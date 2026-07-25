USE ecommerceDB;

CREATE TABLE StockHistory (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    OldStock INT,
    NewStock INT,
    ChangeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

USE ecommerceDB;

SELECT *
FROM StockHistory;

DROP TRIGGER IF EXISTS AfterStockUpdate;

DELIMITER //

CREATE TRIGGER AfterStockUpdate
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    IF OLD.Stock <> NEW.Stock THEN
        INSERT INTO StockHistory
        (
            ProductID,
            OldStock,
            NewStock
        )
        VALUES
        (
            OLD.ProductID,
            OLD.Stock,
            NEW.Stock
        );
    END IF;
END //

DELIMITER ;

SELECT ProductID, ProductName, Stock
FROM Products
WHERE ProductID = 1;

UPDATE Products
SET Stock = Stock - 1
WHERE ProductID = 1;

SELECT *
FROM StockHistory;

DROP TRIGGER IF EXISTS AfterPaymentStatusUpdate;

CREATE TABLE PaymentStatusHistory (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    PaymentID INT,
    OldStatus VARCHAR(20),
    NewStatus VARCHAR(20),
    ChangeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER AfterPaymentStatusUpdate
AFTER UPDATE ON Payments
FOR EACH ROW
BEGIN
    IF OLD.PaymentStatus <> NEW.PaymentStatus THEN
        INSERT INTO PaymentStatusHistory
        (
            PaymentID,
            OldStatus,
            NewStatus
        )
        VALUES
        (
            OLD.PaymentID,
            OLD.PaymentStatus,
            NEW.PaymentStatus
        );
    END IF;
END //

DELIMITER ;


SELECT *
FROM Payments
WHERE PaymentID = 1;

UPDATE Payments
SET PaymentStatus = 'Refunded'
WHERE PaymentID = 1; 

SELECT *
FROM PaymentStatusHistory;
