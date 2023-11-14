-- Join the OrderDetails and Products tables, 
-- to show a report where the columns are OrderID, ProductName, and Quantity.
select 
    OrderDetails.OrderID, 
    Products.ProductName, 
    OrderDetails.Quantity
from OrderDetails
inner join Products on Products.ProductID = OrderDetails.ProductID

--Join the Orders, OrderDetails, and Employees tables 
--to return a report with with the EmployeeName, ProductID, and Quantity.-
select 
    Employees.FirstName || ' ' || Employees.LastName as EmployeeName,
    OrderDetails.ProductID, 
    OrderDetails.Quantity
from Orders
inner join Employees on Orders.EmployeeID = Employees.EmployeeID
inner join OrderDetails on Orders.OrderID = OrderDetails.OrderID
