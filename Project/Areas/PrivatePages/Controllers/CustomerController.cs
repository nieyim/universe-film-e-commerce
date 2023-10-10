using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project.Areas.PrivatePages.Controllers
{
    public class CustomerController : Controller
    {
        // GET: PrivatePages/Customer
        public ActionResult Index()
        {
            return View();
        }
    }
}