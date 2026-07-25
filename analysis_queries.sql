USE ecommerceDB;

SELECT *
FROM Customers;

SELECT FirstName, LastName, Email
FROM Customers;

SELECT ProductName, Price
FROM Products;

SELECT ProductName, Price
FROM Products
WHERE Price > 5000;

USE ecommerceDB;

SELECT *
FROM Customers;

SELECT FirstName, LastName, Email
FROM Customers;

SELECT ProductName, Price
FROM Products
ORDER BY Price DESC;

SELECT COUNT(*) AS TotalCustomers
FROM Customers;

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;

SELECT
    MAX(TotalAmount) AS HighestOrderAmount,
    MIN(TotalAmount) AS LowestOrderAmount
FROM Orders;

SELECT
    CustomerID,
    COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerID;

SELECT CustomerID, COUNT(OrderID)
FROM Orders
GROUP BY CustomerID;

SELECT
    CustomerID,
    SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID;

SELECT
    CustomerID,
    SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 5000;

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    o.OrderStatus
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;
    
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName
ORDER BY TotalSpent DESC;

SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold
FROM Products p
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY TotalQuantitySold DESC;

SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity * od.UnitPrice) AS ProductRevenue
FROM Products p
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY ProductRevenue DESC;

SELECT
    c.CategoryName,
    SUM(od.Quantity * od.UnitPrice) AS CategoryRevenue
FROM Categories c
INNER JOIN Products p
    ON c.CategoryID = p.CategoryID
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY
    c.CategoryID,
    c.CategoryName
ORDER BY CategoryRevenue DESC;

SELECT
    ProductID,
    ProductName,
    Stock
FROM Products
WHERE Stock < 50
ORDER BY Stock ASC;

SELECT
    OrderStatus,
    COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY OrderStatus;


