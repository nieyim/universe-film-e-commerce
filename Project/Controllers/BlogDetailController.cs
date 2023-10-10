using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;

namespace Project.Controllers
{
    public class BlogDetailController : Controller
    {
        // GET: BlockDetail
        public ActionResult Index(string maBV)
        {
            MovieShopConnect db = new MovieShopConnect();
            BaiViet x = db.BaiViets.Where(z => (z.maBV).Equals(maBV)).First();
            ViewData["Blog"] = x;
            return View();
        }
    }
}