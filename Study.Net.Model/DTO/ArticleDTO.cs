namespace Study.Net.Model.DTO
{
    public record ArticleDTO
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime CreateTime { get; set; }
        public int ViewCount { get; set; }
        public int LikeCount { get; set; }
        public string TypeName { get; set; }
        public string UserName { get; set; }
    }
}
