using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using WebAssignment;
using WebAssignment.Models;

namespace WebAssignment
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            Database.SetInitializer<Context>(null);
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //// Code that runs when a new session is started
            //if (Session["User"] == null)
            //{
            //    // create a new session object called User
            //    Session["User"] = new SessionObject();
            //}
            //else
            //{
            //    //Session["User"] = new CustomSessionObject();
            //    //  throw new Exception("Started Session - obj found");

            //}
        }
    }
}
