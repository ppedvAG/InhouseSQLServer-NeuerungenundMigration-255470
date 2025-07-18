use northwind;
GO

create view KundeUmsatz 
as
SELECT 
	Customers.CustomerID, Customers.CompanyName 
   ,Customers.ContactName, Customers.ContactTitle, Customers.City
   ,Customers.Country, Orders.EmployeeID, Orders.OrderDate
   ,Orders.Freight, Orders.ShipName, Orders.ShipCity
   ,Orders.ShipCountry, [Order Details].ProductID
   ,[Order Details].UnitPrice, [Order Details].OrderID 
   ,[Order Details].Quantity, Employees.LastName, Employees.FirstName
   ,Products.ProductName, Products.UnitsInStock
   ,( [Order Details].UnitPrice* [Order Details].Quantity) as PosSumme
FROM Customers INNER JOIN
   Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
   [Order Details] ON 
   Orders.OrderID = [Order Details].OrderID INNER JOIN
   Products ON 
   [Order Details].ProductID = Products.ProductID INNER JOIN
   Employees ON Orders.EmployeeID = Employees.EmployeeID;
GO

select * into KU from KundeUmsatz;
GO

insert into KU
select * from KU
GO 9 --10 Sek
