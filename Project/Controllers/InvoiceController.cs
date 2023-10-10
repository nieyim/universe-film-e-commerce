using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;

namespace Project.Controllers
{
    public class InvoiceController : Controller
    {
        // GET: Invoice
        public ActionResult Index(string soDH)
        {
            ViewData["Bill"] = new MovieShopConnect().DonHangs.Find(soDH);
            return View();
        }
    }
}