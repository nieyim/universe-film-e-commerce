using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;
using Project.Areas.PrivatePages.Models;
using System.IO;

namespace Project.Areas.PrivatePages.Controllers
{
    public class NewBlogController : Controller
    {
        // GET: PrivatePages/NewBlog
        public ActionResult Index()
        {
            BaiViet x = new BaiViet();
            x.ngayDang = DateTime.Now;
            x.luotXem = 0;
            x.taiKhoan = AdminGeneral.getAccount();
            return View(x);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult Index(BaiViet x, HttpPostedFileBase upFile)
        {
            MovieShopConnect db = new MovieShopConnect();
            try
            {
                x.maBV = string.Format("{0:yyMMddhhmm}", DateTime.Now);
                x.daDuyet = false;
                x.ngayDang = DateTime.Now;
                x.taiKhoan = AdminGeneral.getAccount();
                x.luotXem = 0;

                if (upFile != null)
                {
                    string relScr = "/Media/Images/blog/";
                    string absScr = Server.MapPath("~/" + relScr);
                    string file = "blog" + x.maBV + Path.GetExtension(upFile.FileName);
                    upFile.SaveAs(absScr + file);    //save in folder
                    x.hinhDD = relScr + file;        //save path in Database 
                    x.hinhDD2 = relScr + file;
                    ViewBag.Img = x.hinhDD;
                }
                else x.hinhDD = "";

                db.BaiViets.Add(x);
                db.SaveChanges();
                return RedirectToAction("Index", "BlogManage", new { valid = 0 });
            }
            catch
            {

            }
            return View(x);
        }
    }
}