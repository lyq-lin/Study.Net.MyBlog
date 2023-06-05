using AutoMapper;
using Study.Net.Model;
using Study.Net.Model.DTO;

namespace Study.Net.Utility._Mapper
{
    public class DTOMapper : Profile
    {

        public DTOMapper()
        {
            //Article
            base.CreateMap<Article, ArticleDTO>().ForMember(x => x.TypeName, opt =>
            {
                opt.MapFrom(src => src.Type.TypeName);
            }).ForMember(x => x.UserName, opt =>
            {
                opt.MapFrom(src => src.User.UserName);
            });

            //ArticleType
            base.CreateMap<ArticleType, ArticleTypeDTO>().ForMember(x => x.ArticleNames, opt =>
            {
                opt.MapFrom(src => src.Articles.Select(x => x.Title));
            });

            //User
            base.CreateMap<User, UserDTO>().ForMember(x => x.ArticleNames, opt =>
            {
                opt.MapFrom(src => src.Articles.Select(x => x.Title));
            });
        }
    }
}
