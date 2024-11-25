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

-- 13.
select MaSV,
iif(Phai=1, N'Nữ', N'Nam') as GioiTinh, MaKH,
iif(HocBong>500000, N'Học bổng cao', N'Mức trung bình')
from SinhVien
go

-- 14.
select CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen,
iif(SV.Phai=1, N'Nữ', N'Nam') as GioiTinh, KH.TenKH
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
where KH.MaKH like '%AV%'
go

-- 15.
select KH.TenKH, CONCAT(SV.HoSV, ' ', Sv.TenSV) as HoTen, MH.TenMH, MH.Sotiet, KQ.Diem
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
inner join MonHoc MH on KQ.MaMH = MH.MaMH
where KH.MaKH like '%TH%'
go

-- 16.
select CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, KH.MaKH, MH.TenMH, KQ.Diem,
iif(KQ.Diem>8, N'Giỏi', iif(KQ.Diem<6, N'Trung bình', N'Khá')) as Loai
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
inner join MonHoc MH on KQ.MaMH = MH.MaMH
go

-- 17.
select KH.MaKH, KH.TenKH, MAX(SV.HocBong) as MaxHB
from Khoa KH
inner join SinhVien SV on KH.MaKH = SV.MaKH
group by KH.MaKH, KH.TenKH
go

-- 18.
select MH.MaMH, MH.TenMH, COUNT(SV.MaSV) as SoSV
from SinhVien SV
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
inner join MonHoc MH on KQ.MaMH = MH.MaMH
group by MH.MaMH, MH.TenMH
go

-- 19.
select top 1 with ties MH.TenMH, MH.Sotiet, SV.TenSV, KQ.Diem
from Ketqua KQ
inner join SinhVien SV on KQ.MaSV = SV.MaSV
inner join MonHoc MH on KQ.MaMH = MH.MaMH
order by KQ.Diem DESC
go

-- 20.
select top 1 KH.MaKH, KH.TenKH, COUNT(SV.MaSV) as TongSV
from Khoa KH
inner join SinhVien SV on KH.MaKH = SV.MaKH
group by KH.MaKH, KH.TenKH
order by TongSV DESC
go

-- 21.
select top 1 KH.TenKH, CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, SV.HocBong
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
order by SV.HocBong DESC
go

-- 22.
select top 1 SV.MaSV, SV.HoSV, SV.TenSV, KH.TenKH, SV.HocBong
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
where KH.MaKH like '%TH%'
order by SV.HocBong DESC
go

-- 23.
select top 1 with ties SV.HoSV, MH.TenMH, KQ.Diem
from Ketqua KQ
inner join SinhVien SV on KQ.MaSV = SV.MaSV
inner join MonHoc MH on SV.MaSV = MH.MaMH
where MH.TenMH = N'Cơ sở dữ liệu'
order by KQ.Diem DESC
go

-- 24.
select top 3 CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, KH.TenKH, MH.TenMH, MIN(KQ.Diem) as MinScore
from Ketqua KQ
inner join SinhVien SV on KQ.MaSV = SV.MaSV
inner join MonHoc MH on KQ.MaMH = MH.MaMH
inner join Khoa KH on SV.MaKH = KH.MaKH
group by CONCAT(SV.HoSV, ' ', SV.TenSV), KH.TenKH, MH.TenMH
order by MinScore ASC
go

-- 25.
select top 1 with ties KH.MaKH, KH.TenKH, COUNT(*) as Nu
from SinhVien SV
inner join Khoa KH ON SV.MaKH = KH.MaKH
where SV.Phai = 1
group by KH.MaKH, KH.TenKH
order by Nu DESC
go

-- 26.
select KH.MaKH, KH.TenKH, COUNT(SV.MaSV) as TongSV, 
COUNT(
	case
		when SV.Phai = 1 then 1 end
) as TongNu
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
group by KH.MaKH, KH.TenKH
go

-- 27.
select CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, KH.TenKH,
iif(KQ.Diem>=4, N'Đậu', N'Trượt')
from Ketqua KQ
inner join SinhVien SV on KQ.MaSV = SV.MaSV
inner join Khoa KH on SV.MaKH = KH.MaKH
go

-- 28.
select CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, KH.TenKH, COUNT(MaMH) as MonHoc,
iif(SV.Phai=1, N'Nữ', N'Nam') as GioiTinh
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
where KQ.Diem < 4
group by CONCAT(SV.HoSV, ' ', SV.TenSV), KH.TenKH, iif(SV.Phai=1, N'Nữ', N'Nam')
go

