using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;

namespace Project.Areas.PrivatePages.Controllers
{
    public class OrderController : Controller
    {
        // GET: PrivatePages/Order
        public ActionResult Index()
        {
            return View();
        }
    }
}