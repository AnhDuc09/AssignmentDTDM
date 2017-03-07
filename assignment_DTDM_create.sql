Create database ASSIGNMENT
USE ASSIGNMENT
-- tables
-- Table: SanPham
CREATE TABLE SanPham (
    MaSp char(10)  NOT NULL,
    MaNhaSX nvarchar(150)  NOT NULL,
    MaLoaiSp char(10)  NOT NULL,
    TenSp nvarchar(150)  NOT NULL,
    GiaSp money  NOT NULL,
    MotaSp nvarchar(200)  NOT NULL,
    XuatXuSp nvarchar(150)  NOT NULL,
    CONSTRAINT SanPham_pk PRIMARY KEY  (MaSp)
);
-- Table: ChiTietHoaDon
CREATE TABLE ChiTietHoaDon (
    MaHD char(10)  NOT NULL,
    MaSp char(10)  NOT NULL,
    SoLuong char(10)  NOT NULL,
    ThanhTien money  NOT NULL,
    MucGiamGia money  NOT NULL,
    CONSTRAINT ChiTietHoaDon_pk PRIMARY KEY  (MaHD,MaSp)
);

-- Table: HoaDon
CREATE TABLE HoaDon (
    MaHD char(10)  NOT NULL,
    CustomerID char(10)  NOT NULL,
    NgayDatHang datetime  NOT NULL,
    MaSoThue char(20)  NOT NULL,
    NgayGiaoHang datetime  NOT NULL,
    NoiGiaoHang nvarchar(150)  NOT NULL,
    CONSTRAINT HoaDon_pk PRIMARY KEY  (MaHD)
);

-- Table: KhachHang
CREATE TABLE KhachHang (
    CustomerID char(10)  NOT NULL,
    Ten nvarchar(150)  NOT NULL,
    DienThoai char(11)  NOT NULL,
    DiaChi nvarchar(150)  NOT NULL,
    NgaySinh datetime  NOT NULL,
    CONSTRAINT KhachHang_pk PRIMARY KEY  (CustomerID)
);

-- Table: LoaiSanPham
CREATE TABLE LoaiSanPham (
    MaLoaiSp char(10)  NOT NULL,
    TenLoaiSp nvarchar(150)  NOT NULL,
    MotaLoaiSp nvarchar(200)  NOT NULL,
    CONSTRAINT LoaiSanPham_pk PRIMARY KEY  (MaLoaiSp)
);



-- foreign keys
-- Reference: ChiTietHoaDon_HoaDon (table: ChiTietHoaDon)
ALTER TABLE ChiTietHoaDon ADD CONSTRAINT ChiTietHoaDon_HoaDon
    FOREIGN KEY (MaHD)
    REFERENCES HoaDon (MaHD);

-- Reference: ChiTietHoaDon_SanPham (table: ChiTietHoaDon)
ALTER TABLE ChiTietHoaDon ADD CONSTRAINT ChiTietHoaDon_SanPham
    FOREIGN KEY (MaSp)
    REFERENCES SanPham (MaSp);

-- Reference: HoaDon_KhachHang (table: HoaDon)
ALTER TABLE HoaDon ADD CONSTRAINT HoaDon_KhachHang
    FOREIGN KEY (CustomerID)
    REFERENCES KhachHang (CustomerID);

-- Reference: SanPham_LoaiSanPham (table: SanPham)
ALTER TABLE SanPham ADD CONSTRAINT SanPham_LoaiSanPham
    FOREIGN KEY (MaLoaiSp)
    REFERENCES LoaiSanPham (MaLoaiSp);

	
	
	
--them du lieu khach hang
INSERT INTO KhachHang VALUES('KH01',N'Đặng Hoàng Hải Đăng','01688011006',N'416 Trần Hưng Đạo',05/11/1992);
INSERT INTO KhachHang VALUES('KH02',N'Dương Thị Thùy Linh','01645127126',N'416 Trần Hưng Đạo',01/10/1994);
INSERT INTO KhachHang VALUES('KH03',N'Lê Hùng Hưng','0983365444',N'1009 Phan Đình Phùng',06/09/1992);
INSERT INTO KhachHang VALUES('KH04',N'Nguyễn Hữu Thọ','01688011007',N'K07/29 Phan Văn Định',07/12/1994);
INSERT INTO KhachHang VALUES('KH05',N'Nguyễn Thành Tâm','01688011008',N'145 Nguyễn Thị Thập',17/07/1996);

SELECT * FROM KhachHang

--them du lieu HoaDon
INSERT INTO HoaDon VALUES('HD01','KH01',15/07/2016,'AD123',29/07/2016,N'Đà Nẵng');
INSERT INTO HoaDon VALUES('HD02','KH02',19/07/2016,'AB789',30/07/2016,N'Hà Nội');
INSERT INTO HoaDon VALUES('HD03','KH03',18/07/2016,'AC456',28/07/2016,N'Kon Tum');
INSERT INTO HoaDon VALUES('HD04','KH04',19/07/2016,'DC852',30/07/2016,N'Đà Nẵng');
INSERT INTO HoaDon VALUES('HD05','KH05',21/07/2016,'CA951',29/07/2016,N'TP Hồ Chí Minh');

SELECT * FROM HoaDon

--them du lieu SanPham
INSERT INTO SanPham VALUES('SP01',N'Nike','LSP01',N'Giày Nike','1000000',N'Chất lượng cao',N'USA');
INSERT INTO SanPham VALUES('SP02',N'Adidas','LSP02',N'Găng tay Adidas','500000',N'Mẫu mã mới,Chất lượng cao',N'Việt Nam');
INSERT INTO SanPham VALUES('SP03',N'Nike','LSP03',N'Áo Khoác Nike','1000000',N'Chất lượng cao, bền đẹp',N'USA');
INSERT INTO SanPham VALUES('SP04',N'Puma','LSP04',N'Mũ Puma','100000',N'Mẫu mã đẹp',N'Thái Lan');
INSERT INTO SanPham VALUES('SP05',N'Reebok','LSP05',N'Quần Reebok','1000000',N'Chất lượng cao',N'England');	

SELECT * FROM SanPham

--them du lieu ChiTietHoaDon
INSERT INTO ChiTietHoaDon VALUES('HD01','SP01','100','100000000','01');
INSERT INTO ChiTietHoaDon VALUES('HD02','SP02','10','5000000','05');
INSERT INTO ChiTietHoaDon VALUES('HD03','SP03','15','15000000','0');
INSERT INTO ChiTietHoaDon VALUES('HD04','SP04','20','2000000','10');
INSERT INTO ChiTietHoaDon VALUES('HD05','SP05','35','35000000','0');	

SELECT * FROM ChiTietHoaDon



--them du lieu LoaiSanPham
INSERT INTO LoaiSanPham VALUES('LSP01',N'Giày',N'Thần thoại Hy Lạp vị thần Nike là biểu tượng cho chiến thắng');
INSERT INTO LoaiSanPham VALUES('LSP02',N'Găng tay',N'Thiết kế cơ bản Adidas có 3 sọc ngang kèm với dòng chữ công ty');
INSERT INTO LoaiSanPham VALUES('LSP03',N'Áo Khoác',N'Thần thoại Hy Lạp vị thần Nike là biểu tượng cho chiến thắng');
INSERT INTO LoaiSanPham VALUES('LSP04',N'Mũ',N'Hãng thời trang nổi tiếng');
INSERT INTO LoaiSanPham VALUES('LSP05',N'Quần',N'chất lượng quốc tế , giá ưu đãi');

SELECT * FROM LoaiSanPham


	
-- End of file.

