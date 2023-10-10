using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;

namespace Project.Areas.PrivatePages.Controllers
{
    public class BlogManageController : Controller
    {
        private static MovieShopConnect db = new MovieShopConnect();
        private static bool status;
        // GET: PrivatePages/BlogManage
        public ActionResult Index(int valid)
        {
            if (valid == 1) status = true;
            else
            {
                status = false;
                return View("~/Areas/PrivatePages/Views/BlogManage/Hidden.cshtml");
            }
            return View();
        }
        public ActionResult Delete(string maBV)
        {
            BaiViet x = db.BaiViets.Find(maBV);
            db.BaiViets.Remove(x);
            db.SaveChanges();
            return View("Index");
        }
        public ActionResult Status(string maBV)
        {
            BaiViet x = db.BaiViets.Find(maBV);
            x.daDuyet = !status;
            db.SaveChanges();
            if (status == false)
            return View("Hidden");
            else return View("Index");
        }
    }
}