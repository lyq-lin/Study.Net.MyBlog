namespace Study.Net.Utility
{
    public class JwtSetting
    {
        public string? SecKey { get; set; } 

        public int ExpireSeconds { get; set; }

        public string? Issuer { get; set; }

        public string? Audience { get; set; }
    }
}
