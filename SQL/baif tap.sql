create database CUS_PROPERTY
use CUS_PROPERTY

--1
Create table Customer
(
	CNo varchar (10) NOT NULL primary key,
	CName varchar (50) NOT NULL ,
	Tel Varchar (12) NULL,
	CAdress Varchar (150) NULL
)

--2
Create table Owners
(
	OwnerNo Varchar (10) NOT NULL Primary key,
	OName Varchar (50) NOT NULL,
	OTel Varchar (12) NULL,
	OAddress varchar (150) NULL
)
--3
Create table Property
(
	Property_No varchar (10) NOT NULL Primary key,
	Paddress varchar (150) NOT NULL,
	RentPrice int NOT NULL,
	OwerNo varchar (10) NOT NULL,
)
--4
Create table Rental
(
	CNo varchar (10) NOT NULL foreign key references Customer (CNo),
	Property_No varchar (10) NOT NULL foreign key references Property (Property_No),
	RentStart datetime NOT NULL Primary key,
	RentFinish datetime NUll
)
 


insert into Customer values('K001','Bui Anh Tuan','01228168868','02 Tran Hung Dao street, 3 Dist, HCM City')
insert into Customer values('K002','Tieu Chau Nhu Quynh','0989123999','138 Nguyen Hue street, 1 Dist, HCM City')
insert into Customer values('K003','Le Pham Xuan Nghi','0903288988','33 Huynh Thuc Khang street, Ninh Kieu Dist, CanTho City')
insert into Customer values('K004','Phan Ngoc Luan','0918776677','89 Hoang Hoa Tham street, CaMau City')
insert into Customer values('K005','Nguyen Huong Tram','01228979678','10 Ly Thuong Kiet street, DaNang City')

select * from Customer

insert into Owners values('W001','Nguyen Thu Minh','0909123555','15 Ly Tu Trong street, NinhKieu Dist, CanTho City')
insert into Owners values('W002','Tran Lap','0939555999','99 Vo Van Kiet street, 5 Dist, HCM City')
insert into Owners values('W003','Ho Ngoc Ha','0989272727','65 Nguyen Van Cu street, HaNoi City')
insert into Owners values('W004','Dam Vinh Long','0939168999','68 Dinh Tien Hoang street, DaNang City')

select * from Owners

insert into Property values('P001','6 Nguyen Hue, HCM City',350,'W001')
insert into Property values('P002','7 Nguyen Hue, HCM City',250,'W001')
insert into Property values('P003','14 Nguyen Hue, HCM City',400,'W001')
insert into Property values('P004','5 Lac Long Quan, HCM City',450,'W002')
insert into Property values('P005','89 Nguyen Thai Hoc, CanTho City',300,'W002')
insert into Property values('P006','66 Nguyen Khuyen Quang Tri, DaNang City',400,'W003')
insert into Property values('P007','67 Tran Binh Trong Quang Ngai, DaNang City',300,'W003')
insert into Property values('P008','02 Hang Trong, HaNoi City',500,'W004')
insert into Property values('P009','05 Hang Dong, HaNoi City',450,'W004')
insert into Property values('P010','17 Hoa Binh, CanTho City',350,'W004')

select * from Property

insert into Rental values('K001','P001','09/20/2012','11/20/2012')
insert into Rental values('K001','P002','09/20/2012','11/20/2012')
insert into Rental values('K002','P003','02/10/2012','05/10/2012')
insert into Rental values('K002','P005','06/20/2012','10/20/2012')
insert into Rental values('K003','P004','01/01/2012','01/01/2013')
insert into Rental values('K003','P006','03/15/2012','07/20/2012')
insert into Rental values('K003','P005','10/30/2012','05/30/2013')
insert into Rental values('K004','P007','02/15/2012','08/15/2013')
insert into Rental values('K004','P009','12/20/2012','12/20/2013')
insert into Rental values('K005','P008','09/20/2012','11/20/2012')
insert into Rental values('K005','P003','06/15/2012','12/15/2013')

select * from Rental 

--A
select *from Property where Paddress like '%HaNoi%' and RentPrice > 350

--B

select C.CNo, CName, P.Property_No, Paddress
from Customer C, Property P, Rental R
where C.CNo = R.CNo and P.Property_No = R.Property_No
and month(RentStart)=9 and year(RentStart)=2012

--C
select C.CNo, CName, P.Property_No, Paddress
from Customer C, Property P, Rental R
where C.CNo = R.CNo and P.Property_No = R.Property_No
and	dateDiff(MM,RentStart,RentFinish)>10

--D
Update Rental
set RentFinish = DATEADD(dd,5,RentFinish)
where CNo = 'K001' and Property_No = 'P002'

--E
select * from Property
where Property_No NOT in (select Property_No from Rental)

--F

Select C.CNo, CName, count (C.CNo) as 'NUber of routed property'
from Customer C, Rental R
where  C.CNo = R.CNo 
Group by C.CNO,CName having count (C.CNo ) > 2

--G
Select C.CNo, Cname ,Tel, CAddress, Paddress
from Customer C, Property P, Retal R, Owners O
where  C.CNo = R.CNo and R.Property_No = P.Property_No
and P.OwnerNo = O.OwnerNo and OName = 'Dam Vinh Long'

--H
select C.CNo ,CName,P.Property_No,DATEDIFF(MM,RentStart,RentFinish) as 'months',
RentPrice,DATEDIFF,(MM,RentStart,RentFinish)*RentPrice as 'Money must pay'
from Property P , Rental R, Customer C
where P.Property_No = R.Property_no and C.CNo = R.CNo

--I
select C.CNo, C.CName, sum(DATEDIFF(MM,RentStart,RentFinish)*RentPrice) as 'Sum of money'
from Property P, Rental R, Customer C
where P.Property_No = R.Property_No and C.CNo = R.CNo
group by C.CNo, CName

--J

Delete from Rental where CNo
in ( select CNo from Customer where CName ='Nguyen Huong Tram')
Delete from Customer where CName= 'Nguyen Huong Tram'

--K
Create nonclustered index IX_Cus on Customer(CName,Tel)
GO

--L

Create view PropertyofHaHo
as 
select Property_No,Paddress,RentPrice
From Property P, Owners O
Where P.OwerNo = O.OwnerNo and OName = 'Ho Ngoc Ha'

select * from PropertyofHaHo