-- 29.
select MH.MaMH, MH.TenMH
from MonHoc MH
inner join Ketqua KQ on MH.MaMH = KQ.MaMH
group by MH.MaMH, MH.TenMH
having MIN(KQ.Diem) >= 4;
go

-- 30.
select KH.MaKH, KH.TenKH
from Khoa KH
inner join SinhVien SV on KH.MaKH = SV.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
where KQ.Diem < 5
group by KH.MaKH, KH.TenKH
go

-- 31.
SELECT 
    mh.MaMon, 
    mh.TenMon, 
    SUM(CASE WHEN d.DiemSo >= 5 THEN 1 ELSE 0 END) AS SoSinhVienDau,
    SUM(CASE WHEN d.DiemSo < 5 THEN 1 ELSE 0 END) AS SoSinhVienRot
FROM 
    MonHoc mh
INNER JOIN Diem d ON mh.MaMon = d.MaMon
GROUP BY mh.MaMon, mh.TenMon
go

-- 32.
SELECT 
    mh.MaMon, 
    mh.TenMon
FROM 
    MonHoc mh
LEFT JOIN Diem d ON mh.MaMon = d.MaMon
GROUP BY mh.MaMon, mh.TenMon
HAVING SUM(CASE WHEN d.DiemSo < 5 THEN 1 ELSE 0 END) = 0
go

-- 33.
SELECT 
    sv.MaSinhVien, 
    sv.HoTen, 
    k.MaKhoa
FROM 
    SinhVien sv
LEFT JOIN Diem d ON sv.MaSinhVien = d.MaSinhVien
INNER JOIN Khoa k ON sv.MaKhoa = k.MaKhoa
GROUP BY sv.MaSinhVien, sv.HoTen, k.MaKhoa
HAVING COUNT(CASE WHEN d.DiemSo < 5 THEN 1 ELSE 0 END) = 0
go

-- 34.
SELECT 
    sv.MaSinhVien, 
    sv.HoTen, 
    k.MaKhoa
FROM 
    SinhVien sv
INNER JOIN Diem d ON sv.MaSinhVien = d.MaSinhVien
INNER JOIN Khoa k ON sv.MaKhoa = k.MaKhoa
GROUP BY sv.MaSinhVien, sv.HoTen, k.MaKhoa
HAVING COUNT(CASE WHEN d.DiemSo < 5 THEN 1 ELSE 0 END) > 2
go

-- 35.
SELECT 
    k.MaKhoa, 
    k.TenKhoa, 
    COUNT(sv.MaSinhVien) AS TongSoSinhVien
FROM 
    Khoa k
INNER JOIN SinhVien sv ON k.MaKhoa = sv.MaKhoa
GROUP BY k.MaKhoa, k.TenKhoa
HAVING COUNT(sv.MaSinhVien) > 10
go

-- 36.
SELECT 
    sv.MaSinhVien, 
    sv.HoTen
FROM 
    SinhVien sv
INNER JOIN Diem d ON sv.MaSinhVien = d.MaSinhVien
GROUP BY sv.MaSinhVien, sv.HoTen
HAVING COUNT(DISTINCT d.MaMon) > 4
go

-- 37.
SELECT 
    k.MaKhoa, 
    k.TenKhoa, 
    COUNT(CASE WHEN sv.GioiTinh = 'Nam' THEN 1 END) AS TongSoSinhVienNam
FROM 
    Khoa k
INNER JOIN SinhVien sv ON k.MaKhoa = sv.MaKhoa
GROUP BY k.MaKhoa, k.TenKhoa
HAVING COUNT(CASE WHEN sv.GioiTinh = 'Nam' THEN 1 END) >= 5
go

-- 38.
SELECT 
    sv.HoTen, 
    mh.TenMon, 
    AVG(d.DiemSo) AS DiemTrungBinh
FROM 
    SinhVien sv
INNER JOIN Diem d ON sv.MaSinhVien = d.MaSinhVien
INNER JOIN MonHoc mh ON d.MaMon = mh.MaMon
GROUP BY sv.HoTen, mh.TenMon
HAVING AVG(d.DiemSo) > 4
go

-- 39.
SELECT 
    mh.MaMon, 
    mh.TenMon, 
    AVG(d.DiemSo) AS DiemTrungBinh
FROM 
    MonHoc mh
INNER JOIN Diem d ON mh.MaMon = d.MaMon
GROUP BY mh.MaMon, mh.TenMon
HAVING AVG(d.DiemSo) > 6
go
