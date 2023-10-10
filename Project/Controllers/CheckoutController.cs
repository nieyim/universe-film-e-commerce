using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;
using System.Data.Entity;

namespace Project.Controllers
{
    public class CheckoutController : Controller
    {
        // GET: Checkout
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost] 
        public ActionResult Index(KhachHang x)
        {     
            using (var db = new MovieShopConnect())
            {
                using (DbContextTransaction transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        // Thêm vào bảng KH
                        x.maKH = x.soDT;
                        db.KhachHangs.Add(x);                     
                        db.SaveChanges();

                        // Thêm vào bảng DH
                        DonHang a = new DonHang();
                        a.soDH = string.Format("{0:yyMMddhhmm}", DateTime.Now);
                        a.maKH = x.soDT;
                        a.ngayDat = DateTime.Now;
                        a.ngayGH = DateTime.Now.AddMinutes(30);
                        a.taiKhoan = "tri";
                        a.emailGH = x.email;
                        a.ghiChu = x.ghiChu;
                        db.DonHangs.Add(a);
                        db.SaveChanges();

                        // Thêm vào bảng CTDH
                        Cart b = Session["Cart"] as Cart;
                        foreach (CtDonHang i in b.choosenFilms.Values)
                        {
                            i.soDH = a.soDH;
                            db.CtDonHangs.Add(i);
                        }
                        db.SaveChanges();

                        // Lưu Transaction
                        transaction.Commit();
                        return RedirectToAction("Index", "Invoice", new { @soDH = a.soDH});
                    }
                    catch (Exception e)
                    {
                        // Lỗi , rollback
                        transaction.Rollback();
                    }
                } 
            }
            return View();
        }
    }
}