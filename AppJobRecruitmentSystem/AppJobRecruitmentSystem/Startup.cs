using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AppJobRecruitmentSystem.Startup))]
namespace AppJobRecruitmentSystem
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
