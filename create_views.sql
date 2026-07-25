USE ecommerceDB;

CREATE VIEW CustomerOrderSummary AS
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

SELECT *
FROM CustomerOrderSummary;

CREATE VIEW ProductSalesSummary AS
SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Products p
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName; 

SELECT *
FROM ProductSalesSummary;
    

