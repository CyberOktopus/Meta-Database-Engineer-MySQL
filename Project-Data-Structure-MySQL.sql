CREATE DATABASE Little_Lemon;
USE Little_Lemon;
CREATE TABLE Customers(CustomerID INT NOT NULL PRIMARY KEY, FullName VARCHAR(100) NOT NULL, PhoneNumber INT NOT NULL UNIQUE);
INSERT INTO Customers(CustomerID, FullName, PhoneNumber) VALUES 
(1, "Vanessa McCarthy", 0757536378), 
(2, "Marcos Romero", 0757536379), 
(3, "Hiroki Yamane", 0757536376), 
(4, "Anna Iversen", 0757536375), 
(5, "Diana Pinto", 0757536374),     
(6, "Altay Ayhan", 0757636378),      
(7, "Jane Murphy", 0753536379),      
(8, "Laurina Delgado", 0754536376),      
(9, "Mike Edwards", 0757236375),     
(10, "Karl Pederson", 0757936374);
SELECT *FROM Customers;
CREATE TABLE Bookings (BookingID INT, BookingDate DATE,TableNumber INT, NumberOfGuests INT,CustomerID INT); 
INSERT INTO Bookings 
(BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) 
VALUES 
(10, '2021-11-10', 7, 5, 1),  
(11, '2021-11-10', 5, 2, 2),  
(12, '2021-11-10', 3, 2, 4), 
(13, '2021-11-11', 2, 5, 5),  
(14, '2021-11-11', 5, 2, 6),  
(15, '2021-11-11', 3, 2, 7), 
(16, '2021-11-11', 3, 5, 1),  
(17, '2021-11-12', 5, 2, 2),  
(18, '2021-11-12', 3, 2, 4), 
(19, '2021-11-13', 7, 5, 6),  
(20, '2021-11-14', 5, 2, 3),  
(21, '2021-11-14', 3, 2, 4);
SELECT *FROM Bookings;
CREATE TABLE Courses (CourseName VARCHAR(255) PRIMARY KEY, Cost Decimal(4,2));
INSERT INTO Courses (CourseName, Cost) VALUES 
("Greek salad", 15.50), 
("Bean soup", 12.25), 
("Pizza", 15.00), 
("Carbonara", 12.50), 
("Kabasa", 17.00), 
("Shwarma", 11.30);
SELECT *FROM Courses;

-- Task1: Logical operator BETWEEN
SELECT * FROM Bookings WHERE BookingDate BETWEEN '2021-11-11' AND '2021-11-13';

-- Task2: JOIN query, print the customers full names and related bookings IDs from the date 2021-11-11. 
SELECT Customers.FullName, Bookings.BookingID FROM Customers
INNER JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID 
WHERE BookingDate='2021-11-11';

-- Task3: show the total number of bookings placed on each of the printed dates using the GROUP BY BookingDate. 
SELECT BookingDate, COUNT(BookingDate) FROM Bookings GROUP BY BookingDate;

-- Task4: Create a SQL REPLACE statement that updates the cost of the Kabsa course from $17.00 to $20.00.
REPLACE INTO Courses(CourseName, Cost) VALUES ('Kabasa',20); 
SELECT * FROM Courses; 

-- Task5: Create constraints
CREATE TABLE DeliveryAddress (
ID INT PRIMARY KEY, 
Address VARCHAR(255) NOT NULL, 
Type VARCHAR(100) NOT NULL DEFAULT 'Private', 
CustomerID INT NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
SHOW COLUMNS FROM DeliveryAddress;

-- Task6: Alter table structure
ALTER TABLE Courses
ADD Ingredients VARCHAR(255);
SHOW COLUMNS FROM Courses;

-- Task 7: Create a subquery
SELECT Customers.FullName
FROM Customers 
WHERE (SELECT Bookings.CustomerID FROM Bookings WHERE Customers.CustomerID = Bookings.CustomerID and BookingDate = '2021-11-11');
-- WHERE Customers.CustomerID = ANY (SELECT Bookings.CustomerID FROM Bookings WHERE Bookings.BookingDate='2021-11-11');

-- Task 8: Create a virtual table
CREATE VIEW BookingsView AS 
SELECT BookingID, BookingDate, NumberOfGuests
FROM Bookings
WHERE BookingDate < '2021-11-13' AND NumberOfGuests > 3;
SELECT * FROM BookingsView;

-- Task 9: Create a stored procedure
CREATE PROCEDURE GetBookingsData (InputDate DATE)
SELECT * FROM Bookings WHERE BookingDate = InputDate;
CALL GetBookingsData ('2021-11-13');

-- Task 10: Use the String function
SELECT CONCAT('ID: ', BookingID,', Date: ', BookingDate,', Number of guests: ', NumberOfGuests) AS 'Booking Details' FROM Bookings;
