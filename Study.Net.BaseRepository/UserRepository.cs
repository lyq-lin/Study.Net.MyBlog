using Microsoft.EntityFrameworkCore;
using Study.Net.EFCoreEnvironment.DbContexts;
using Study.Net.IBaseRepository;
using Study.Net.Model;
using System.Linq.Expressions;

namespace Study.Net.BaseRepository
{
    public class UserRepository : BaseRepository<User>, IUserRepository
    {
        private readonly MySqlDbContext _dbContext;

        public UserRepository(MySqlDbContext dbContext)
        {
            base._db = dbContext;
            _dbContext = dbContext;
        }

        public override async Task<List<User>> FindAllAsync()
        {
            return await _dbContext.Users.Include(x => x.Articles).ToListAsync();
        }

        public override async Task<List<User>> FindAllAsync(Expression<Func<User, bool>> del)
        {
            return await _dbContext.Users.Where(del).Include(x => x.Articles).ToListAsync();
        }

        public override async Task<User> FindOneAsync(Guid id)
        {
            return await _dbContext.Users.Include(x => x.Articles).SingleOrDefaultAsync(x => x.Id == id);
        }

        public async override Task<User> FindOneAsync(Expression<Func<User, bool>> del)
        {
            return await _dbContext.Users.Include(x => x.Articles).SingleOrDefaultAsync(del);
        }
    }
}
