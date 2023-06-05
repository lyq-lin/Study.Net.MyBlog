using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using Study.Net.IBaseService;
using Study.Net.Model;
using Study.Net.Model.DTO;
using Study.Net.Utility;
using System.Security.Claims;
using System.Text.Json;

namespace Study.Net.MyBlog.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly IMapper _mapper;
        private readonly UserManager<User> _userManager;
        private readonly RoleManager<Role> _roleManager;
        private readonly IDistributedCache _cache;

        public UserController(IUserService userService, IMapper mapper, UserManager<User> userManager, RoleManager<Role> roleManager, IDistributedCache cache)
        {
            this._userService = userService;
            this._mapper = mapper;
            this._userManager = userManager;
            this._roleManager = roleManager;
            this._cache = cache;
        }

        [HttpGet("GetUsers")]
        [Authorize]
        public async Task<ActionResult<ApiResult>> GetUsers()
        {
            var data = await _userService.FindAllAsync();

            if (data.Count == 0)
            {
                return ApiResultHelper.Error($"没有更多的用户了!");
            }

            List<UserDTO> users = new List<UserDTO>();

            foreach (var user in data)
            {
                users.Add(_mapper.Map<UserDTO>(user));
            }

            return ApiResultHelper.Success(users);
        }

        [HttpGet("GetUser")]
        [Authorize]
        public async Task<ActionResult<ApiResult>> GetUser(string username)
        {
            var data = await _userService.FindOneAsync(x => x.UserName == username);
            if (data is null)
            {
                return ApiResultHelper.Error($"{username}不存在!");
            }

            UserDTO user = _mapper.Map<UserDTO>(data);

            return ApiResultHelper.Success(user);

        }

        [HttpPost("CreateUser")]
        [Authorize("Admin")]
        public async Task<ActionResult<ApiResult>> CreateUser(CheckRequestInfo info)
        {
            User user = new User() { UserName = info.userName, IsDeleted = false };
            var b = await _userManager.CreateAsync(user, info.userPwd);
            if (!b.Succeeded)
            {
                return ApiResultHelper.Error($"创建用户失败");
            }

            //添加角色
            if (await _userManager.IsInRoleAsync(user, "Normal"))
            {
                await _userManager.AddToRoleAsync(user, "Normal");
            }


            return ApiResultHelper.Success(b.Succeeded);
        }

        [HttpPut("EditName")]
        [Authorize]
        public async Task<ActionResult<ApiResult>> EditName(string NewName)
        {
            var user = await _userManager.FindByIdAsync(this.User.FindFirst(ClaimTypes.NameIdentifier).Value);
            if (user is null)
            {
                return ApiResultHelper.Error($"修改用户名失败");
            }

            user.JwtVersion++;
            var data = await _userManager.UpdateAsync(user);
            if (!data.Succeeded)
            {
                return ApiResultHelper.Error($"修改用户名失败");
            }

            return ApiResultHelper.Success(data.Succeeded);
        }

        [HttpPut("ResetPassword")]
        public async Task<ActionResult<ApiResult>> ResetPassword(string token, string newPwd)
        {
            var user = await _userManager.FindByIdAsync(this.User.FindFirst(ClaimTypes.NameIdentifier).Value);

            string tokenFromRedis = JsonSerializer.Deserialize<string>(await _cache.GetAsync($"sms_{user.Id}"));
            if (!tokenFromRedis.Equals(token))
            {
                return ApiResultHelper.Error($"验证码有误!修改密码失败!");
            }

            var result = await _userManager.ResetPasswordAsync(user, token, newPwd);

            user.JwtVersion++;
            await _userManager.UpdateAsync(user);

            if (!result.Succeeded)
            {
                return ApiResultHelper.Error($"验证码有误!修改密码失败!");
            }

            return ApiResultHelper.Success("重置成功!");
        }
    }
}
