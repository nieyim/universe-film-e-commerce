using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;

namespace Project.Areas.PrivatePages.Controllers
{
    public class CategoryManageController : Controller
    {
        private static bool update = false; 
        // GET: PrivatePages/CategoryManage
        [HttpGet]
        public ActionResult Index()
        {
            MovieShopConnect db = new MovieShopConnect();
            update = false;
            return View();
        }
        
        [HttpPost]
        public ActionResult Index(LoaiPhim x)
        {
            MovieShopConnect db = new MovieShopConnect();
            if (!update) 
                db.LoaiPhims.Add(x);
            else
            {
                LoaiPhim y = db.LoaiPhims.Find(x.maLoai);
                y.tenLoai = x.tenLoai;
                y.ghiChu = x.ghiChu;
                update = false;
            }
            db.SaveChanges();
            if (ModelState.IsValid)
                ModelState.Clear();
            return View();
        }
        [HttpPost]
        public ActionResult Delete(string maLoai)
        {
            MovieShopConnect db = new MovieShopConnect();
            int mL = int.Parse(maLoai);
            LoaiPhim x = db.LoaiPhims.Find(mL);
            db.LoaiPhims.Remove(x);
            db.SaveChanges();
            return View("Index");
        }
        [HttpPost]
        public ActionResult Update(string maLoai)
        {
            MovieShopConnect db = new MovieShopConnect();
            int mL = int.Parse(maLoai);
            LoaiPhim x = db.LoaiPhims.Find(mL);
            update = true;
            return View("Index", x);
        }
    }
}