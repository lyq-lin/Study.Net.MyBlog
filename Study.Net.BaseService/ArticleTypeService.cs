using Study.Net.IBaseRepository;
using Study.Net.IBaseService;
using Study.Net.Model;

namespace Study.Net.BaseService
{
    public class ArticleTypeService : BaseService<ArticleType>, IArticleTypeService
    {
        private readonly IArticleTypeRepository _articleTypeRepository;

        public ArticleTypeService(IArticleTypeRepository articleTypeRepository)
        {
            base._repository = articleTypeRepository;
            _articleTypeRepository = articleTypeRepository;
        }
    }
}
