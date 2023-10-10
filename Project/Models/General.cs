using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Project.Models;

namespace Project.Models
{
    public class General
    {
        private static MovieShopConnect db = new MovieShopConnect();
        /// <summary>
        /// Lấy ra danh sách phim
        /// </summary>
        /// <returns></returns>
        public static List<Phim> getPhimAZ()
        {
            List<Phim> listPhim = new List<Phim>();
            listPhim = db.Phims.OrderBy(x => x.tenPhim).ToList<Phim>();
            return listPhim;
        }
        /// <summary>
        /// Lấy ra danh sách phim theo lượt mua giảm dần
        /// </summary>
        /// <returns></returns>
        public static List<Phim> getPhimTopBuy()
        {
            List<Phim> listPhim = new List<Phim>();
            listPhim = db.Phims.OrderByDescending(x => x.luotMua).ToList<Phim>();
            return listPhim;
        }
        /// <summary>
        /// Lấy ra danh sách phim theo điểm giảm dần
        /// </summary>
        /// <returns></returns>
        public static List<Phim> getPhimTopMark()
        {
            List<Phim> listPhim = new List<Phim>();
            listPhim = db.Phims.OrderByDescending(x => x.diemImdb).ToList<Phim>();
            return listPhim;
        }
        /// <summary>
        /// Lấy ra danh sách phim ra mắt gần đây nhất
        /// </summary>
        /// <returns></returns>
        public static List<Phim> getPhimLatest()
        {
            List<Phim> listPhim = new List<Phim>();
            listPhim = db.Phims.OrderByDescending(x => x.ngayPH).ToList<Phim>();
            return listPhim;
        }
        /// <summary>
        /// Lấy ra danh sách phim giá rẻ nhất
        /// </summary>
        /// <returns></returns>
        public static List<Phim> getPhimCheap()
        {
            List<Phim> listPhim = new List<Phim>();
            listPhim = db.Phims.OrderBy(x => x.giaBan).ToList<Phim>();
            return listPhim;
        }
        /// <summary>
        /// Lấy ra danh sách phim theo loại
        /// </summary>
        /// <param name="maLoai"></param>
        /// <returns></returns>
        public static List<Phim> getPhimByCategory(int maLoai)
        {
            List<Phim> listPhim = new List<Phim>();
            listPhim = db.Phims.Where(z => z.maLoai == maLoai).ToList();
            return listPhim;
        }
        /// <summary>
        /// Lấy ra loại phim
        /// </summary>
        /// <param name="maLoai"></param>
        /// <returns></returns>
        public static List<LoaiPhim> getCategory()
        {
            List<LoaiPhim> listLP = new List<LoaiPhim>();
            listLP = db.LoaiPhims.ToList();
            return listLP;
        }
        /// <summary>
        /// Lấy ra danh sách bài viết
        /// </summary>
        /// <returns></returns>
        public static List<BaiViet> getBlog()
        {
            List<BaiViet> listBlog = new List<BaiViet>();
            listBlog = db.BaiViets.ToList<BaiViet>();
            return listBlog;
        }
        /// <summary>
        /// Lấy ra danh sách khác hàng
        /// </summary>
        /// <returns></returns>
        public static List<KhachHang> getCustomer()
        {
            List<KhachHang> listKH = new List<KhachHang>();
            listKH = db.KhachHangs.ToList<KhachHang>();
            return listKH;
        }
        /// <summary>
        /// Lấy ra danh sách đơn hàng
        /// </summary>
        /// <returns></returns>
        public static List<DonHang> getOrder()
        {
            List<DonHang> listDH = new List<DonHang>();
            listDH = db.DonHangs.ToList<DonHang>();
            return listDH;
        }
        /// <summary>
        /// Lấy ra CT đơn hàng theo số ĐH
        /// </summary>
        /// <param name="soDH"></param>
        /// <returns></returns>
        public static List<CtDonHang> getOrderDetail(string soDH)
        {
            List<CtDonHang> listCTDH = new List<CtDonHang>();
            listCTDH = db.CtDonHangs.Where(x => (x.soDH).Equals(soDH)).ToList<CtDonHang>();
            return listCTDH;
        }
        /// <summary>
        /// Lấy danh sách tài khoản
        /// </summary>
        /// <returns></returns>
        public static List<TaiKhoan> getUser()
        {
            List<TaiKhoan> listTK = new List<TaiKhoan>();
            listTK = db.TaiKhoans.ToList<TaiKhoan>();
            return listTK;
        }
        /// <summary>
        /// Lấy danh sách bài viết mới nhất
        /// </summary>
        /// <returns></returns>
        public static List<BaiViet> getBlogLatest()
        {
            List<BaiViet> listBlog = new List<BaiViet>();
            listBlog = db.BaiViets.Where(x => x.daDuyet==true).OrderByDescending(x => x.ngayDang).ToList<BaiViet>();
            return listBlog;
        }
        /// <summary>
        /// Lấy danh sách bài viết đã duyệt
        /// </summary>
        /// <returns></returns>
        public static List<BaiViet> getBlogActive()
        {
            List<BaiViet> listBlog = new List<BaiViet>();
            listBlog = db.BaiViets.Where(x => x.daDuyet == true).ToList<BaiViet>();
            return listBlog;
        }
        /// <summary>
        /// Lấy danh sách bài viết chưa duyệt
        /// </summary>
        /// <returns></returns>
        public static List<BaiViet> getBlogHidden()
        {
            List<BaiViet> listBlog = new List<BaiViet>();
            listBlog = db.BaiViets.Where(x => x.daDuyet == false).ToList<BaiViet>();
            return listBlog;
        }
        /// <summary>
        /// Lấy ct đơn hàng bằng số ĐH
        /// </summary>
        /// <param name="soDH"></param>
        /// <returns></returns>
        public static List<CtDonHang> getBillByID(string soDH)
        {
            return db.CtDonHangs.Where(x=>x.soDH == soDH).ToList<CtDonHang>();
        }
    }
}