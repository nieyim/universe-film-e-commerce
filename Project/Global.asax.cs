using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Optimization;
using Project.App_Start;
using Project.Models;

namespace Project
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            //-- Declare Bundle
            BundleCollection bundles = BundleTable.Bundles;
            BundleConfig.RegisterBundle(bundles);
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["NewLogin"] = null;
            Session["Cart"] = new Cart();
        }
    }
}
