using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Caching.Distributed;
using Study.Net.Model;
using Study.Net.MyBlog.Attributes;
using System.Security.Claims;
using System.Text.Json;

namespace Study.Net.MyBlog.Filters
{
    public class JwtVersionCheckFilter : IAsyncActionFilter
    {
        private readonly UserManager<User> _userManager;
        private readonly IDistributedCache _distributedCache;

        public JwtVersionCheckFilter(UserManager<User> userManager, IDistributedCache distributedCache)
        {
            _userManager = userManager;
            _distributedCache = distributedCache;
        }

        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var descriptor = context.ActionDescriptor as ControllerActionDescriptor;

            if (descriptor is null)
            {
                //访问的就不是action方法
                await next();
                return;
            }

            //检查是否携带NotCheck特性
            if (descriptor.MethodInfo.GetCustomAttributes(typeof(NotCheckJwtVersionAttribute), true).Any())
            {
                await next();    //标注了NotCheckJwtVersionAttribute就放行
                return;
            }


            var claimJwtVersion = context.HttpContext.User.FindFirst("JwtVersion");
            if (claimJwtVersion is null)
            {
                context.Result = new ObjectResult("没有找到JwtVersion的内容") { StatusCode = 400 };
                return;
            }

            var UserId = context.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);

            long jwtVersionFromClient = long.Parse(claimJwtVersion.Value);

            //先去查询redis缓存，如果缓存没有就去数据库查询并将结果插入到redis缓存中
            var data = await _distributedCache.GetStringAsync($"jwt_{UserId}");
            if (data is not null)
            {  //缓存不为空
                long jwtVersion = JsonSerializer.Deserialize<long>(data);

                if (jwtVersion > jwtVersionFromClient)
                {
                    context.Result = new ObjectResult("Jwt已过时") { StatusCode = 400 };
                    return;
                }

                await next();
            }
            else //缓存为空
            {
                var user = await _userManager.FindByIdAsync(UserId.Value);
                if (user is null)
                {
                    context.Result = new ObjectResult("数据库中不存在该用户") { StatusCode = 400 };
                    return;
                }

                //找到数据
                await _distributedCache.SetStringAsync($"jwt_{UserId}", JsonSerializer.Serialize(user.JwtVersion), new DistributedCacheEntryOptions()
                {
                    AbsoluteExpirationRelativeToNow = TimeSpan.FromSeconds(Random.Shared.Next(7, 10)),
                    SlidingExpiration = TimeSpan.FromSeconds(5)
                });

                if (user.JwtVersion > jwtVersionFromClient)
                {
                    context.Result = new ObjectResult("Jwt已过时") { StatusCode = 400 };
                    return;
                }
            }
            await next();
        }
    }
}
