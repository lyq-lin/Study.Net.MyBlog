using System.Linq.Expressions;

namespace Study.Net.IBaseService
{
    public interface IBaseService<TEntity> where TEntity : class, new()
    {
        /// <summary>
        /// 创建
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public Task<bool> CreateAsync(TEntity entity);

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public Task<bool> DeletedAsync(TEntity entity);

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public Task<bool> UpdateAsync(TEntity entity);

        /// <summary>
        /// 查询所有
        /// </summary>
        /// <returns></returns>
        public Task<List<TEntity>> FindAllAsync();

        /// <summary>
        /// 根据自定义条件查询
        /// </summary>
        /// <param name="del"></param>
        /// <returns></returns>
        public Task<List<TEntity>> FindAllAsync(Expression<Func<TEntity, bool>> del);

        /// <summary>
        /// 根据id查询单条数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Task<TEntity> FindOneAsync(Guid id);

        /// <summary>
        /// 根据自定义条件查询单条数据
        /// </summary>
        /// <param name="del"></param>
        /// <returns></returns>
        public Task<TEntity> FindOneAsync(Expression<Func<TEntity, bool>> del);
    }
}
