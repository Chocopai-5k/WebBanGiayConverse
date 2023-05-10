using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Http;
using System.Security.Principal;

namespace WebBanGiayConverse
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            Application["PageView"] = 0;
            Application["Online"] = 0;
        }
        protected void Session_Start()
        {
            Application.Lock(); // Dùng để đồng bộ hóa
            Application["PageView"] = (int)Application["PageView"] + 1;
            Application["Online"] = (int)Application["Online"] + 1;
            Application.UnLock();
        }
        protected void Session_End()
        {
            Application.Lock(); // Dùng để đồng bộ hóa
            Application["Online"] = (int)Application["Online"] - 1;
            Application["PageView"] = (int)Application["PageView"] + 1;

            Application.UnLock();
        }
        protected void Application_AuthenticateRequest(Object sender, EventArgs e)
        {
            var authCookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];
            if (authCookie != null)
            {
                var authTicket = FormsAuthentication.Decrypt(authCookie.Value);
                var roles = authTicket.UserData.Split(new Char[] { ',' });
                var userPrincipal = new GenericPrincipal(new GenericIdentity
                (authTicket.Name), roles);
                Context.User = userPrincipal;
            }
        }
    }
}