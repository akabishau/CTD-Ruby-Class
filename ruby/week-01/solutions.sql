--(1) Using the Customer Table, select the CustomerName, ContactName, and Country.  Use ORDER BY to order by Country.  
--Use LIMIT and OFFSET to get entries 11 through 20. 
--Paste your SQL statement below.
select CustomerID, CustomerName, ContactName, Country 
from Customers
limit 10 offset 10

--(2) Select all columns from the Customer table where the ContactName starts with A. 
--Paste your SQL statement below.
select * from Customers 
where ContactName like 'A%'

--(3) Select all columns from the OrderDetails table where the ProductID is 51 and the quantity is greater than 10.
--Paste your SQL statement below.
select * from OrderDetails
where ProductID = 51 and Quantity > 10

--(4) Insert 3 rows into the Products table. 
--Note that you will have to specify a valid SupplierID and CategoryID, corresponding to rows from the Supplier and Category tables.  
--Paste your three SQL statements below.
insert into Products (ProductName, SupplierID, CategoryID, Unit, Price)
values 
    ('Funny Carrots', 12, 7, '5 lbs pkgs', 10.00),
    ('Weird Apples', 12, 7, '5 lbs pkgs', 15.00),
    ('Ugly Oranges', 12, 7, '5 lbs pkgs', 12.00)

--(5) Update the two top rows of the Products Table to increase the price by 1.50. (Get SQL to do the addition for you.)  
--Paste your SQL statement below.
update Products
set Price = Price + 1.5
where ProductID <= 2

--(6) Delete all rows of the Products Table where the price is less than 7.00.
--Paste your SQL statement below.
delete from Products
where Price < 7.00