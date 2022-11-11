USE Lucky_shrub;
SHOW TABLES;
DROP TABLE orders;
DROP TABLE employees;

CREATE TABLE Orders
(
	OrderID    INT NOT NULL,
    ClientID   VARCHAR(10) DEFAULT NULL,
    ProductID  VARCHAR(10) DEFAULT NULL,
    Quantity   INT DEFAULT NULL,
    Cost       DECIMAL(6,2) DEFAULT NULL,
    Date       DATE DEFAULT NULL,
    PRIMARY KEY (OrderID)
);

CREATE TABLE Employees
(
	EmployeeID 	INT DEFAULT NULL,
    FullName   	VARCHAR(100) DEFAULT NULL,
    Role       	VARCHAR(50) DEFAULT NULL,
    Department 	VARCHAR(255) DEFAULT NULL
);

INSERT INTO Orders (OrderID, ClientID, ProductID , Quantity, Cost, Date)  
VALUES  
(1, "Cl1", "P1", 10, 500, "2020-09-01"), 
(2, "Cl2", "P2", 5, 100, "2020-09-05"),  
(3, "Cl3", "P3", 20, 800, "2020-09-03"),  
(4, "Cl4", "P4", 15, 150, "2020-09-07"),  
(5, "Cl3", "P3", 10, 450, "2020-09-08"),  
(6, "Cl2", "P2", 5, 800, "2020-09-09"),  
(7, "Cl1", "P4", 22, 1200, "2020-09-10"),  
(8, "Cl3", "P1", 15, 150, "2020-09-10"),  
(9, "Cl1", "P1", 10, 500, "2020-09-12"),  
(10, "Cl2", "P2", 5, 100, "2020-09-13"),  
(11, "Cl1", "P2", 15, 80, "2020-09-12"), 
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
(29, "Cl3", "P3", 20, 800, "2021-09-03"); 

INSERT INTO Employees (EmployeeID, FullName,  Role, Department)  
VALUES    
(1, "Seamus Hogan", "Manager", "Management"),    
(2, "Thomas Eriksson", "Assistant ", "Sales"),   
(3, "Simon Tolo", "Executive", "Management"),   
(4, "Francesca Soffia", "Assistant  ", "Human Resources"),   
(5, "Emily Sierra", "Accountant", "Finance"),    
(6, "Greta Galkina", "Accountant", "Finance"), 
(7, "Maria Carter", "Executive", "Human Resources"), 
(8, "Rick Griffin", "Manager", "Marketing"); 




-- TASK 1
SELECT OrderID,ProductID,Quantity,Date FROM Orders;


SELECT * FROM Orders WHERE ClientID = 'Cl1';
EXPLAIN SELECT * FROM Orders WHERE ClientID = 'Cl1';


-- TASK 2
-- ADDING THE ClientID index
CREATE INDEX IdxClientID ON Orders (ClientID);
EXPLAIN SELECT * FROM Orders WHERE ClientID = 'Cl1';
SELECt * FROM Orders WHERE ClientId = 'Cl1';

-- TASK3
SELECT FullName FROM Employees;
-- Required. The number of times to search for the delimiter.
-- Can be both a positive or negative number. If it is a positive 
-- number, this function returns all to the left of the delimiter.
-- If it is a negative number, this function returns all to the
-- right of the delimiter.
SELECT SUBSTRING_INDEX('TANVIR RAHMAN',' ',-1);
SELECT CONCAT(SUBSTRING_INDEX(FullName,' ',-1),' ',SUBSTRING_INDEX(FullName,' ',1)) AS ReverseFullName FROM Employees;

-- alter the table and and a reverseFullName column
DESCRIBE Employees;
ALTER TABLE Employees ADD ReverseFullName VARCHAR(100);

DESCRIBE Employees;

UPDATE Employees 
SET
ReverseFullName = CONCAT(SUBSTRING_INDEX(FullName,' ',-1),' ',SUBSTRING_INDEX(FullName,' ',1));
CREATE INDEX IdxReverseFullName ON Employees (ReverseFullName);
SELECT * FROM Employees;

EXPLAIN SELECT * FROM Employees WHERE FullName LIKE '%Hogan';

EXPLAIN SELECT * FROm Employees WHERE ReverseFullName LIKE 'Hogan%';



EXPLAIN SELECT * FROm Employees WHERE ReverseFullName LIKE 'Hogan%';



-- MYSQL TRANSACTION

SELECT * FROM Orders;
CREATE TABLE IF NOT EXISTS Orders (OrderID INT NOT NULL PRIMARY KEY, ClientID VARCHAR(10), ProductID VARCHAR(10), Quantity INT, Cost DECIMAL(6,2), Date DATE);
CREATE TABLE IF NOT EXISTS Products (ProductID VARCHAR(10), ProductName VARCHAR(100), BuyPrice DECIMAL(6,2), SellPrice DECIMAL(6,2), NumberOfItems INT);
SELECT * FROM Products;
INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfItems) VALUES 
("P1", "Artificial grass bags ", 40, 50, 100), 
("P2", "Wood panels", 15, 20, 250), 
("P3", "Patio slates",  35, 40, 60), 
("P4", "Sycamore trees ", 7, 10, 50), 
("P5", "Trees and Shrubs", 35, 50, 75), 
("P6", "Water fountain", 65, 80, 15);

SELECT * FROM Products;

START TRANSACTION;
INSERT INTO Orders(OrderID,ClientId,ProductId,Quantity,Cost,Date)
VALUES(30,'Cl1','P1',10,500,'2022-09-30');
SELECT * FROM Orders;
-- rollback;

