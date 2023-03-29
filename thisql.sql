create database hqtthituyensinh
use hqtthituyensinh

CREATE TABLE hoc_sinh (
    ma_hoc_sinh INT PRIMARY KEY,
    ho_ten VARCHAR(255),
    ngay_sinh DATE,
    gioi_tinh VARCHAR(10),
    dia_chi VARCHAR(255),
    sdt VARCHAR(20)
);
CREATE TABLE ky_thi (
    ma_ky_thi INT PRIMARY KEY,
    ten_ky_thi VARCHAR(255),
    ngay_bat_dau DATE,
    ngay_ket_thuc DATE
);
CREATE TABLE truong (
    ma_truong INT PRIMARY KEY,
    ten_truong VARCHAR(255),
    dia_chi VARCHAR(255),
    sdt VARCHAR(20),
    email VARCHAR(255)
);
CREATE TABLE diem_thi (
    ma_diem_thi INT PRIMARY KEY,
    ma_hoc_sinh INT,
    ma_ky_thi INT,
    diem_toan FLOAT,
    diem_van FLOAT,
    diem_ngoai_ngu FLOAT,
    FOREIGN KEY (ma_hoc_sinh) REFERENCES hoc_sinh(ma_hoc_sinh),
    FOREIGN KEY (ma_ky_thi) REFERENCES ky_thi(ma_ky_thi)
);
CREATE TABLE khoi (
    ma_khoi INT PRIMARY KEY,
    ten_khoi VARCHAR(255)
);
CREATE TABLE nguyen_vong (
    ma_nguyen_vong INT PRIMARY KEY,
    ten_nguyen_vong VARCHAR(255)
);
CREATE TABLE dang_ki_thi (
    ma_dang_ki INT PRIMARY KEY,
    ma_hoc_sinh INT,
    ma_ky_thi INT,
    ma_truong INT,
    ma_khoi INT,
    ma_nguyen_vong INT,
    FOREIGN KEY (ma_hoc_sinh) REFERENCES hoc_sinh(ma_hoc_sinh),
    FOREIGN KEY (ma_ky_thi) REFERENCES ky_thi(ma_ky_thi),
    FOREIGN KEY (ma_truong) REFERENCES truong(ma_truong),
    FOREIGN KEY (ma_khoi) REFERENCES khoi(ma_khoi),
    FOREIGN KEY (ma_nguyen_vong) REFERENCES nguyen_vong(ma_nguyen_vong)
);

CREATE TABLE ket_qua_tuyen_sinh (
    ma_ket_qua INT PRIMARY KEY,
	ma_diem_thi INT,
    ma_hoc_sinh INT,
    ma_truong INT,
    ma_khoi INT,
    ma_nguyen_vong INT,
    diem_trung_binh FLOAT,
    ket_qua_tuyen_sinh VARCHAR(255),
    FOREIGN KEY (ma_hoc_sinh) REFERENCES hoc_sinh(ma_hoc_sinh),
    FOREIGN KEY (ma_truong) REFERENCES truong(ma_truong),
    FOREIGN KEY (ma_khoi) REFERENCES khoi(ma_khoi),
    FOREIGN KEY (ma_nguyen_vong) REFERENCES nguyen_vong(ma_nguyen_vong),
	FOREIGN KEY (ma_diem_thi) REFERENCES diem_thi(ma_diem_thi)
);
INSERT INTO hoc_sinh (ma_hoc_sinh, ho_ten, ngay_sinh, gioi_tinh, dia_chi, sdt) VALUES
(1, 'Nguyen Van A', '2008-05-01', 'Nam', 'Ha Noi', '0987654321'),
(2, 'Tran Thi B', '2008-07-02', 'Nu', 'Hai Phong', '0912345678'),
(3, 'Le Van C', '2008-10-03', 'Nam', 'Da Nang', '0909123456'),
(4, 'Pham Thi D', '2008-11-04', 'Nu', 'Ho Chi Minh', '0978123456'),
(5, 'Vu Van E', '2008-12-05', 'Nam', 'Hue', '0918123456');

