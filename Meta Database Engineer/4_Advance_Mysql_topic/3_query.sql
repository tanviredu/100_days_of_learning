USE lucky_shrub;

-- find the top selling products
DESCRIBE orders;
DESCRIBE products;
SELECT * FROM orders LIMIT 1;
SELECT * FROM products LIMIT 1;

SELECT MAX(Quantity) FROM Orders;


SELECT ProductID FROM Products WHERE ProductID 
= ANY (SELECT ProductID FROM Orders WHERE Quantity>=10);
SELECT * FROM Orders;


-- data analysis lab
CREATE DATABASE IF NOT EXISTS Lucky_Shrub3;
USE Lucky_Shrub3;
CREATE TABLE Clients 
(
	ClientID VARCHAR(10),
    FullName VARCHAR(100),
    ContactNumber INT,
    AddressID INT
);
CREATE TABLE Orders 
(
	OrderID INT NOT NULL PRIMARY KEY,
    ClientID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity   INT,
    Cost DECIMAL(6,2),
    Date DATE
); 

CREATE TABLE Products 
(
	ProductID VARCHAR(10),
    ProductName VARCHAR(100),
    BuyPrice DECIMAL(6,2),
    SellPrice DECIMAL(6,2),
    NumberOfItems INT
); 

CREATE TABLE Addresses
(
	AddressID INT PRIMARY KEY,
    Street VARCHAR(255),
    County VARCHAR(100)
); 

-- seed the data
INSERT INTO Clients(ClientID, FullName, ContactNumber, AddressID) VALUES 
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
(12, "Cl1", "P1", 10, 500, "2022-09-01"), 
(13, "Cl2", "P2", 5, 100, "2022-09-05"), 
(14, "Cl3", "P3", 20, 800, "2022-09-03"), 
(15, "Cl4", "P4", 15, 150, "2022-09-07"), 
(16, "Cl3", "P3", 10, 450, "2022-09-08"), 
(17, "Cl2", "P2", 5, 800, "2022-09-09"), 
(18, "Cl1", "P4", 22, 1200, "2022-09-10"), 
(19, "Cl3", "P1", 15, 150, "2022-09-10"), 
(20, "Cl1", "P1", 10, 500, "2022-09-12"), 
(21, "Cl2", "P2", 5, 100, "2022-09-13"),  
(22, "Cl2", "P1", 10, 500, "2021-09-01"), 
(23, "Cl2", "P2", 5, 100, "2021-09-05"), 
(24, "Cl3", "P3", 20, 800, "2021-09-03"), 
(25, "Cl4", "P4", 15, 150, "2021-09-07"), 
(26, "Cl1", "P3", 10, 450, "2021-09-08"), 
(27, "Cl2", "P1", 20, 1000, "2022-09-01"), 
(28, "Cl2", "P2", 10, 200, "2022-09-05"), 
(29, "Cl3", "P3", 20, 800, "2021-09-03"), 
(30, "Cl1", "P1", 10, 500, "2022-09-01"); 



INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfItems) VALUES 
("P1", "Artificial grass bags ", 40, 50, 100), 
("P2", "Wood panels", 15, 20, 250), 
("P3", "Patio slates",  35, 40, 60), 
("P4", "Sycamore trees ", 7, 10, 50), 
("P5", "Trees and Shrubs", 35, 50, 75), 
("P6", "Water fountain", 65, 80, 15); 

INSERT INTO Addresses (AddressID, Street, County) VALUES 
(1, ",291 Oak Wood Avenue", "Graham County"), 
(2, "724 Greenway Drive", "Pinal County"), 
(3, "102 Sycamore Lane", "Santa Cruz County"), 
(4, "125 Roselawn Close", "Gila County"), 
(5, "831 Beechwood Terrace", "Cochise County"),
(6, "755 Palm Tree Hills", "Mohave County"), 
(7, "751 Waterfall Hills", "Tucson County") , 
(8, "878 Riverside Lane", "Tucson County") , 
(9, "908 Seaview Hills", "Tucson County"), 
(10, "243 Waterview Terrace", "Tucson County"), 
(11, "148 Riverview Lane", "Tucson County"),  
(12, "178 Seaview Avenue", "Tucson County");


SELECT * FROM Clients;
SELECT * FROM Addresses;
SELECT * FROM Products;
SELECT * FROM Orders;

-- Task 1
-- Create a query that returns the total
-- quantity of all products with the ID of
-- P4 sold in the years 2020, 2021 and 2022

-- we use common table expression
SELECT * FROM Orders;
SELECT SUM(Quantity) FROM Orders WHERE ProductID = 'P4' AND Year(Date) = '2022';

WITH
sum_2020 AS (SELECT SUM(Quantity) AS 'P4 product:Quantity sold' FROM Orders WHERE ProductID = 'P4' AND Year(Date) = '2020'),
sum_2021 AS (SELECT SUM(Quantity) AS 'P4 product:Quantity sold' FROM Orders WHERE ProductID = 'P4' AND Year(Date) = '2021'),
sum_2022 AS (SELECT SUM(Quantity) AS 'P4 product:Quantity sold' FROM Orders WHERE ProductID = 'P4' AND Year(Date) = '2022')
SELECT * FROM sum_2020
UNION ALL
SELECT * FROM sum_2021
UNION ALL 
SELECT * FROM sum_2022;

-- Task 2
SELECT * FROM Clients;
SELECT * FROM Addresses;
SELECT * FROM Orders;

SELECT CL.ClientID,CL.ContactNumber,AD.Street,AD.County,Ord.OrderID,Ord.Cost,Ord.Date,Pr.ProductName FROM Clients CL
JOIN Addresses AD
ON CL.AddressId = AD.AddressID
JOIN Orders Ord
ON CL.ClientID = Ord.ClientID
JOIN Products Pr
ON Ord.ProductID = Pr.ProductID
WHERE YEAR(Date) = '2022' OR YEAR(Date) = '2021'
ORDER BY Ord.Date;

SELECT SUM(Quantity) FROM Orders WHERE Year(Date) = 2021 AND ProductID = 'P3';

DELIMITER //
CREATE FUNCTION FindSoldQuantity(ProductIDIN VARCHAR(100),YearIN VARCHAR(100)) RETURNS INT
BEGIN
	DECLARE Result INT;
    SELECT SUM(Quantity) INTO Result FROM Orders WHERE 
    YEAR(Date) = YearIN AND ProductID = ProductIDIN;
    RETURN Result;
    
END//
DELIMITER ;

SELECT FindSoldQuantity('P3',2021);
DROP function FindSoldQuantity;