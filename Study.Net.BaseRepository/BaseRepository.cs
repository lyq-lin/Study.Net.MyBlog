using Microsoft.EntityFrameworkCore;
using Study.Net.EFCoreEnvironment.DbContexts;
using Study.Net.IBaseRepository;
using System.Linq.Expressions;

namespace Study.Net.BaseRepository
{
    public abstract class BaseRepository<TEntity> : IBaseRepository<TEntity> where TEntity : class, new()
    {
        //使用子类实例化时，根据base传递dbcontext对象到父类，也就是当前作用域之下
        protected MySqlDbContext _db;

        public async Task<bool> CreateAsync(TEntity entity)
        {
            await _db.Set<TEntity>().AddAsync(entity);
            return await _db.SaveChangesAsync() > 0;
        }

        public async Task<bool> DeletedAsync(TEntity entity)
        {
            return await UpdateAsync(entity);
        }

        public virtual async Task<List<TEntity>> FindAllAsync()
        {
            return await _db.Set<TEntity>().ToListAsync();
        }

        public virtual async Task<List<TEntity>> FindAllAsync(Expression<Func<TEntity, bool>> del)
        {
            return await _db.Set<TEntity>().Where(del).ToListAsync();
        }

        public virtual async Task<TEntity> FindOneAsync(Guid id)
        {
            return await _db.Set<TEntity>().FindAsync(id);
        }

        public virtual async Task<TEntity> FindOneAsync(Expression<Func<TEntity, bool>> del)
        {
            return await _db.Set<TEntity>().FirstOrDefaultAsync(del);
        }

        public async Task<bool> UpdateAsync(TEntity entity)
        {
            _db.Set<TEntity>().Update(entity);
            return await _db.SaveChangesAsync() > 0;
        }
    }
}
