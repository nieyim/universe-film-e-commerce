using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;

namespace Project.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Increase(string maPhim)
        {
            (Session["Cart"] as Cart).increaseUnit(maPhim);
            return View("Index");
        }
        [HttpPost]
        public ActionResult Decrease(string maPhim)
        {
            (Session["Cart"] as Cart).decreaseUnit(maPhim);
            return View("Index");
        }
        [HttpPost]
        public ActionResult Delete(string maPhim)
        {
            (Session["Cart"] as Cart).removeFilm(maPhim);
            return View("Index");
        }
    }
}