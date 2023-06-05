using Microsoft.EntityFrameworkCore;
using Study.Net.EFCoreEnvironment.DbContexts;
using Study.Net.IBaseRepository;
using Study.Net.Model;
using System.Linq.Expressions;

namespace Study.Net.BaseRepository
{
    public class ArticleRepository : BaseRepository<Article>, IArticleRepository
    {
        private readonly MySqlDbContext _dbContext;

        public ArticleRepository(MySqlDbContext dbContext)
        {
            base._db = dbContext;
            _dbContext = dbContext;
        }

        public override async Task<List<Article>> FindAllAsync()
        {
            return await _dbContext.articles.Include(x=>x.User).Include(x => x.Type).ToListAsync();
        }

        public override async Task<List<Article>> FindAllAsync(Expression<Func<Article, bool>> del)
        {
            return await _dbContext.articles.Where(del).Include(x => x.User).Include(x => x.Type).ToListAsync();
        }

        public override async Task<Article> FindOneAsync(Guid id)
        {
            return await _dbContext.articles.Include(x => x.User).Include(x => x.Type).SingleOrDefaultAsync(x => x.Id == id);
        }

        public async override Task<Article> FindOneAsync(Expression<Func<Article, bool>> del)
        {
            return await _dbContext.articles.Include(x => x.User).Include(x => x.Type).SingleOrDefaultAsync(del);
        }
    }
}
