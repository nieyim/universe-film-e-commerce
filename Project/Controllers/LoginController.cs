using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Models;

namespace Project.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(string taiKhoan, string matKhau)
        {
            string newPass = Encrypt.passEncrypt(matKhau);
            try
            {
                TaiKhoan login = General.getUser().Where(x => x.taiKhoan1.Equals(taiKhoan) && x.matKhau.Equals(newPass)).First();
                if (login != null && login.taiKhoan1.Equals(taiKhoan) && login.matKhau.Equals(newPass))
                {
                    Session["NewLogin"] = login;
                    return RedirectToAction("Index", "Dashboard", new { area = "PrivatePages" });
                }
            }
            catch
            {
                ViewBag.Warning = "Sai tài khoản hoặc mật khẩu, vui lòng nhập lại.";
            }
            return View();
        }
    }
}