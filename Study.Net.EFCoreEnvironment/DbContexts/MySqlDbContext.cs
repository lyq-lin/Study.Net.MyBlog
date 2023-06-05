using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Study.Net.Model;


namespace Study.Net.EFCoreEnvironment.DbContexts
{
    public class MySqlDbContext : IdentityDbContext<User,Role,Guid>
    {
        public DbSet<Article> articles { get; set; }

        public DbSet<ArticleType> articleTypes { get; set; }

        public MySqlDbContext(DbContextOptions options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            //把当前程序集中实现了IEntityTypeConfiguration接口的实现类加载进来，配置sql
            modelBuilder.ApplyConfigurationsFromAssembly(this.GetType().Assembly);
        }

    }
}