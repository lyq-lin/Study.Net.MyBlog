namespace Study.Net.Model
{
    public class ArticleType : BaseId
    {
        public string TypeName { get; set; }

        public List<Article> Articles { get; set; } = new List<Article>();

        public bool IsDeleted { get; set; }
    }
}