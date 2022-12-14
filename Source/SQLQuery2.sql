
USE [master]
GO
/****** Object:  Database [QLyShop]    Script Date: 07/04/2022 9:40:29 SA ******/
CREATE DATABASE [QLyShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLyShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLyShop.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLyShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLyShop_log.ldf' , SIZE = 1600KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLyShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLyShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLyShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLyShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLyShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLyShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLyShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLyShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLyShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLyShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLyShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLyShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLyShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLyShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLyShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLyShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLyShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLyShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLyShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLyShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLyShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLyShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLyShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLyShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLyShop] SET RECOVERY FULL 
GO
ALTER DATABASE [QLyShop] SET  MULTI_USER 
GO
ALTER DATABASE [QLyShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLyShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLyShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLyShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLyShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLyShop', N'ON'
GO
USE [QLyShop]
GO
/****** Object:  Table [dbo].[CHITIETDONTHANG]    Script Date: 07/04/2022 9:40:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONTHANG](
	[MaDonHang] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CHITIETDONTHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 07/04/2022 9:40:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[Dathanhtoan] [bit] NULL,
	[Tinhtranggiaohang] [bit] NULL,
	[Ngaydat] [datetime] NULL,
	[Ngaygiao] [datetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 07/04/2022 9:40:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Email] [varchar](50) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 07/04/2022 9:40:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoaiSp] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSp] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 07/04/2022 9:40:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 07/04/2022 9:40:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NOT NULL,
	[Giaban] [decimal](18, 0) NULL,
	[Mota] [nvarchar](max) NULL,
	[Anhbia] [nvarchar](max) NULL,
	[Ngaycapnhat] [datetime] NULL,
	[Soluongton] [int] NULL,
	[MaLoai] [int] NULL,
	[MaNCC] [int] NULL,
	[DaXoa] [bit] NULL,
	[Anhbia2] [nvarchar](max) NULL,
	[GiamGia] [int] NULL,
	[DanhGia] [int] NULL,
	[Anhbia3] [nvarchar](max) NULL,
	[GioiTinh] [nvarchar](10) NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (1, NULL, N'123', N'123', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (2, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (3, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (4, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (5, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (6, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (7, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (8, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (9, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (10, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (11, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (12, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (13, N'Phan Tất Yên', N'phantatyen1102@gmail.com', N'123', NULL, NULL, NULL, N'0343065699')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (14, N'Phan Tất Yên', N'abc', N'bac', CAST(N'1998-02-11 00:00:00.000' AS DateTime), NULL, N'asdasdasd@gmaila.as', N'asd')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (16, N'123213', N'phantatyen1102', N'123', CAST(N'2232-02-11 00:00:00.000' AS DateTime), NULL, N'asdasdasd@gmaila.as', NULL)
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (17, NULL, N'phantatyen1102', N'123', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (18, NULL, N'123', N'123', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NgaySinh], [DiaChi], [Email], [DienThoai]) VALUES (19, N'Phan Tất Yên 1', N'phantatyen', N'123123', CAST(N'1999-02-11 00:00:00.000' AS DateTime), NULL, N'asdasdasd@gmaila.as', N'0343065699')
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

GO
INSERT [dbo].[LoaiSP] ([MaLoaiSp], [TenLoaiSp]) VALUES (1, N'Váy')
GO
INSERT [dbo].[LoaiSP] ([MaLoaiSp], [TenLoaiSp]) VALUES (2, N'Sơ mi')
GO
INSERT [dbo].[LoaiSP] ([MaLoaiSp], [TenLoaiSp]) VALUES (3, N'Đầm')
GO
INSERT [dbo].[LoaiSP] ([MaLoaiSp], [TenLoaiSp]) VALUES (4, N'Balo')
GO
INSERT [dbo].[LoaiSP] ([MaLoaiSp], [TenLoaiSp]) VALUES (5, N'Ví')
GO
INSERT [dbo].[LoaiSP] ([MaLoaiSp], [TenLoaiSp]) VALUES (6, N'Áo Thun')
GO
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
GO
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] ON 

GO
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [DienThoai]) VALUES (1, N'NEM', N'Phòng 1002, tầng 10, Tòa nhà NEM
số 545 đường Nguyễn Văn Cừ, P. Gia Thụy, Q. Long Biên, Hà Nội', N' 024 3938 8512')
GO
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [DienThoai]) VALUES (2, N'Vascara', N'Lầu 4 tòa nhà ACM số 96 Cao Thắng phường 04 quận 03 TP Hồ Chí Minh.', N'1900 6909')
GO
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [DienThoai]) VALUES (3, N'COSMO ', N'91 Phạm Văn Hai, p.3, Q.Tân Bình, TPHCM ', N'1900 54 54 57')
GO
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (1, N'CHÂN VÁY BÚT CHÌ Z05732
', CAST(149500 AS Decimal(18, 0)), N'Phù hợp : đi làm, đi sự kiện, hay đi dạo phố, có thể kết hợp cùng áo sơ mi, áo phông, áo vest', N'https://product.hstatic.net/200000182297/product/46_37d476d7d80040c7aceb8a0de0b50761_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 50, 1, 1, 0, N'https://product.hstatic.net/200000182297/product/sm026021212132400429p499___z057321542162160418p499.jpg_2ec58f60d0c44a62bdf25ebaa18c09cb_master.jpg', 25, 5, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (2, N'CHÂN VÁY MIDI HOA Z80402', CAST(279000 AS Decimal(18, 0)), N'Chân váy thiết kế dáng chữ A dài qua gối, kết hợp họa tiết hoa nổi bật', N'https://product.hstatic.net/200000182297/product/10_18a2edef8f734974b1d9c7e142fbd848_master.jpg', CAST(N'2121-09-30 00:00:00.000' AS DateTime), 80, 1, 1, 0, N'https://product.hstatic.net/200000182297/product/sm050521212112130418p699___z804021542132400418p559.jpg_2__499dd58190164e65808faed863e0652e_master.jpg', 30, 4, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (3, N'CHÂN VÁY MIDI Z80182
', CAST(229500 AS Decimal(18, 0)), N'Chân váy thiết kế dáng chữ A dài qua gối tone màu vàng mù tạt, cạp thường', N'https://product.hstatic.net/200000182297/product/12_f78ef13077134dc09238ce470e59d5d6_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 40, 1, 1, 0, N'https://product.hstatic.net/200000182297/product/sm048521212112000435p559___z801821522132150401p459.jpg_3__d121c7dbc9b747709af08644f4fe2bd3_master.jpg', 15, 4, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (4, N'CHÂN VÁY ĐUÔI CÁ DÁNG NGẮN Z06042
', CAST(249500 AS Decimal(18, 0)), N'Chân váy dáng đuôi cá ngắn trên gối, tone màu đen trơn, kết hợp hàng khuy nhỏ dọc sườn', N'https://product.hstatic.net/200000182297/product/6_26315a77cb474109ba652a109e013020_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 55, 1, 1, 0, N'https://product.hstatic.net/200000182297/product/sm047421212132030438p559___z060421512122110457p499_1__64a651466c2649d38910e60277831263_master.jpg', 35, 3, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (5, N'CHÂN VÁY THIẾT KẾ Z05722
', CAST(290000 AS Decimal(18, 0)), N'Chân váy ngắn trên gối, kết hợp xếp li bản to, tone màu đen trơn, cạp thường', N'https://product.hstatic.net/200000182297/product/24_19ac95a0b02441e1a8309ff8228ffd93_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 70, 1, 1, 0, N'https://product.hstatic.net/200000182297/product/sm033821202152000401p599___z057221512192110402p599.jpg_1__a8897dc7729642a3a2fbaf5f77e296a0_master.jpg', 24, 4, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (6, N'CHÂN VÁY XẾP LI Z05712
', CAST(249000 AS Decimal(18, 0)), N'Chân váy xếp li bản to cạp thường, tone màu hồng', N'https://product.hstatic.net/200000182297/product/6_2f80ae341e3a4e57b8525750e2c1620d_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 68, 1, 1, 0, N'https://product.hstatic.net/200000182297/product/ts608621902132039023p199____z057121512132120419p499_1__70cb2415e772486aa9fc5268d0ca375c_master.jpg', 45, 2, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (7, N'SƠ MI THIẾT KẾ SM25052
', CAST(159000 AS Decimal(18, 0)), N'đi làm, đi sự kiện, hay đi dạo phố, kết hợp quần hay chân váy, tạo vẻ trẻ trung, hiện đại cho người mặc.', N'https://product.hstatic.net/200000182297/product/133_6433ecd0030c42ba8808e93fee6897dc_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 63, 2, 1, 0, N'https://product.hstatic.net/200000182297/product/241311101_2196080780529811_7022443089234039179_n_bf3992d3c2404c8ab89b64527b856fa0_master.jpg', 32, 1, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (8, N'SƠ MI THIẾT KẾ SM12071', CAST(165000 AS Decimal(18, 0)), N'sơ mi ngắn tay tone màu tím nhạt, phần thân thiết kế xếp nhún, tay bồng nhẹ', N'https://product.hstatic.net/200000182297/product/218352167_2150165455121344_1337592383265388583_n_41b9c4abe2da418d85be6826e09db38b_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 65, 2, 1, 0, N'https://product.hstatic.net/200000182297/product/218352167_2150165455121344_1337592383265388583_n_41b9c4abe2da418d85be6826e09db38b_master.jpg', 35, 5, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (9, N'SƠ MI CỔ BẺ SM05649
', CAST(239000 AS Decimal(18, 0)), N'sơ mi thiết kế ngắn tay, cổ bẻ, tone màu trắng kết hợp họa tiết nổi bật', N'https://product.hstatic.net/200000182297/product/sm056491212112430401p799____q030121722122110474p559.jpg_2__1e679e65c84745b7911289f430dead32_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 54, 2, 1, 0, N'https://product.hstatic.net/200000182297/product/sm056491212112430401p799____q030121722122110474p559.jpg_c1b95cda61004e16ae478551457fdcfc_master.jpg', 47, 4, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (10, N'SƠ MI PHỐI HỌA TIẾT SM01522
', CAST(180000 AS Decimal(18, 0)), N' sơ mi thiết kế ngắn tay, cổ tròn phối nơ bản to, tone màu xanh than kết hợp họa tiết hoa nhí', N'https://product.hstatic.net/200000182297/product/sm015221212132400405p599____z015121542132160405p499.jpg_1__7e649be76cf348e2b915f2c6f241f665_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 23, 2, 1, 0, N'https://product.hstatic.net/200000182297/product/sm015221212132400405p599____z015121542132160405p499_28533baa04554801ba9d56ed46a5b668_master.jpg', 29, 2, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (11, N'SƠ MI THÊU HOA SM80072
', CAST(329000 AS Decimal(18, 0)), N'sơ mi thiết kế ngắn tay tone màu đen trơn, tay bồng nhẹ, kết hợp hoa thêu nổi bật', N'https://product.hstatic.net/200000182297/product/25_70b35dc1289949239e1433364a4cc4bc_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 65, 2, 1, 0, N'https://product.hstatic.net/200000182297/product/sm800721212162010457p659__q800821722110110474p659_2__b8b6361282fd4067bc4774b6540c8456_master.jpg', 45, 1, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (12, N'SƠ MI CUT - OUT SM06322', CAST(293000 AS Decimal(18, 0)), N' sơ mi thiết kế ngắn tay, vai cut - out, tone màu đỏ hết hợp họa tiết 
Phù hợp: đi làm, sự kiện, hay đi dạo', N'https://product.hstatic.net/200000182297/product/11_71b8792a7e164ee8927464e1147b0d65_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 83, 2, 1, 0, N'https://product.hstatic.net/200000182297/product/sm063221212192400401p599___z015121542132160405p499.jpg_1__0257e8937db148e7852b40d171f27ebe_master.jpg', 43, 3, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (13, N'ĐẦM TIỆC ÔM ĐỎ D33492
', CAST(1399000 AS Decimal(18, 0)), N'đầm tiệc thiết kế dáng ôm dài qua gối, tone màu đỏ trơn, phần thân xếp nếp tạo điểm nhấn cùng hàng ngọc trai đính eo', N'https://product.hstatic.net/200000182297/product/20_a9875eb184ae4e299b1c4782fa958bec_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 65, 3, 1, 0, N'https://product.hstatic.net/200000182297/product/1_8a9ae54a5aca4f10a000f9326b15f3c4_master.jpg', 23, 2, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (14, N'ĐẦM TIỆC CAO CẤP D33332
', CAST(1399000 AS Decimal(18, 0)), N'đầm tiệc không tay dáng xòe, dài qua gối, tone màu hồng be, kết hợp hoa 3D bản to đính nổi phần eo', N'https://product.hstatic.net/200000182297/product/7_1e497266f2bc449fb678fb4840d3c13d_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 76, 3, 1, 0, N'https://product.hstatic.net/200000182297/product/d333321492133020401p1399_3__cb1759c356894eb2a3386f20b0806da9_master.jpg', 12, 5, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (15, N'ĐẦM SUÔNG ĐEN PHỐI KẺ D03812
', CAST(499500 AS Decimal(18, 0)), N'đầm thiết kế dáng suông dài qua gối tone màu đen, kết hợp họa tiết kẻ nổi bật', N'https://product.hstatic.net/200000182297/product/30_d4cca509af65495c9af3b3dab208f953_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 38, 3, 1, 0, N'https://product.hstatic.net/200000182297/product/d038121412162110457p999.jpg_2__319ce7f016334dadbd5dee1a20dc8953_master.jpg', 32, 4, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (16, N'ĐẦM SUÔNG ĐEN D05662
', CAST(579500 AS Decimal(18, 0)), N'ầm thiết kế dáng suông dài qua gối tone đen trơn, cổ phối bèo ', N'https://product.hstatic.net/200000182297/product/d056621412122110461p1159_ff8f94ba30ce46f39a8366e4699edd21_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 67, 3, 1, 0, N'https://product.hstatic.net/200000182297/product/d056621412122110461p1159.jpg_3__7bc16b6520b540b4bb55ee6ad0b95d53_master.jpg', 15, 5, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (17, N'ĐẦM TIỆC ĐEN PHỐI SEQUIN D32169
', CAST(1493000 AS Decimal(18, 0)), N'đầm tiệc 2 dây dáng ôm, dài qua gối, tone màu đen hồng nhạt, eo đính nơ bản to, kết hợp tà chất liệu voan sequin', N'https://product.hstatic.net/200000182297/product/2_c6135c3d1aa8413aa7cd5f4dc3f38f09_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 53, 3, 1, 0, N'https://product.hstatic.net/200000182297/product/ada_d8d57bbeeb1845699f0ad006012b28f5_master.jpg', 25, 4, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (18, N'ĐẦM TIỆC ĐEN PHỐI SEQUIN D32169', CAST(1493000 AS Decimal(18, 0)), N'đầm tiệc 2 dây dáng ôm, dài qua gối, tone màu đen trơn, eo đính nơ bản to, kết hợp tà chất liệu voan sequin', N'https://product.hstatic.net/200000182297/product/25_9f894dfdc814441689c9921bd9e6452c_master.jpg', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 65, 3, 1, 0, N'https://product.hstatic.net/200000182297/product/d321691492193010436p1493_4__d63f88f77a5a48d2946470ea9a978218_master.jpg', 45, 3, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (19, N'Balo Mini Vải Dù Phối Da - BAC 0149', CAST(845000 AS Decimal(18, 0)), N'Balo Mini Vải Dù Phối Da, Phù hợp sử dụng
Đi làm, đi học, đi chơi', N'https://www.vascara.com/uploads/cms_productmedia/2021/July/31/balo-mini-vai-du-phoi-da-bac-0149-mau-cam-main__60465__1625070970__60662__1627717711-medium@2x.jpg?1', CAST(N'2021-10-01 00:00:00.000' AS DateTime), 45, 4, 2, 0, N'https://www.vascara.com/uploads/cms_productmedia/2021/July/31/balo-mini-vai-du-phoi-da-bac-0149-mau-cam-3__60466__1625070988__60663__1627717723-medium.jpg?1', 12, 2, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (20, N'Balo Phối Màu Khóa Marble Cách Điệu - BAC 0144', CAST(845000 AS Decimal(18, 0)), N'Balo Phối Màu Khóa Marble Cách Điệu - Phù hợp sử dụng
Đi làm, đi học, đi chơi ', N'https://www.vascara.com/uploads/cms_productmedia/2021/May/25/balo-phoi-mau-khoa-marble-cach-dieu-bac-0144-mau-xanh-reu-main__60210__1621924165-medium@2x.jpg?1', CAST(N'2021-10-01 00:00:00.000' AS DateTime), 54, 4, 2, 0, N'https://www.vascara.com/uploads/cms_productmedia/2021/May/25/balo-phoi-mau-khoa-marble-cach-dieu-bac-0144-mau-xanh-reu-1__60211__1621924178-medium.jpg?1', 32, 5, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (24, N'Balo Nắp Gập Phối Vân Cá Sấu Khóa Cài Oval - BAC 0148', CAST(825000 AS Decimal(18, 0)), N'Balo Nắp Gập Phối Vân Cá Sấu Khóa Cài Oval - BAC 0148 -Kích cỡ
Nhỏ
Phù hợp sử dụng
Đi làm, đi học, đi chơi', N'https://www.vascara.com/uploads/cms_productmedia/2021/February/22/balo-nap-gap-phoi-van-ca-sau-khoa-cai-oval-bac-0148-mau-den-main__58879__1613972011-medium@2x.jpg?1', CAST(N'2021-10-01 00:00:00.000' AS DateTime), 67, 4, 2, 0, N'https://www.vascara.com/uploads/cms_productmedia/2021/February/22/balo-nap-gap-phoi-van-ca-sau-khoa-cai-oval-bac-0148-mau-den-3__58881__1613972044-medium.jpg?1', 23, 3, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (25, N'Balo Dù Đa Năng Trang Trí Mảng Đa Sắc - BAC 0141', CAST(625000 AS Decimal(18, 0)), N'Balo Dù Đa Năng Trang Trí Mảng Đa Sắc - BAC 0141 - Hoa văn, chi tiết
Phối mảng màu đa sắc
Số ngăn
1 ngăn lớn, 6 ngăn nhỏ
Kích cỡ
Trung bình
Phù hợp sử dụng
Đi làm, đi học, đi chơi', N'https://www.vascara.com/uploads/cms_productmedia/2020/December/3/balo-du-da-nang-trang-tri-mang-da-sac-bac-0141-mau-den-main__57890__1606992013-medium@2x.jpg?1', CAST(N'2021-10-01 00:00:00.000' AS DateTime), 15, 4, 2, 0, N'https://www.vascara.com/uploads/cms_productmedia/2020/December/3/balo-du-da-nang-trang-tri-mang-da-sac-bac-0141-mau-cam-dam-3__57888__1606991369-medium.jpg?1', 21, 4, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (26, N'Ví Cầm Tay Da Vân Nổi Đính Kim Loại Mini - WAL 0211', CAST(325000 AS Decimal(18, 0)), N'Chất liệu
Da nhân tạo
Hoa văn, chi tiết
Một màu, trang trí kim loại
Kích thước (dài x rộng x cao)
12.1 x 2.4 x 9.2 cm
Kiểu khóa
Nút bấm
Số ngăn
1 ngăn lớn, 6 ngăn đựng thẻ
Kích cỡ
Nhỏ
Kiểu ví
Ví ngắn
Phù hợp sử dụng
Đi làm, đi chơi', N'https://www.vascara.com/uploads/cms_productmedia/2021/May/13/vi-cam-tay-da-van-noi-dinh-kim-loai-mini-wal-0211-mau-do-main__60105__1620898245-medium@2x.jpg?1', CAST(N'2021-10-01 00:00:00.000' AS DateTime), 45, 5, 2, 0, N'https://www.vascara.com/uploads/cms_productmedia/2021/May/13/vi-cam-tay-da-van-noi-dinh-kim-loai-mini-wal-0211-mau-do-2__60106__1620898260-medium.jpg?1', 23, 2, NULL, N'Nữ')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (27, N'Ví Cầm Tay Mini Quai Cài Ellipse Phối Nubuck - WAL 0207', CAST(325000 AS Decimal(18, 0)), N'Chất liệu 
Da nhân tạo
, Hoa văn, chi tiết
 Một màu, phối nubuck
 Kích thước (dài x rộng x cao)
10.9 x 1.5 x 9.2 cm
Kiểu khóa
Nút bấm
Số ngăn
1 ngăn lớn, 6 ngăn đựng thẻ
Kích cỡ
Nhỏ
Kiểu ví
Ví ngắn
Phù hợp sử dụng
 Đi làm, đi chơi', N'https://www.vascara.com/uploads/cms_productmedia/2021/May/13/vi-cam-tay-mini-quai-cai-ellipse-phoi-nubuck-wal-0207-mau-kem-main__60049__1620893282-medium@2x.jpg?1', CAST(N'2021-10-01 00:00:00.000' AS DateTime), 23, 5, 2, 0, N'https://www.vascara.com/uploads/cms_productmedia/2021/May/13/vi-cam-tay-mini-quai-cai-ellipse-phoi-nubuck-wal-0207-mau-kem-2__60052__1620893323-medium.jpg?1', 21, 5, NULL, N'Nam')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (28, N'ÁO THUN UNISEX NAPPY ZOO GREEN', CAST(299000 AS Decimal(18, 0)), N'Nếu như một chiếc áo thun trơn tay ngắn cổ tròn là item cần có trong bất kỳ tủ đồ nào, Nappy Zoo Tee chính là một phiên bản nâng cấp cho mùa hè năm nay. Các nhà thiết kế của The Cosmo đã thổi hồn vào chiếc áo tối giản này bằng hình in những người bạn nhỏ cực dễ thương, mang đến không khí và tinh thần vui vẻ cho người mặc.

Áo thun cổ tròn, tay ngắn, được may từ chất liệu 100% cotton mang đến độ thấm hút mồ hôi tuyệt đối và cảm giác thoải mái, thoáng mát để các chàng thỏa thích vận động suốt cả ngày. Áo thun trơn là item không kén dáng, nên phái mạnh có thể tùy thích kết hợp cùng jeans dài, shorts cho phong cách thời trang năng động, hay thậm chí là phối cùng suits và sneakers để tạo dáng vẻ lịch lãm nhưng cũng không kém phần trẻ trung và thời thượng.', N'https://product.hstatic.net/1000289385/product/mausac_xanhbo_supi_08263f77cf2b4cfe9cfbb14e97420eca_1024x1024.jpg', CAST(N'2021-10-01 00:00:00.000' AS DateTime), 45, 6, 3, 0, N'https://product.hstatic.net/1000289385/product/mausac_xanhbo_unisex1_420b7fcc85d948d0b94925cc5a5517dd_1024x1024.jpg', 10, 4, NULL, N'Nam')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (29, N'ÁO THUN ESSENTIAL TEE
', CAST(299000 AS Decimal(18, 0)), N'Nếu như một chiếc áo thun trơn tay ngắn cổ tròn là item cần có trong bất kỳ tủ đồ nào, Nappy Zoo Tee chính là một phiên bản nâng cấp cho mùa hè năm nay với palette 20 màu ngọt ngào. 

Áo thun cổ tròn, tay ngắn, được may từ chất liệu 100% cotton mang đến độ thấm hút mồ hôi tuyệt đối và cảm giác thoải mái, thoáng mát để các chàng thỏa thích vận động suốt cả ngày. Áo thun trơn là item không kén dáng, nên phái mạnh có thể tùy thích kết hợp cùng jeans dài, shorts cho phong cách thời trang năng động, hay thậm chí là phối cùng suits và sneakers để tạo dáng vẻ lịch lãm nhưng cũng không kém phần trẻ trung và thời thượng.', N'https://product.hstatic.net/1000289385/product/mausac_blushdongoi_unisex_1a7785fd88b84efaabaed984e067c923_1024x1024.jpg', CAST(N'2021-10-01 00:00:00.000' AS DateTime), 78, 6, 3, 0, N'https://product.hstatic.net/1000289385/product/mausac_blushdongoi_unisex1_178be7f08dd443439d6aa1ad7d54cd51_1024x1024.jpg', 10, 2, NULL, N'Nam')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (30, N'ÁO THUN NAM STEVE MOCK NECK TEE
', CAST(149500 AS Decimal(18, 0)), N'
Size guide

CHI TIẾT-
Mã SP. TC1021081

Trong mùa lạnh, bên cạnh những chiếc áo khoác ấm áp thì áo thun tay dài là một trong những item rất được phái mạnh ưa chuộng bởi bất cứ vóc dáng, màu da hay độ tuổi nào cũng phù hợp. Steve Mock Neck với chính là một lựa chọn cực kỳ tiện lợi cho các chàng trai bởi thiết kế được tối ưu hoá cho mùa đông. 

Áo thun trơn, phom suông, tay dài, cổ 3cm, có độ ôm vừa phải, giữ ấm tốt. Áo được may trên chất liệu thun cotton có gân cực nhẹ, không nhăn nhàu, giúp bạn luôn thoải mái và tự tin tối đa trong các hoạt động.

Áo có bảng màu trung tính, kiểu dáng tối giản để bạn thỏa sức sáng tạo và tự tin thể hiện phong cách thời trang cá nhân khi mix cùng jeans, chinos, khaki hay kết hợp hài hòa cùng blazer, cardigan cùng tone màu.', N'https://product.hstatic.net/1000289385/product/mausac-den_mock1_81a45a068418460ca6c391be015d7f5a_1024x1024.jpg', CAST(N'2021-10-01 00:00:00.000' AS DateTime), 23, 6, 3, 0, N'https://product.hstatic.net/1000289385/product/mausac-den_mock_065ce6fe0cf342f0af278c5ae130bf2a_1024x1024.jpg', 15, 4, NULL, N'Nam')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (31, N'ÁO THUN NAM DANIEL KNIT TEE
', CAST(149500 AS Decimal(18, 0)), N'Mã SP. TC1021076

Bên cạnh jeans thì áo thun tay dài là một trong những item rất được phái mạnh ưa chuộng bởi bất cứ vóc dáng, màu da hay độ tuổi nào cũng phù hợp. Tiêu biểu phải kể đến mẫu áo Daniel Knit Tee thuộc BST mới nhất của The Cosmo. Áo thun trơn, phom suông, tay dài, cổ tròn, chất liệu vải nhẹ tênh, không nhăn nhàu để bạn luôn thoải mái và tự tin tối đa trong các hoạt động.

Áo có bảng màu trung tính, kiểu dáng tối giản để bạn thỏa sức sáng tạo và tự tin thể hiện phong cách thời trang cá nhân khi mix cùng jeans, chinos, khaki hay kết hợp hài hòa cùng blazer, cardigan cùng tone màu.', N'https://product.hstatic.net/1000289385/product/mausac-xanhduong_21076cn3_f0b7f1fdad1f484eb3838cd5577b6d7b_1024x1024.jpg', CAST(N'2021-10-01 00:00:00.000' AS DateTime), 65, 6, 3, 0, N'https://product.hstatic.net/1000289385/product/mausac-xanhduong_21076cn1_f2b52500c6394a37897d3f13f247d0c8_1024x1024.jpg', 5, 5, NULL, N'Nam')
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaLoai], [MaNCC], [DaXoa], [Anhbia2], [GiamGia], [DanhGia], [Anhbia3], [GioiTinh]) VALUES (32, N'ÁO THUN NAM TYLER SWEATSHIRT
', CAST(199500 AS Decimal(18, 0)), N'Mã SP. TC1021083



Những ngày trời lạnh, có lẽ không gì tiện lợi hơn một chiếc áo sweatshirt ấm áp. Mùa đông năm nay, The Cosmo xin gửi đến bạn một bộ sưu tập áo sweatshirt đôi mang phong cách tối giản đặc trưng của hãng. Điểm nhấn của chiếc áo chính là hoạ tiết thêu dễ thương trên ngực trái với 3 người bạn nhỏ: cáo Fifi, thỏ Gigi, và gấu Pippi. 

Áo thun cổ tròn, vai liền, tay dài, có bo cổ, bo tay và bo gấu áo. Áo được may trên nền vải cotton mềm mịn, bên trong lót nỉ bông ấm áp, có độ dày vừa phải. Áo thích hợp để phối cùng sơ mi bên trong, áo khoác bên ngoài, quần leggings hoặc jeans để có một vẻ ngoài khoẻ khoắn và năng động. ', N'https://product.hstatic.net/1000289385/product/mausac-xam_tyler2_5420daf99b834b6c99cd3529a71a194f_1024x1024.jpg', CAST(N'2021-10-01 00:00:00.000' AS DateTime), 45, 6, 3, 0, N'https://product.hstatic.net/1000289385/product/mausac-xam_tyler_a089ad5f0261416792ff38c2136cb96d_1024x1024.jpg', 10, 1, NULL, N'Nam')
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONTHANG_DONDATHANG] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONDATHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_CHITIETDONTHANG_DONDATHANG]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONTHANG_SACH] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SANPHAM] ([MaSanPham])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_CHITIETDONTHANG_SACH]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_KHACHHANG]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_Chude] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoaiSp])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_Chude]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_NhaXB] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNCC])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_NhaXB]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [CK__CHITIETDO__Dongi__440B1D61] CHECK  (([Dongia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [CK__CHITIETDO__Dongi__440B1D61]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [CK__CHITIETDO__Soluo__4316F928] CHECK  (([Soluong]>(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [CK__CHITIETDO__Soluo__4316F928]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [CK__SANPHAM__Giaban__20C1E124] CHECK  (([Giaban]>=(0)))
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [CK__SANPHAM__Giaban__20C1E124]
GO
USE [master]
GO
ALTER DATABASE [QLyShop] SET  READ_WRITE 
GO
