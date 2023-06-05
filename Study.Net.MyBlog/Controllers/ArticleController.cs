using AutoMapper;
using MarkdownSharp;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Study.Net.IBaseService;
using Study.Net.Model;
using Study.Net.Model.DTO;
using Study.Net.Utility;
using System.Security.Claims;

namespace Study.Net.MyBlog.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ArticleController : ControllerBase
    {
        private readonly IArticleService _articleService;
        private readonly IMapper _mapper;

        public ArticleController(IArticleService articleService, IMapper mapper)
        {
            _articleService = articleService;
            _mapper = mapper;
        }

        [HttpGet("Articles")]
        [Authorize]
        public async Task<ActionResult<ApiResult>> GetArticles()
        {
            var data = await _articleService.FindAllAsync();
            if (data.Count == 0)
            {
                return ApiResultHelper.Error("没有更多的文章");
            }


            List<ArticleDTO> articleDTOs = new List<ArticleDTO>();

            foreach (var article in data)
            {
                articleDTOs.Add(_mapper.Map<ArticleDTO>(article));
            }

            return ApiResultHelper.Success(articleDTOs);
        }

        [HttpPost("Create")]
        [Authorize]
        public async Task<ActionResult<ApiResult>> CreateArticle(ArticleRequestInfo info)
        {
            //把content的markdown语法转化为html源代码
            Markdown markdown = new Markdown();
            string html = markdown.Transform(info.content);

            Article article = new Article()
            {
                Title = info.Title,
                Content = html,
                CreateTime = DateTime.Now,
                TypeId = info.TypeId,
                IsDeleted = false,
                UserId = Guid.Parse(this.User.FindFirst(ClaimTypes.NameIdentifier).Value),
                ViewCount = 0,
                LikeCount = 0
            };

            var result = await _articleService.CreateAsync(article);
            if (!result)
            {
                return ApiResultHelper.Error($"{info.Title} 添加失败! 服务器发生故障!");
            }

            return ApiResultHelper.Success(result);
        }

        [HttpDelete("Delete")]
        [Authorize]
        public async Task<ActionResult<ApiResult>> Delete(Guid id)
        {
            Article article = await _articleService.FindOneAsync(id);
            if (article == null)
            {
                return ApiResultHelper.Error($"删除失败");
            }

            //软删除
            article.IsDeleted = true;

            bool result = await _articleService.DeletedAsync(article);

            if (!result)
            {
                return ApiResultHelper.Error($"删除失败! 服务器发生故障!");
            }

            return ApiResultHelper.Success(result);
        }

        [HttpPut("Edit")]
        [Authorize]
        public async Task<ActionResult<ApiResult>> Edit(ArticleRequestInfo info)
        {
            var article = await _articleService.FindOneAsync(info.Id);
            if (article is null)
            {
                return ApiResultHelper.Error($"修改失败");
            }

            article.Title = info.Title;
            article.Content = info.content;
            article.TypeId = info.TypeId;

            var result = await _articleService.UpdateAsync(article);

            if (!result)
            {
                return ApiResultHelper.Error($"修改失败");
            }
            return ApiResultHelper.Success(result);
        }
    }
}
