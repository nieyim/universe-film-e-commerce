using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;

namespace Project.Controllers
{
    public class MovieController : Controller
    {
        // GET: Movie
        public ActionResult Index(int maLoai)
        {
            if (maLoai == 0 ) return View("~/Views/Movie/Default.cshtml");
            MovieShopConnect db = new MovieShopConnect();
            LoaiPhim x = db.LoaiPhims.Where(z => z.maLoai == maLoai).First();
            ViewData["Movie"] = x;
            return View();
        }
    }
}