SELECT * FROM Products;
UPDATE Products
SET NumberOfItems = NumberOfItems -10
WHERE ProductID = "P1";
SELECT * FROM Products; 
commit;

SELECT * FROM Orders Limit 1;
SELECT * FROM Products Limit 1;

SELECT O.*,P.* FROM Orders O INNER JOIN Products P
ON O.ProductID = P.ProductID
WHERE O.OrderID = 30; 


SELECT * FROM Orders;



-- Common Table Expression(CTE)
WITH 
avg_sale_2020 AS
	(SELECT AVG(Cost) AS "Average Sale" FROM Orders WHERE YEAR(DATE) = 2020),
avg_sale_2021 AS
	(SELECT AVG(Cost) AS 'Average Sale' FROM Orders WHERE YEAR(DATE) = 2021),
avg_sale_2022 AS
	(SELECT AVG(Cost) AS 'Average Sale' FROM Orders WHERE YEAR(DATE) = 2022)
SELECT * FROM avg_sale_2020
UNION
SELECT * FROM avg_sale_2021
UNION 
SELECT * FROM avg_sale_2022;

-- Prepared Statement
PREPARE GET_ORDER_BY_ORDER_ID
FROM 'SELECT * FROM Orders WHERE OrderID = ? ';

SET @order_id = 10;
EXECUTE GET_ORDER_BY_ORDER_ID USING @order_id;

-- find avg cost of year with prepared statement
PREPARE GET_AVG_COST_BY_YEAR
FROM 'SELECT AVG(Cost) AS "Average Sale" FROM Orders WHERE YEAR(DATE)=?';
SET @year = 2021;
EXECUTE GET_AVG_COST_BY_YEAR USING @year;

CREATE TABLE locations (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,  
    type CHAR(1) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    attr JSON, 
    PRIMARY KEY (id)
);
SHOW CREATE TABLE locations;
INSERT INTO locations (type, name, latitude, longitude, attr) VALUES 
     ('A', 'Cloud Gate', 41.8826572, -87.6233039, 
'{"category": "Landmark", "lastVisitDate": "11/10/2019"}');

SELECT * FROM locations;
SELECT name, latitude, longitude, 
    JSON_VALUE(attr, '$.category') AS food_type
FROM locations
WHERE type = 'A';




-- WORKING WITH JSON IN MYSQL
CREATE TABLE Activity(ActivityID INT PRIMARY KEY,Properties JSON);
DESCRIBE Activity;

INSERT INTO Activity(ActivityID,Properties)
VALUES
(1,'{"ClientID":"Cl1","ProductID":"P1","Order":"True"}'),
(2,'{"ClientID":"Cl2","ProductID":"P2","Order":"False"}'),
(3,'{"ClientID":"Cl3","ProductID":"P3","Order":"True"}');

SELECT * FROM Activity; 
DESCRIBE Activity;

SELECT ActivityID,JSON_VALUE(Properties,'$.ClientID') AS CLIENTID ,JSON_VALUE(Properties,'$.ProductID') AS ProductID,JSON_VALUE(Properties,'$.Order') AS Ord
FROM Activity;

SELECT  COUNT(OrderID) AS "Total number of orders" FROM Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl1" UNION SELECT CONCAT("Cl2: ", COUNT(OrderID), "orders") FROM Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl2" UNION SELECT CONCAT("Cl3: ", COUNT(OrderID), "orders") FROM Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl3"; 

WITH 
t_order_cl1 AS (SELECT COUNT(OrderID) AS "TOTAL NUMBER OF ORDERS" FROM  Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl1"),
t_order_cl2 AS (SELECT COUNT(OrderID) AS "TOTAL NUMBER OF ORDERS" FROM  Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl2"),
t_order_cl3 AS (SELECT COUNT(OrderID) AS "TOTAL NUMBER OF ORDERS" FROM  Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl3")

SELECT * FROM t_order_cl1
UNION
SELECT * FROM t_order_cl2
UNION
SELECT * FROM t_order_cl3;


-- PREPARE GET_AVG_COST_BY_YEAR
-- FROM 'SELECT AVG(Cost) AS "Average Sale" FROM Orders WHERE YEAR(DATE)=?';
SELECT * FROM Orders;

PREPARE GetOrderDetail FROM 'SELECT OrderID,Quantity,Cost,Date FROM Orders WHERE ClientID=? AND YEAR(Date) = ?';
SET @ClientID =  'Cl1';
SET @Year = '2020';
SELECT OrderID,Quantity,Cost,Date FROM Orders WHERE ClientID='Cl1' AND YEAR(Date) = '2020';
EXECUTE GetOrderDetail USING @ClientId , @Year;

SELECT * FROM Activity;

SELECT ActivityID,JSON_VALUE(Properties,'$.ClientID') AS CLIENTID ,JSON_VALUE(Properties,'$.ProductID') AS ProductID,JSON_VALUE(Properties,'$.Order') AS Ord
FROM Activity;

SELECT * FROM Products;

SELECT  P.* FROM Products P
WHERE P.ProductID IN 
(SELECT JSON_VALUE(Properties,'$.ProductID') FROM Activity WHERE JSON_VALUE(Properties,'$.Order') = "True"
);

SELECT JSON_VALUE(A.Properties,'$.ProductID') AS ProductID,P.* FROM Activity A
JOIN Products P
ON JSON_VALUE(A.Properties,'$.ProductID') = P.ProductID
WHERE JSON_VALUE(A.Properties,'$.Order') = 'True';

