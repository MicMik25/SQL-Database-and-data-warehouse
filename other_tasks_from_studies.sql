/*#1*/
CREATE TABLE DOM 
(
dom_id int IDENTITY(1,1)  PRIMARY KEY  not null ,
dom_powierzchnia decimal(5,2) not null ,
dom_piwnica nchar(1) NOT NULL CHECK (dom_piwnica IN ('T','N')),
dom_pieter smallint  not null,
dom_miasto nvarchar(50) not null,
dom_ulica nvarchar(100) not null,
dom_nr_ulicy nvarchar(10) not null ,
dom_opis nvarchar(255)

);

/*2*/
merge products as P
using(values('Finlandia')) as S (Nazwa)
on ProductName = S.Nazwa
when matched then
update set UnitsInStock = UnitsInStock+10
When not matched then
Insert(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
Values('Finlandia',(select SupplierID from Suppliers where CompanyName='Exotic Liquids'),(select CategoryID from Categories where CategoryName='Beverages'),12,13,14,15,16,17);

/*3*/
CREATE VIEW vpracownik AS
SELECT p.pr_id AS vpr_id
     , p.pr_imie AS vpr_imie
	 , p.pr_nazwisko AS vpr_nazwisko
	 , p.pr_pensja AS vpr_pensja
	 , p.pr_plec AS vpr_plec
	 , p.pr_st_id AS vpr_st_id
	 , p.pr_szef_id AS vpr_szef_id
	 , IIF(p.pr_plec = 'M', 'Pan', 'Pani') AS vpr_pan_pani
	 , REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
        LOWER(p.pr_imie) + '.' + LOWER(p.pr_nazwisko)
        ,' ',''),'ą','a'),'ć','c'),'ę','e'),'ł','l'),'ń','n'),'ó','o'),'ś','s'),'ż','z'),'ź','z')
       + '.' + REPLACE(CAST(p.pr_id AS char),' ','')
	   + '@prog.pl' AS vpr_email
  FROM pracownik p

Set Identity_insert dbo.info OFF
INSERT INTO dbo.INFO (info_adresat, info_tresc, info_data_wystawienia, info_email)
SELECT vp.vpr_pan_pani + ' ' + vp.vpr_imie + ' ' + vp.vpr_nazwisko
	 , IIF(vp.vpr_plec='M','Otrzymał Pan','Otrzymała Pani') + ' ' 
       + 'nagrodę w kwocie ' + CAST(na_kwota AS varchar) + ' zł '
	   + 'z tytułu "' + n.na_z_tytulu + '".'
	   AS tresc
	 , CAST(getdate() AS date) AS data_wstawienia
	 , vpr_email
  FROM dbo.nagroda AS n
     , dbo.vpracownik AS vp
 WHERE vp.vpr_id = n.na_pr_id

/*4*/
USE [PROG2]
Alter table dbo.kara NOCHECK CONSTRAINT [FK_kara_pracownik]

SET IDENTITY_INSERT dbo.kara ON
Insert into dbo.kara (ka_id,ka_z_tytulu,ka_pr_id,ka_kwota) 
Select ka_id,ka_z_tytulu,ka_pr_id,ka_kwota
From PROG.dbo.kara
Set IDENTITY_INSERT dbo.kara OFF

Alter table dbo.nagroda NOCHECK CONSTRAINT [FK_nagroda_pracownik]

SET IDENTITY_INSERT dbo.nagroda ON
Insert into dbo.nagroda(na_id,na_z_tytulu,na_pr_id,na_kwota) 
Select na_id,na_z_tytulu,na_pr_id,na_kwota
From PROG.dbo.nagroda
Set IDENTITY_INSERT dbo.nagroda OFF


Alter table dbo.pracownik NOCHECK CONSTRAINT [FK_pracownik_stanowisko]

SET IDENTITY_INSERT dbo.pracownik ON
Insert into dbo.pracownik(pr_id,pr_imie,pr_nazwisko,pr_plec,pr_pensja,pr_st_id,pr_szef_id) 
Select pr_id,pr_imie,pr_nazwisko,pr_plec,pr_pensja,pr_st_id,pr_szef_id
From PROG.dbo.pracownik
Set IDENTITY_INSERT dbo.pracownik OFF

Set identity_insert dbo.pracownik OFF

SET IDENTITY_INSERT dbo.stanowisko ON
Insert into dbo.stanowisko(st_id,st_nazwa,st_dodatek) 
Select st_id,st_nazwa,st_dodatek
From PROG.dbo.stanowisko
Set IDENTITY_INSERT dbo.stanowisko OFF

/*5*/
Select ProductName
from Products
where Discontinued = 1
Order by ProductName asc;

/*6*/
Select count(*) as "Liczba dostawców"
from Suppliers

/*7*/
Select S.SupplierID as id, S.CompanyName as Nazwa, S.Address as Adres, S.Phone as "Numer kontaktowy"
from Products as P, Suppliers as S
where P.ProductName = 'Ipoh Coffee' and S.SupplierID = P.SupplierID

/*8*/
Select ProductName as "Nazwa produktu", UnitPrice as Cena
from Products
Where UnitPrice > (Select AVG(UnitPrice) From Products);

/*9*/
Select CategoryName,Country , count(*) as [ilość zamówień]
From[dbo].[Order Details] as O , Products as P , Categories as C , Suppliers as S
Where O.ProductID=P.ProductID and P.CategoryID = C.CategoryID and P.SupplierID = S.SupplierID
Group by CategoryName , Country
Order by CategoryName

/*10*/
Create Login admin
with password = '1234';

/*11*/
Create View ListaPracownik�w as select TerritoryID,FirstName,LastName from Employees , EmployeeTerritories
Where EmployeeTerritories.EmployeeID=Employees.EmployeeID;

/*12*/
CREATE SEQUENCE [odd_numbers]
AS INT
START WITH 1
INCREMENT BY 2
MINVALUE 1
MAXVALUE 99
CYCLE;

SELECT NEXT VALUE FOR odd_numbers;

/*13*/
Create table Complains(
Id int identity(1,1) primary key not null,
employeeid int foreign key(EmployeeID) References Employees(EmployeeID) not null,
description nvarchar(200),
date date,
type char check(type='P'or type = 'R' or type='S'));

/*14*/
BEGIN TRANSACTION;

UPDATE products
SET UnitPrice = UnitPrice * 1.15
WHERE CategoryID = 7
AND UnitPrice = (SELECT MIN(UnitPrice) FROM products WHERE CategoryID = 7)

IF (SELECT UnitPrice FROM products WHERE CategoryID = 7 AND 
	UnitPrice = (SELECT MIN(UnitPrice) FROM products WHERE CategoryID=7)) > 16
BEGIN
    ROLLBACK;
END
ELSE
    COMMIT;