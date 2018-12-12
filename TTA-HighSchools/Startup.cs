using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TTA_HighSchools.Startup))]
namespace TTA_HighSchools
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
