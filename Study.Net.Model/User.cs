using Microsoft.AspNetCore.Identity;

namespace Study.Net.Model
{
    public class User : IdentityUser<Guid>
    {
        public long JwtVersion { get; set; }
        public List<Article> Articles { get; set; } = new List<Article>();
        public bool IsDeleted { get; set; }
    }
}
