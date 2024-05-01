-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 20, 2023 lúc 04:02 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `csdl_sua`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(11) NOT NULL,
  `name_brand` varchar(255) DEFAULT NULL,
  `image_brand` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id_brand`, `name_brand`, `image_brand`) VALUES
(1, 'Vinamilk', '../uploads/Vinamilk_new_logo.svg.png'),
(2, 'TH True milk', '../uploads/1063_image_thumbnail.png'),
(3, 'Nutifood', '../uploads/nutifood-20210910171817.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiet_hd`
--

CREATE TABLE `chitiet_hd` (
  `MaHD` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `Soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiet_hd`
--

INSERT INTO `chitiet_hd` (`MaHD`, `id_product`, `Soluong`) VALUES
(9, 18, 10),
(10, 18, 10),
(10, 20, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colorproduct`
--

CREATE TABLE `colorproduct` (
  `id_colorProduct` int(11) NOT NULL,
  `name_colorProduct` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `colorproduct`
--

INSERT INTO `colorproduct` (`id_colorProduct`, `name_colorProduct`) VALUES
(1, 'Vàng'),
(2, 'Xanh Rêu'),
(3, 'Xám'),
(4, 'Bạc'),
(5, 'Đỏ'),
(6, 'Xanh Lục'),
(7, 'Tím'),
(8, 'Đen'),
(9, 'Trắng'),
(10, 'Màu Đồng'),
(11, 'Xanh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `cur_date` date DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giamgia`
--

CREATE TABLE `giamgia` (
  `ID` int(11) NOT NULL,
  `Ten` varchar(50) NOT NULL,
  `GiaTriGiamGia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giamgia`
--

INSERT INTO `giamgia` (`ID`, `Ten`, `GiaTriGiamGia`) VALUES
(1, 'Giảm giá tất cả', 50000),
(2, 'Giảm giá dịp Lễ', 10000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHD` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `TenKhacHang` varchar(50) NOT NULL,
  `SDT` varchar(50) NOT NULL,
  `Ngay` varchar(50) NOT NULL,
  `id_gg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `id_user`, `TenKhacHang`, `SDT`, `Ngay`, `id_gg`) VALUES
(9, 4, 'son', '02121515', '2023-12-21', 1),
(10, 5, 'Sơnbg', '02121515', '2023-12-21', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `name_product` varchar(255) DEFAULT NULL,
  `image_product1` varchar(255) DEFAULT NULL,
  `image_product2` varchar(255) DEFAULT NULL,
  `image_product3` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `sale` float DEFAULT NULL,
  `des` varchar(1000) DEFAULT NULL,
  `countView` int(11) DEFAULT 0,
  `detail` text DEFAULT NULL,
  `amountProduct` int(11) DEFAULT NULL,
  `id_brand` int(11) DEFAULT NULL,
  `id_productStatus` int(11) DEFAULT NULL,
  `id_sizeProduct` int(11) DEFAULT NULL,
  `id_colorProduct` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `image_product1`, `image_product2`, `image_product3`, `price`, `sale`, `des`, `countView`, `detail`, `amountProduct`, `id_brand`, `id_productStatus`, `id_sizeProduct`, `id_colorProduct`) VALUES
(18, 'Thùng 48 hộp sữa dinh dưỡng tiệt trùng có đường Nuvi 180ml', '../uploads/thung-48-hop-sua-dinh-duong-tiet-trung-co-duong-nuvi-180ml-202308101530120358.jpg', '../uploads/thung-48-hop-sua-dinh-duong-tiet-trung-co-duong-nuvi-180ml-202212260930565289.jpg', '../uploads/thung-48-hop-sua-dinh-duong-tiet-trung-co-duong-nuvi-180ml-202212240917294701.jpg', 323232, 200000, 'Sữa tươi Nuvi với công thức độc quyền TallMax IGF1 cung cấp đầy đủ hệ vi chất thiết yếu, giúp phát triển chiều cao và não bộ. Thùng 48 hộp sữa tươi tiệt trùng có đường Nuvi 180ml tiện lợi, được làm từ sữa tươi thiên nhiên, không chứa chất bảo quản, có đường thơm ngon, dễ dùng.', 10, '<h2>Th&ocirc;ng tin sản phẩm</h2>\r\n\r\n<p><a href=\"https://www.bachhoaxanh.com/sua-tuoi-nuvi\">Sữa tươi Nuvi</a>&nbsp;với c&ocirc;ng thức độc quyền TallMax IGF1 cung cấp đầy đủ hệ vi chất thiết yếu, gi&uacute;p ph&aacute;t triển chiều cao v&agrave; n&atilde;o bộ.&nbsp;<a href=\"https://www.bachhoaxanh.com/sua-tuoi/thung-48-hop-sua-dinh-duong-tiet-trung-co-duong-nuvi-180ml\">Th&ugrave;ng 48 hộp sữa tươi tiệt tr&ugrave;ng c&oacute; đường Nuvi 180ml</a>&nbsp;tiện lợi, được l&agrave;m từ&nbsp;<a href=\"http://www.bachhoaxanh.com/sua-tuoi\">sữa tươi</a>&nbsp;thi&ecirc;n nhi&ecirc;n, kh&ocirc;ng chứa chất bảo quản,&nbsp;c&oacute; đường thơm ngon, dễ d&ugrave;ng.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Loại sữa</td>\r\n			<td>\r\n			<p>Sữa dinh dưỡng tiệt tr&ugrave;ng c&oacute; đường</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung t&iacute;ch</td>\r\n			<td>\r\n			<p>180ml</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ph&ugrave; hợp với</td>\r\n			<td>\r\n			<p>Người lớn v&agrave; trẻ từ 1 tuổi trở l&ecirc;n</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&agrave;nh phần</td>\r\n			<td>\r\n			<p>Sữa 95,3% (Nước, sữa bột, chất b&eacute;o sữa), đường sucrose (3,8%), maltodextrin, chất b&eacute;o thực vật, chất ổn định, hương liệu tổng hợp d&ugrave;ng cho thực phẩm, taurin, hỗn hợp vitamin v&agrave; kho&aacute;ng chất,...</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bảo quản</td>\r\n			<td>\r\n			<p>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Lưu &yacute;</td>\r\n			<td>\r\n			<p>Sản phẩm c&oacute; chứa sữa.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>\r\n			<p>Nuvi (Việt Nam)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>\r\n			<p>Việt Nam</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>B&agrave;i viết sản phẩm</p>\r\n\r\n<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu Nuvi</strong></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nuvi l&agrave; thương hi&ecirc;u thức uống dinh dưỡng d&agrave;nh cho trẻ em v&agrave; rất được ưa chuộng bởi chất lượng cao c&ugrave;ng hương vị thơm ngon, với c&ocirc;ng thức Nuvi Power độc quyền được nghi&ecirc;n cứu v&agrave; ph&aacute;t triển bởi Viện Nghi&ecirc;n Cứu Dinh Dưỡng Nutifood Thụy Điển (NNRIS) v&agrave; sản xuất bởi C&ocirc;ng ty Cổ phần thực phẩm dinh dưỡng Nutifood.<br />\r\n&nbsp;</p>\r\n\r\n<h3><strong>Th&agrave;nh phần dinh dưỡng trong th&ugrave;ng 48 hộp&nbsp;sữa dinh dưỡng tiệt tr&ugrave;ng c&oacute; đường Nuvi 180ml</strong></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Th&agrave;nh phần dinh dưỡng c&oacute; trong sữa dinh dưỡng tiệt tr&ugrave;ng Nuvi 180ml: Chất đạm, chất b&eacute;o, cacbonhydrat&nbsp;c&ugrave;ng c&aacute;c vitamin v&agrave; kho&aacute;ng chất như: Niacin, canxi, phospho, vitamin D3, lysine, kẽm, taurine, sắt, vitamin A, B2, B1, B6,...</p>\r\n\r\n<p>Trong 100ml sữa dinh dưỡng Nuvi c&oacute; chứa khoảng 82 calo.</p>\r\n\r\n<p><img alt=\"thung-48-hop-sua-dinh-duong-tiet-trung-co-duong-nuvi-180ml-202304262216232962.jpg (600×600)\" src=\"https://cdn.tgdd.vn/Products/Images/2386/299639/bhx/thung-48-hop-sua-dinh-duong-tiet-trung-co-duong-nuvi-180ml-202304262216232962.jpg\" /><br />\r\n&nbsp;</p>\r\n\r\n<h3><strong>T&aacute;c dụng của sữa dinh dưỡng tiệt tr&ugrave;ng c&oacute; đường Nuvi 180ml với sức khỏe</strong></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Sữa dinh dưỡng Nuvi gi&uacute;p bổ sung c&aacute;c dưỡng chất v&agrave; vitamin thiết yếu cho b&eacute; cao lớn th&ocirc;ng minh, tăng cường chức năng v&agrave; ph&aacute;t triển n&atilde;o bộ.</p>\r\n	</li>\r\n	<li>\r\n	<p>Gi&uacute;p xương vững chắc, hỗ trợ hấp thu canxi tối ưu v&agrave; tăng cường ph&aacute;t triển chiều cao của trẻ. Sản phẩm kh&ocirc;ng chứa chất bảo quản, đạt ti&ecirc;u chuẩn ISO 9001, n&ecirc;n rất an to&agrave;n cho người ti&ecirc;u d&ugrave;ng.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>Hướng dẫn sử dụng th&ugrave;ng 48 hộp sữa dinh dưỡng tiệt tr&ugrave;ng c&oacute; đường Nuvi 180ml</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Sản phẩm được đ&oacute;ng g&oacute;i dạng th&ugrave;ng gồm 48 hộp sữa.</p>\r\n	</li>\r\n	<li>\r\n	<p>Sử dụng sữa Nuvi ngay sau khi mở bao b&igrave;, n&ecirc;n lắc đều trước khi uống, ngon hơn khi uống lạnh.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><img alt=\"banner-nuvi.png (1445×812)\" src=\"https://nutifood.com.vn/files/brands/nuvi/banner-nuvi.png\" /><br />\r\n&nbsp;</p>\r\n\r\n<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản th&ugrave;ng 48 hộp sữa dinh dưỡng tiệt tr&ugrave;ng c&oacute; đường Nuvi 180ml</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Bảo quản sữa Nuvi nơi&nbsp;tho&aacute;ng m&aacute;t, kh&ocirc;ng để dưới &aacute;nh nắng trực tiếp từ mặt trời.</p>\r\n	</li>\r\n	<li>\r\n	<p>Sử dụng sản phẩm cho người lớn v&agrave; trẻ em tr&ecirc;n 1 tuổi.<br />\r\n	&nbsp;</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><strong>Ưu điểm khi mua sữa Nuvi tại B&aacute;ch ho&aacute; XANH</strong></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&aacute;c sản phẩm sữa Nuvi đang được b&agrave;y b&aacute;n tại B&aacute;ch h&oacute;a XANH cam kết ch&iacute;nh h&atilde;ng, đảm bảo nguồn gốc, xuất xứ r&otilde; r&agrave;ng&nbsp;c&ugrave;ng mức gi&aacute; hợp l&yacute;. Ngo&agrave;i ra khi mua h&agrave;ng trực tuyến tại website v&agrave; ứng dụng B&aacute;ch h&oacute;a XANH bạn c&ograve;n nhận về nhiều những ưu đ&atilde;i hấp dẫn v&agrave; được giao h&agrave;ng tận nh&agrave;, nhanh ch&oacute;ng.</p>\r\n', 10, 1, 1, 1, 1),
(19, 'Thùng 48 hộp sữa tươi tiệt trùng ít đường TH true MILK 110ml', '../uploads/thung-48-hop-sua-tuoi-tiet-trung-it-duong-th-true-milk-110ml-202307120944254332.jpg', '../uploads/-202307011515044514.jpg', '../uploads/-202307011515046682.jpg', 323232, 200000, 'Đảm bảo không sử dụng thêm hương liệu, vị ngon 100% đến từ sữa tươi từ trang trại của TH True Milk chứa nhiều vitamin và khoáng chất như Vitamin A, D, B1, B2, canxi, kẽm. Thùng 48 hộp sữa tươi tiệt trùng ít đường TH true MILK 110ml đóng thùng tiện lợi, tiết kiệm', 10, '<p>Đảm bảo kh&ocirc;ng sử dụng th&ecirc;m hương liệu, vị ngon 100% đến từ&nbsp;<a href=\"https://www.bachhoaxanh.com/sua-tuoi\">sữa tươi</a>&nbsp;từ trang trại của&nbsp;<a href=\"https://www.bachhoaxanh.com/sua-tuoi-th-true-milk\">TH True Milk</a>&nbsp;chứa nhiều vitamin v&agrave; kho&aacute;ng chất như Vitamin A, D, B1, B2, canxi, kẽm.&nbsp;<a href=\"http://www.bachhoaxanh.com/sua-tuoi/sua-tiet-trung-th-it-duong-110ml-thung48\">Th&ugrave;ng 48 hộp sữa tươi tiệt tr&ugrave;ng &iacute;t đường TH true MILK 110ml</a>&nbsp;đ&oacute;ng th&ugrave;ng tiện lợi, tiết kiệm</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Loại sữa</td>\r\n			<td>\r\n			<p>Sữa tươi tiệt tr&ugrave;ng &iacute;t đường</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung t&iacute;ch</td>\r\n			<td>\r\n			<p>110ml</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ph&ugrave; hợp với</td>\r\n			<td>\r\n			<p>Trẻ từ 1 tuổi trở l&ecirc;n</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&agrave;nh phần</td>\r\n			<td>\r\n			<p>Sữa ho&agrave;n to&agrave;n từ sữa b&ograve; tươi (97%), đường tinh luyện,...</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>\r\n			<p>TH true MILK (Việt Nam)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>\r\n			<p>Việt Nam</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>B&agrave;i viết sản phẩm</p>\r\n\r\n<p><strong>Sữa tươi TH True Milk &iacute;t đường</strong>&nbsp;c&oacute; vị ngọt nhẹ, thơm ngon, b&eacute;o ngậy cực kỳ dễ uống. Sữa được l&agrave;m ho&agrave;n to&agrave;n từ nguồn sữa b&ograve; tươi sạch tại trang trại của TH.</p>\r\n\r\n<p><strong><a href=\"https://www.bachhoaxanh.com/sua-tuoi\">Sữa tươi</a></strong>&nbsp;c&oacute; chứa nhiều Vitamin A, D, B1, B2 v&agrave; c&aacute;c loại kho&aacute;ng chất c&oacute; lợi cho sức khoẻ xương v&agrave; hệ miễn dịch.</p>\r\n\r\n<h3><strong>Gi&aacute; trị dinh dưỡng</strong><br />\r\n<img alt=\"\" src=\"https://cdn.tgdd.vn/Products/Images//2386/85876/bhx/files/7.jpg\" /><br />\r\n<strong>Th&agrave;nh phần v&agrave; c&ocirc;ng dụng:</strong></h3>\r\n\r\n<ul>\r\n	<li>Th&agrave;nh phần<strong>:</strong>&nbsp;Sữa tươi, vitamin A, D, B1, B2, đường, kho&aacute;ng chất, Collagen, Canxi, Phytosterol, chất xơ, Cacbohydrate,...&nbsp;đem đến hương vị thơm ngon cũng như cung cấp c&aacute;c dưỡng chất thiết yếu cho sự ph&aacute;t triển tr&iacute; lực v&agrave; thể chất của cả gia đ&igrave;nh.</li>\r\n	<li>Bổ sung Colagen, Canxi, Phytosterol v&agrave; c&aacute;c dưỡng chất thiết yếu gi&uacute;p tăng khả năng hấp thu chất dinh dưỡng, bảo vệ xương v&agrave; răng, cải thiện hệ tim mạch.</li>\r\n</ul>\r\n\r\n<h3><strong>Hướng dẫn sử dụng:</strong></h3>\r\n\r\n<ul>\r\n	<li>D&ugrave;ng uống trực tiếp.</li>\r\n	<li>Ngon hơn khi ướp lạnh.</li>\r\n</ul>\r\n\r\n<h3><strong>Lưu &yacute;:&nbsp;</strong></h3>\r\n\r\n<ul>\r\n	<li>Sau khi mở hộp, bảo quản ở 4 - 10 độ C v&agrave; sử dụng cho một lần uống.</li>\r\n	<li>D&ugrave;ng cho b&eacute; tr&ecirc;n 1 tuổi.</li>\r\n</ul>\r\n\r\n<h3><strong>Bảo quản:</strong></h3>\r\n\r\n<ul>\r\n	<li>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</li>\r\n	<li>N&ecirc;n d&ugrave;ng hết sau khi mở, nếu c&ograve;n bảo quản ngăn m&aacute;t tủ lanh, n&ecirc;n d&ugrave;ng hết sau 3 ng&agrave;y.</li>\r\n</ul>\r\n\r\n<p><strong>Hai loại bao b&igrave; chuẩn quốc tế của sữa TH True Milk</strong></p>\r\n\r\n<p>Sữa tươi TH TRUE MILK hiện c&oacute; 2 loại bao b&igrave; được cung cấp bởi Tetra Pak (Thuỵ Điển) v&agrave; Combibloc (Đức), tuy kh&aacute;c nhau về k&iacute;ch cỡ, m&agrave;u sắc v&agrave; c&aacute;ch đ&oacute;ng g&oacute;i nhưng cả hai đều c&oacute; c&ugrave;ng dung t&iacute;ch v&agrave; đạt chuẩn quốc tế, gi&uacute;p giữ trọn sự tươi ngon của sữa trong suốt 6 th&aacute;ng m&agrave; kh&ocirc;ng cần giữ lạnh hoặc d&ugrave;ng bất kỳ chất bảo quản n&agrave;o.</p>\r\n\r\n<p><img alt=\"Hai loại bao bì của sữa TH True Milk\" src=\"https://cdn.tgdd.vn/Products/Images//2386/178967/bhx/files/bao%20bi%cc%80%20th%20true%20milk%20copy.jpg\" /></p>\r\n', 8, 2, 1, 1, 1),
(20, 'Sữa tươi tiệt trùng nguyên chất không đường TH true MILK bịch 220ml', '../uploads/sua-tuoi-tiet-trung-nguyen-chat-khong-duong-th-true-milk-bich-220ml-202202190827586630.jpg', '../uploads/sua-tuoi-tiet-trung-th-true-milk-khong-duong-bich-220ml-201912101431278620.jpg', '../uploads/sua-tuoi-tiet-trung-th-true-milk-khong-duong-bich-220ml-201912101431272626.jpg', 323232, 300000, 'Sữa tươi TH True Milk đảm bảo không sử dụng thêm hương liệu, mang vị ngon sữa tươi nguyên chất 100%, chứa nhiều vitamin và khoáng chất như Vitamin A, D, B1, B2, canxi, kẽm. Sữa tươi tiệt trùng nguyên chất không đường TH true MILK bịch 220ml vị ngon từ sữa tươi nguyên chất', 0, '<h2>Th&ocirc;ng tin sản phẩm</h2>\r\n\r\n<p><a href=\"http://www.bachhoaxanh.com/sua-tuoi-th-true-milk\">Sữa tươi&nbsp;TH True Milk</a>&nbsp;đảm bảo kh&ocirc;ng sử dụng th&ecirc;m hương liệu, mang vị ngon&nbsp;<a href=\"https://www.bachhoaxanh.com/sua-tuoi\">sữa tươi</a>&nbsp;nguy&ecirc;n chất 100%,&nbsp;chứa nhiều vitamin v&agrave; kho&aacute;ng chất như Vitamin A, D, B1, B2, canxi, kẽm.&nbsp;<a href=\"http://www.bachhoaxanh.com/sua-tuoi/sttt-th-milk-cd-bich-220ml-thung\">Sữa tươi tiệt tr&ugrave;ng nguy&ecirc;n chất kh&ocirc;ng đường TH true MILK bịch 220ml</a><a href=\"http://www.bachhoaxanh.com/sua-tuoi/sttt-th-milk-kd-bich-220ml\">&nbsp;</a>vị ngon từ sữa tươi nguy&ecirc;n chất</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Loại sữa</td>\r\n			<td>\r\n			<p>Sữa tươi tiệt tr&ugrave;ng nguy&ecirc;n chất kh&ocirc;ng đường</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung t&iacute;ch</td>\r\n			<td>\r\n			<p>220ml</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ph&ugrave; hợp với</td>\r\n			<td>\r\n			<p>Trẻ từ 1 tuổi trở l&ecirc;n</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&agrave;nh phần</td>\r\n			<td>\r\n			<p>Sữa ho&agrave;n to&agrave;n từ sữa b&ograve; 100%</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>\r\n			<p>TH true MILK (Việt Nam)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>\r\n			<p>Việt Nam</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>B&agrave;i viết sản phẩm</p>\r\n\r\n<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>\r\n\r\n<p>TH True Milk&nbsp;l&agrave; một trong những&nbsp;doanh nghiệp sản xuất sữa v&agrave; sản phẩm l&agrave;m từ sữa nổi bật&nbsp;h&agrave;ng đầu thị trường&nbsp;Việt Nam hiện nay. Ra&nbsp;mắt lần đầu ti&ecirc;n đến người ti&ecirc;u d&ugrave;ng v&agrave;o th&aacute;ng 12 năm 2010,&nbsp;TH True Milk hiện&nbsp;vẫn lu&ocirc;n&nbsp;tự h&agrave;o với c&aacute;c sản phẩm&nbsp;đạt chuẩn&nbsp;về an to&agrave;n thực phẩm, rất được người ti&ecirc;u d&ugrave;ng ưa chuộng nhờ&nbsp;mang đến nguồn dinh dưỡng đủ đầy ho&agrave;n to&agrave;n từ sữa b&ograve; tươi, chất lượng v&agrave;&nbsp;an to&agrave;n.</p>\r\n\r\n<h3><strong>Th&agrave;nh phần dinh dưỡng của sản phẩm</strong></h3>\r\n\r\n<p>Sản phẩm được l&agrave;m từ 100% sữa ho&agrave;n to&agrave;n từ sữa b&ograve; tươi.<strong>&nbsp;</strong>&nbsp;Ngo&agrave;i ra, sản phẩm cung cấp&nbsp;<strong>khoảng 60 kcal</strong>&nbsp;tr&ecirc;n&nbsp;<strong>100ml sữa</strong>.</p>\r\n\r\n<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>\r\n\r\n<p><strong>Sữa tươi TH True Milk nguy&ecirc;n chất được l&agrave;m&nbsp;</strong>ho&agrave;n to&agrave;n từ sữa tươi sạch tại c&aacute;c trang trại của TH v&agrave;&nbsp;kh&ocirc;ng sử dụng th&ecirc;m&nbsp;đường. Từ đ&oacute;, sản phẩm&nbsp;kh&ocirc;ng chỉ giữ được trọn vẹn vị thơm ngon, b&eacute;o ngậy m&agrave; c&ograve;n chứa rất nhiều chất dinh dưỡng như vitamin A, D, B1, B2, Canxi, kẽm... tốt cho xương v&agrave; hệ miễn dịch.<br />\r\n<img alt=\"\" src=\"https://cdn.tgdd.vn/Products/Images//2386/266064/bhx/files/sua-tuoi-tiet-trung-nguyen-chat-khong-duong-th-true-milk-bich-220ml-202202190827586630.jpg\" /></p>\r\n\r\n<h3><strong>Hướng dẫn sử dụng</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>D&ugrave;ng uống trực tiếp</p>\r\n	</li>\r\n	<li>\r\n	<p>Ngon hơn khi ướp lạnh</p>\r\n	</li>\r\n	<li>\r\n	<p>Sử dụng cho 1 lần uống</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp.</p>\r\n	</li>\r\n	<li>\r\n	<p>N&ecirc;n d&ugrave;ng hết sau khi mở, nếu c&ograve;n bảo quản ngăn m&aacute;t tủ lạnh, n&ecirc;n d&ugrave;ng hết sau 3 ng&agrave;y</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong><img alt=\"\" src=\"https://cdn.tgdd.vn/Products/Images//2386/266064/bhx/files/sua-tuoi-tiet-trung-th-true-milk-khong-duong-bich-220ml-201912101431278620.JPG\" /></strong></p>\r\n\r\n<h3><strong>C&aacute;c m&oacute;n ngon từ sản phẩm</strong></h3>\r\n\r\n<p>Với sữa tươi kh&ocirc;ng đường, bạn c&oacute; thể d&ugrave;ng l&agrave;m nguồn nguy&ecirc;n liệu ho&agrave;n hảo cho c&aacute;c m&oacute;n ăn, thức uống thơm ngon, gi&agrave;u dinh dưỡng như:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>M&oacute;n sữa chua ph&ocirc; mai</p>\r\n	</li>\r\n	<li>\r\n	<p>M&oacute;n b&aacute;nh panna cotta kiểu &Yacute;</p>\r\n	</li>\r\n	<li>\r\n	<p>M&oacute;n s&uacute;p khoai t&acirc;y mịn</p>\r\n	</li>\r\n	<li>\r\n	<p>M&oacute;n tr&agrave; sữa</p>\r\n	</li>\r\n	<li>\r\n	<p>M&oacute;n kem chi&ecirc;n</p>\r\n	</li>\r\n	<li>\r\n	<p>M&oacute;n ca cao sữa n&oacute;ng</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>\r\n\r\n<p>D&ograve;ng&nbsp;sản phẩm sữa tươi TH True Milk&nbsp;hiện&nbsp;đang c&oacute; b&aacute;n ch&iacute;nh h&atilde;ng Tại B&aacute;ch h&oacute;a XANH với gi&aacute; th&agrave;nh tốt, đảm bảo&nbsp;100% đ&uacute;ng nguồn gốc xuất xứ từ nh&agrave; sản xuất, an to&agrave;n với người d&ugrave;ng. Bạn&nbsp;c&oacute; thể mua sản phẩm&nbsp;online qua app hoặc website để nhận được&nbsp;nhiều ưu đ&atilde;i k&egrave;m theo dịch vụ&nbsp;giao h&agrave;ng nhanh ch&oacute;ng tận nơi.<br />\r\n<strong>Xem th&ecirc;m:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><a href=\"https://www.bachhoaxanh.com/kinh-nghiem-hay/th-true-milk-va-khat-vong-sua-sach-1175283\">TH true Milk và khát vọng sữa sạch cho người Vi&ecirc;̣t</a></p>\r\n	</li>\r\n</ul>\r\n', 10, 2, 1, 1, 1),
(21, ' Thùng 48 bịch sữa dinh dưỡng có đường Nutimilk 220ml ', '../uploads/-202307011509108869.jpg', '../uploads/thung-48-bich-sua-dinh-duong-co-duong-nutimilk-220ml-202307071657273064.jpg', '../uploads/thung-48-bich-sua-dinh-duong-co-duong-nutimilk-220ml-202307071657275487.jpg', 283000, 250000, 'Sữa tươi NutiMilk có hàm lượng dinh dưỡng vượt trội, đạt tiêu chuẩn trên thế giới. Sữa tươi thơm ngon tự nhiên, dồi dào hàm lượng dinh dưỡng tương đương sữa nhập nên được các bà mẹ ưa chuộng. Thùng 48 bịch sữa dinh dưỡng có đường Nutimilk 220ml đóng thùng tiết kiệm, tiện dùng lâu dài.', 0, '<p><a href=\"https://www.bachhoaxanh.com/sua-tuoi-nutimilk\">Sữa tươi NutiMilk</a>&nbsp;c&oacute; h&agrave;m lượng dinh dưỡng vượt trội, đạt ti&ecirc;u chuẩn tr&ecirc;n thế giới.&nbsp;<a href=\"https://www.bachhoaxanh.com/sua-tuoi\">Sữa tươi</a>&nbsp;thơm ngon tự nhi&ecirc;n, dồi d&agrave;o h&agrave;m lượng dinh dưỡng tương đương sữa nhập n&ecirc;n được c&aacute;c b&agrave; mẹ ưa chuộng.&nbsp;<a href=\"http://www.bachhoaxanh.com/sua-tuoi/thung-48-bich-sua-dinh-duong-co-duong-nutimilk-220ml\">Th&ugrave;ng 48 bịch sữa dinh dưỡng c&oacute; đường Nutimilk 220ml</a>&nbsp;đ&oacute;ng th&ugrave;ng tiết kiệm, tiện d&ugrave;ng l&acirc;u d&agrave;i.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Loại sữa</td>\r\n			<td>\r\n			<p>Sữa dinh dưỡng c&oacute; đường</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung t&iacute;ch</td>\r\n			<td>\r\n			<p>220ml</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ph&ugrave; hợp với</td>\r\n			<td>\r\n			<p>Trẻ từ 1 tuổi trở l&ecirc;n</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&agrave;nh phần</td>\r\n			<td>\r\n			<p>Sữa (94,3%) (nước, sữa tươi, sữa bột, chất b&eacute;o sữa), đường tinh luyện (3,8%), maltodextrin, chất b&eacute;o thực vật, chất ổn định d&agrave;nh cho thực phẩm, vitamin v&agrave; kho&aacute;ng chất (vitamin A, D3, kẽm sulfat)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bảo quản</td>\r\n			<td>\r\n			<p>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Lắc đều trước khi uống v&agrave; ngon hơn khi uống lạnh.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Lưu &yacute;</td>\r\n			<td>\r\n			<p>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi. Sản phẩm cho 1 lần sử dụng</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>\r\n			<p>Nutimilk (Việt Nam)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>\r\n			<p>Việt Nam</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>B&agrave;i viết sản phẩm</p>\r\n\r\n<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>\r\n\r\n<p>Nutimilk l&agrave; thương hiệu được ra mắt trong thời gian gần đ&acirc;y, hiện tại được sở hữu bởi C&ocirc;ng ty Cổ phần Thực phẩm Dinh dưỡng Nutifood. D&ugrave; chỉ mới ra mắt nhưng hiện nay c&aacute;c sản phẩm sữa của thương hiệu n&agrave;y đang rất được người ti&ecirc;u d&ugrave;ng quan t&acirc;m chọn lựa. Được sản xuất từ những th&agrave;nh phần tươi ngon, quy tr&igrave;nh sản xuất kh&eacute;p k&iacute;n cũng c&ocirc;ng nghệ hiện đại gi&uacute;p c&aacute;c sản phẩm đạt ti&ecirc;u chuẩn v&agrave; chất lượng như c&aacute;c sản phẩm sữa ngoại nhập kh&aacute;c.</p>\r\n\r\n<h3><strong>Th&agrave;nh phần dinh dưỡng của sản phẩm</strong></h3>\r\n\r\n<p>Sữa tươi Nutimilk c&oacute; đường&nbsp;220ml được l&agrave;m từ c&aacute;c th&agrave;nh phần ch&iacute;nh như: Sữa (94,3%) (nước, sữa tươi, sữa bột, chất b&eacute;o sữa), đường tinh luyện (3,8%), maltodextrin, chất b&eacute;o thực vật, chất ổn định d&agrave;nh cho thực phẩm, vitamin v&agrave; kho&aacute;ng chất (vitamin A, D3, kẽm sulfat). Ngo&agrave;i ra, sản phẩm cung cấp cho cơ thể&nbsp;<strong>khoảng 77 calo&nbsp;</strong>tr&ecirc;n&nbsp;<strong>100ml sữa</strong>.</p>\r\n\r\n<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>\r\n\r\n<p>Sữa tươi tiệt tr&ugrave;ng c&oacute; đường NutiMilk ch&iacute;nh l&agrave; 1 sự lựa chọn ph&ugrave; hợp cho những bạn kh&ocirc;ng th&iacute;ch uống ngọt hoặc đang trong thời kỳ giữ d&aacute;ng muốn bổ sung năng lượng nhanh cho cơ thể. Đồng thời, sữa Nutimilk c&ograve;n l&agrave; giải ph&aacute;p gi&uacute;p trẻ em ph&aacute;t triển to&agrave;n diện v&agrave; ngăn ngừa bệnh lo&atilde;ng xương cho người lớn được tiệt tr&ugrave;ng bằng c&ocirc;ng nghệ hiện đại, cam kết kh&ocirc;ng chất bảo quản hay chất tạo ngọt tổng hợp, đảm bảo an to&agrave;n cho sức khỏe người ti&ecirc;u d&ugrave;ng.<br />\r\n<img alt=\"\" src=\"https://cdn.tgdd.vn/Products/Images//2687/79620/bhx/files/thung-48-bich-sua-dinh-duong-co-duong-nutimilk-220ml-202202221718300343.jpg\" /></p>\r\n\r\n<h3><strong>Hướng dẫn sử dụng</strong></h3>\r\n\r\n<p>Sữa tươi l&agrave; sản phẩm c&oacute; thể sử dụng ngay sau khi mở bịch. B&ecirc;n cạnh c&aacute;ch uống th&ocirc;ng thường bạn c&ograve;n c&oacute; thể kết hợp, pha chế sữa tươi hoặc chế biến th&agrave;nh c&aacute;c m&oacute;n ăn thơm ngon, bổ dưỡng. Tuyệt đối kh&ocirc;ng sử dụng sữa đ&atilde; hết hạn hoặc c&oacute; dấu hiệu hư hỏng. Ngon hơn khi uống lạnh.</p>\r\n\r\n<h3><strong>C&aacute;ch bảo quản v&agrave; lưu &yacute; khi d&ugrave;ng sữa tươi Nutimilk</strong></h3>\r\n\r\n<p>Sữa tươi c&oacute; thể bảo quản ở nhiệt độ thường hoặc nếu uống lạnh bạn c&oacute; thể cho v&agrave;o ngăn m&aacute;t. Sữa khi mở hộp kh&ocirc;ng n&ecirc;n để ở nhiệt độ thường qu&aacute; l&acirc;u sẽ ảnh hưởng đến chất lượng sữa.</p>\r\n\r\n<h3><strong>C&aacute;c m&oacute;n ăn ngon với sữa tươi Nutimilk</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Sữa tươi c&agrave; ph&ecirc;</p>\r\n	</li>\r\n	<li>\r\n	<p>B&aacute;nh sữa tươi chi&ecirc;n</p>\r\n	</li>\r\n	<li>\r\n	<p>B&aacute;nh flan sữa tươi</p>\r\n	</li>\r\n	<li>\r\n	<p>B&aacute;nh khoai lang sữa tươi</p>\r\n	</li>\r\n	<li>\r\n	<p>Sữa tươi vi&ecirc;n</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/Products/Images//2687/79620/bhx/files/thung-48-bich-sua-dinh-duong-co-duong-nutimilk-220ml-202111040811065843.jpg\" /></p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<p>Th&ugrave;ng 48 bịch sữa tươi c&oacute; đường Nutimilk 220ml v&agrave; c&aacute;c sản phẩm c&aacute;c của Nutimilk đều&nbsp;đang được ph&acirc;n phối ch&iacute;nh h&atilde;ng tại B&aacute;ch h&oacute;a XANH, đảm bảo đ&uacute;ng nguồn gốc xuất xứ v&agrave; an to&agrave;n với người sử dụng. Bạn c&oacute; thể mua sản phẩm online qua app hoặc website để nhận được nhiều ưu đ&atilde;i v&agrave; khuyến m&atilde;i mỗi ng&agrave;y, c&ugrave;ng dịch vụ giao h&agrave;ng tận nh&agrave; nhanh ch&oacute;ng, tiện lợi.</p>\r\n', 50, 1, 1, 1, 1),
(22, 'Sữa dinh dưỡng có đường Nutimilk bịch 220ml', '../uploads/sua-dinh-duong-co-duong-nutimilk-bich-220ml-202202221719314652.jpg', '../uploads/sua-dinh-duong-co-duong-nutimilk-bich-220ml-202310061703412994.jpg', '../uploads/sua-dinh-duong-co-duong-nutimilk-bich-220ml-202310061703422604.jpg', 8100, 7000, 'Sữa tươi NutiMilk có hàm lượng dinh dưỡng vượt trội, đạt tiêu chuẩn trên thế giới. Sữa tươi thơm ngon tự nhiên, dồi dào hàm lượng dinh dưỡng tương đương sữa nhập nên được các bà mẹ ưa chuộng. Sữa dinh dưỡng có đường Nutimilk bịch 220ml thêm đường dễ uống, gọn nhẹ vô cùng.', 7, '<h2>Th&ocirc;ng tin sản phẩm</h2>\r\n\r\n<p><a href=\"https://www.bachhoaxanh.com/sua-tuoi-nutimilk\">Sữa tươi NutiMilk</a>&nbsp;c&oacute; h&agrave;m lượng dinh dưỡng vượt trội, đạt ti&ecirc;u chuẩn tr&ecirc;n thế giới.&nbsp;<a href=\"https://www.bachhoaxanh.com/sua-tuoi\">Sữa tươi</a>&nbsp;thơm ngon tự nhi&ecirc;n, dồi d&agrave;o h&agrave;m lượng dinh dưỡng tương đương sữa nhập n&ecirc;n được c&aacute;c b&agrave; mẹ ưa chuộng.&nbsp;<a href=\"https://www.bachhoaxanh.com/sua-tuoi/sua-dinh-duong-co-duong-nutimilk-bich-220ml\">Sữa dinh dưỡng c&oacute; đường Nutimilk bịch 220ml</a>&nbsp;th&ecirc;m đường dễ uống, gọn nhẹ v&ocirc; c&ugrave;ng.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Loại sữa</td>\r\n			<td>\r\n			<p>Sữa dinh dưỡng c&oacute; đường</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Dung t&iacute;ch</td>\r\n			<td>\r\n			<p>220ml</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ph&ugrave; hợp với</td>\r\n			<td>\r\n			<p>Trẻ từ 1 tuổi trở l&ecirc;n</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&agrave;nh phần</td>\r\n			<td>\r\n			<p>Sữa (94,3%) (nước, sữa tươi, sữa bột, chất b&eacute;o sữa), đường tinh luyện (3,8%), maltodextrin, chất b&eacute;o thực vật, chất ổn định d&agrave;nh cho thực phẩm, vitamin v&agrave; kho&aacute;ng chất (vitamin A, D3, kẽm sulfat)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bảo quản</td>\r\n			<td>\r\n			<p>Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Lắc đều trước khi uống v&agrave; ngon hơn khi uống lạnh.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Lưu &yacute;</td>\r\n			<td>\r\n			<p>Kh&ocirc;ng d&ugrave;ng cho trẻ dưới 1 tuổi. Sản phẩm cho 1 lần sử dụng</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>\r\n			<p>Nutimilk (Việt Nam)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất tại</td>\r\n			<td>\r\n			<p>Việt Nam</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>B&agrave;i viết sản phẩm</p>\r\n\r\n<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu&nbsp;</strong></h3>\r\n\r\n<p>Th&agrave;nh lập từ năm 2000 bởi C&ocirc;ng ty Nutifood, trải qua hơn 20 năm ph&aacute;t triển đến nay Nutimilk đ&atilde; c&oacute; cho m&igrave;nh chỗ đứng nhất định trong l&ograve;ng người ti&ecirc;u d&ugrave;ng. C&aacute;c sản phẩm sữa Nutimilk mang đến hương vị thơm ngon, đa dạng. chất lượng sản phẩm v&agrave; độ vệ sinh an to&agrave;n thực phẩm để bạn an t&acirc;m sử dụng mỗi ng&agrave;y.<br />\r\n<img alt=\"\" src=\"https://cdn.tgdd.vn/Products/Images//2386/250090/bhx/files/sua-dinh-duong-co-duong-nutimilk-bich-220ml-202202221719314652.jpg\" /></p>\r\n\r\n<h3><strong>Th&agrave;nh phần dinh dưỡng của sản phẩm</strong></h3>\r\n\r\n<p>Sữa dinh dưỡng Nutimilk cung cấp cho cơ thể nguồn năng lượng dồi d&agrave;o, hương vị sữa thơm ngon, dễ uống. Theo bảng th&ocirc;ng tin dinh dưỡng của sản phẩm, sữa Nutimilk cung cấp khaongr 77 kcal t&iacute;nh tr&ecirc;n 100ml sữa c&ugrave;ng với đ&oacute; v&agrave; chất b&eacute;o, chất đạm, c&aacute;c vitamin A, D3, canxi v&agrave; kẽm&hellip;</p>\r\n\r\n<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>\r\n\r\n<p>Một số t&aacute;c dụng nổi bật của sản phẩm như:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Cung cấp năng lượng cho cơ thể</p>\r\n	</li>\r\n	<li>\r\n	<p>Gi&uacute;p xương chắc khỏe</p>\r\n	</li>\r\n	<li>\r\n	<p>Tăng sức đề kh&aacute;ng</p>\r\n	</li>\r\n	<li>\r\n	<p>Gi&uacute;p mắt s&aacute;ng</p>\r\n	</li>\r\n	<li>\r\n	<p>Tăng chiều cao</p>\r\n	</li>\r\n	<li>\r\n	<p>&hellip;</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><strong>Hướng dẫn sử dụng sản phẩm</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Sản phẩm sẽ ngon hơn khi uống lạnh, lắc đều trước khi uống</p>\r\n	</li>\r\n	<li>\r\n	<p>N&ecirc;n d&ugrave;ng từ 2 - 3 bịch mỗi ng&agrave;y</p>\r\n	</li>\r\n	<li>\r\n	<p>Chỉ sử dụng cho 1 lần uống</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>\r\n\r\n<p>Bảo quản sản phẩm chưa mở ở nhiệt độ ph&ograve;ng. Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh nơi ẩm ướt, nơi c&oacute; nhiệt độ cao hoặc &aacute;nh nắng chiếu trực tiếp.Kh&ocirc;ng d&ugrave;ng sản phẩm cho b&eacute; dưới 1 tuổi.<br />\r\n<img alt=\"\" src=\"https://cdn.tgdd.vn/Products/Images//2386/250090/bhx/files/sua-dinh-duong-co-duong-nutimilk-bich-220ml-202111040802453768.jpg\" /></p>\r\n\r\n<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>\r\n\r\n<p>Một trong những địa chỉ kinh doanh c&aacute;c sản phẩm sữa tươi, sữa dinh dưỡng thơm ngon, đa dạng thương hiệu, sản phẩm nhất hiện nay l&agrave; B&aacute;ch h&oacute;a XANH. Khi mua sắm tại đ&acirc;y, bạn sẽ an t&acirc;m với chất lượng sản phẩm được kiểm tra nghi&ecirc;m ngặt, đảm bảo nguồn gốc xuất xứ. Ngo&agrave;i ra khi đặt h&agrave;ng, bạn c&ograve;n được nh&acirc;n vi&ecirc;n giao h&agrave;ng tận nơi, nhanh ch&oacute;ng.</p>\r\n', 500, 3, 1, 1, 1),
(23, 'Lốc 6 chai sữa chua uống hương cam Fristi 80ml', '../uploads/loc-6-chai-sua-chua-uong-fristi-80ml-202202161515125465.jpg', '../uploads/loc-6-chai-sua-chua-uong-cam-fristi-80ml-202305161040285391.jpg', '../uploads/loc-6-chai-sua-chua-uong-cam-fristi-80ml-202305161040291498.jpg', 24500, 23000, 'Sữa chua uống của thương hiệu sữa chua Fristi với hương thơm lừng từ sữa hoà với trái cây dễ uống, vị chua chua ngọt ngọt tự nhiên, bổ sung thêm vitamin nhóm B, vitamin A và D cho bé phát triển khoẻ mạnh, cao lớn hơn. Lốc 6 chai sữa chua uống cam Fristi 80ml hương cam thơm ngon, dễ uống, lốc tiện dùng.', 0, '<h2>Th&ocirc;ng tin sản phẩm</h2>\r\n\r\n<p><a href=\"https://www.bachhoaxanh.com/sua-chua\">Sữa chua uống</a>&nbsp;của thương hiệu&nbsp;<a href=\"https://www.bachhoaxanh.com/sua-chua-fristi\">sữa chua Fristi</a>&nbsp;với hương thơm lừng từ sữa ho&agrave; với tr&aacute;i c&acirc;y dễ uống, vị chua chua ngọt ngọt tự nhi&ecirc;n, bổ sung th&ecirc;m vitamin nh&oacute;m B, vitamin A v&agrave; D cho b&eacute; ph&aacute;t triển khoẻ mạnh, cao lớn hơn.&nbsp;<a href=\"http://www.bachhoaxanh.com/sua-chua/scu-fristi-cam-80ml-loc\">Lốc 6 chai sữa chua uống cam Fristi 80ml</a>&nbsp;hương cam thơm ngon, dễ uống, lốc tiện d&ugrave;ng.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Hương vị</td>\r\n			<td>\r\n			<p>Cam</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ph&ugrave; hợp</td>\r\n			<td>\r\n			<p>Trẻ em tr&ecirc;n 1 tuổi</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thể t&iacute;ch</td>\r\n			<td>\r\n			<p>80ml</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&agrave;nh phần</td>\r\n			<td>\r\n			<p>Nước, sữa tươi, đường, bột whey...</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>\r\n			<p>Fristi (H&agrave; Lan)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất</td>\r\n			<td>\r\n			<p>Việt Nam</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>B&agrave;i viết sản phẩm</p>\r\n\r\n<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>\r\n\r\n<p>Fristi l&agrave; d&ograve;ng sản phẩm sữa chua nổi tiếng&nbsp;thuộc thương hiệu nh&agrave; Dutch Lady hay c&ograve;n c&oacute; t&ecirc;n gọi quen thuộc với người ti&ecirc;u d&ugrave;ng Việt l&agrave; C&ocirc; g&aacute;i H&agrave; Lan. Fristi&nbsp;chuy&ecirc;n sản xuất v&agrave; cung cấp c&aacute;c sản phẩm sữa chua uống mang nhiều hương vị kh&aacute;c nhau d&agrave;nh cho trẻ nhỏ với&nbsp;dạng chai nhỏ gọn tiện dụng, nhiều m&agrave;u sắc.<br />\r\nNgo&agrave;i ra, c&aacute;c sản phẩm của Fristi được sản xuất từ nguy&ecirc;n liệu cao cấp, c&ugrave;ng d&acirc;y chuyền sản xuất c&ugrave;ng c&ocirc;ng nghệ cao, kh&eacute;p k&iacute;n đảm bảo đủ đầy dinh dưỡng, c&ugrave;ng&nbsp;hương vị thơm ngon v&agrave; an to&agrave;n với&nbsp;kh&aacute;ch h&agrave;ng tin d&ugrave;ng.</p>\r\n\r\n<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>\r\n\r\n<p>Sữa chua Fristi cam 80ml được l&agrave;m từ c&aacute;c th&agrave;nh phần&nbsp;như: Nước, đường, bột sữa gầy, bột whey, chất b&eacute;o sữa&hellip; an to&agrave;n cho người sử dụng, k&iacute;ch th&iacute;ch vị gi&aacute;c tốt. Đảm bảo cung cấp được c&aacute;c th&agrave;nh phần dinh dưỡng thiết yếu như: chất đạm, chất b&eacute;o, carbohydrate, đường, canxi, natri, vitamin,.... Ngo&agrave;i ra&nbsp;trong 100ml sữa chua&nbsp;sẽ chứa khoảng 60 kcal.</p>\r\n\r\n<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>\r\n\r\n<p>Sữa chua uống cam Fristi mang đến hương vị cam thơm ngon c&ugrave;ng&nbsp;nhiều c&ocirc;ng dụng v&ocirc; c&ugrave;ng tốt cho sức khỏe như:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Khả năng giải kh&aacute;t v&agrave; hạ nhiệt hiệu quả cho c&aacute;c ng&agrave;y nắng n&oacute;ng.</p>\r\n	</li>\r\n	<li>\r\n	<p>Chứa nhiều th&agrave;nh phần dinh dưỡng nu&ocirc;i dưỡng cơ thể cực tốt, cho bạn c&oacute; năng lượng hoạt động suốt cả ng&agrave;y.</p>\r\n	</li>\r\n	<li>\r\n	<p>L&ecirc;n men tự nhi&ecirc;n chứa c&aacute;c lợi khuẩn tốt cho hệ ti&ecirc;u h&oacute;a v&agrave; miễn dịch.</p>\r\n	</li>\r\n	<li>\r\n	<p>Bổ sung canxi cho xương chắc khỏe.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/Products/Images//2944/87065/bhx/files/loc-6-chai-sua-chua-uong-fristi-80ml-202202161515125465.jpg\" /></p>\r\n\r\n<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩ</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Hướng dẫn sử dụng:</strong>&nbsp;Sản phẩm ph&ugrave; hợp d&ugrave;ng ngay sau khi mở nắp. Lắc đều trước khi sử dụng, ngon hơn khi uống lạnh, sản phẩm kh&ocirc;ng d&ugrave;ng cho trẻ em dưới 1 tuổi. N&ecirc;n sử dụng 3 chai mỗi ng&agrave;y để bổ sung năng lượng v&agrave; dưỡng chất mỗi ng&agrave;y.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>C&aacute;ch bảo quản:</strong>&nbsp;Bảo quản ở nơi kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp cũng như những nơi c&oacute; nhiệt độ cao.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.tgdd.vn/Products/Images//2944/87065/bhx/files/loc-6-chai-sua-chua-uong-cam-fristi-80ml-202005081547549872.JPG\" /></p>\r\n\r\n<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>\r\n\r\n<p>Sữa chua Fristi cam 80ml đang được kinh doanh ch&iacute;nh h&atilde;ng tại B&aacute;ch h&oacute;a XANH với gi&aacute; th&agrave;nh hợp l&yacute;, nhiều ưu đ&atilde;i cực hấp dẫn. Ngo&agrave;i ra, sản phẩm c&ograve;n được cam kết 100% nguồn gốc xuất xứ, mua online để được trải nghiệm dịch vụ giao h&agrave;ng nhanh ch&oacute;ng tận nơi, nhanh ch&oacute;ng.</p>\r\n\r\n<p><strong>Xem th&ecirc;m</strong>:&nbsp;<a href=\"https://www.bachhoaxanh.com/kinh-nghiem-hay/cac-loai-sua-chua-uong-ngon-chat-luong-duoc-ua-chuong-nhat-hien-nay-1224514\">C&aacute;c loại sữa chua uống ngon, chất lượng được ưa chuộng nhất hiện nay</a></p>\r\n', 50, 1, 2, 1, 1),
(24, 'Lốc 6 chai sữa chua uống hương nho Fristi 80ml', '../uploads/loc-6-chai-sua-chua-uong-nho-fristi-80ml-202202161501386821.jpg', '../uploads/loc-6-chai-sua-chua-uong-nho-fristi-80ml-202305161032231307.jpg', '../uploads/loc-6-chai-sua-chua-uong-nho-fristi-80ml-202305161032236679.jpg', 24500, 23000, 'Sản phẩm sữa chua uống của thương hiệu sữa chưa Fristi mang hương thơm sữa hoà với trái cây, tạo vị chua chua ngọt ngọt tự nhiên, bổ sung thêm vitamin nhóm B, vitamin A và D cho bé phát triển khoẻ mạnh, cao lớn hơn. Lốc 6 chai sữa chua uống nho Fristi 80ml hương nho hấp dẫn, kích thích vị giác.', 0, '<h2>Th&ocirc;ng tin sản phẩm</h2>\r\n\r\n<p>Sản phẩm&nbsp;<a href=\"https://www.bachhoaxanh.com/sua-chua\">sữa chua uống</a>&nbsp;của thương hiệu&nbsp;<a href=\"http://www.bachhoaxanh.com/sua-chua-fristi\">sữa chưa&nbsp;Fristi</a>&nbsp;mang hương thơm sữa ho&agrave; với tr&aacute;i c&acirc;y, tạo vị chua chua ngọt ngọt tự nhi&ecirc;n, bổ sung th&ecirc;m vitamin nh&oacute;m B, vitamin A v&agrave; D cho b&eacute; ph&aacute;t triển khoẻ mạnh, cao lớn hơn.&nbsp;<a href=\"http://www.bachhoaxanh.com/sua-chua/scu-fristi-nho-80ml-loc\">Lốc 6 chai sữa chua uống nho Fristi 80ml</a>&nbsp;hương nho hấp dẫn, k&iacute;ch th&iacute;ch vị gi&aacute;c.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Hương vị</td>\r\n			<td>\r\n			<p>Nho</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ph&ugrave; hợp</td>\r\n			<td>\r\n			<p>Trẻ em tr&ecirc;n 1 tuổi</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thể t&iacute;ch</td>\r\n			<td>\r\n			<p>80ml</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&agrave;nh phần</td>\r\n			<td>\r\n			<p>Nước, đường, bột sữa gầy, bột whey, chất b&eacute;o sữa...</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>\r\n			<p>Fristi (H&agrave; Lan)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất</td>\r\n			<td>\r\n			<p>Việt Nam</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>B&agrave;i viết sản phẩm</p>\r\n\r\n<p><strong>Th&agrave;nh phần dinh dưỡng:</strong></p>\r\n\r\n<p><img alt=\"Thành phần dinh dưỡng\" src=\"https://cdn.tgdd.vn/Products/Images/2944/84119/bhx/scu-fristi-nho-80ml-loc-6.jpg\" /></p>\r\n\r\n<p><strong>Hướng dẫn sử dụng:</strong></p>\r\n\r\n<ul>\r\n	<li>Lắc đều trước khi uống.</li>\r\n	<li>Ngon hơn khi uống lạnh.</li>\r\n	<li>Sử dụng cho 1 lần uống.</li>\r\n</ul>\r\n\r\n<p><strong>Bảo quản:&nbsp;</strong>để nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t,&nbsp;tr&aacute;nh &aacute;nh nắng trực tiếp.</p>\r\n', 50, 1, 2, 1, 1),
(25, 'Kem đặc Vinamilk Tài Lộc lon 380g', '../uploads/sua-dac-vinamilk-tai-loc-lon-380g-202202120956300247.jpg', '../uploads/sua-dac-vinamilk-tai-loc-lon-380g-202104220855029994.jpg', '../uploads/sua-dac-vinamilk-tai-loc-lon-380g-202104220855043132.jpg', 15800, 15000, 'Kem đặc của thương hiệu kem đặc Vinamilk với vị ngọt đậm đà, độ sánh mịn phù hợp với mọi nhu cầu sử dụng. Kem đặc mang lại vị ngon, ngọt, béo thơm ngon và hấp dẫn cực kỳ. Kem đặc Vinamilk Tài Lộc lon 380g tiện lợi, giá tốt, thơm ngon đi cùng năm tháng, phù hợp pha chế nhiều món ăn, thức uống.', 0, '<h2>Th&ocirc;ng tin sản phẩm</h2>\r\n\r\n<p><a href=\"https://www.bachhoaxanh.com/sua-dac\">Kem đặc</a>&nbsp;của thương hiệu&nbsp;<a href=\"http://www.bachhoaxanh.com/sua-dac-vinamilk\">kem đặc&nbsp;Vinamilk</a>&nbsp;với vị ngọt đậm đ&agrave;, độ s&aacute;nh mịn ph&ugrave; hợp với mọi nhu cầu sử dụng. Kem đặc mang lại vị ngon, ngọt, b&eacute;o thơm ngon v&agrave; hấp dẫn cực kỳ.&nbsp;<a href=\"https://www.bachhoaxanh.com/sua-dac/sua-dac-vinamilk-tai-loc-lon-380g\">Kem đặc Vinamilk T&agrave;i Lộc lon 380g</a>&nbsp;tiện lợi, gi&aacute; tốt, thơm ngon đi c&ugrave;ng năm th&aacute;ng, ph&ugrave; hợp pha chế nhiều m&oacute;n ăn, thức uống.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Loại sản phẩm</td>\r\n			<td>\r\n			<p>Sữa đặc</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>\r\n			<p>380g</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&agrave;nh phần</td>\r\n			<td>\r\n			<p>Đường (47,2%), nước, dầu thực vật, whey bột, bột sữa, laztoza,...</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Độ đạm</td>\r\n			<td>\r\n			<p>2,2g/100g</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Th&iacute;ch hợp</td>\r\n			<td>\r\n			<p>L&agrave;m sữa chua, b&aacute;nh flan..., pha c&agrave; ph&ecirc;, xay sinh tố</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>\r\n			<p>Vinamilk (Việt Nam)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Sản xuất</td>\r\n			<td>\r\n			<p>Việt Nam</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>B&agrave;i viết sản phẩm</p>\r\n\r\n<h3><strong>Đ&ocirc;i n&eacute;t về thương hiệu</strong></h3>\r\n\r\n<p><strong>Vinamilk</strong>&nbsp;l&agrave; thương hiệu chuy&ecirc;n sản xuất c&aacute;c sản phẩm về sữa, chăm s&oacute;c dinh dưỡng cho người d&ugrave;ng. Quen thuộc với người ti&ecirc;u d&ugrave;ng từ l&acirc;u, cũng như d&agrave;y dặn trong kinh nghiệm trong lĩnh vực sữa, c&aacute;c sản phẩm của Vinamilk lu&ocirc;n nhận được sự tin cậy của người ti&ecirc;u d&ugrave;ng. Sữa đặc Vinamilk mang đến cho bạn nguồn dưỡng chất tuyệt vời v&agrave; thơm ngon b&eacute;o ngậy.</p>\r\n\r\n<h3><strong>Th&agrave;nh phần dinh dưỡng trong sản phẩm</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Th&agrave;nh phần dinh dưỡng trong sữa đặc Vinamilk T&agrave;i Lộc bao gồm: 2.2g chất đạm, 10.8g chất b&eacute;o, 57g hydrate cacbon.</p>\r\n	</li>\r\n	<li>\r\n	<p>Trong 100g sữa đặc cung cấp cho cơ thể 334 calo</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong><img alt=\"Sữa đặc Vinamilk Tài Lộc lon 380g\" src=\"https://cdn.tgdd.vn/Products/Images//2526/237129/bhx/files/sua-dac-vinamilk-tai-loc-lon-380g-202104220855033736.jpg\" /></strong></p>\r\n\r\n<h3><strong>T&aacute;c dụng của sản phẩm với sức khỏe</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Cung cấp năng lượng v&agrave; dinh dưỡng đầy đủ cho cơ thể</p>\r\n	</li>\r\n	<li>\r\n	<p>Hỗ trợ cho người gầy c&oacute; thể tăng c&acirc;n hiệu quả</p>\r\n	</li>\r\n	<li>\r\n	<p>Cung cấp vitamin cho cơ thể, cải thiện giấc ngủ cho người d&ugrave;ng</p>\r\n	</li>\r\n	<li>\r\n	<p>Ph&ugrave; hợp với người đang mang thai.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><strong>Hướng dẫn sử dụng sản phẩm</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Đục lỗ hoặc d&ugrave;ng dụng cụ chuy&ecirc;n cắt nắp hộp để mở nắp hộp sữa</p>\r\n	</li>\r\n	<li>\r\n	<p>D&ugrave;ng trực tiếp hoặc d&ugrave;ng để pha chế c&aacute;c m&oacute;n ăn, thức uống kh&aacute;c</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3><strong>C&aacute;c m&oacute;n ngon với sản phẩm</strong></h3>\r\n\r\n<p>Bạn c&oacute; thể ăn b&aacute;nh m&igrave; chấm với sữa đặc rất ngon v&agrave; đầy đủ dinh dưỡng. Sữa đặc cũng được sử dụng nhiều để l&agrave;m b&aacute;nh, l&agrave;m sữa chua, hoặc l&agrave;m một gia vị th&ecirc;m cho m&oacute;n ăn ngọt nhẹ v&agrave; b&eacute;o hơn, hoặc th&ecirc;m v&agrave;o nước sốt, nước chấm rất ngon v&agrave; trọn vị.</p>\r\n\r\n<h3><strong>C&aacute;c thức uống ngon với sản phẩm</strong></h3>\r\n\r\n<p>Bạn c&oacute; thể l&agrave;m được nhiều m&oacute;n thức uống ngon với sữa đăc Vinamilk như c&aacute;c m&oacute;n sinh tố, pha chế c&aacute;c m&oacute;n nước, c&aacute;c m&oacute;n đ&aacute; xay,...</p>\r\n\r\n<h3><strong>Lưu &yacute; khi sử dụng v&agrave; c&aacute;ch bảo quản sản phẩm</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Bảo quản ở nơi kh&ocirc; r&aacute;o, tr&aacute;nh &aacute;nh nắng trực tiếp</p>\r\n	</li>\r\n	<li>\r\n	<p>C&oacute; thể để trong tủ lạnh, hoặc cho v&agrave;o 1 b&aacute;t nước để tr&aacute;nh kiến, c&ocirc;n tr&ugrave;ng x&acirc;m nhập v&agrave;o hộp sữa đ&atilde; khui</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong><img alt=\"\" src=\"https://cdn.tgdd.vn/Products/Images//3357/299075/bhx/files/sua-dac-vinamilk-tai-loc-lon-380g-202202120956300247.jpg\" /></strong></p>\r\n\r\n<h3><strong>Ưu điểm khi mua sản phẩm tại B&aacute;ch ho&aacute; XANH</strong></h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Tất cả c&aacute;c sản phẩm của B&aacute;ch h&oacute;a XANH đều được b&aacute;n với gi&aacute; tốt, h&agrave;ng ch&iacute;nh h&atilde;ng, nguồn gốc r&otilde; r&agrave;ng n&ecirc;n kh&aacute;ch h&agrave;ng ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m</p>\r\n	</li>\r\n	<li>\r\n	<p>C&oacute; thể đặt mua online ngay tr&ecirc;n app hoặc web&nbsp;<a href=\"https://www.bachhoaxanh.com/\">bachhoaxanh.com</a>&nbsp;để được giao h&agrave;ng tận nơi trong ng&agrave;y.</p>\r\n	</li>\r\n</ul>\r\n', 50, 1, 12, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productstatus`
--

CREATE TABLE `productstatus` (
  `id_productStatus` int(11) NOT NULL,
  `type_productName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `productstatus`
--

INSERT INTO `productstatus` (`id_productStatus`, `type_productName`) VALUES
(1, 'Mới Về'),
(2, 'Đang Giảm Giá'),
(12, 'Yêu Thích');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizeproduct`
--

CREATE TABLE `sizeproduct` (
  `id_sizeProduct` int(11) NOT NULL,
  `name_sizeProduct` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sizeproduct`
--

INSERT INTO `sizeproduct` (`id_sizeProduct`, `name_sizeProduct`) VALUES
(1, 'Mới'),
(4, 'Cũ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id_slider` int(11) NOT NULL,
  `image_slider` varchar(255) DEFAULT NULL,
  `name_slider` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id_slider`, `image_slider`, `name_slider`) VALUES
(1, '../uploads/3ad2dc320f154e3afdf0ee9d5a799d59.jpg', 'Banner 1'),
(5, '../uploads/sua-non-optalife.jpg', 'Banner 2'),
(7, '../uploads/nutifood-20210910171817.png', 'Banner 3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `type_user` varchar(10) DEFAULT 'member',
  `tichdiem` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `pass`, `address`, `phone`, `avatar`, `type_user`, `tichdiem`) VALUES
(4, 'son', 'sonbgt36@gmail.com', '123456', 'dfdfsf', '424242', '../uploads/nhansu1.jpg', 'member', 32323),
(5, 'Sơnbg', 'sonbgt361@gmail.com', '123456', 'Bắc giang', '0348521001', '../uploads/loc-6-chai-sua-chua-uong-nho-fristi-80ml-202305161032236679.jpg', 'admin', 48485),
(6, 'Sơnbg', 'sonbgt361@gmail.com', '123456', 'Bắc giang', '0348521001', '../uploads/loc-6-chai-sua-chua-uong-nho-fristi-80ml-202305161032236679.jpg', 'personnel', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`);

--
-- Chỉ mục cho bảng `chitiet_hd`
--
ALTER TABLE `chitiet_hd`
  ADD PRIMARY KEY (`MaHD`,`id_product`);

--
-- Chỉ mục cho bảng `colorproduct`
--
ALTER TABLE `colorproduct`
  ADD PRIMARY KEY (`id_colorProduct`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `FK_comments_idProduct` (`id_product`);

--
-- Chỉ mục cho bảng `giamgia`
--
ALTER TABLE `giamgia`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHD`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `FK_products_idProductStatus` (`id_productStatus`),
  ADD KEY `FK_products_id_brand` (`id_brand`),
  ADD KEY `FK_products_id_sizeProduct` (`id_sizeProduct`),
  ADD KEY `FK_products_id_colorProduct` (`id_colorProduct`);

--
-- Chỉ mục cho bảng `productstatus`
--
ALTER TABLE `productstatus`
  ADD PRIMARY KEY (`id_productStatus`);

--
-- Chỉ mục cho bảng `sizeproduct`
--
ALTER TABLE `sizeproduct`
  ADD PRIMARY KEY (`id_sizeProduct`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id_slider`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `colorproduct`
--
ALTER TABLE `colorproduct`
  MODIFY `id_colorProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `giamgia`
--
ALTER TABLE `giamgia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MaHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `productstatus`
--
ALTER TABLE `productstatus`
  MODIFY `id_productStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `sizeproduct`
--
ALTER TABLE `sizeproduct`
  MODIFY `id_sizeProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_comments_idProduct` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products_idProductStatus` FOREIGN KEY (`id_productStatus`) REFERENCES `productstatus` (`id_productStatus`),
  ADD CONSTRAINT `FK_products_id_brand` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_brand`),
  ADD CONSTRAINT `FK_products_id_colorProduct` FOREIGN KEY (`id_colorProduct`) REFERENCES `colorproduct` (`id_colorProduct`),
  ADD CONSTRAINT `FK_products_id_sizeProduct` FOREIGN KEY (`id_sizeProduct`) REFERENCES `sizeproduct` (`id_sizeProduct`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
