﻿USE [master]
GO
/****** Object:  Database [MovieShop]    Script Date: 1/7/2022 12:27:33 PM ******/
CREATE DATABASE [MovieShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL1\MSSQL\DATA\MovieShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL1\MSSQL\DATA\MovieShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MovieShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MovieShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MovieShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieShop] SET  MULTI_USER 
GO
ALTER DATABASE [MovieShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MovieShop] SET QUERY_STORE = OFF
GO
USE [MovieShop]
GO
/****** Object:  User [aspDbProject]    Script Date: 1/7/2022 12:27:33 PM ******/
CREATE USER [aspDbProject] FOR LOGIN [aspDbProject] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [aspDbProject]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 1/7/2022 12:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[maBV] [varchar](10) NOT NULL,
	[tenBV] [nvarchar](250) NOT NULL,
	[hinhDD] [varchar](max) NULL,
	[hinhDD2] [varchar](max) NULL,
	[ndTomTat] [nvarchar](2000) NULL,
	[ngayDang] [datetime] NULL,
	[loaiTin] [nvarchar](30) NULL,
	[noiDung] [nvarchar](max) NULL,
	[taiKhoan] [varchar](20) NOT NULL,
	[daDuyet] [bit] NULL,
	[luotXem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maBV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CtDonHang]    Script Date: 1/7/2022 12:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CtDonHang](
	[soDH] [varchar](10) NOT NULL,
	[maPhim] [varchar](10) NOT NULL,
	[soLuong] [int] NULL,
	[giaBan] [bigint] NULL,
	[giamGia] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[soDH] ASC,
	[maPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 1/7/2022 12:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[soDH] [varchar](10) NOT NULL,
	[maKH] [varchar](10) NOT NULL,
	[taiKhoan] [varchar](20) NOT NULL,
	[ngayDat] [datetime] NULL,
	[daKichHoat] [bit] NULL,
	[ngayGH] [datetime] NULL,
	[emailGH] [nvarchar](250) NULL,
	[ghiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[soDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 1/7/2022 12:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKH] [varchar](10) NOT NULL,
	[tenKH] [nvarchar](50) NOT NULL,
	[soDT] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[diaChi] [nvarchar](250) NULL,
	[ngaySinh] [datetime] NULL,
	[gioiTinh] [bit] NULL,
	[ghiChu] [ntext] NULL,
	[lanMua] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhim]    Script Date: 1/7/2022 12:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhim](
	[maLoai] [int] IDENTITY(1,1) NOT NULL,
	[tenLoai] [nvarchar](88) NOT NULL,
	[ghiChu] [ntext] NULL,
	[hinhDD] [varchar](max) NULL,
	[hinhDD2] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phim]    Script Date: 1/7/2022 12:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phim](
	[maPhim] [varchar](10) NOT NULL,
	[tenPhim] [nvarchar](500) NOT NULL,
	[hinhDD] [varchar](max) NULL,
	[hinhDD2] [varchar](max) NULL,
	[ndTomTat] [nvarchar](2000) NULL,
	[ngayDang] [datetime] NULL,
	[maLoai] [int] NOT NULL,
	[noiDung] [nvarchar](4000) NULL,
	[taiKhoan] [varchar](20) NOT NULL,
	[daDuyet] [bit] NULL,
	[soTap] [varchar](10) NULL,
	[giaBan] [int] NULL,
	[giamGia] [int] NULL,
	[nhaSanXuat] [nvarchar](168) NULL,
	[luotMua] [int] NULL,
	[ngayPH] [date] NULL,
	[doPG] [varchar](10) NULL,
	[thoiLuong] [nvarchar](50) NULL,
	[diemImdb] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[maPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/7/2022 12:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[taiKhoan] [varchar](20) NOT NULL,
	[matKhau] [varchar](200) NULL,
	[hoDem] [nvarchar](50) NULL,
	[tenTV] [nvarchar](30) NOT NULL,
	[ngaysinh] [datetime] NULL,
	[gioiTinh] [bit] NULL,
	[soDT] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[diaChi] [nvarchar](250) NULL,
	[trangThai] [bit] NULL,
	[ghiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[taiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'2112270829', N'Những mảng sáng - tối trong showbiz Hàn 2021', N'/Media/Images/blog/blog2112270829.jpg', N'/Media/Images/blog/blog2112270829.jpg', N'Năm 2021, dù phải đối mặt với nhiều khó khăn do Covid-19, làng giải trí Hàn Quốc vẫn gặt hái được nhiều thành công, gây tiếng vang toàn cầu.

', CAST(N'2021-12-27T20:29:10.297' AS DateTime), N'sao', N'<p class="description" style="margin-bottom: 15px; padding: 0px; text-rendering: optimizelegibility; font-size: 18px; line-height: 28.8px; color: rgb(34, 34, 34); font-family: arial; background-color: rgb(252, 250, 246);">Youn Yuh Jung đoạt Oscar, loạt sao ngừng hoạt động vì bị tố cáo bắt nạt, quấy rối tình dục bạn học, tạo mảng sáng - tối ở showbiz Hàn 2021.</p><article class="fck_detail " style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 18px; line-height: 28.8px; font-family: arial; color: rgb(34, 34, 34); background-color: rgb(252, 250, 246);"><p class="Normal" style="margin-bottom: 1em; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;">Năm 2021, dù phải đối mặt với nhiều khó khăn do Covid-19, làng giải trí Hàn Quốc vẫn gặt hái được nhiều thành công, gây tiếng vang toàn cầu.</p><p class="Normal" style="margin-bottom: 1em; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;">Đầu năm,&nbsp;<a href="https://vnexpress.net/tag/youn-yuh-jung-1398589" rel="dofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">Youn Yuh Jung</a>&nbsp;ghi dấu lịch sử khi trở thành ngôi sao Hàn Quốc đầu tiên thắng giải diễn xuất Oscar. Diễn viên được vinh danh ở hạng mục "Nữ phụ xuất sắc" với vai bà ngoại Soon Ja trong&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Minari</em>. Trên sân khấu nhận giải, bà gây cười khi nói tha thứ cho những người phát âm sai tên mình suốt mùa giải thưởng năm nay. Bà cảm ơn những người đã bỏ phiếu và ủng hộ, đồng thời tri ân đoàn làm phim. Truyền thông nhận định Youn Yuh Jung và&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Minari&nbsp;</em>giúp điện ảnh Hàn tạo mốc son mới tại Oscar, tiếp nối&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Parasite&nbsp;</em>- bom tấn đoạt&nbsp;<a href="https://vnexpress.net/nguoi-han-vo-oa-khi-parasite-thang-oscar-4052903.html" rel="dofollow" target="_blank" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">bốn giải lớn</a>&nbsp;Oscar 2020.</p><figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject" class="tplCaption action_thumb_added" style="margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left;"><div class="fig-picture" style="margin: 0px; padding: 0px 0px 481.641px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; justify-content: center; background: rgb(240, 238, 234); position: relative;"><picture style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"><source data-srcset="https://i1-giaitri.vnecdn.net/2021/12/26/Youn-Yuh-Jung-Brad-Pitt-8125-1-2495-4679-1640523033.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=e9P1CUDNjX6dzvHP_ayawA 1x, https://i1-giaitri.vnecdn.net/2021/12/26/Youn-Yuh-Jung-Brad-Pitt-8125-1-2495-4679-1640523033.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=IL1wlnXxsqDcunj7LqXDPA 1.5x, https://i1-giaitri.vnecdn.net/2021/12/26/Youn-Yuh-Jung-Brad-Pitt-8125-1-2495-4679-1640523033.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=iQ1Ty7c5oQ3h7IvH7LRlGg 2x" srcset="https://i1-giaitri.vnecdn.net/2021/12/26/Youn-Yuh-Jung-Brad-Pitt-8125-1-2495-4679-1640523033.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=e9P1CUDNjX6dzvHP_ayawA 1x, https://i1-giaitri.vnecdn.net/2021/12/26/Youn-Yuh-Jung-Brad-Pitt-8125-1-2495-4679-1640523033.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=IL1wlnXxsqDcunj7LqXDPA 1.5x, https://i1-giaitri.vnecdn.net/2021/12/26/Youn-Yuh-Jung-Brad-Pitt-8125-1-2495-4679-1640523033.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=iQ1Ty7c5oQ3h7IvH7LRlGg 2x" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"><img itemprop="contentUrl" loading="lazy" intrinsicsize="680x0" alt="Youn Yuh Jung chụp hình cùng Brad Pitt sau khi nhận tượng vàng. Ảnh: AP" class="lazy lazied" src="https://i1-giaitri.vnecdn.net/2021/12/26/Youn-Yuh-Jung-Brad-Pitt-8125-1-2495-4679-1640523033.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=e9P1CUDNjX6dzvHP_ayawA" data-src="https://i1-giaitri.vnecdn.net/2021/12/26/Youn-Yuh-Jung-Brad-Pitt-8125-1-2495-4679-1640523033.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=e9P1CUDNjX6dzvHP_ayawA" data-ll-status="loaded" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 0px; max-height: 700px; width: 670px;"></picture></div><figcaption itemprop="description" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;"><p class="Image" style="margin-bottom: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px;">Youn Yuh Jung chụp hình cùng Brad Pitt sau khi nhận tượng vàng. Ảnh:&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">AP</em></p></figcaption></figure><p class="Normal" style="margin-bottom: 1em; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;"><em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;"><a href="https://vnexpress.net/tag/squid-game-1449644" rel="dofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">Squid Game</a>&nbsp;</em>(Trò chơi con mực) - bom tấn phim sinh tồn Hàn Quốc - trở thành&nbsp;<a href="https://vnexpress.net/squid-game-phim-han-thanh-hien-tuong-toan-cau-4373257.html" rel="dofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">hiện tượng toàn cầu</a>&nbsp;khi khởi chiếu vào tháng 9. Phim thu hút hàng trăm triệu lượt theo dõi, đứng đầu danh sách được xem nhiều nhất của nền tảng trực tuyến này tại 94 quốc gia, vùng lãnh thổ, trong đó có Mỹ.</p><p class="Normal" style="margin-bottom: 1em; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;">Theo&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">New York Times</em>, các từ khóa về phim, diễn viên... trở thành chủ đề thịnh hành trên&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Tiktok,</em>&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Twitter, Instagram</em>. Loạt hoạt động "ăn theo" như tham gia các trò chơi, làm kẹo đường... trở thành xu hướng. Lượng người theo dõi các diễn viên&nbsp;<a href="https://vnexpress.net/nhung-mang-sang-toi-trong-showbiz-han-2021-4408371.html" rel="nofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">Jung Ho Yeon</a>, Lee Jung Jae... trên mạng xã hội tăng theo cấp số nhân. Theo&nbsp;<em style="margin: 0px; padding: 0px; text-rendering: optimizelegibility;">Bloomberg</em>, series đã tạo ra 891,1 triệu USD về giá trị tác động - một số liệu Netflix sử dụng để đánh giá hiệu suất của các sản phẩm đặc biệt. Series Hàn nhận&nbsp;<a href="https://vnexpress.net/squid-game-nhan-ba-de-cu-qua-cau-vang-2022-4402825.html" rel="dofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">ba đề cử</a>&nbsp;Quả Cầu Vàng 2022, trong đó có hạng mục quan trọng "Series truyền hình - Chính kịch".</p><p class="Normal" style="margin-bottom: 1em; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;"><a href="https://vnexpress.net/chu-de/bts-2600" rel="dofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">BTS</a>,&nbsp;<a href="https://vnexpress.net/chu-de/black-pink-1671" rel="dofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">Blackpink</a>&nbsp;và nhiều nhóm nhạc Hàn tiếp tục nâng cao tiếp tục ghi dấu ở thị trường quốc tế khi liên tiếp đứng đầu bảng xếp hạng Billboard, đoạt cúp tại các lễ trao giải... Các nhóm nhạc cũng&nbsp;<a href="https://vnexpress.net/sao-han-kiem-tien-tot-thoi-dich-4295443.html" rel="dofollow" style="margin: 0px; padding: 0px 0px 1px; text-rendering: optimizelegibility; color: rgb(7, 109, 182); position: relative; text-underline-position: under; border-bottom-width: 1px; border-bottom-style: solid;">kiếm tiền tốt thời dịch</a>&nbsp;nhờ chuyển hướng sang hoạt động trực tuyến.</p></article>', N'miyuine', 1, 0)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866A1', N'Shang-Chi: Anh hùng mới, nội dung cũ', N'/Media/Images/blog/shangchi.jpg', N'/Media/Images/blog/shangchi2.jpg', N'Bom tấn "Shang-Chi and the Legend of the Ten Rings" giới thiệu siêu anh hùng gốc Á nhưng có phần kịch bản thiếu sáng tạo.', CAST(N'2021-08-21T09:08:00.000' AS DateTime), N'review', N'Shang-Chi (Lưu Tư Mộ) mất mẹ từ năm bảy tuổi, được cha Văn Vũ (Lương Triều Vỹ) huấn luyện võ công để trở thành sát thủ.
				Đến năm 14 tuổi, cậu bỏ nhà sang San Francisco, tìm cách chôn vùi quá khứ và sống bằng nghề nhân viên khách sạn.
				Một lần khi đang đi xe buýt cùng bạn thân Katy (Awkwafina), Shang-Chi bị tổ chức tội phạm Thập Luân do cha cầm đầu chặn đánh.
				Anh quyết định trở về quê hương để tìm em gái Hạ Linh (Trương Mộng Nhi), đồng thời làm rõ kế hoạch của cha.
				Tuy nhiên, phần kịch bản cũ kỹ và có nhiều điểm trừ. Số phận của người hùng được xây dựng theo mô-típ quen thuộc của Thor (2011)
				lẫn Black Panther (2018) khi nhân vật vướng vào những mâu thuẫn gia đình khó tháo gỡ.
				Shang-Chi được Văn Vũ nuôi nấng từ nhỏ nhưng hai cha con không có nhiều tình cảm.
				Em gái Hạ Linh thì xa cách, cho rằng anh trai phản bội khi bỏ nhà ra đi mà không liên lạc.
				Biên kịch không đầu tư xây dựng và phát triển tâm lý nhân vật, khiến các nhân vật hành động một màu, ít tạo được sự bất ngờ.
				Điểm sáng của phim nằm ở màn võ thuật. Những pha đánh đấm cận chiến đóng vai trò quan trọng trong việc xây dựng kịch tính.
				Để sáng tạo chiêu thức của Shang-Chi, ê-kíp phối hợp nhiều đòn thế võ thuật khác nhau như Thiếu Lâm, Thái cực quyền, Vịnh Xuân quyền, Hồng Gia quyền...
				Các màn đánh đấm gợi nhớ tác phẩm hành động Hong Kong thập niên 1980, 1990 lẫn dòng võ hiệp của Trung Quốc.
				Cảnh mở màn sử dụng hiệu ứng chuyển động chậm (slow-motion) theo phong cách của Trương Nghệ Mưu qua các phim Anh hùng (2002) hay Thập diện mai phục (2004).
				Trong khi đó, cảnh Shang-Chi cởi trần trong đấu trường nhằm tri ân phim của Lý Tiểu Long.', N'stark', 1, 5611)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866A2', N'Rạp phim ở TP.HCM mở lại vào ngày 19/11', N'/Media/Images/blog/cinema.jpg', N'/Media/Images/blog/cinema2.jpg', N'TP.HCM ban hành quy định mới về thích ứng an toàn trên toàn thành phố và ở cấp phường, xã, thị trấn.
				Theo đó, rạp phim được mở cửa ở vùng cấp độ dịch 1, 2, 3.', CAST(N'2021-11-16T20:24:00.000' AS DateTime), N'xã hội', N'Chiều 16/11, Chủ tịch UBND TP.HCM Phan Văn Mãi ký quyết định quy định tạm thời biện pháp "Thích ứng an toàn, linh hoạt, kiểm soát hiệu quả Covid-19".
				Kèm theo quyết định là 3 phụ lục quy định tạm thời về các biện pháp áp dụng theo từng cấp độ dịch trên phạm vi phường, xã, thị trấn của các nhóm hoạt động
				gồm cơ quan, công sở, giao thông, giáo dục và hoạt động khác. Theo đó, rạp phim được hoạt động ở vùng cấp độ dịch 1, 2, 3. Cụ thể, ở cấp độ 1,
				rạp chiếu phim hoạt động tối đa 100% công suất. Ở cấp độ hai hoạt động tối đa 50% công suất và cấp độ 3 là 25%.
				Như vậy, sau hơn 6 tháng đóng cửa, hệ thống rạp chiếu phim đã tái hoạt động. Trước đó, vào 18h ngày 3/5, trước diễn biến phức tạp của dịch Covid-19,
				UBND TP.HCM chỉ đạo ngừng nhiều dịch vụ giải trí, trong đó có rạp phim. Tính đến thời điểm hiện tại là hơn 6 tháng hệ thống rạp phim đóng cửa tại TP.HCM.
				Đây được xem là quãng thời gian tạm dừng hoạt động lâu nhất từ trước đến nay đối với nhà rạp. Đại diện CGV cho biết hiện 100% nhân viên làm việc tại rạp
				đã được tiêm phòng Covid-19 ít nhất một mũi. Hệ thống rạp chiếu phim cũng thành lập tổ an toàn phòng chống Covid-19 tại các chi nhánh để tập huấn cho nhân viên.
				Đồng thời, các tổ này có nhiệm vụ phản ứng nhanh khi phát hiện trường hợp nghi nhiễm SARS-CoV-2.'',''16/11/2021 20:24'',N''xã hội'',
				N''TP.HCM ban hành quy định mới về thích ứng an toàn trên toàn thành phố và ở cấp phường, xã, thị trấn.
				Theo đó, rạp phim được mở cửa ở vùng cấp độ dịch 1, 2, 3.', N'mtp', 1, 11203)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866A3', N'Sony và Marvel lên kế hoạch sản xuất nhiều phần phim Spider-Man', N'/Media/Images/blog/spiderMan.jpg', N'/Media/Images/blog/spiderMan2.jpg', N'Nguồn tin của The Hollywood Reporter ngày 29.11 cho biết hai hãng Sony và Marvel đang lên kế hoạch sản xuất bộ 3 phim Người nhện (Spider-Man) mới trong tương lai. ', CAST(N'2021-11-30T16:01:00.000' AS DateTime), N'dự án phim', N'Trong khi bom tấn Spider-Man: No Way Home (Jon Watts chỉ đạo, Kevin Feige và Amy Pascal sản xuất) chưa ra rạp (dự kiến xuất xưởng ngày 17.12 tới tại thị trường Bắc Mỹ)
				thì nhà sản xuất Amy Pascal đã thông báo rằng phía Sony và Marvel lên kế hoạch thực hiện bộ 3 phim Người nhện mới trong tương lai.
				Cụ thể, nhà sản xuất Amy Pascal tiết lộ là hai hãng đang tìm nhiều tình tiết, câu chuyện cho nhân vật Người nhện của nam diễn viên Tom Holland sắp tới.
				Anh đóng chính trong 3 phần phim Người nhện từ năm 2017 đến hiện tại, trong đó 2 tác phẩm Spider-Man: Homecoming (2017) và Spider-Man: Far From Home (2019)
				có doanh thu phòng vé toàn cầu rất cao, lần lượt là trên 880 triệu USD và trên 1,13 tỉ USD, theo Box Office Mojo. Bà Amy Pascal nói trong một cuộc phỏng vấn trên Fandango mới đây:
				"Phim Spider-Man: No Way Home không phải là bộ phim về Người nhện cuối cùng mà chúng tôi thực hiện. Chúng tôi đã sẵn sàng để làm bộ phim tiếp theo với Tom Holland và phía Marvel.
				Chúng tôi nghĩ sẽ có 3 phần phim ra đời". Phía Sony (hãng phát hành dự án) cho biết studio rất quý sự hợp tác của nam diễn viên Tom Holland
				và nhà sản xuất Kevin Feige nên hy vọng sẽ tiếp tục duy trì mối quan hệ này trong thời gian tới.', N'dungct', 1, 9678)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866A4', N'Top 6 nữ diễn viên Hàn Quốc có nhiều người theo dõi nhất trên Instagram: Jung Ho Yeon soán ngôi IU?', N'/Media/Images/blog/IU.jpg', N'/Media/Images/blog/koreanActress.jpg', N'Thứ tự các nữ diễn viên Hàn Quốc sở hữu số lượng người theo dõi trên Instagram nhiều nhất đã có sự xáo trộn lớn.', CAST(N'2021-10-06T20:24:00.000' AS DateTime), N'sao', N'Sau cơn bão đến từ Squid Game, thứ tự các nữ diễn viên Hàn Quốc sở hữu số lượng người theo dõi nhiều nhất trên Instagram đã có sự thay đổi vô cùng mạnh mẽ.
				Chắc chắn từ đây sẽ có nhiều nữ diễn viên kì cựu phải dè chừng trước những tân binh khủng. Khá tiếc cho Song Hye Kyo khi cô cô nàng đã phải tụt xuống vị trí thứ 6
				với 12 triệu người theo dõi trên Instagram. Với số lượng là 12,6 triệu người theo dõi, Yoona đã đứng vị trí thứ 5. Cô nàng được biết đến không chỉ là một idol tài sắc vẹn toàn
				mà còn là một diễn viên tài năng với rất nhiều vai diễn đa dạng. Lee Sung Kyung giành vị trí thứ 4 với 12,9 triệu người theo dõi. Trong năm nay, nữ diễn viên chưa có một tác phẩm truyền hình mới nào để ra mắt khán giả. 
				Chỉ sau một đêm với bộ phim Squid Game, Jung Ho Yeon đã vượt lên vị trí số ba với tài khoản Instagram có 13,6 triệu người theo dõi. Đây quả là một thành tích khủng so với một tân binh mới bước chân vào nghề diễn viên. 
				Với tài khoản đạt 16,5 triệu người theo dõi, nữ diễn viên Suzy vẫn xuất sắc giữ cho mình vị trí thứ 2. Vị trí quán quân thuộc về IU. Cô nàng sở hữu tài khoản với 22,7 triệu người theo dõi,
				đứng đầu trong tất cả các nữ diễn viên Hàn Quốc.', N'iu', 1, 2664)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866A5', N'Thông báo bảo trì Website vào 03/12/2021 lúc 03:00 AM', N'/Media/Images/blog/baoTri.jpg', N'/Media/Images/blog/baoTri.jpg', N'Tạm ngưng để bảo trì nâng cấp hệ thống Universe.', CAST(N'2021-12-02T08:00:00.000' AS DateTime), N'thông báo', N'Để nâng cao chất lượng dịch vụ, Ban quản trị website xin thông báo sẽ tiến hành bảo trì hệ thống website kinh doanh phim bản quyền trực tuyến Universe trong khoảng thời gian từ 3h00 đến 5h00, Thứ Sáu, ngày 03 tháng 12 năm 2021.
				Trong thời gian này, Quý khách sẽ không thể truy cập được hệ thống website để thanh toán hoặc xem phim. Lần bảo trì này website sẽ nâng cấp một số hệ thống cũng như cải thiện tốc độ truy cập, cập nhật thêm nhiều phim mới.
				Rất mong nhận được sự thông cảm của Quý khách cho bất kỳ sự bất tiện nào (nếu có).', N'miyuine', 1, 6070)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866A6', N'Arcane 2021: Soán ngôi Squid game, là phim Netflix đạt điểm IMDb cao nhất lịch sử', N'/Media/Images/blog/arcane.jpg', N'/Media/Images/blog/arcane2.jpg', N'Arcane: Liên Minh Huyền Thoại (2021) vừa công chiếu đã soán ngôi vương của Squid Game, đồng thời là phim Netflix có điểm IMDb cao nhất lịch sử cùng 100% Rotten Tomatoes.', CAST(N'2021-11-12T14:34:00.000' AS DateTime), N'review', N'Arcane là loạt phim hoạt hình mới do Riot Games phối hợp với Netflix phát triển và kể về câu chuyện của hai nhà vô địch mang tính biểu tượng nhất của Liên Minh Huyền Thoại. 
				Lấy bối cảnh ở các thành phố đối lập Piltover và Zaun với mâu thuẫn ngày càng trở nên sôi sục. Sự cạnh tranh giữa các thành phố khiến gia đình bị chia rẽ, bạn bè phản bội nhau…
				nhưng cũng trong hoàn cảnh loạn lạc đấy đã định hình nên một số nhà vô địch nổi tiếng của Liên minh huyền thoại bao gồm Vi, Jinx, Caitlyn, Jayce và Viktor. 
				Mặc dù Arcane mới được phát hành và điểm số có thể sẽ còn thay đổi, nhưng những đánh giá ban đầu của bộ phim trên một số nguồn phê bình uy tín nhất vẫn đáng được lưu ý.
				Bộ phim đang đạt 9,4/10 trên IMDb và thật đáng kinh ngạc là 100% cà chua tươi trên Rotten Tomatoes. Các nhân vật của Arcane trông cũng rất tuyệt vời.
				Tạo hình các nhân vật vẫn mang cảm giác quen thuộc vốn có của LMHT nhưng cũng có sự chuyển động tự nhiên, linh hoạt như phim hoạt hình.
				Các phân cảnh chiến đấu của bộ phim cũng được đánh giá rất cao, pha trộn giữa chuyển động chậm, góc quay độc đáo và việc sử dụng nhiều góc nhìn trong một vụ nổ để giúp khán giả
				dễ theo dõi phim một cách trơn tru, mượt mà hơn.', N'miyuine', 0, 9102)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866A7', N'Công an TP HCM khởi tố vụ án hình sự liên quan website phimmoi.net', N'/Media/Images/blog/phimmoi.jpg', N'/Media/Images/blog/phimmoi2.jpg', N'Quá trình xác minh, Công an TP HCM xác định các cá nhân đã sao chép, sử dụng tác phẩm điện ảnh để phát trên website www.phimmoi.net.', CAST(N'2021-08-19T19:01:00.000' AS DateTime), N'xã hội', N'Ngày 19-8, Cơ quan CSĐT Công an TP HCM cho biết đang điều tra vụ án xâm phạm quyền tác giả, quyền liên quan theo quyết định khởi tố vụ án hình sự liên quan đến website:
				www.phimmoi.net, xảy ra tại TP HCM. Theo Công an TP HCM, từ năm 2014, ông N.T.T. (quê Lâm Đồng) xây dựng website chiếu phim trực tuyến miễn phí trên mạng internet.
				Ông T. đã thuê 2 người có trình độ kỹ thuật cao về công nghệ thông tin ở Đồng Nai để thực hiện lập trình, quản trị, vận hành website: www.phimmoi.net. 
				Nhóm ông T. đã khai thác, sao chép, sử dụng, trình chiếu, truyền đạt các tác phẩm điện ảnh ra công chúng không được phép của chủ thể quyền và kinh doanh quảng cáo sản phẩm,
				dịch vụ trái phép trên các bộ phim có bản quyền, nhằm thu lợi bất chính với số tiền đặc biệt lớn. Để phục vụ công tác điều tra, Công an TP HCM thông báo đề nghị các bị hại là tác giả,
				chủ sở hữu quyền tác giả, đại diện chủ thể quyền đến Công an TP HCM (PC03 - Đội 9), địa chỉ: 674 đường 3/2, phường 14, quận 10, gặp Điều tra viên Lê Trung Luân. 
				Các cá nhân có thể cung cấp thông tin, tài liệu, dữ liệu điện tử có liên quan hành vi xâm phạm quyền tác giả, quyển liên quan.
				Ngoài ra, công an cũng yêu cầu ông N.T.T. cùng các cá nhân liên quan Ban quản trị, vận hành, giao dịch website: www.phimmoi.net đến PC03 Đội 9 để làm rõ, sự việc có liên quan.', N'mtp', 1, 3714)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866A8', N'Cats bị gọi là phim thảm họa điện ảnh năm 2019, dàn sao toàn hạng A như Taylor Swift cũng không đỡ nổi', N'/Media/Images/blog/cats.jpg', N'/Media/Images/blog/cats2.jpg', N'"Bom tấn nhạc kịch" Cats đang bị giới phê bình chê bai hết lời.', CAST(N'2019-12-20T19:23:00.000' AS DateTime), N'review', N'Các bài đánh giá về nhạc kịch Cats (Những Chú Mèo) của Andrew Lloyd Webber bắt đầu tràn ngập. Đáng tiếc, phần lớn các nhà phê bình và cư dân mạng đều không có thiện cảm với bộ phim này.
				Trong tổng số 89 bài đánh giá trên Rotten Tomatoes, có đến 74 ý kiến chê bai khiến điểm số của phim chỉ đạt 15%. Nhiều đánh giá chỉ trích CGI của bộ phim,
				biến dàn diễn viên A + bao gồm Judi Dench, Idris Elba, Jennifer Hudson... thành những "quái mèo" đáng sợ. Một số nhà phê bình còn khẳng định Cats là một bộ phim nhàm chán,
				vô hồn và buồn tẻ. Nhà phê bình Mark Dujsik còn khắc nghiệt hơn: "Sống cả cuộc đời mà tôi không biết bộ phim này có ý nghĩa gì và điều gì đã đưa nó đến với thế giới".
				BuzzFeed News gọi Cats là thảm họa trong khi trang Gizmodo còn bày tỏ: "Tôi tiên đoán rằng chẳng ai cần xem phim này". Cats bị công chúng đánh giá thấp ngay từ những trailer đầu tiên.
				Trước phản ứng của khán giả, Cats đã phải chỉnh sửa lại rất nhiều lần. Tiếc rằng phiên bản chính thức của phim có vẻ cũng không hề khá hơn những hình ảnh "nhá hàng" là bao.', N'dungct', 1, 7002)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866A9', N'Nam thần Gong Yoo tái xuất với tạo hình khác lạ trong bom tấn mới', N'/Media/Images/blog/gongyoo.jpg', N'/Media/Images/blog/gongyoo2.jpg', N'Gong Yoo, ngôi sao phim Yêu tinh sẽ vào vai trưởng nhóm của một biệt đội ưu tú trong series phim được chờ đợi nhất cuối năm nay mang tên Biển tĩnh lặng.', CAST(N'2021-12-01T09:31:00.000' AS DateTime), N'dự án phim', N'Sau một thời gian dài mong đợi cùng với sự săn đón nồng nhiệt của khán giả, đoạn phim giới thiệu cùng poster thứ hai của bộ phim Biển tĩnh lặng (The Silent Sea)
				chính thức ra mắt ngày 30/11 khiến các fan phấn khích. Lấy bối cảnh về sự cạn kiệt tài nguyên thiên nhiên đã tàn phá Trái đất trong tương lai gần, loạt phim Biển tĩnh lặng mang đến cho khán giả câu chuyện
				về biệt đội ưu tú sẽ đến một cơ sở nghiên cứu bị bỏ hoang trên mặt trăng để thực hiện một sứ mệnh đặc biệt. Nhà sinh vật học Song Jian (Bae Doona), trưởng nhóm Han Yunjae (Gong Yoo),
				kỹ sư trưởng Ryu Taesuk (Lee Joon), bác sĩ Hong Gayoung (Kim Sun-young) cùng trưởng nhóm an ninh Gong Soohyuk (Lee Mu-saeng) và thuyền trưởng Kim Sun (Lee Sung-wook) phải đối mặt với những căng thẳng
				khi đặt chân vào vùng lãnh thổ chưa từng được con người khám phá. Họ sẽ phải thực hiện nhiệm vụ bí mật trên cơ sở nghiên cứu nằm ở trung tâm của mặt trăng, trong một khu vực được gọi là Biển tĩnh lặng,
				nơi vẫn còn ẩn giấu đằng sau vô vàn những bí ẩn. Điều này góp phần làm tăng thêm phần kịch tính của câu chuyện xung quanh những sự kiện sắp được hé lộ trước mắt họ và bí mật đằng sau nhiệm vụ của họ là gì.', N'iu', 1, 7113)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866B1', N'Phong độ Thành Long tuổi 67', N'/Media/Images/blog/jackieChan.jpg', N'/Media/Images/blog/jackieChan2.jpg', N'Siêu sao hành động Thành Long được nhiều người khen nhanh nhẹn, năng động ở tuổi 67.', CAST(N'2021-10-28T09:31:00.000' AS DateTime), N'sao', N'Theo Ithome, hôm 27/10, Thành Long lần đầu sử dụng ứng dụng video ngắn Kuaishou và gây sốt trên mạng xã hội. Tính tới sáng 28/10, lượng fan theo dõi tài tử vượt 20 triệu.
				Video đầu tiên ông đăng tải thu hút hơn 200 triệu lượt xem. Gần 10 triệu người xem lại các trích đoạn phim của Thành Long trên Kuaishow khi tài tử sử dụng mạng xã hội này.
				Sau một ngày, tổng lượt xem video liên quan ông vượt 1,6 tỷ. Trong nội dung đăng tải, Thành Long tái hiện những cảnh hành động trong phim của ông như biểu diễn với gậy sắt, ô, thang.
				Ông còn khoe cơ bắp khi luyện võ. Hàng chục nghìn khán giả khen Thành Long khỏe khoắn, năng động và mạnh mẽ. Thành Long duy trì độ nổi tiếng, hoạt động sôi nổi nhưng những năm gần đây, phim của ông không còn gây tiếng vang khi ra rạp.
				Các tác phẩm ông đóng chính như Cấp tiên phong (2020), Thần thám Bồ Tùng Linh (2019) đều có doanh thu phòng vé thấp hơn kinh phí thực hiện. Vì thế, nhiều khán giả cho rằng Thành Long được chú ý nhờ thành công từ các tác phẩm cũ. 
				Sự nghiệp rực rỡ song về đời tư, nam diễn viên vướng nhiều tai tiếng, trong đó có ngoại tình, có con rơi nhưng không nhận con, nghi án trốn thuế, nhiều lần phát ngôn không đúng mực. Trong tự truyện Chưa lớn đã già, Thành Long tự nhận bản thân ít học,
				không giỏi ăn nói và không phải người chồng, người cha tốt.', N'stark', 1, 4320)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866B2', N'Bom tấn Transformers, Star Trek dời lịch chiếu', N'/Media/Images/blog/transformers.jpg', N'/Media/Images/blog/transformers2.jpg', N'Hollywood Reporter ngày 10.11 đưa tin hai bom tấn của hãng Paramount là Transformers và Star Trek dời lịch chiếu', CAST(N'2021-11-11T13:00:00.000' AS DateTime), N'dự án phim', N'Phần mới nhất của thương hiệu phim nổi tiếng Transformers (tựa Việt: Robot đại chiến) mang tên Transformers: Rise of the Beasts sẽ khởi chiếu vào ngày 9.6.2023, thay vì 24.6.2022 như công bố trước đó.
				Tác phẩm do đạo diễn Steven Caple Jr thực hiện, có sự góp mặt của hai diễn viên Anthony Ramos và Dominique Fishback. Bộ phim lấy bối cảnh những năm 1990 với các địa điểm chính là Brooklyn, New York (Mỹ) và Peru. 
				Đầu năm nay, nhà làm phim Steven Caple Jr tiết lộ về bom tấn Transformers: Rise of the Beasts: "Có nhiều chủng Transformers (robot) khác nhau. Trong bộ phim của chúng tôi, chúng là những động vật thời tiền sử du hành xuyên thời gian và không gian,
				sau đó chúng được tìm thấy trên trái đất”. Một bom tấn khác của hãng Paramount là Star Trek do Matt Shakman đạo diễn cũng dời lịch phát hành từ ngày 9.6.2023 sang 22.12.2023. Hiện đoàn phim chưa công bố diễn viên chính.
				Nhiều khán giả thắc mắc liệu tài tử Chris Pine có trở lại dự án mới hay không. Anh là người đã đóng vai thuyền trưởng Kirk trong ba phần phim Star Trek trước đó (lần lượt ra mắt vào năm 2009, 2013 và 2016). Thông tin Transformers: Rise of the Beasts
				và Star Trek dời chiếu được đưa ra sau khi Paramount bổ nhiệm giám đốc điều hành mới Brian Robbins. Hồi tháng 10, Brian Robbins nhấn mạnh vai trò của phim nhượng quyền thương mại khi nói chuyện với Hollywood Reporter:
				"Những bom tấn nhượng quyền chính là ngọn lửa dẫn đường. Chúng tôi đang trong quá trình sản xuất và chưa thể nói trước điều gì, nhưng chúng tôi sẽ đạt mục tiêu sớm thôi".', N'dungct', 1, 10207)
INSERT [dbo].[BaiViet] ([maBV], [tenBV], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [loaiTin], [noiDung], [taiKhoan], [daDuyet], [luotXem]) VALUES (N'BL866B3', N'Giảm giá hoàng loạt phim hot nhân dịp Black Friday 2021', N'/Media/Images/blog/sale.jpg', N'/Media/Images/blog/sale2.jpg', N'Black Friday 2021 với hàng nghìn quà tặng hấp dẫn', CAST(N'2021-11-25T11:12:00.000' AS DateTime), N'thông báo', N'Tưng bừng mùa mua sắm cuối năm, siêu sale Black Friday Universe đổ bộ với khuyến mãi giảm giá cực nhiệt lên đến 50% cho hàng loạt sản phẩm phim. Đặc biệt, khi mua 2 sản phẩm trở lên còn được giảm thêm và cơ hội săn thêm những coupon mua sắm cực kỳ giá trị. 
				Rút thăm may mắn - Quà tặng hấp dẫn - Tổng trị giá lên đến 10 000 000 đồng. Ngoài ra còn có chương trình Cơn mưa FLASH DEAL chỉ từ 10K, sở hữu ngay loạt siêu phẩm từ phim truyền hình đến phim bộ với giá sốc chưa từng có từ các nhà sản xuất đình đám như
				Marvel, Sony, Universal, Paramount, Warner Bros...', N'miyuine', 1, 15320)
GO
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'2201040537', N'LLCRGTD3', 2, 210000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'2201040537', N'ZPA52T95', 1, 99000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'2201040650', N'3UDEVC45', 1, 210000, 20)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'2201040650', N'ZPA52T95', 1, 99000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'2201040713', N'R7NBHNUM', 2, 100000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'2201040713', N'ZQ7UM54M', 2, 131000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'2201060946', N'8YE6NMKF', 3, 25000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'2201060946', N'AYADZL98', 1, 235000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'2201060946', N'D46C49V9', 2, 160000, 0)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'BILL99251', N'D46C49V9', 1, 160000, NULL)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'BILL99252', N'9E4Y7LRC', 1, 125000, NULL)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'BILL99253', N'ZQ7UM54M', 1, 131000, NULL)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'BILL99254', N'8YE6NMKF', 1, 25000, NULL)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'BILL99254', N'FMRA74KE', 1, 105000, NULL)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'BILL99255', N'AYADZL98', 2, 235000, NULL)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'BILL99256', N'8G3C834H', 5, 356000, NULL)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'BILL99257', N'9FUS2285', 4, 9000, NULL)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'BILL99257', N'9ZCC6ZEP', 2, 10000, NULL)
INSERT [dbo].[CtDonHang] ([soDH], [maPhim], [soLuong], [giaBan], [giamGia]) VALUES (N'BILL99257', N'TXME8E5W', 1, 46000, NULL)
GO
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [emailGH], [ghiChu]) VALUES (N'2201040537', N'0945321448', N'triet', CAST(N'2022-01-04T17:37:56.543' AS DateTime), NULL, CAST(N'2022-01-04T18:07:56.543' AS DateTime), N'minhchau12@gmail.com', N'5 sao')
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [emailGH], [ghiChu]) VALUES (N'2201040650', N'0945321451', N'triet', CAST(N'2022-01-04T18:50:31.687' AS DateTime), NULL, CAST(N'2022-01-04T19:20:31.687' AS DateTime), N'laudaitinhai@gmail.com', N'bạn quá hư sẽ bị đàm phạt')
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [emailGH], [ghiChu]) VALUES (N'2201040713', N'0944365321', N'triet', CAST(N'2022-01-04T19:13:41.253' AS DateTime), NULL, CAST(N'2022-01-04T19:43:41.253' AS DateTime), N'blackpinkinurarea@gmail.com', N'Blink is love')
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [emailGH], [ghiChu]) VALUES (N'2201060946', N'0947652314', N'triet', CAST(N'2022-01-06T21:46:27.373' AS DateTime), NULL, CAST(N'2022-01-06T22:16:27.373' AS DateTime), N'ceophuonghang@gmail.com', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [emailGH], [ghiChu]) VALUES (N'BILL99251', N'U404I3', N'dungct', NULL, 1, CAST(N'2021-11-20T00:00:00.000' AS DateTime), N'mydiemirene@gmail.com', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [emailGH], [ghiChu]) VALUES (N'BILL99252', N'U404I3', N'stark', NULL, 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), N'mydiemirene@gmail.com', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [emailGH], [ghiChu]) VALUES (N'BILL99253', N'U404H8', N'iu', NULL, 1, CAST(N'2021-11-08T00:00:00.000' AS DateTime), N'dungnguyen1910@outlook.com', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [emailGH], [ghiChu]) VALUES (N'BILL99254', N'U404I1', N'miyuine', NULL, 1, CAST(N'2021-11-20T00:00:00.000' AS DateTime), N'kiedienlovely@gmail.com', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [emailGH], [ghiChu]) VALUES (N'BILL99255', N'U404H1', N'mtp', NULL, 1, CAST(N'2021-11-19T00:00:00.000' AS DateTime), N'thanhtrungdt92@gmail.com', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [emailGH], [ghiChu]) VALUES (N'BILL99256', N'U404I2', N'iu', NULL, 1, CAST(N'2021-11-15T00:00:00.000' AS DateTime), N's1mpleNavi@gmail.com', NULL)
INSERT [dbo].[DonHang] ([soDH], [maKH], [taiKhoan], [ngayDat], [daKichHoat], [ngayGH], [emailGH], [ghiChu]) VALUES (N'BILL99257', N'U404H6', N'stark', NULL, 1, CAST(N'2021-11-19T00:00:00.000' AS DateTime), N'minhquangproducer91@gmail.com', NULL)
GO
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'0944365321', N'Kim Jennie', N'0944365321', N'blackpinkinurarea@gmail.com', NULL, CAST(N'1996-01-16T00:00:00.000' AS DateTime), 0, N'Blink is love', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'0945321448', N'Nguyễn Thị Minh Châu', N'0945321448', N'minhchau12@gmail.com', NULL, CAST(N'2000-12-12T00:00:00.000' AS DateTime), 0, N'5 sao', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'0945321451', N'Đàm Vĩnh Hưng', N'0945321451', N'laudaitinhai@gmail.com', NULL, CAST(N'1971-11-11T00:00:00.000' AS DateTime), 1, N'bạn quá hư sẽ bị đàm phạt', NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'0947652314', N'Nguyễn Thị Phương Hằng', N'0947652314', N'ceophuonghang@gmail.com', NULL, CAST(N'1971-01-26T00:00:00.000' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404H1', N'Nguyễn Thành Trung', N'0918 554 362', N'thanhtrungdt92@gmail.com', N'103 Đồng Đen, quận Tân Bình, TP.HCM', NULL, 1, NULL, 32)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404H2', N'Trần Thị Ngọc Nhi', N'0817 776 453', N'ngocnhibunny@gmail.com', N'46 Hồ Thị Kỷ, quận 10, TPHCM', NULL, 0, NULL, 54)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404H3', N'Trịnh Mỹ Như', N'0908 145 387', N'mynhutrinh97@gmail.com', N'221 Nguyễn Thị Thập, quận 7, TPHCM', NULL, 0, NULL, 40)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404H4', N'Phạm Minh Thiện', N'0945 841 707', N'thienhandsome1203@gmail.com', N'330 Sư Vạn Hạnh, quận 10, TPHCM', NULL, 1, NULL, 84)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404H5', N'Lê Nguyễn Thiên An', N'0706 333 789', N'thienanworkcontact@gmail.com', N'90/35D Dương Bá Trạc, quận 8, TPHCM', NULL, 0, NULL, 89)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404H6', N'Lê Minh Quang', N'0799 459 112', N'minhquangproducer91@gmail.com', N'286 Lý Thường Kiệt, thành phố Dĩ An, tỉnh Bình Dương', NULL, 1, NULL, 15)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404H7', N'Trần Văn Hoàng Nghĩa', N'0942 100 907', N'nghiajokerdevil@gmail.com', N'247/11 Thạch Lam, quận Tân Phú, TPHCM', NULL, 1, NULL, 64)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404H8', N'Nguyễn Anh Dũng', N'0942 100 907', N'dungnguyen1910@outlook.com', N'30 Nguyễn Thị Minh Khai, quận 1, TPHCM', NULL, 1, NULL, 105)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404H9', N'Phan Ngọc Phương Trinh', N'0372 454 999', N'trinhphanngoc1994@gmail.com', N'145/23 Lê Văn Quới, quận Bình Tân, TPHCM', NULL, 0, NULL, 35)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404I1', N'Phạm Kiều Duyên', N'0924 795 398', N'kiedienlovely@gmail.com', N'224C Pasteur, quận 3, TPHCM', NULL, 0, NULL, 71)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404I2', N'Oleksandr Kostyliev', N'0888 888 989', N's1mpleNavi@gmail.com', N'2 Hải Triều, quận 1, TPHCM', NULL, 1, NULL, 1)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404I3', N'Võ Thị Diễm My', N'0328 333 586', N'mydiemirene@gmail.com', N'151/1 Nguyễn Trãi, quận 5, TPHCM', NULL, 0, NULL, 91)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404I4', N'Lê Phú Quý', N'0842 441 801', N'dia15lmht@gmail.com', N'1050 Quang Trung, quận Gò Vấp, TPHCM', NULL, 1, NULL, 37)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404I5', N'Nguyễn Hữu Minh Tiến', N'0771 003 154', N'tienfakert1@gmail.com', N'95/4/2 Hà Huy Giáp, quận 12, TPHCM', NULL, 1, NULL, 46)
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [soDT], [email], [diaChi], [ngaySinh], [gioiTinh], [ghiChu], [lanMua]) VALUES (N'U404I6', N'Ngô Bảo Trâm', N'0584 212 452', N'ngobaotram210995@gmail.com', N'10 Phan Đình Phùng, quận Phú Nhuận, TPHCM', NULL, 0, NULL, 50)
GO
SET IDENTITY_INSERT [dbo].[LoaiPhim] ON 

