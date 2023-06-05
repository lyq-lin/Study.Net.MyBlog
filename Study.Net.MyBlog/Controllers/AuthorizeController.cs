using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Study.Net.IBaseService;
using Study.Net.Model;
using Study.Net.MyBlog.Attributes;
using Study.Net.Utility;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Text.Json;

namespace Study.Net.MyBlog.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class AuthorizeController : ControllerBase
    {
        private readonly IOptionsSnapshot<JwtSetting> _settings;
        private readonly IUserService _userService;
        private readonly UserManager<User> _userManager;
        private readonly IDistributedCache _cache;

        public AuthorizeController(IOptionsSnapshot<JwtSetting> settings, IUserService userService, UserManager<User> userManager, IDistributedCache cache)
        {
            _settings = settings;
            _userService = userService;
            _userManager = userManager;
            _cache = cache;
        }

        [HttpPost("Login")]
        [NotCheckJwtVersion]
        public async Task<ActionResult<ApiResult>> Login(CheckRequestInfo info)
        {
            var isExist = await _userService.FindOneAsync(x => x.UserName == info.userName);
            if (isExist is null)
            {
                return ApiResultHelper.Error($"用户名或密码输入错误!");
            }

            //判断是否被冻结
            if (await _userManager.IsLockedOutAsync(isExist)) //是否被冻结
            {
                return ApiResultHelper.Error($"用户{isExist.UserName} 已被冻结,距离解冻还需{isExist.LockoutEnd} 分");
            }

            //执行登录操作
            var result = await _userManager.CheckPasswordAsync(isExist, info.userPwd);
            if (result) //登录成功
            {
                //重置登录次数
                await _userManager.ResetAccessFailedCountAsync(isExist);

                isExist.JwtVersion++;
                await _userManager.UpdateAsync(isExist);

                //颁发令牌
                //1. 声明payload
                List<Claim> claims = new List<Claim>() {
                    new (ClaimTypes.NameIdentifier,isExist.Id.ToString()),
                    new (ClaimTypes.Name,isExist.UserName),
                    new ("JwtVersion",isExist.JwtVersion.ToString())
                };
                var roles = await _userManager.GetRolesAsync(isExist);
                foreach (var role in roles)
                {
                    claims.Add(new(ClaimTypes.Role, role));
                }

                //2. 生成jwt
                string? key = _settings.Value.SecKey;
                DateTime expire = DateTime.Now.AddSeconds(_settings.Value.ExpireSeconds);

                byte[] secBytes = Encoding.UTF8.GetBytes(key);
                var secKey = new SymmetricSecurityKey(secBytes);
                var credentials = new SigningCredentials(secKey, SecurityAlgorithms.HmacSha256Signature);

                var tokenDescriptor = new JwtSecurityToken(
                    claims: claims,
                    issuer: _settings.Value.Issuer,
                    audience: _settings.Value.Audience,
                    expires: expire,
                    signingCredentials: credentials
                    );

                string jwt = new JwtSecurityTokenHandler().WriteToken(tokenDescriptor);

                //3. 返回jwt
                return ApiResultHelper.Success(jwt);

            }
            else //登录失败
            {
                //记录登录次数
                await _userManager.AccessFailedAsync(isExist);
                return ApiResultHelper.Error($"用户名或密码输入错误!");
            }
        }

        [HttpGet("ResetPwdToken")]
        [Authorize]
        public async Task<ActionResult<ApiResult>> SendResetPwdToken()
        {
            var user = await _userManager.FindByIdAsync(this.User.FindFirst(ClaimTypes.NameIdentifier).Value);
            if (user is null)
            {
                return ApiResultHelper.Error($"发送失败!");
            }

            var token = await _userManager.GeneratePasswordResetTokenAsync(user);

            /*
                调用发送短信Api
             */
            SMSHelper.UseSMS(user.PhoneNumber, token);

            //将验证码存入redis
            await _cache.SetStringAsync($"sms_{user.Id}", JsonSerializer.Serialize(token), new DistributedCacheEntryOptions()
            {
                AbsoluteExpiration = DateTimeOffset.UtcNow.AddMinutes(5)
            });

            return ApiResultHelper.Success(token);
        }
    }
}
