CREATE DATABASE [ShopGiayConverse];
USE [ShopGiayConverse]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 11/27/2022 11:01:03 PM ******/
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
	[TenSp] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 11/27/2022 11:01:03 PM ******/
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
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 11/27/2022 11:01:03 PM ******/
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
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 11/27/2022 11:01:03 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/27/2022 11:01:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[NgaySanXuat] [date] NULL,
	[CoSan] [bit] NULL,
	[IDLoaiSanPham] [bigint] NULL,
	[MoTa] [nvarchar](max) NULL,
	[Anh] [nvarchar](max) NULL,
	[Gia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 11/27/2022 11:01:03 PM ******/
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
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau], [ID], [Ten], [Email], [DiaChi], [SoDienThoai], [PhanQuyenID]) VALUES (N'thanhvien1', N'Chocopai2002', 1, N'Mạnh béo', N'manhbeo123vp@gmail.com', N'Hà Nội', N'034567899', NULL)
INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau], [ID], [Ten], [Email], [DiaChi], [SoDienThoai], [PhanQuyenID]) VALUES (NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([ID], [Ten], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Gia]) VALUES (19, N'Converse 70s vàng cao', CAST(N'2022-11-04' AS Date), 1, 1, N'Converse 1970s là 1 trong những dòng sản phẩm bán chạy nhất của Converse.  Sunflower là một trong những phối màu hot nhất của dòng Converse 1970s, rất đẹp và dễ phối đồ, đồng thời có 2 bản là cao cổ và thấp cổ,', N'1970s-vang-2.png', CAST(950000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([ID], [Ten], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Gia]) VALUES (28, N'Vans Old Skool Black White', CAST(N'2022-11-16' AS Date), 1, 2, N'Được gọi vui một cách thân thuộc là “giày Vans đen“, thực chất đây là một trong những phiên bản đầu tiên và cổ điển nhất của VANS trong bộ sưu tập VANS OLD SKOOL ra đời năm 1977. Tới nay đôi giày chỉ với phối màu đen trắng này vẫn nằm trong top “Best Seller” của VANS trên toàn thế giới, với kiểu dáng cổ điển cùng “sọc Jazz” huyền thoại hợp thời trang khiến đôi VANS này thật sự trở thành mẫu giày classic bất bại, là fan hâm mộ của VANS nói chung và những skaters nói riêng đều nên có một đôi trong tủ giày. Được mệnh danh là phiên bản mang “càng cũ càng đẹp” và nhiều phiên bản custom  bậc nhất của nhà VANS.', N'2-37.jpg', CAST(950000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([ID], [Ten], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Gia]) VALUES (33, N'Vans Authen DX Cream', CAST(N'2022-11-04' AS Date), 1, 2, N'Vans Authentic 44 DX Anaheim Factory vừa giữ lại được kiểu dáng của các dòng Vans cổ điển, vừa đảm bảo tính thời trang cho người mang.', N'111111.jpg', CAST(950000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([ID], [Ten], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Gia]) VALUES (35, N'Vans UA Era Varsity Canvas - VN0A5KX524O', CAST(N'2022-11-16' AS Date), 1, 2, N'Vans Varsity Canvas đã mang tới một sắc màu mới mẻ hiện đại, cùng với lối thiết kế đậm chất cổ điển. Với chất liệu chính là 57.7% da và 42.3% vải đã đem tới sự khác biệt lớn cho dòng Era này. Phối màu Varsity Canvas Green/ Blue sẽ giúp bạn chinh phục mọi outfit khác nhau. Bên cạnh đó, bộ đệm lót OrthoLite êm ái cũng hỗ trợ trong quá trình chuyển động tốt hơn. Giúp bạn có một trải nghiệm đáng nhớ hơn với đôi giày thể thao đường phố này.', N'VN0A5KX524O_3-650x650.jpg', CAST(1305000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([ID], [Ten], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Gia]) VALUES (36, N'Vans UA Authentic Vans Collage - VN0A5KRDBZW', CAST(N'2022-11-16' AS Date), 1, 2, N'Hiện đại, thẩm mỹ, sáng tạo, Vans Collage tiếp tục bước vào thế giới nghệ thuật đương đại với kỹ thuật Collage mang đến hiệu ứng thị giác độc đáo. Đa dạng với các bản in được cắt ghép khéo léo cùng biểu tượng logo Vans và họa tiết Checkerboard đặc trưng thể hiện tính di sản của thương hiệu. BST được tạo nên với những mảnh ghép mộc mạc liên kết với nhau một cách bất quy tắc với cách tạo hình tự do, phóng khoáng và không theo một trật tự nào. ', N'VN0A5KRDBZW_1-650x650.jpg', CAST(1395000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([ID], [Ten], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Gia]) VALUES (51, N'Converse 70s vàng cao', CAST(N'2022-11-04' AS Date), 1, 1, N'Vans Authentic 44 DX Anaheim Factory vừa giữ lại được kiểu dáng của các dòng Vans cổ điển, vừa đảm bảo tính thời trang cho người mang.', N'1-13_20221127053651.jpg', CAST(950000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([ID], [Ten], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Gia]) VALUES (52, N'Converse 70s vàng cao', CAST(N'2022-11-16' AS Date), 1, 1, N'Vans Eco Theory Positivity truyền tải thông điệp nhân văn nhân dịp kỷ niệm Ngày Trái Đất trên tinh thần đẩy mạnh việc thực hiện sử dụng các vật liệu có nguồn gốc, thân thiện với môi trường. Ngoại hình tạo điểm nhấn với các họa tiết hoa văn sinh động và slogan thể hiện trách nhiệm với môi trường. Đồng thời, thiết kế được hoàn thiện bởi upper canvas từ hai thành phần chính là bông hữu cơ và cây gai dầu. Sự cải tiến còn được thể hiện ở đế ngoài với cấu trúc EcoWaffle™ và đệm lót EcoCush ™ êm ái, cùng đế ngoài dày dặn linh hoạt.', N'1-14_20221127053911.jpg', CAST(1305000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([ID], [Ten], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Gia]) VALUES (53, N'Converse 70s vàng cao', CAST(N'2022-11-16' AS Date), 1, 1, N'Vans Authentic 44 DX Anaheim Factory vừa giữ lại được kiểu dáng của các dòng Vans cổ điển, vừa đảm bảo tính thời trang cho người mang.', N'1-39 (1)_20221127053748.jpg', CAST(950000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([ID], [Ten], [NgaySanXuat], [CoSan], [IDLoaiSanPham], [MoTa], [Anh], [Gia]) VALUES (54, N'Converse 70s vàng cao', CAST(N'2022-11-16' AS Date), 1, 1, N'Vans Authentic 44 DX Anaheim Factory vừa giữ lại được kiểu dáng của các dòng Vans cổ điển, vừa đảm bảo tính thời trang cho người mang.', N'1-13_20221127052814.jpg', CAST(950000 AS Decimal(18, 0)))
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
