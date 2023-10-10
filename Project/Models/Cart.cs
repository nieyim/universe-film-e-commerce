using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Models
{
    public class Cart
    {
        private static MovieShopConnect db = new MovieShopConnect();
        /// <summary>
        /// Mã khách hàng
        /// </summary>
        public string maKH { get; set; }
        /// <summary>
        /// Tài khoản xử lí
        /// </summary>
        public string taiKhoan1 { get; set; }
        /// <summary>
        /// Ngày đặt hàng
        /// </summary>
        public DateTime ngayDat { get; set; }
        /// <summary>
        /// Ngày giao hàng
        /// </summary>
        public DateTime ngayGH { get; set; }
        /// <summary>
        /// Email nhận hàng
        /// </summary>
        public string emailGH { get; set; }
        /// <summary>
        /// Danh sách phim trong đơn hàng
        /// </summary>
        public SortedList<string, CtDonHang> choosenFilms;
        /// <summary>
        /// Contructor
        /// </summary>
        public Cart()
        {
            maKH = "";
            taiKhoan1 = "";
            ngayDat = DateTime.Now;
            ngayGH = DateTime.Now.AddMinutes(10);
            emailGH = "";
            choosenFilms = new SortedList<string, CtDonHang>();
        }


        // -------------Method---------------

        /// <summary>
        /// Kiểm tra giỏ hàng rỗng
        /// </summary>
        /// <returns></returns>
        public bool isEmpty()
        {
            return choosenFilms.Keys.Count() == 0;
        }
        /// <summary>
        /// Thêm 1 phim mới vào giỏ hàng
        /// </summary>
        /// <param name="maPhim"></param>
        public void addFilm(string maPhim)
        {
            if (choosenFilms.Keys.Contains(maPhim)) // đã có trong giỏ hàng
            {
                choosenFilms.Values[choosenFilms.IndexOfKey(maPhim)].soLuong++;
            }
            else
            {
                CtDonHang x = new CtDonHang();
                Phim y = db.Phims.Find(maPhim);
                x.maPhim = maPhim;
                x.soLuong = 1;
                x.giaBan = y.giaBan;
                x.giamGia = y.giamGia;

                choosenFilms.Add(maPhim, x); // thêm vào Sorted List
            }
        }
        /// <summary>
        /// Xóa 1 phim trong giỏ hàng
        /// </summary>
        /// <param name="maPhim"></param>
        public void removeFilm(string maPhim)
        {
            if (choosenFilms.Keys.Contains(maPhim)) choosenFilms.Remove(maPhim);
        }
        /// <summary>
        /// Tăng số lượng phim đã mua
        /// </summary>
        /// <param name="maPhim"></param>
        public void increaseUnit(string maPhim)
        {
            choosenFilms.Values[choosenFilms.IndexOfKey(maPhim)].soLuong++;
        }
        /// <summary>
        /// Giảm số lượng phim đã mua
        /// </summary>
        /// <param name="maPhim"></param>
        public void decreaseUnit(string maPhim)
        {
            if (choosenFilms.Values[choosenFilms.IndexOfKey(maPhim)].soLuong == 1) removeFilm(maPhim);
            else choosenFilms.Values[choosenFilms.IndexOfKey(maPhim)].soLuong--;
        }
        /// <summary>
        /// Tính tổng tiền 1 sản phẩm
        /// </summary>
        /// <param name="x"></param>
        /// <returns></returns>
        public long getPrice(CtDonHang x)
        {
            return (long)((x.giaBan - x.giaBan * x.giamGia / 100 ) * x.soLuong);
        }
        /// <summary>
        /// Tính tổng giá giỏ hàng
        /// </summary>
        /// <returns></returns>
        public long getTotal ()
        {
            long total=0;
            foreach (CtDonHang i in choosenFilms.Values)
            {
                total += getPrice(i);
            }
            return total;
        }
    }
}