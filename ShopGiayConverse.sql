USE [master]
GO
/****** Object:  Database [ShopGiayConverse]    Script Date: 11/15/2022 10:49:37 PM ******/
CREATE DATABASE [ShopGiayConverse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopGiayConverse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopGiayConverse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopGiayConverse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopGiayConverse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopGiayConverse] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopGiayConverse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopGiayConverse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopGiayConverse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopGiayConverse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopGiayConverse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopGiayConverse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopGiayConverse] SET  MULTI_USER 
GO
ALTER DATABASE [ShopGiayConverse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopGiayConverse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopGiayConverse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopGiayConverse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopGiayConverse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopGiayConverse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopGiayConverse] SET QUERY_STORE = OFF
GO
USE [ShopGiayConverse]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 11/15/2022 10:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDHoaDon] [bigint] NULL,
	[IDSanPham] [bigint] NULL,
	[Gia] [float] NULL,
	[SoLuong] [float] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 11/15/2022 10:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDKhachHang] [bigint] NULL,
	[NgayDat] [datetime] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoLuong] [float] NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 11/15/2022 10:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[PhanQuyenID] [bigint] NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 11/15/2022 10:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/15/2022 10:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[Gia] [nvarchar](50) NULL,
	[NgaySanXuat] [date] NULL,
	[CoSan] [bit] NULL,
	[IDLoaiSanPham] [bigint] NULL,
	[MoTa] [nvarchar](max) NULL,
	[Anh] [nvarchar](max) NULL,
	[Anh1] [nvarchar](max) NULL,
	[Anh2] [nvarchar](max) NULL,
	[Anh3] [nvarchar](max) NULL,
	[Anh4] [nvarchar](max) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 11/15/2022 10:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([ID], [Ten], [Gia], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Anh1], [Anh2], [Anh3], [Anh4]) VALUES (1, N'Chuck 70s High AllWhite', N'950.500', CAST(N'2022-05-01' AS Date), 1, 1, N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn.', N'https://conversestore.vn/wp-content/uploads/2020/09/1970s-trang-1.png', N'https://conversestore.vn/wp-content/uploads/2021/08/1-13-600x600.jpg', N'https://conversestore.vn/wp-content/uploads/2021/08/2-12-600x600.jpg', N'https://conversestore.vn/wp-content/uploads/2021/08/4-5-600x600.jpg', N'https://conversestore.vn/wp-content/uploads/2021/08/3-12.jpg')
INSERT [dbo].[SanPham] ([ID], [Ten], [Gia], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Anh1], [Anh2], [Anh3], [Anh4]) VALUES (2, N'Converse Classic Đen Cao', N'750.000', CAST(N'2022-06-20' AS Date), 1, 1, N'Nhắc đến tên dòng sản phẩm này – giày Converse classic đã đủ để thấy được sự basic của nó. Và BST Chuck Taylor All Star Classic đã chứng tỏ được vị thế của những đôi giày chất lượng – đơn giản – giá cả phải chăng của mình khi nó lọt top những sản phẩm đáng sở hữu nhất mà ai cũng nên có một đôi

', N'https://conversestore.vn/wp-content/uploads/2020/09/Classic-den-1.png', N'https://conversestore.vn/wp-content/uploads/2021/08/2-1.jpg', N'https://conversestore.vn/wp-content/uploads/2021/08/3-1.jpg', N'https://conversestore.vn/wp-content/uploads/2021/08/4.jpg', N'https://conversestore.vn/wp-content/uploads/2021/08/1-2.jpg')
INSERT [dbo].[SanPham] ([ID], [Ten], [Gia], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Anh1], [Anh2], [Anh3], [Anh4]) VALUES (3, N'Converse Run Star Move', N'1.900.000', CAST(N'2022-09-01' AS Date), 1, 1, N'Đôi giày Run Star Move với kiểu dáng Chunky thời thượng cùng phong cách độc đáo, mang lại cho bạn vẻ ngoài thu hút ánh nhìn. Đế giày dày dặn cho bạn thỏa sức hack chiều cao và thêm tự tin xuống phố. Màu đen trắng tinh tế không kém phần thanh lịch sẽ phối hợp rất tốt với nhiều kiểu outfit hàng ngày. Chất vải Canvas dày dặn với những thớ dệt bền bỉ được gia công tỉ mỉ giúp bạn yên tâm hơn trong mọi hoạt động.', N'https://conversestore.vn/wp-content/uploads/2021/11/MOVE-2.png', N'https://conversestore.vn/wp-content/uploads/2021/11/z2901259333741_b202c2bb77c6832ca26f244f6bec159e.jpg', N'https://conversestore.vn/wp-content/uploads/2021/11/MOVE-2.png', N'https://conversestore.vn/wp-content/uploads/2021/11/z2901259358430_7bf8409bbcbbc8a5a6e3d8e503111ae2-600x600.jpg', N'https://conversestore.vn/wp-content/uploads/2021/11/MOVE-2.png')
INSERT [dbo].[SanPham] ([ID], [Ten], [Gia], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Anh1], [Anh2], [Anh3], [Anh4]) VALUES (7, N'Vans Slip on checker', N'950.000', CAST(N'2022-09-01' AS Date), 1, 2, N'Đối với VANS không một tín đồ nào còn xa lại với khả năng sáng tạo, phấn đấu không ngừng nghỉ cũng như sự chuyên chú vào chất lượng ngày một cải tiến. Sự hài lòng và phong cách của các tín đồ được VANS đặt làm tôn chỉ ngay từ những ngày đầu tiên bước chân vào ngành giày chuyên nghiệp. Minh chứng rõ nhất cho sự ưu ái mà nhà mốt OFF THE WALL dành cho các tín đồ yêu quý mình chính là siêu phẩm VANS SLIP-ON. Đây là siêu phẩm với bề dày lịch sử gần một nửa thế kỷ. Tuy nhiên, được cho ra mắt với một tên gọi khác - VANS #44 vào năm 1979 sau này được đổi tên thành VANS SLIP-ON hay “giày lười” cái tên thân thiết mà tín đồ dành riêng gọi cho tuyệt phẩm. VANS SLIP-ON với ưu điểm lớn phần đế giày được thiết kế bằng chất liệu cao su lưu hoá, cùng phần Upper đệm thun có thể dễ dàng tùy chỉnh, tiện lợi và linh động hơn trong việc sử dụng sản phẩm. Đối với siêu phẩm VANS SLIP-ON, VANS cần gắn liền với một họa tiết đỉnh cao làm nên tên tuổi của nó - có lẽ ai cũng biết đó chính là Checkerboard. ', N'https://conversestore.vn/wp-content/uploads/2021/08/2-41.jpg', N'https://conversestore.vn/wp-content/uploads/2021/08/4-33.jpg', N'https://conversestore.vn/wp-content/uploads/2021/08/3-42.jpg', N'https://conversestore.vn/wp-content/uploads/2021/08/2-41-600x600.jpg', N'https://conversestore.vn/wp-content/uploads/2021/08/1-43.jpg')
INSERT [dbo].[SanPham] ([ID], [Ten], [Gia], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Anh1], [Anh2], [Anh3], [Anh4]) VALUES (8, N'Vans Authentic – National Geographic', N'1.900.000', CAST(N'2022-09-01' AS Date), 1, 2, N'Vans x National Geographic Authentic có thiết kế độc đáo với hình ảnh đại dương xanh “mướt mắt” được in bao phủ trên toàn bộ upper. Công nghệ in cao cấp của Vans cho ra hình ảnh họa tiết cực sắc nét và sống động. Ngoài ra, bạn hãy thử tìm kiếm tọa độ được in trên viền đế của đôi giày, chắc chắn bạn sẽ thấy điều rất thú vị!', N'https://drake.vn/image/catalog/H%C3%ACnh%20content/vans-national-geographic/vans-national-geographic-10.jpg', N'https://drake.vn/image/cache/catalog/Vans/SNEAKERS%202/VN0A2Z5I002/VN0A2Z5I002-500x500.jpg', N'https://cf.shopee.vn/file/8e8539d271ea8fff8a9e319c359e734b', N'https://cf.shopee.vn/file/4d2c11c8ab3d807235045baee91a6004', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTXYYM3D6AqsSgdDqRR65S31bQUVRWZS4S2Y8pE48&s')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([ID], [Ten]) VALUES (1, N'Converse')
INSERT [dbo].[TheLoai] ([ID], [Ten]) VALUES (2, N'Vans')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([IDHoaDon])
REFERENCES [dbo].[HoaDon] ([ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NguoiDung] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[NguoiDung] ([ID])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NguoiDung]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_PhanQuyen] FOREIGN KEY([PhanQuyenID])
REFERENCES [dbo].[PhanQuyen] ([ID])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_PhanQuyen]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_TheLoai] FOREIGN KEY([IDLoaiSanPham])
REFERENCES [dbo].[TheLoai] ([ID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_TheLoai]
GO
USE [master]
GO
ALTER DATABASE [ShopGiayConverse] SET  READ_WRITE 
GO
