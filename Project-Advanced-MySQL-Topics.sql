-- Create Database and tables
Create DATABASE Lucky_Shrub;
USE Lucky_Shrub;
CREATE TABLE Clients (ClientID VARCHAR(10), FullName VARCHAR(100), ContactNumber INT, AddressID INT);
CREATE TABLE Orders (OrderID INT NOT NULL PRIMARY KEY, ClientID VARCHAR(10),  ProductID VARCHAR(10),  Quantity INT, Cost DECIMAL(6,2), Date DATE); 
CREATE TABLE Products (ProductID VARCHAR(10), ProductName VARCHAR(100), BuyPrice DECIMAL(6,2), SellPrice DECIMAL(6,2), NumberOfItems INT);
CREATE TABLE Addresses (AddressID INT PRIMARY KEY, Street VARCHAR(255), County VARCHAR(100)); 
CREATE TABLE Employees (EmployeeID INT, FullName VARCHAR(100), Role VARCHAR(50), Department VARCHAR(200), AddressID INT); 
CREATE TABLE Activity (ActivityID INT PRIMARY KEY, Properties JSON); 
CREATE TABLE Audit(AuditID INT AUTO_INCREMENT PRIMARY KEY, OrderDateTime TIMESTAMP NOT NULL);
CREATE TABLE Notifications (NotificationID INT AUTO_INCREMENT PRIMARY KEY, Notification VARCHAR(256), DateTime TIMESTAMP NOT NULL);
INSERT INTO Employees (EmployeeID, FullName, Role, Department, AddressID) VALUES  
(1, "Seamus Hogan", "Manager", "Management", 7),  
(2, "Thomas Eriksson", "Assistant ", "Sales", 8), 
(3, "Simon Tolo", "Head Chef", "Management", 9), 
(4, "Francesca Soffia", "Assistant  ", "Human Resources", 10), 
(5, "Emily Sierra", "Accountant", "Finance", 11),  
(6, "Greta Galkina", "Accountant", "Finance", 12);
INSERT INTO Activity (ActivityID, Properties) VALUES 
(1, '{ "ClientID": "Cl1", "ProductID": "P1", "Order": "True" }' ), 
(2, '{ "ClientID": "Cl2", "ProductID": "P4", "Order": "False" }' ), 
(3, '{ "ClientID": "Cl5", "ProductID": "P5", "Order": "True" }' );
INSERT INTO Clients (ClientID, FullName, ContactNumber, AddressID) VALUES 
("Cl1", "Takashi Ito", 351786345, 1), 
("Cl2", "Jane Murphy", 351567243, 2), 
("Cl3", "Laurina Delgado", 351342597, 3), 
("Cl4", "Benjamin Clauss", 351342509, 4), 
("Cl5", "Altay Ayhan", 351208983, 5), 
("Cl6", "Greta Galkina", 351298755, 6);
INSERT INTO Orders (OrderID, ClientID, ProductID , Quantity, Cost, Date) VALUES 
(1, "Cl1", "P1", 10, 500, "2020-09-01" ), 
(2, "Cl2", "P2", 5, 100, "2020-09-05"), 
(3, "Cl3", "P3", 20, 800, "2020-09-03"), 
(4, "Cl4", "P4", 15, 150, "2020-09-07"), 
(5, "Cl3", "P3", 10, 450, "2020-09-08"), 
(6, "Cl2", "P2", 5, 800, "2020-09-09"), 
(7, "Cl1", "P4", 22, 1200, "2020-09-10"), 
(8, "Cl3", "P1", 15, 150, "2020-09-10"), 
(9, "Cl1", "P1", 10, 500, "2020-09-12"), 
(10, "Cl2", "P2", 5, 100, "2020-09-13"), 
(11, "Cl4", "P5", 5, 100, "2020-09-15"),
(12, "Cl1", "P1", 10, 500, "2022-09-01" ), 
(13, "Cl2", "P2", 5, 100, "2022-09-05"), 
(14, "Cl3", "P3", 20, 800, "2022-09-03"), 
(15, "Cl4", "P4", 15, 150, "2022-09-07"), 
(16, "Cl3", "P3", 10, 450, "2022-09-08"), 
(17, "Cl2", "P2", 5, 800, "2022-09-09"), 
(18, "Cl1", "P4", 22, 1200, "2022-09-10"), 
(19, "Cl3", "P1", 15, 150, "2022-09-10"), 
(20, "Cl1", "P1", 10, 500, "2022-09-12"), 
(21, "Cl2", "P2", 5, 100, "2022-09-13"),  
(22, "Cl2", "P1", 10, 500, "2021-09-01" ), 
(23, "Cl2", "P2", 5, 100, "2021-09-05"), 
(24, "Cl3", "P3", 20, 800, "2021-09-03"), 
(25, "Cl4", "P4", 15, 150, "2021-09-07"), 
(26, "Cl1", "P3", 10, 450, "2021-09-08"), 
(27, "Cl2", "P1", 20, 1000, "2022-09-01" ), 
(28, "Cl2", "P2", 10, 200, "2022-09-05"), 
(29, "Cl3", "P3", 20, 800, "2021-09-03"), 
(30, "Cl1", "P1", 10, 500, "2022-09-01" );
INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfITems) VALUES 
("P1", "Artificial grass bags ", 40, 50, 100), 
("P2", "Wood panels", 15, 20, 250), 
("P3", "Patio slates",  35, 40, 60), 
("P4", "Sycamore trees ", 7, 10, 50), 
("P5", "Trees and Shrubs", 35, 50, 75), 
("P6", "Water fountain", 65, 80, 15); 
INSERT INTO Addresses (AddressID, Street, County) VALUES 
(1, "291 Oak Wood Avenue", "Graham County"), 
(2, "724 Greenway Drive", "Pinal County"), 
(3, "102 Sycamore Lane", "Santa Cruz County"), 
(4, "125 Roselawn Close", "Gila County"), 
(5, "831 Beechwood Terrace", "Cochise County"),
(6, "755 Palm Tree Hills", "Mohave County"), 
(7, "751 Waterfall Hills", "Tuscon County") , 
(8, "878 Riverside Lane", "Tuscon County") , 
(9, "908 Seaview Hills", "Tuscon County"), 
(10, "243 Waterview Terrace", "Tuscon County"), 
(11, "148 Riverview Lane", "Tuscon County"),  
(12, "178 Seaview Avenue", "Tuscon County");
SELECT * FROM Activity;

