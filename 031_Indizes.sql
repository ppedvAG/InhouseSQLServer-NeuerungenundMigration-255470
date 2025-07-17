 /*
 CL IX
 NON CL IX
  ---------------------------
 Zusammengesetzter IX
 IX mit eingeschl Spalten
 abdeckender IX
 ind Sicht
 part. IX
 eindeutiger IX
 gefilterter IX
 realer hypothetischer IX


 Columnstore IX ( gr und n. gr)


 */


 SELECT        Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.EmployeeID, Orders.OrderDate, Orders.ShipVia, Orders.Freight, 
                         Orders.ShipName, Orders.ShipCity, Orders.ShipCountry, [Order Details].OrderID, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, Products.ProductName, Products.UnitsInStock, Employees.LastName, 
                         Employees.FirstName, Employees.BirthDate
INTO KU
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                         Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
                         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                         Products ON [Order Details].ProductID = Products.ProductID


Insert into ku
select * from ku
go 9

alter table ku add id int identity


dbcc showcontig('ku')

--48000

set statistics io, time on

select id from ku where id = 100

select * from sys.dm_db_index_physical_stats(db_id(), object_id('ku'),NULL,NULL,'detailed')

--CL IX auf Bdatum
select id from ku where id = 100
--60000-->   3 0 ms
--IX_ID

--zusammengesetzter 
 select id, freight from ku where id = 100

 --

 select id, freight, country, city from ku where id < 13000


 select * from ku where country = 'UK' or City = 'London' and customerid = 'ALFKI'
                                                                    

 select id, freight, country, city, employeeid from ku where id < 13000













