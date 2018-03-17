-- I. PHẦN ĐẦU
USE MASTER
GO
if exists(SELECT*FROM master..sysdatabases WHERE name='FloweryPerfume')
DROP DATABASE FloweryPerfume
GO
CREATE DATABASE FloweryPerfume
ON PRIMARY (
	NAME=FloweryPerfume,
	FILENAME='C:\FloweryPerfume\CSDL\FloweryPerfume.mdf',
	SIZE=10MB,
	MAXSIZE=100MB,
	FILEGROWTH=5MB
),

FILEGROUP MyGroup (
	NAME=G1_FloweryPerfume,
	FILENAME='C:\FloweryPerfume\CSDL\G1_FloweryPerfume.ndf',
	SIZE=10MB,
	MAXSIZE=100MB,
	FILEGROWTH=5MB
)

LOG ON (
	NAME=FloweryPerfumelog,
	FILENAME='C:\FloweryPerfume\CSDL\FloweryPerfumelog.ldf',
	SIZE=10MB,
	MAXSIZE=100MB,
	FILEGROWTH=5MB
)

GO
USE FloweryPerfume
GO
------------------------------------------------------------------------------------

-- II. TẠO BẢNG (bao gồm cả khóa chính)
CREATE TABLE Admin ( 
	adName varchar(20) CONSTRAINT PK_ NOT NULL PRIMARY KEY,
	adPass varchar(20) NOT NULL ,
)
GO
CREATE TABLE Customer ( 
	CCode int identity(1,1) CONSTRAINT PK_CCode PRIMARY KEY(CCode),
	CName nvarchar(50) NOT NULL,
	CUsername nvarchar(20) NOT NULL ,
	CPassword nvarchar(20) NOT NULL ,
	CPhone nvarchar(20),
	CAddress nvarchar(50),
	CSex varchar(10),
	CEmail varchar(50),		
)
GO
CREATE TABLE Manufactuter(
	ManuCode  int identity(1,1) CONSTRAINT PK_ManuCode PRIMARY KEY(ManuCode),
	ManuName nvarchar(50) NOT NULL,
	ManuPhone nvarchar(20),
	ManuAddress	nvarchar(50),
	ManuCountry nvarchar(50),
	ManuEmail	nvarchar(50),
	ManuWebsite nvarchar(50),
	ManuLogo nvarchar(50),
	ManuHead nvarchar(50)
)
GO
CREATE TABLE Products (
	ProductCode int identity(1,1) CONSTRAINT PK_ProductCode PRIMARY KEY(ProductCode),
	ProductName nvarchar(50) NOT NULL,
	ManuCode int NOT NULL FOREIGN KEY REFERENCES Manufactuter(ManuCode),
	ProductImage nvarchar(1000) NOT NULL,
	Price int DEFAULT 0,
	Volumetric int DEFAULT 0,
	Sex nvarchar(10),
	Content nvarchar(500),
	DateInput nchar(10),
	)
GO
---insert du lieu vao bang admin
INSERT INTO Admin VALUES	('admin','admin')
GO

---insert du lieu vao bang Manufactuter
INSERT INTO Manufactuter VALUES	('Calvin Klein',8665130513,'1054 ES Amsterdam','The Netherlands',' SERVICE.UK@CALVINKLEIN.COM','','',''),
								('Lacoste',01962312803,'1054 ES Amsterdam','The Netherlands',' SERVICE.UK@LACOSTE.COM','','',''),
								('Giorgio Armani ',8665130513,'1054 ES Amsterdam','The Netherlands',' SERVICE.UK@GIORGIOARMANI.COM','','',''),
								('Bvlgari',1-800-645-9251,'1054 ES Amsterdam','The Netherlands','SERVICE.UK@BVLGARI.COM ','','',''),
								('Gucci',1-800-645-9251,'1054 ES Amsterdam','The Netherlands','SERVICE.UK@GUCCI.COM ','','',''),
								('Valentino',1-800-645-9251,'1054 ES Amsterdam','The Netherlands','SERVICE.UK@VALENTINO.COM ','','','')
GO
---insert du lieu vao bang product
INSERT INTO Products VALUES		('Calvin Klein Euphoria Intense Men','1','/Calvin Klein Euphoria Intense Men.jpg',1100000,220,'Nam','',''),
								('Lacoste Inspiration','1','/Lacoste Inspiration.jpg',3000000,220,'Nu','',''),
								('Giorgio Armani Sun di Gioia','1','/Giorgio Armani Sun di Gioia.jpg',2000000,100,'Nu','',''),
								('Bvlgari Goldea The Roman Night','1','/Bvlgari Goldea The Roman Night.jpg',6000000,300,'Nam','',''),
								('Gucci Flora Gracious Tuberose','1','/Gucci Flora Gracious Tuberose.jpg',6000000,300,'Nam','',''),
								('Valentino Uomo Men Set 3PC','1','/Valentino Uomo Men Set 3PC.jpg',6000000,300,'Nam','','')

GO
INSERT INTO Customer VALUES	('Kevin','kevinhoang','123456',0989999999,'Ho Chi Minh','Nam','kevinhoang@gmail.com'),
							('Cat','catle','123456',0989999999,'Ho Chi Minh','Nam','catle@gmail.com'),
							('Lee','leehoang','123456',0989999999,'Ho Chi Minh','Nu','leehoang@gmail.com'),
							('Keekhun','leekhuntran','123456',0989999999,'Ho Chi Minh','Nam','leekhuntran@gmail.com'),
							('David','davidnguyen','123456',0989999999,'Ho Chi Minh','Nam','davidnguyen@gmail.com')
							
GO
SELECT * FROM Customer

								




