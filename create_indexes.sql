USE ecommerceDB;

CREATE INDEX idx_customer_email
ON Customers(Email);

SHOW INDEX FROM Customers;

CREATE INDEX idx_orders_customer
ON Orders(CustomerID);

SHOW INDEX FROM Orders;

CREATE INDEX idx_orderdetails_product
ON OrderDetails(ProductID);

SHOW INDEX FROM OrderDetails;

CREATE INDEX idx_products_category
ON Products(CategoryID);

SHOW INDEX FROM Products;

