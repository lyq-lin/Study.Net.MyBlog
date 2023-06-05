using Study.Net.IBaseRepository;
using Study.Net.IBaseService;
using Study.Net.Model;

namespace Study.Net.BaseService
{
    public class UserService:BaseService<User>,IUserService
    {
        private readonly IUserRepository _userRepository;

        public UserService(IUserRepository userRepository)
        {
            base._repository = userRepository;
            _userRepository = userRepository;
        }
    }
}
