using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IdentityMySQLDemo.Startup))]
namespace IdentityMySQLDemo
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