-- Task1 Create a function to find out the average sale price for all product in 2022
CREATE FUNCTION FindAverageCost (Input_Year INT)
RETURNS DECIMAL (10,2) DETERMINISTIC
RETURN (SELECT AVG(Cost) FROM Orders WHERE YEAR(Date)=Input_Year);
SELECT FindAverageCost(2022);

-- Task2 Create a procedure to output the total number of items sold based on Product ID during 2020 and 2022 
DELIMITER //
CREATE PROCEDURE EvaluateProduct(
	IN Input_ID VARCHAR(10), OUT Items_Sold_2020 INT, OUT Items_Sold_2021 INT, OUT Items_Sold_2022 INT)
	BEGIN
		SELECT SUM(Quantity) INTO Items_Sold_2020 FROM Orders WHERE ProductID=Input_ID AND YEAR(Date)=2020;
		SELECT SUM(Quantity) INTO Items_Sold_2021 FROM Orders WHERE ProductID=Input_ID AND YEAR(Date)=2021;
		SELECT SUM(Quantity) INTO Items_Sold_2022 FROM Orders WHERE ProductID=Input_ID AND YEAR(Date)=2022;
	END //
DELIMITER ;
DROP PROCEDURE EvaluateProduct;
CALL EvaluateProduct('P1', @Items_Sold_2020, @Items_Sold_2021, @Items_Sold_2022);
SELECT @Items_Sold_2020, @Items_Sold_2021, @Items_Sold_2022;

