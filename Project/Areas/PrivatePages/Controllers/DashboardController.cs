using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;
using System.Web.Security;

namespace Project.Areas.PrivatePages.Controllers
{
    public class DashboardController : Controller
    {
        // GET: PrivatePages/Dashboard
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            return RedirectToAction("Index", "Home", new { area = ""});
        }
    }
}