INSERT INTO ky_thi (ma_ky_thi, ten_ky_thi, ngay_bat_dau, ngay_ket_thuc) VALUES
(1, 'Ky thi tuyen sinh lop 10', '2023-07-01', '2023-07-02'),
(2, 'Ky thi tuyen sinh lop 10 (phu)', '2023-07-03', '2023-07-04');

INSERT INTO truong (ma_truong, ten_truong, dia_chi, sdt, email) VALUES
(1, 'Truong THPT A', 'Ha Noi', '02412345678', 'truonga@abc.edu.vn'),
(2, 'Truong THPT chuyen B', 'Hai Phong', '02253456789', 'truongb@abc.edu.vn'),
(3, 'Truong THPT chuyen C', 'Da Nang', '02363546789', 'truongc@abc.edu.vn'),
(4, 'Truong THPT quoc te D', 'Ho Chi Minh', '02843546789', 'truongd@abc.edu.vn'),
(5, 'Truong THPT E', 'Hue', '02343856789', 'truonge@abc.edu.vn');

INSERT INTO diem_thi (ma_diem_thi, ma_hoc_sinh, ma_ky_thi, diem_toan, diem_van, diem_ngoai_ngu) VALUES
(1, 1, 1, 8.5, 9.0, 7.5),
(2, 2, 1, 9.0, 8.5, 8.0),
(3, 3, 1, 9.5, 9.0, 7.0),
(4, 4, 1, 8.0, 8.5, 7.5),
(5, 5, 1, 7.5, 8.0, 8.5);

INSERT INTO khoi (ma_khoi, ten_khoi) VALUES
(1, 'Khoi A'),
(2, 'Khoi B'),
(3, 'Khoi C');

INSERT INTO nguyen_vong (ma_nguyen_vong,ten_nguyen_vong) VALUES
(1,'NV1'),
(2,'NV2'),
(3,'NV3');
INSERT INTO dang_ki_thi (ma_dang_ki, ma_hoc_sinh, ma_ky_thi, ma_truong, ma_khoi, ma_nguyen_vong) 
VALUES 
(101, 1, 1, 1, 1, 1), 
(102, 2, 1, 2, 1, 1), 
(103, 3, 2, 3, 2, 2), 
(104, 4, 2, 4, 2, 3), 
(105, 5, 1, 5, 3, 1);
INSERT INTO ket_qua_tuyen_sinh (ma_ket_qua,ma_diem_thi, ma_hoc_sinh, ma_truong, ma_khoi, ma_nguyen_vong, diem_trung_binh, ket_qua_tuyen_sinh) 
VALUES 
(1, 1 , 1, 1, 1, 1, 38.5, 'Đạt'),
(2, 2 , 2, 2, 1, 1, 27.8, 'Không đạt'),
(3, 3 , 3, 3, 2, 2, 29.2, 'Đạt'),
(4, 4 , 4 ,4, 2, 3, 18.6, 'Không Đạt'),
(5, 5 , 5, 5, 3, 1, 39.0, 'Đạt');

--------------------------------------------------------------------------
--- nhap sdt ra tên hoc sinh
create FUNCTION XEM_TENHS(@MHS VARCHAR(20))
RETURNS NVARCHAR(50)
AS
	BEGIN
		DECLARE @HT NVARCHAR(50)
		SET @HT=(SELECT ho_ten FROM hoc_sinh WHERE sdt LIKE '%'+@MHS+'%')
		RETURN @HT
END
--VD :
PRINT dbo.XEM_TENHS(0987654321)
--- nhap maHS ra nguyen vong
CREATE FUNCTION XEM_NVHS(@MHS NVARCHAR(10))
RETURNS NVARCHAR(50)
AS
	BEGIN
		DECLARE @MT NVARCHAR(50)
		SET @MT=(SELECT ma_nguyen_vong FROM dang_ki_thi WHERE ma_hoc_sinh LIKE '%'+@MHS+'%')
		RETURN @MT
END
--VD :
PRINT dbo.XEM_NVHS(4)

