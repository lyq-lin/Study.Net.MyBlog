using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Study.Net.Model;

namespace Study.Net.EFCoreEnvironment.Configs
{
    public class UserConfig : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            //配置双向导航属性

            builder.HasMany(x => x.Articles).WithOne(x => x.User).HasForeignKey(x => x.UserId);

            //配置全局筛选器
            builder.HasQueryFilter(x => x.IsDeleted == false);
        }
    }
}