INSERT [dbo].[LoaiPhim] ([maLoai], [tenLoai], [ghiChu], [hinhDD], [hinhDD2]) VALUES (1, N'Hành Động', N'', N'/Media/Images/actionMovie.jpg', NULL)
INSERT [dbo].[LoaiPhim] ([maLoai], [tenLoai], [ghiChu], [hinhDD], [hinhDD2]) VALUES (2, N'Kinh Dị', NULL, N'/Media/Images/horrorMovie.jpg', NULL)
INSERT [dbo].[LoaiPhim] ([maLoai], [tenLoai], [ghiChu], [hinhDD], [hinhDD2]) VALUES (3, N'Hoạt Hình', NULL, N'/Media/Images/cartoonMovie.jpg', NULL)
INSERT [dbo].[LoaiPhim] ([maLoai], [tenLoai], [ghiChu], [hinhDD], [hinhDD2]) VALUES (4, N'Tâm Lý', N'', N'/Media/Images/dramaMovie.jpg', NULL)
INSERT [dbo].[LoaiPhim] ([maLoai], [tenLoai], [ghiChu], [hinhDD], [hinhDD2]) VALUES (5, N'Hài Hước', N'', N'/Media/Images/funnyMovie.jpg', NULL)
INSERT [dbo].[LoaiPhim] ([maLoai], [tenLoai], [ghiChu], [hinhDD], [hinhDD2]) VALUES (6, N'Cổ Trang', N'', N'/Media/Images/historicalMovie.jpg', NULL)
SET IDENTITY_INSERT [dbo].[LoaiPhim] OFF
GO
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'2QWWQCPT', N'Hotel Transylvania 3: Summer Vacation', N'/Media/Images/movie/hotelTransylvania.jpg', N'/Media/Images/movie/hotelTransylvania2.jpg', N'Một bộ phim hài hoạt hình 3D được sản xuất bằng máy tính bởi Sony Pictures Animation và được phân phối bởi Sony Pictures Releasing.', CAST(N'2021-12-02T20:59:23.603' AS DateTime), 3, N'', N'iu', 0, N'', 221000, 15, N'Sony', 1162, CAST(N'2018-06-13' AS Date), N'Full HD', N'1 giờ 30 phút', N'6.3/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'39HETWX3', N'IT', N'/Media/Images/movie/it.jpg', N'/Media/Images/movie/it2.jpg', N'Phim kinh dị siêu nhiên Mỹ ra mắt năm 2017 của đạo diễn Andy Muschietti.
					  Đây là phần đầu tiên trong kế hoạch sản xuất loạt phim It hai phần dựa trên cuốn tiểu thuyết cùng tên của nhà văn Stephen King.', CAST(N'2021-12-04T21:08:41.783' AS DateTime), 2, N'', N'stark', 0, N'', 147000, 0, N'Warner Bros', 1727, CAST(N'2017-09-08' AS Date), N'Full HD', N'2 giờ 15 phút', N'7.3/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'3UDEVC45', N'Spider-Man: Far From Home', N'/Media/Images/movie/spiderManFFH.jpg', N'/Media/Images/movie/spiderManFFH2.jpg', N'Phim siêu anh hùng năm 2019 của Mỹ dựa trên nhân vật Peter Parker của Marvel Comics,
					  do Columbia Pictures và Marvel Studios đồng sản xuất và Sony Pictures Releasing phân phối.
					  Phim là phần tiếp theo của Người Nhện: Trở về nhà (2017), đồng thời là phim điện ảnh thứ hai mươi ba của Vũ trụ Điện ảnh Marvel.', CAST(N'2021-12-02T20:58:47.140' AS DateTime), 1, N'', N'stark', 0, N'', 210000, 20, N'Marvel', 2139, CAST(N'2019-06-29' AS Date), N'Full HD', N'2 giờ 9 phút', N'7.4/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'4QNLCCQA', N'Frozen 2', N'/Media/Images/movie/frozen2.jpg', N'/Media/Images/movie/frozen22.jpg', N'Phim điện ảnh hoạt hình máy tính nhạc kịch kỳ ảo của Mỹ năm 2019 do Walt Disney Animation Studios sản xuất
					  và Walt Disney Studios Motion Pictures chịu trách nhiệm phân phối.', CAST(N'2021-12-02T20:58:51.820' AS DateTime), 3, N'', N'iu', 0, N'', 149000, 0, N'Walt Disney', 1320, CAST(N'2019-07-11' AS Date), N'Full HD', N'1 giờ 43 phút', N'6.8/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'6QHCNM9G', N'Free Guy', N'/Media/Images/movie/freeGuy.jpg', N'/Media/Images/movie/freeGuy2.jpg', N'Phim điện ảnh Mỹ thuộc thể loại hài xen lẫn khoa học viễn tưởng ra mắt năm 2021. Phim do Shawn Levy đạo diễn, bên cạnh hai biên kịch Matt Lieberman và Zak Penn.', CAST(N'2021-12-04T21:58:38.783' AS DateTime), 5, N'', N'stark', 0, N'', 294000, 0, N'20th Century', 1209, CAST(N'2021-08-13' AS Date), N'Full HD', N'1 giờ 55 phút', N'7.2/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'8G3C834H', N'Fast and Furious 9', N'/Media/Images/movie/fast9.jpg', N'/Media/Images/movie/fast92.jpg', N'Một bộ phim hành động sắp ra mắt của Mỹ do Justin Lin đạo diễn và Daniel Casey viết kịch bản.', CAST(N'2021-12-02T20:59:19.283' AS DateTime), 1, N'', N'stark', 0, N'', 356000, 0, N'Universal', 1175, CAST(N'2021-05-19' AS Date), N'Full HD', N'2 giờ 23 phút', N'5.2/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'8YE6NMKF', N'Moon Lovers: Scarlet Heart Ryeo', N'/Media/Images/movie/moonLover.jpg', N'/Media/Images/movie/moonLover2.jpg', N'Bộ phim truyền hình Hàn Quốc được chuyển thể từ cuốn tiểu thuyết Bộ Bộ Kinh Tâm của nhà văn Trung Quốc Đồng Hoa.', CAST(N'2021-12-02T20:58:23.150' AS DateTime), 6, N'', N'iu', 0, N'20/20', 25000, 0, N'BaramiBunda ', 699, CAST(N'2016-08-29' AS Date), N'HD', N'60 phút/tập', N'8.7/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'9E4Y7LRC', N'Blood Moon Party', N'/Media/Images/movie/bloodMoonParty.jpg', N'/Media/Images/movie/bloodMoonParty2.jpg', N'Một bộ phim điện ảnh Việt Nam do đạo diễn Nguyễn Quang Dũng thực hiện, khởi chiếu vào ngày 20 tháng 10, 2020. Phim được làm lại từ bản gốc Perfect Strangers (2016) của Italy.', CAST(N'2021-12-04T20:41:21.637' AS DateTime), 4, N'', N'mtp', 0, N'', 125000, 0, N'Lotte Entertainment', 1311, CAST(N'2020-10-20' AS Date), N'Full HD', N'1 giờ 58 phút', N'7.6/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'9FUS2285', N'The Monkey King 2', N'/Media/Images/movie/wukong.jpg', N'/Media/Images/movie/wukong2.jpg', N'Phim viễn tưởng hợp tác giữa Hong Kong-Trung Quốc dựa trên tiểu thuyết kinh điển Tây du ký của Ngô Thừa Ân.', CAST(N'2021-12-05T20:30:14.057' AS DateTime), 6, N'', N'stark', 0, N'', 9000, 20, N'Filmko ', 115, CAST(N'2016-02-08' AS Date), N'Full HD', N'1 giờ 59 phút', N'5.9/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'9ZCC6ZEP', N'Final Destination 5', N'/Media/Images/movie/finalDestination.jpg', N'/Media/Images/movie/finalDestination2.jpg', N'Một bộ phim kinh dị siêu nhiên năm 2011 của Mỹ do Eric Heisserer viết kịch bản và Steven Quale làm đạo diễn.', CAST(N'2021-12-02T20:59:33.840' AS DateTime), 2, N'', N'stark', 0, N'', 10000, 0, N'Warner Bros', 461, CAST(N'2011-04-08' AS Date), N'HD', N'1 giờ 32 phút', N'5.8/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'AYADZL98', N'Squid Game', N'/Media/Images/movie/squidGame.jpg', N'/Media/Images/movie/squidGame2.jpg', N'Bộ phim truyền hình Hàn Quốc do Hwang Dong-hyuk viết kịch bản và đạo diễn.', CAST(N'2021-12-02T20:59:00.277' AS DateTime), 2, N'', N'dungct', 0, N'9/9', 235000, 0, N'Siren Pictures', 1968, CAST(N'2021-09-17' AS Date), N'Full HD', N'55 phút/tập', N'8.1/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'BUQ5AUGB', N'Cars 3', N'/Media/Images/movie/cars.jpg', N'/Media/Images/movie/cars2.jpg', N'Phim hoạt hình 3D hành động hài đồ họa bằng máy vi tính được hãng Pixar Animation Studios sản xuất và Walt Disney Pictures phát hành vào năm 2017', CAST(N'2021-12-05T19:38:45.307' AS DateTime), 3, N'', N'iu', 0, N'', 122000, 0, N'Walt Disney', 517, CAST(N'2017-06-16' AS Date), N'HD', N'1 giờ 42 phút', N'6.7/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'CEVZWE3J', N'Old Daddy', N'/Media/Images/movie/boGia.jpg', N'/Media/Images/movie/boGia2.jpg', N'Phim điện ảnh hài tình cảm của Việt Nam năm 2021 do Trấn Thành và Vũ Ngọc Đãng đồng đạo diễn.
					  Phim do Trấn Thành Town, HKFilm và Galaxy Studio phối hợp sản xuất.', CAST(N'2021-12-02T20:59:40.340' AS DateTime), 5, N'', N'mtp', 0, N'', 50000, 0, N'Galaxy Studio', 770, CAST(N'2021-03-12' AS Date), N'Full HD', N'2 giờ 8 phút', N'6.7/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'D46C49V9', N'Goblin', N'/Media/Images/movie/goblin.jpg', N'/Media/Images/movie/goblin2.jpg', N'Bộ phim truyền hình Hàn Quốc với sự tham gia của Gong Yoo, Lee Dong-wook, Kim Go-eun, Yoo In-na và Yook Sung-jae.', CAST(N'2021-12-02T20:59:29.313' AS DateTime), 4, N'', N'miyuine', 0, N'19/19', 160000, 0, N'Studio Dragon', 393, CAST(N'2016-12-02' AS Date), N'Full HD', N'60 - 90 phút/tập', N'8.6/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'ESG9MPSY', N'Avengers: Endgame', N'/Media/Images/movie/avengerEndGame.jpg', N'/Media/Images/movie/avengerEndGame2.png', N'Phần thứ tư của loạt phim Avengers, sau Biệt đội siêu anh hùng (2012), Avengers: Đế chế Ultron (2015)
					  và Avengers: Cuộc chiến vô cực (2018).', CAST(N'2021-12-02T19:10:37.940' AS DateTime), 1, N'', N'stark', 0, N'', 120000, 0, N'Marvel', 2338, CAST(N'2019-04-22' AS Date), N'Full HD', N'3 giờ 1 phút', N'8.4/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'F5VXH7FN', N'Parasite', N'/Media/Images/movie/parasite.png', N'/Media/Images/movie/parasite2.jpg', N'Phim điện ảnh hài kịch đen của Hàn Quốc, được ra mắt công chúng vào năm 2019 do Bong Joon-ho làm đạo diễn.', CAST(N'2021-12-02T20:58:56.143' AS DateTime), 4, N'', N'mtp', 0, N'', 110000, 0, N'Barunson E&A Corp', 1004, CAST(N'2019-05-21' AS Date), N'Full HD', N'2 giờ 12 phút', N'8.6/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'FMRA74KE', N'Go Ahead', N'/Media/Images/movie/goAhead.jpg', N'/Media/Images/movie/goAhead2.jpg', N'Một bộ phim truyền hình Trung Quốc đại lục phát sóng vào năm 2020.', CAST(N'2021-12-05T19:51:49.990' AS DateTime), 4, N'', N'mtp', 0, N'46/46', 105000, 0, N'Long Ya', 931, CAST(N'2020-08-10' AS Date), N'Full HD', N'45 phút/tập', N'8.6/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'J34AMGLP', N'The Hunger Games: Mockingjay – Part 2', N'/Media/Images/movie/hungerGames.jpg', N'/Media/Images/movie/hungerGames2.jpg', N'Một phim điện ảnh chiến tranh khoa học viễn tưởng năm 2015 của đạo diễn Francis Lawrence với phần kịch bản được viết bởi Peter Craig và Danny Strong.
					  Đây là phần thứ hai trong hai phần điện ảnh chuyển thể từ Húng nhại, cuốn tiểu thuyết cuối cùng của bộ ba tiểu thuyết Đấu trường sinh tử,', CAST(N'2021-12-04T20:14:16.860' AS DateTime), 1, N'', N'dungct', 0, N'', 89000, 0, N'Lionsgate', 990, CAST(N'2015-11-04' AS Date), N'Full HD', N'2 giờ 17 phút', N'6.6/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'J3CVPPGD', N'Harry Potter and the Deathly Hallows: Part 2', N'/Media/Images/movie/harryPotter.jpg', N'/Media/Images/movie/harryPotter2.jpg', N'Một bộ phim kỳ ảo sản xuất năm 2010 của đạo diễn David Yates và được phát hành bởi hãng Warner Bros Pictures.
					  Đây là phần 2 của phần phim thứ bảy trong loạt phim Harry Potter và Bảo bối Tử thần dựa trên cuốn tiểu thuyết ăn khách cùng tên của nhà văn Anh J.K. Rowling.', CAST(N'2021-12-05T19:15:19.257' AS DateTime), 1, N'', N'miyuine', 0, N'', 61000, 0, N'Warner Bros', 2014, CAST(N'2011-07-15' AS Date), N'HD', N'2 giờ 10 phút', N'8.1/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'K8XYYNVY', N'Mr. Beans Holiday', N'/Media/Images/movie/mrBeanHoliday.jpg', N'/Media/Images/movie/mrBeanHoliday2.jpg', N'Phim hài hước năm 2007 của Anh do Steve Bendelack làm đạo diễn. Diễn viên Rowan Atkinson thủ vai chính là ngài Bean.
					  Bộ phim này là phim cuối cùng của loạt phim Mr. Bean cũng như là sự xuất hiện cuối cùng của Rowan Atkinson trong vai ngài Bean.', CAST(N'2021-12-02T20:58:40.497' AS DateTime), 5, N'', N'stark', 0, N'', 77000, 10, N'Universal', 935, CAST(N'2007-03-30' AS Date), N'HD', N'1 giờ 30 phút', N'6.4/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'LLCRGTD3', N'Mr. Queen', N'/Media/Images/movie/mrQueen.jpg', N'/Media/Images/movie/mrQueen2.jpg', N'Một bộ phim truyền hình cổ trang - hài hước, giả tưởng ra mắt năm 2020 của Hàn Quốc, dựa trên tiểu thuyết Go Princess Go của Trung Quốc và Thái tử phi thăng chức ký
					  - bộ phim chuyển thể từ web series được phát sóng trên LeTV vào năm 2015.', CAST(N'2021-12-04T21:28:42.410' AS DateTime), 6, N'', N'miyuine', 0, N'20/20', 210000, 0, N'Studio Dragon', 1400, CAST(N'2020-12-12' AS Date), N'Full HD', N'75 phút/tập', N'8.8/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'QGP77E3W', N'Hotel Del Luna', N'/Media/Images/movie/hotelDelLuna.jpg', N'/Media/Images/movie/hotelDelLuna2.jpg', N'Bộ phim truyền hình của Hàn Quốc với sự tham gia của Lee Ji-eun (IU) và Yeo Jin-goo.
					  Được viết bởi hai chị em biên kịch họ Hong của Hàn Quốc: Hong Jeong-eun và Hong Mi-ran.', CAST(N'2021-12-02T20:58:12.100' AS DateTime), 4, N'', N'miyuine', 0, N'16/16', 140000, 0, N'Studio Dragon', 818, CAST(N'2019-07-13' AS Date), N'Full HD', N'73 - 94 phút/tập', N'8.2/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'R7NBHNUM', N'Inside Out', N'/Media/Images/movie/insideOut.jpg', N'/Media/Images/movie/insideOut2.jpg', N'Phim hoạt hình máy tính 3D của Mỹ được hãng phim hoạt hình Pixar sản xuất và phát hành bởi Walt Disney Pictures.', CAST(N'2021-12-04T20:29:34.660' AS DateTime), 3, N'', N'iu', 0, N'', 100000, 0, N'Walt Disney', 1699, CAST(N'2015-06-19' AS Date), N'Full HD', N'1 giờ 35 phút', N'8.1/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'SYWRJTAA', N'Kingdom', N'/Media/Images/movie/kingDom.png', N'/Media/Images/movie/kingDom2.jpg', N'Phim truyền hình thời kỳ chính trị Hàn Quốc năm 2019 được biên tập bởi Kim Eun-hee và Kim Seong-hun đạo diễn.', CAST(N'2021-12-02T20:59:37.407' AS DateTime), 6, N'', N'iu', 0, N'13/13', 195000, 20, N'AStory', 873, CAST(N'2019-01-25' AS Date), N'Full HD', N'45 phút/tập', N'8.4/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'TXME8E5W', N'Annabelle: Creation', N'/Media/Images/movie/annabelle.jpg', N'/Media/Images/movie/annabelle2.jpg', N'Phim kinh dị siêu nhiên của Mỹ năm 2017 do David F. Sandberg đạo diễn và do Gary Dauberman viết.
					  Đây là một phần trước của Annabelle năm 2014 và phần thứ tư trong loạt The Conjuring.', CAST(N'2021-12-02T20:58:17.780' AS DateTime), 2, N'', N'dungct', 0, N'', 46000, 0, N'Warner Bros', 1601, CAST(N'2019-06-19' AS Date), N'Full HD', N'1 giờ 49 phút', N'6.5/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'U3HFGLZ8', N'Story of Yanxi Palace', N'/Media/Images/movie/dienHi.jpg', N'/Media/Images/movie/dienHi2.jpg', N'Phim truyền hình cổ trang, cung đấu của Trung Quốc được phát sóng trong năm 2018. Phim được chuyển thể từ tiểu thuyết cùng tên của tác giả Chu Mạt.', CAST(N'2021-12-02T20:59:07.570' AS DateTime), 6, N'', N'miyuine', 0, N'70/70', 22000, 0, N'Huanyu Film', 217, CAST(N'2018-07-07' AS Date), N'Full HD', N'45 phút/tập', N'8.2/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'UY6ALB7N', N'The Big Bang Theory', N'/Media/Images/movie/bigBang.jpg', N'/Media/Images/movie/bigBang2.jpg', N'Một bộ phim sitcom Mỹ được sáng lập bởi Chuck Lorre và Bill Prady, cả hai đều là người sản xuất điều hành của chương trình cùng với Steven Molaro.', CAST(N'2021-12-05T20:52:11.693' AS DateTime), 5, N'', N'mtp', 0, N'279/279', 90000, 0, N'Warner Bros', 432, CAST(N'2007-09-24' AS Date), N'HD', N'18-22 phút/tập', N'8.1/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'YNBWA3NA', N'Johnny English Strikes Again', N'/Media/Images/movie/johnnyEnglish.jpg', N'/Media/Images/movie/johnnyEnglish2.jpg', N'Phim điện ảnh hành động hài điệp viên của Anh Quốc năm 2018 do David Kerr đạo diễn.
					  Đây là phần tiếp nối của bộ phim Điệp viên không không thấy tái xuất ra mắt năm 2011 và cũng là phần phim thứ ba của loạt phim Johnny English.', CAST(N'2021-12-02T20:59:14.523' AS DateTime), 5, N'', N'mtp', 0, N'', 198000, 10, N'Universal', 774, CAST(N'2018-10-05' AS Date), N'Full HD', N'1 giờ 29 phút', N'6.2/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'ZPA52T95', N'Arcane', N'/Media/Images/movie/arcane.jpg', N'/Media/Images/movie/arcane2.jpg', N'Loạt phim hoạt hình trực tuyến Pháp-Mỹ ra mắt năm 2021. Được miêu tả là một "chuỗi sự kiện",
					  phim lấy bối cảnh của vũ trụ Liên minh huyền thoại.', CAST(N'2021-12-02T19:13:24.810' AS DateTime), 3, N'', N'mtp', 0, N'9/9', 99000, 0, N'Riot', 1992, CAST(N'2021-11-06' AS Date), N'Full HD', N'41 phút/tập', N'9.3/10')
