USE ecommerceDB;

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    SUM(o.TotalAmount) AS TotalSpent,
    RANK() OVER (
        ORDER BY SUM(o.TotalAmount) DESC
    ) AS CustomerRank
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName;
    
SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue,
    RANK() OVER (
        ORDER BY SUM(od.Quantity * od.UnitPrice) DESC
    ) AS RevenueRank
FROM Products p
INNER JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName;
    
WITH CustomerSpending AS (
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
)
SELECT
    CustomerID,
    FirstName,
    LastName,
    TotalSpent,
    AVG(TotalSpent) OVER () AS AverageCustomerSpending
FROM CustomerSpending;

SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    LAG(TotalAmount) OVER (
        ORDER BY OrderDate
    ) AS PreviousOrderAmount
FROM Orders;

SELECT
    CustomerID,
    OrderID,
    OrderDate,
    TotalAmount,
    ROW_NUMBER() OVER (
        PARTITION BY CustomerID
        ORDER BY OrderDate
    ) AS OrderNumber
FROM Orders;

SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    LEAD(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
    ) AS NextOrderAmount
FROM Orders;
    
    
