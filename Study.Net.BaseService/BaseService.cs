using Study.Net.IBaseRepository;
using Study.Net.IBaseService;
using System.Linq.Expressions;

namespace Study.Net.BaseService
{
    public abstract class BaseService<TEntity> : IBaseService<TEntity> where TEntity : class, new()
    {

        protected IBaseRepository<TEntity> _repository;

        public async Task<bool> CreateAsync(TEntity entity)
        {
            return await _repository.CreateAsync(entity);
        }

        public async Task<bool> DeletedAsync(TEntity entity)
        {
            return await _repository.DeletedAsync(entity);
        }

        public async Task<List<TEntity>> FindAllAsync()
        {
            return await _repository.FindAllAsync();
        }

        public async Task<List<TEntity>> FindAllAsync(Expression<Func<TEntity, bool>> del)
        {
            return await _repository.FindAllAsync(del);
        }

        public async Task<TEntity> FindOneAsync(Guid id)
        {
            return await _repository.FindOneAsync(id);
        }

        public async Task<TEntity> FindOneAsync(Expression<Func<TEntity, bool>> del)
        {
            return await _repository.FindOneAsync(del);
        }

        public Task<bool> UpdateAsync(TEntity entity)
        {
            return _repository.UpdateAsync(entity);
        }
    }
}
