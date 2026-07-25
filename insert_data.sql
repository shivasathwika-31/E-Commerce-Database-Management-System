USE ecommercedb;

INSERT INTO Categories (CategoryName, Description)
VALUES
('Clothing', 'Fashion and clothing products'),
('Books', 'Books and educational materials'),
('Home Appliances', 'Appliances used at home'),
('Sports', 'Sports and fitness products');

SELECT * FROM Categories;

INSERT INTO Customers
(FirstName, LastName, Email, Phone, City, State, RegistrationDate)
VALUES
('Rahul', 'Sharma', 'rahul.sharma@email.com', '9876543210', 'Hyderabad', 'Telangana', '2025-01-15'),
('Priya', 'Reddy', 'priya.reddy@email.com', '9876543211', 'Bengaluru', 'Karnataka', '2025-02-10'),
('Arjun', 'Kumar', 'arjun.kumar@email.com', '9876543212', 'Chennai', 'Tamil Nadu', '2025-03-05'),
('Sneha', 'Patel', 'sneha.patel@email.com', '9876543213', 'Mumbai', 'Maharashtra', '2025-03-20'),
('Vikram', 'Singh', 'vikram.singh@email.com', '9876543214', 'Delhi', 'Delhi', '2025-04-12');

SELECT * FROM Customers;

INSERT INTO Suppliers
(SupplierName, ContactPerson, Phone, Email, City, State)
VALUES
('TechWorld Suppliers', 'Ramesh Kumar', '9876500011',
 'techworld@gmail.com', 'Hyderabad', 'Telangana'),

('FashionHub Distributors', 'Anita Sharma', '9876500012',
 'fashionhub@gmail.com', 'Bengaluru', 'Karnataka'),

('BookPoint Suppliers', 'Suresh Reddy', '9876500013',
 'bookpoint@gmail.com', 'Chennai', 'Tamil Nadu'),

('HomeNeeds Suppliers', 'Kiran Patel', '9876500014',
 'homeneeds@gmail.com', 'Mumbai', 'Maharashtra'),

('SportsGear Distributors', 'Arun Singh', '9876500015',
 'sportsgear@gmail.com', 'Delhi', 'Delhi');
 
 SELECT * FROM Suppliers;
 SELECT * FROM Categories;
 SELECT * FROM Suppliers; 
 
 INSERT INTO Products
(ProductName, CategoryID, SupplierID, Brand, Price, Stock, Description)
VALUES
('Smartphone', 1, 1, 'Samsung', 25000.00, 50,
 'Android smartphone with advanced features'),

('Laptop', 1, 1, 'Dell', 65000.00, 30,
 'High performance laptop for work and study'),

('T-Shirt', 38, 2, 'Nike', 1500.00, 100,
 'Comfortable cotton t-shirt'),

('Jeans', 38, 2, 'Levis', 3000.00, 75,
 'Premium quality denim jeans'),

('Python Programming Book', 39, 3, 'OReilly', 800.00, 40,
 'Book for learning Python programming'),

('Study Table', 40, 4, 'IKEA', 7500.00, 20,
 'Wooden table for study and office use'),

('Cricket Bat', 41, 5, 'SG', 2500.00, 35,
 'Professional cricket bat');
 
 SELECT * FROM Products;
 
 SELECT CustomerID, FirstName, LastName
FROM Customers; 

INSERT INTO Orders
(CustomerID, OrderDate, TotalAmount, OrderStatus)
VALUES
(1, '2026-07-20', 25000.00, 'Delivered'),
(2, '2026-07-20', 1500.00, 'Shipped'),
(3, '2026-07-21', 800.00, 'Processing'),
(4, '2026-07-21', 7500.00, 'Delivered'),
(5, '2026-07-21', 2500.00, 'Pending');

DESCRIBE Orders;
DESCRIBE OrderDetails;
INSERT INTO OrderDetails
(OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 1, 25000.00),
(1, 2, 1, 65000.00),
(2, 3, 2, 1500.00),
(3, 5, 1, 800.00),
(4, 6, 1, 7500.00),
(5, 7, 1, 2500.00);

SELECT * FROM OrderDetails;
DELETE FROM OrderDetails
WHERE OrderDetailID > 6;
DESCRIBE Payments;

USE ecommerceDB;

INSERT INTO Payments
(OrderID, PaymentDate, PaymentMethod, PaymentStatus, Amount)
VALUES
(1, '2026-07-20', 'UPI', 'Paid', 25000.00),
(2, '2026-07-20', 'Credit Card', 'Paid', 1500.00),
(3, '2026-07-21', 'Debit Card', 'Paid', 800.00),
(4, '2026-07-21', 'UPI', 'Paid', 7500.00),
(5, '2026-07-21', 'Cash on Delivery', 'Pending', 2500.00);

SELECT * FROM Payments;


 
 