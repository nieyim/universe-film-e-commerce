using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Project.Models;

namespace Project.Areas.PrivatePages.Models
{
    public class AdminGeneral
    {
        /// <summary>
        /// Hàm đọc tài khoản từ Session
        /// </summary>
        /// <returns></returns>
        public static TaiKhoan Account()
        {
            TaiKhoan x = (TaiKhoan)HttpContext.Current.Session["NewLogin"];
            return x;
        }
        /// <summary>
        /// Hàm lấy tên tài khoản
        /// </summary>
        /// <returns></returns>
        public static string getAccount()
        {
            string user = "";
            try
            {
                user = Account().taiKhoan1;
            }
            catch { }
            return user;
        }
    }
}