using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Study.Net.Model;

namespace Study.Net.EFCoreEnvironment.Configs
{
    public class ArticleConfig : IEntityTypeConfiguration<Article>
    {
        public void Configure(EntityTypeBuilder<Article> builder)
        {
            //配置表名
            builder.ToTable($"T_{nameof(Article)}");

            //配置Content为text类型
            builder.Property(x => x.Content).HasColumnType("Text");

            //配置全局筛选器
            builder.HasQueryFilter(x => x.IsDeleted == false);

            //配置双向导航属性
            builder.HasOne(x => x.Type).WithMany(x => x.Articles).HasForeignKey(x => x.TypeId);
        }
    }
}