using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;

namespace Project.Controllers
{
    public class MovieDetailController : Controller
    {
        // GET: MovieDetail
        [HttpGet]
        public ActionResult Index(string maPhim)
        {
            MovieShopConnect db = new MovieShopConnect();
            Phim x = db.Phims.Where(z => (z.maPhim).Equals(maPhim)).First();
            ViewData["Movie"] = x;
            return View("Index");
        }
        [HttpPost]
        public ActionResult Buy(string maPhim)
        {
            (Session["Cart"] as Cart).addFilm(maPhim);
            return Index(maPhim);
        }
    }
}