-- Task3  Create a trigger of updating Audit to be invoked automatically AFTER a new order is inserted into the Orders table.
CREATE TRIGGER Audit_Update 
	AFTER INSERT
    ON Orders FOR EACH ROW
    INSERT INTO Audit (OrderDateTime) VALUES (current_timestamp()); -- Notice that AuditID is an auto increment key, no manual insert needed!
SHOW TRIGGERS;
INSERT INTO Orders (OrderID, ClientID, ProductID , Quantity, Cost, Date) 
VALUES (31, "Cl3", "P2", 20, 400, "2020-09-11" );
SELECT * FROM Audit;

-- Task4 Optimize query to output: full name of clients and employees, addresses of each person,  ordered by the street name
SELECT Employees.FullName, Addresses.Street, Addresses.County
FROM Employees 
INNER JOIN Addresses
ON Employees.AddressID = Addresses.AddressID
UNION
SELECT Clients.FullName, Addresses.Street, Addresses.County
FROM Clients 
INNER JOIN Addresses
ON Clients.AddressID = Addresses.AddressID
ORDER BY Street;

-- Task5 Simplify query by CTE !Maynot supported by every IDE
WITH
P2_Sales_2020 AS (SELECT CONCAT(FORMAT(SUM(Cost),2), " (2020)") AS "Total sum of P2 Product" FROM Orders WHERE YEAR(Date) = 2020 AND ProductID= "P2"),
P2_Sales_2021 AS (SELECT CONCAT(FORMAT(SUM(Cost),2), " (2021)") AS "Total sum of P2 Product" FROM Orders WHERE YEAR(Date) = 2021 AND ProductID= "P2"),
P2_Sales_2022 AS (SELECT CONCAT(FORMAT(SUM(Cost),2), " (2022)") AS "Total sum of P2 Product" FROM Orders WHERE YEAR(Date) = 2022 AND ProductID= "P2")
SELECT * FROM P2_Sales_2020
UNION
SELECT * FROM P2_Sales_2021
UNION
SELECT * FROM P2_Sales_2022;

-- Task6 Output the record of clients who used online store, using JSON datatype
SELECT Activity.Properties ->>'$.ClientID' AS ClientID, 
	   ACtivity.Properties ->> '$.ProductID' AS ProductID,
       Clients.FullName, Clients.ContactNumber
FROM   Clients RIGHT JOIN Activity
	   ON Clients.ClientID = Activity.Properties ->'$.ClientID';
       
-- Task7 Create a procedure returns the overall profits of a specific product in a specific year
DELIMITER //
CREATE PROCEDURE GetProfit(IN Input_ID VARCHAR(10), IN Input_Year INT)
	BEGIN
		DECLARE Profit DECIMAL(10,2) DEFAULT 0.00;
        DECLARE Total_Quantity, Buy_Price, Sell_Price INT DEFAULT 0;
        SELECT SUM(Quantity) INTO Total_Quantity FROM Orders WHERE ProductID = Input_ID AND YEAR(Date) = Input_Year;
        SELECT BuyPrice INTO Buy_Price FROM Products WHERE ProductID = Input_ID;
        SELECT SellPrice INTO Sell_Price FROM Products WHERE ProductID = Input_ID;
        SET Profit = (Sell_Price - Buy_Price) * Total_Quantity;
        SELECT Profit;
	END //
DELIMITER ;
CALL GetProfit('P1', 2020);

-- Task8 Create a View of client’s details, including their addresses, order details and the products they purchased
CREATE VIEW DataSummary AS 
	SELECT Clients.FullName, Clients.ContactNumber, Addresses.County, Products.ProductName, Orders.ProductID, Orders.Cost, Orders.Date 
	FROM Clients 
		INNER JOIN Addresses ON Clients.AddressID = Addresses.AddressID 
		INNER JOIN Orders ON Clients.ClientID = Orders.ClientID 
		INNER JOIN Products ON Orders.ProductID = Products.ProductID 
	WHERE YEAR(Orders.Date) = 2022 
	ORDER BY Orders.Cost DESC;
SELECT * FROM DataSummary;