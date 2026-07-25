USE ecommerceDB;

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName
ORDER BY TotalSpent DESC;

SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Products p
JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY TotalRevenue DESC;

SELECT
    c.CategoryName,
    COUNT(DISTINCT p.ProductID) AS TotalProducts,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Categories c
JOIN Products p
    ON c.CategoryID = p.CategoryID
JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY
    c.CategoryID,
    c.CategoryName
ORDER BY TotalRevenue DESC;

SELECT
    OrderDate,
    COUNT(OrderID) AS TotalOrders,
    SUM(TotalAmount) AS TotalRevenue,
    AVG(TotalAmount) AS AverageOrderValue
FROM Orders
GROUP BY OrderDate
ORDER BY OrderDate;

SELECT
    ProductID,
    ProductName,
    Stock,
    Price
FROM Products
WHERE Stock < 50
ORDER BY Stock ASC;

SELECT
    PaymentStatus,
    COUNT(PaymentID) AS TotalPayments,
    SUM(Amount) AS TotalAmount
FROM Payments
GROUP BY PaymentStatus
ORDER BY TotalAmount DESC;


SELECT
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Products p
JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 1;

SELECT
    OrderStatus,
    COUNT(OrderID) AS TotalOrders,
    SUM(TotalAmount) AS TotalAmount
FROM Orders
GROUP BY OrderStatus
ORDER BY TotalAmount DESC;