INSERT [dbo].[Phim] ([maPhim], [tenPhim], [hinhDD], [hinhDD2], [ndTomTat], [ngayDang], [maLoai], [noiDung], [taiKhoan], [daDuyet], [soTap], [giaBan], [giamGia], [nhaSanXuat], [luotMua], [ngayPH], [doPG], [thoiLuong], [diemImdb]) VALUES (N'ZQ7UM54M', N'The Conjuring', N'/Media/Images/movie/theConjuring.jpg', N'/Media/Images/movie/theConjuring2.jpg', N'Một bộ phim kinh dị siêu nhiên của điện ảnh Hoa Kỳ công chiếu vào năm 2013, đạo diễn bởi James Wan.
					  Hai diễn viên Vera Farmiga và Patrick Wilson vào vai Ed và Lorraine Warren, họ là những nhà điều tra các hiện tượng siêu nhiên xảy ra trên nước Mỹ.', CAST(N'2021-12-05T20:11:41.507' AS DateTime), 2, N'', N'dungct', 0, N'', 131000, 0, N'Warner Bros', 2256, CAST(N'2013-07-19' AS Date), N'HD', N'1 giờ 52 phút', N'7.5/10')
GO
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'dungct', N'3C-99-09-AF-EC-25-35-4D-55-1D-AE-21-59-0B-B2-6E-38-D5-3F-21-73-B8-D3-DC-3E-EE-4C-04-7E-7A-B1-C1-EB-8B-85-10-3E-3B-E7-BA-61-3B-31-BB-5C-9C-36-21-4D-C9-F1-4A-42-FD-7A-2F-DB-84-85-6B-CA-5C-44-C2', N'Nguyễn Anh', N'Dũng', CAST(N'1996-12-06T00:00:00.000' AS DateTime), 1, N'0935694223', N'dungct@gmail.com', N'201 Thành Thái, Q.10, TP.HCM', 1, N'')
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'iu', N'DD-AF-35-A1-93-61-7A-BA-CC-41-73-49-AE-20-41-31-12-E6-FA-4E-89-A9-7E-A2-0A-9E-EE-E6-4B-55-D3-9A-21-92-99-2A-27-4F-C1-A8-36-BA-3C-23-A3-FE-EB-BD-45-4D-44-23-64-3C-E8-0E-2A-9A-C9-4F-A5-4C-A4-9F', N'Lee Ji', N'Eun', CAST(N'1993-05-16T00:00:00.000' AS DateTime), 0, N'0194554287', N'manwol@gmail.com', N'37 Tân Cảng, Q.Bình Thạnh, TP.HCM', 1, N'')
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'miyuine', N'4A-3E-D8-14-7E-37-87-6A-DC-8F-76-32-8E-5A-BC-C1-B4-70-E6-AC-FC-18-EF-EA-01-35-F9-83-60-49-53-A5-8E-18-3C-1A-60-86-E9-1B-A3-E8-21-D9-26-F5-FD-EB-37-76-1C-7C-A0-32-8A-96-3F-5E-92-87-06-75-B7-28', N'Nguyễn Thị Mỹ', N'Duyên', CAST(N'2000-10-19T00:00:00.000' AS DateTime), 0, N'0123456789', N'yuumiduyen1910@gmail.com', N'103 Hoàng Hoa Thám, Q.Tân Bình, TP.HCM', 1, N'')
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'mtp', N'C7-0B-5D-D9-EB-FB-6F-51-D0-9D-41-32-B7-17-0C-9D-20-75-0A-78-52-F0-06-80-F6-56-58-F0-31-0E-81-00-56-E6-76-3C-34-C9-A0-0B-0E-94-00-76-F5-44-95-C1-69-FC-23-02-CC-EB-31-20-39-27-1C-43-46-95-07-DC', N'Nguyễn Thanh', N'Tùng', CAST(N'1994-07-05T00:00:00.000' AS DateTime), 1, N'0918014323', N'stmtp@gmail.com', N'131 Trần Xuân Soạn, Q.7, TP.HCM', 1, N'')
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'stark', N'3F-58-84-61-C4-A6-D0-76-4F-8E-3F-92-5C-E8-A4-B5-B4-BB-6C-07-2C-24-58-FA-AC-FE-3A-46-EC-41-41-64-DD-34-25-C5-6E-16-ED-62-34-8A-B3-E6-3A-17-37-E4-05-59-FC-C2-DF-9E-B4-D3-81-AF-94-12-A8-48-70-4E', N'Trần Công', N'Minh', CAST(N'1995-03-22T00:00:00.000' AS DateTime), 1, N'0125693212', N'tonystark@gmail.com', N'4 Trần Phú, Q.8, TP.HCM', 1, N'')
INSERT [dbo].[TaiKhoan] ([taiKhoan], [matKhau], [hoDem], [tenTV], [ngaysinh], [gioiTinh], [soDT], [email], [diaChi], [trangThai], [ghiChu]) VALUES (N'triet', N'AA-67-F8-85-4B-29-4F-9E-99-16-9D-21-1F-C8-3F-7F-38-D4-CB-B7-2F-6D-C3-6B-CA-5B-FA-9A-C4-5A-6A-37-34-C6-3C-8F-1D-3C-E9-B5-17-02-79-B8-18-C4-79-AB-E1-77-FF-22-D0-C7-64-27-D4-A1-D2-B3-7D-0F-E7-89', N'Nguyễn Minh', N'Triết', CAST(N'1999-11-04T00:00:00.000' AS DateTime), 1, N'0945509377', N'minhtrietnguyen@gmail.com', N'Landmark 81', 1, NULL)
GO
ALTER TABLE [dbo].[BaiViet] ADD  DEFAULT ((0)) FOR [daDuyet]
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT ((1)) FOR [daKichHoat]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT ((1)) FOR [gioiTinh]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT ((0)) FOR [lanMua]
GO
ALTER TABLE [dbo].[LoaiPhim] ADD  DEFAULT ('') FOR [ghiChu]
GO
ALTER TABLE [dbo].[Phim] ADD  DEFAULT ('') FOR [hinhDD]
GO
ALTER TABLE [dbo].[Phim] ADD  DEFAULT ('') FOR [hinhDD2]
GO
ALTER TABLE [dbo].[Phim] ADD  DEFAULT ('') FOR [ndTomTat]
GO
ALTER TABLE [dbo].[Phim] ADD  DEFAULT (getdate()) FOR [ngayDang]
GO
ALTER TABLE [dbo].[Phim] ADD  DEFAULT ('') FOR [noiDung]
GO
ALTER TABLE [dbo].[Phim] ADD  DEFAULT ((0)) FOR [daDuyet]
GO
ALTER TABLE [dbo].[Phim] ADD  DEFAULT ('') FOR [soTap]
GO
ALTER TABLE [dbo].[Phim] ADD  DEFAULT ((0)) FOR [giaBan]
GO
ALTER TABLE [dbo].[Phim] ADD  DEFAULT ((0)) FOR [giamGia]
GO
ALTER TABLE [dbo].[Phim] ADD  DEFAULT ('') FOR [nhaSanXuat]
GO
ALTER TABLE [dbo].[Phim] ADD  DEFAULT ((0)) FOR [luotMua]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((1)) FOR [gioiTinh]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((0)) FOR [trangThai]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD FOREIGN KEY([taiKhoan])
REFERENCES [dbo].[TaiKhoan] ([taiKhoan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CtDonHang]  WITH CHECK ADD FOREIGN KEY([maPhim])
REFERENCES [dbo].[Phim] ([maPhim])
GO
ALTER TABLE [dbo].[CtDonHang]  WITH CHECK ADD FOREIGN KEY([soDH])
REFERENCES [dbo].[DonHang] ([soDH])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([maKH])
REFERENCES [dbo].[KhachHang] ([maKH])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([taiKhoan])
REFERENCES [dbo].[TaiKhoan] ([taiKhoan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Phim]  WITH CHECK ADD FOREIGN KEY([maLoai])
REFERENCES [dbo].[LoaiPhim] ([maLoai])
GO
ALTER TABLE [dbo].[Phim]  WITH CHECK ADD FOREIGN KEY([taiKhoan])
REFERENCES [dbo].[TaiKhoan] ([taiKhoan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Phim]  WITH CHECK ADD CHECK  (([giamGia]>=(0) AND [giamGia]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [MovieShop] SET  READ_WRITE 
GO
