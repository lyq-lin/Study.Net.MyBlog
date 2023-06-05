namespace Study.Net.Utility
{
    public record ArticleRequestInfo
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string content { get; set; }
        public Guid TypeId { get; set; }
    }
}
