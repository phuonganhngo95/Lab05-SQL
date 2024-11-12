use master
go

use Lab04
go

-- Bài 1
-- 1.
select CONCAT(HoSV, ' ', TenSV) as HoTen, MaKH, NoiSinh, NgaySinh
from SinhVien
where HocBong > 100000 and NoiSinh = N'Tp. HCM'
go

-- 2.
select MaSV, MaKH,
iif(Phai=1, N'Nữ', N'Nam') as GioiTinh
from SinhVien
where MaKH in(N'Anh Văn', N'Triết')
go

-- 3.
select MaSV, NgaySinh, NoiSinh, HocBong 
from SinhVien
where NgaySinh between '1986/01/01' and '1992/06/05'
go

-- 4.
select MaSV, NgaySinh,
iif(Phai=1, N'Nữ', N'Nam') as GioiTinh, MaKH
from SinhVien
where HocBong between 200000 and 800000
go

-- 5.
select MaMH, TenMH, SoTiet from MonHoc
where Sotiet > 40 and Sotiet < 60
go

-- 6.
select MaSV, CONCAT(HoSV, ' ', TenSV) as HoTen,
iif(Phai=1, N'Nữ', N'Nam') as GioiTinh
from SinhVien
where Phai=0 and MaKH like '%AV%'
go

-- 7.
select HoSV, TenSV, NoiSinh, NgaySinh from SinhVien
where NoiSinh = N'Hà Nội' and NgaySinh > '1990/01/01'
go

-- 8.
select * from SinhVien
where Phai=1 and TenSV like '%N%'
go

-- 9.
select * from SinhVien
where Phai=0 and MaKH like '%TH%' and NgaySinh > '1986/05/30'
go

-- 10.
select CONCAT(HoSV, ' ', TenSV) as HoTen,
iif(Phai=1, N'True', N'False') as GioiTinh, NgaySinh
from SinhVien
go

-- 11.
select MaSV, YEAR(GETDATE()) - YEAR(NgaySinh) as Tuoi, NoiSinh, MaKH
from SinhVien
go

-- 12.
select CONCAT(HoSV, ' ', TenSV) as HoTen, 
YEAR(GETDATE()) - YEAR(NgaySinh) as Tuoi, TenKH from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
where YEAR(GETDATE()) - YEAR(NgaySinh) between 20 and 30
go