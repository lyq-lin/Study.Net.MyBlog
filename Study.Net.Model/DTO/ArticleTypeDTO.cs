namespace Study.Net.Model.DTO
{
    public record ArticleTypeDTO
    {
        public Guid Id { get; set; }
        public string TypeName { get; set; }
        public List<string> ArticleNames { get; set; } = new List<string>();
    }
}