--------------------------
create trigger tg_hocsinh
	on hoc_sinh
	after insert
as begin
	--lấy thông tin từ insert
	declare @ma_hoc_sinh INT
	declare @ho_ten VARCHAR(255) 
	declare @ngay_sinh DATE
	declare @gioi_tinh VARCHAR(10)
	declare @dia_chi VARCHAR(255)
	declare @sdt VARCHAR(20)
	select @ma_hoc_sinh = ma_hoc_sinh, @ho_ten = ho_ten, @ngay_sinh = ngay_sinh, @gioi_tinh = gioi_tinh, @dia_chi = dia_chi, @sdt = sdt
	from inserted
	--cập nhật 
	update ket_qua_tuyen_sinh
	set [ma_hoc_sinh] = ma_hoc_sinh
	where ma_hoc_sinh = @ma_hoc_sinh
end
---ktra
select * from hoc_sinh
select * from ket_qua_tuyen_sinh

INSERT INTO hoc_sinh (ma_hoc_sinh, ho_ten, ngay_sinh, gioi_tinh, dia_chi, sdt) VALUES
(6, N'Tạ Quang Thắng', '2002-01-01', 'Nam', N'Lâm Đồng', '0394008743');
INSERT INTO diem_thi (ma_diem_thi, ma_hoc_sinh, ma_ky_thi, diem_toan, diem_van, diem_ngoai_ngu) VALUES

--trigger 
create trigger tg_hoc_sinh on hoc_sinh for insert 
as if (select ngay_sinh from inserted) < (select GETDATE())
begin
print N'Ngày sinh phải trước ngày hôm nay'
rollback transaction
end
--xóa
delete from hoc_sinh where ma_hoc_sinh=7
--thêm
INSERT INTO hoc_sinh (ma_hoc_sinh, ho_ten, ngay_sinh, gioi_tinh, dia_chi, sdt) VALUES
(7, N'Tạ Quang Thắng', '2002-4-01', 'Nam', N'Lâm Đồng', '0394008743');


---------------------proc lấy thông tin danh sách học sinh đã đăng ký thi tuyển sinh theo một nguyện vọng cụ thể
CREATE PROCEDURE get_dang_ky_thi_by_nguyen_vong
    @ma_nguyen_vong INT
AS
BEGIN
    SELECT *
    FROM dang_ki_thi
    WHERE ma_nguyen_vong = @ma_nguyen_vong;
END
EXECUTE get_dang_ky_thi_by_nguyen_vong @ma_nguyen_vong = 1;

------------------lấy danh sách học sinh đăng ký thi tại một trường
CREATE PROCEDURE GetDangKiThiByTruong
    @ma_truong INT
AS
BEGIN
    SELECT 
        dk.ma_dang_ki, 
        hs.ho_ten, 
        hs.ngay_sinh, 
        hs.gioi_tinh, 
        dk.ma_ky_thi, 
        kt.ten_ky_thi, 
        dk.ma_truong, 
        tr.ten_truong, 
        dk.ma_khoi, 
        kh.ten_khoi, 
        dk.ma_nguyen_vong
    FROM dang_ki_thi dk
    INNER JOIN hoc_sinh hs ON dk.ma_hoc_sinh = hs.ma_hoc_sinh
    INNER JOIN ky_thi kt ON dk.ma_ky_thi = kt.ma_ky_thi
    INNER JOIN truong tr ON dk.ma_truong = tr.ma_truong
    INNER JOIN khoi kh ON dk.ma_khoi = kh.ma_khoi
    WHERE dk.ma_truong = @ma_truong
END

EXECUTE GetDangKiThiByTruong @ma_truong=2;
---lenh UPDATE
update ket_qua_tuyen_sinh set diem_trung_binh = 27 where ma_hoc_sinh = 2
update hoc_sinh set ho_ten = N'Đinh Xuân Trường' where ho_ten = N'Tạ Quang Thắng'
update diem_thi set diem_toan = 9, diem_van = 10, diem_ngoai_ngu = 8 where ma_diem_thi = 3