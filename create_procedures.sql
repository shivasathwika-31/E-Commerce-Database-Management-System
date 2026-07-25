USE ecommerceDB;

DELIMITER //

CREATE PROCEDURE GetExpensiveProducts(IN MinimumPrice DECIMAL(10,2))
BEGIN
    SELECT
        ProductID,
        ProductName,
        Price,
        Stock
    FROM Products
    WHERE Price > MinimumPrice
    ORDER BY Price DESC;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS GetExpensiveProducts;

CALL GetExpensiveProducts(5000);

DELIMITER //

CREATE PROCEDURE GetCustomerOrders(
    IN InputCustomerID INT
)
BEGIN
    SELECT
        o.OrderID,
        o.OrderDate,
        o.TotalAmount,
        o.OrderStatus
    FROM Orders o
    WHERE o.CustomerID = InputCustomerID
    ORDER BY o.OrderDate DESC;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS GetCustomerOrders;

CALL GetCustomerOrders(1);

DROP PROCEDURE IF EXISTS GetSalesSummary;

DELIMITER //

CREATE PROCEDURE GetSalesSummary()
BEGIN
    SELECT
        od.OrderID,
        SUM(od.Quantity * od.UnitPrice) AS TotalSales
    FROM OrderDetails od
    GROUP BY od.OrderID
    ORDER BY TotalSales DESC;
END //

DELIMITER ;

CALL GetSalesSummary();