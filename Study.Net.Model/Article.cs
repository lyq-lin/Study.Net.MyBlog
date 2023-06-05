namespace Study.Net.Model
{
    public class Article : BaseId
    {
        public string Title { get; set; }

        public string Content { get; set; }

        public DateTime CreateTime { get; set; }

        public ArticleType Type { get; set; }
        public Guid TypeId { get; set; }

        public User User { get; set; }

        public Guid? UserId { get; set; }

        public int ViewCount { get; set; }

        public int LikeCount { get; set; }

        public bool IsDeleted { get; set; }
    }
}