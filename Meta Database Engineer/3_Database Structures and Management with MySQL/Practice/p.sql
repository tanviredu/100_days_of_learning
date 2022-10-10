CREATE DATABASE IF NOT exists luckyshrub_db; 
USE luckyshrub_db;
CREATE TABLE employees (
  EmployeeID int NOT NULL,
  EmployeeName varchar(150) DEFAULT NULL,
  Department varchar(150) DEFAULT NULL,
  ContactNo varchar(12) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  AnnualSalary int DEFAULT NULL,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE orders (
  OrderID int NOT NULL,
  Department varchar(100) DEFAULT NULL,
  OrderDate date DEFAULT NULL,
  OrderQty int DEFAULT NULL,
  OrderTotal int DEFAULT NULL,
  PRIMARY KEY (OrderID)
);

CREATE TABLE employee_orders (
 OrderID int NOT NULL,
 EmployeeID int NOT NULL,
 Status VARCHAR(150),
 HandlingCost int DEFAULT NULL,
 PRIMARY KEY (EmployeeID,OrderID),
 FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
 FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);

INSERT INTO employees VALUES 
(1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
(2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@luckyshrub.com',75000), 
(3,'Simon Tolo', 'Marketing', '351930582','Simon.t@luckyshrub.com',40000), 
(4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@luckyshrub.com',45000), 
(5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@luckyshrub.com',35000), 
(6,'Maria Carter', 'Human Resources', '351022508','Maria.c@luckyshrub.com',55000),
(7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);

INSERT INTO orders VALUES(1,'Lawn Care','2022-05-05',12,500),
(2,'Decking','2022-05-22',150,1450),
(3,'Compost and Stones','2022-05-27',20,780),
(4,'Trees and Shrubs','2022-06-01',15,400),
(5,'Garden Decor','2022-06-10',2,1250),
(6,'Lawn Care','2022-06-10',12,500),
(7,'Decking','2022-06-25',150,1450),
(8,'Compost and Stones','2022-05-29',20,780),
(9,'Trees and Shrubs','2022-06-10',15,400),
(10,'Garden Decor','2022-06-10',2,1250),
(11,'Lawn Care','2022-06-25',10,400), 
(12,'Decking','2022-06-25',100,1400),
(13,'Compost and Stones','2022-05-30',15,700), 
(14,'Trees and Shrubs','2022-06-15',10,300), 
(15,'Garden Decor','2022-06-11',2,1250),
(16,'Lawn Care','2022-06-10',12,500), 
(17,'Decking','2022-06-25',150,1450), 
(18,'Trees and Shrubs','2022-06-10',15,400), 
(19,'Lawn Care','2022-06-10',12,500), 
(20,'Decking','2022-06-25',150,1450), 
(21,'Decking','2022-06-25',150,1450); 

INSERT INTO employee_orders 
VALUES(1,3,"In Progress",200), 
(1,5,"Not Recieved",300), 
(1,4,"Not Recieved",250), 
(2,3,"Completed",200), 
(2,5,"Completed",300), 
(2,4,"In Progress",250), 
(3,3,"In Progress",200), 
(3,5,"Not Recieved",300), 
(3,4,"Not Recieved",250), 
(4,3,"Completed",200), 
(4,5,"In Progress",300), 
(4,4,"In Progress",250), 
(5,3,"Completed",200), 
(5,5,"In Progress",300), 
(5,4,"Not Recieved",250), 
(11,3,"Completed",200), 
(11,5,"Completed",300), 
(11,4,"Not Recieved",250), 
(14,3,"Completed",200), 
(14,5,"Not Recieved",300), 
(14,4,"Not Recieved",250); 


SELECT * FROM Orders;
SELECT * FROM Employees;
SELECT * FROM employee_orders;



-- this is the join solution
SELECT DISTINCT E.EmployeeName FROM Employees E
Join employee_orders EO 
On E.EmployeeID = EO.EmployeeID
WHERE EO.Status = 'Completed';

-- (ANY) SOLUTION
-- RETURN BOOLEAN VALUE 
-- AND RETURNS TRUE IF ANY OF THE SUBQUERY VALUES MEET THE CONDITION
-- ANY AND ALL ARE USED IN SUBQUERY
-- IF YOU SURE THAT SUBQUERY RETURNS MULTIPLE VALUE THEN
-- ALL AND ANY COMES
-- ANY -  EKTA MILLEI RETURN TRUE  (EX. SUPPOSE TAKA IS 150 TAKA>ANY(100,200,300,400) SO ONE CONDITION MATCHED SO RETURN TRUE OF THAT values

-- ALL - SOB MILTE HOBE (EX. SUPPOSE TAKA IS 150 TAKA>ALL(100,200,300,400) SO ONE CONDITION IS TRUE THATS IS 100 BUT OTHER IS NOT SO RETURN FALSE  
-- LETS EXPLAIN IT FURTHER


-- IN THE MAIN QUERY AND THE SUBQUERY WITH CONDITION  
-- WHEN SUBQUERY RETURN MULTIPLE VALUE
-- WE USE IN THE MAIN QUERY "IN" AND "NOT IN"
-- BUT WE CAN USE ANY AND ALL

-- ALL

-- PARENT QUERY SELECT NAME FROM SLAR WHERE SALARY >ALL(20000,25000,3000)
-- 
-- IF SALARY IS GREATER THAN ALL OF THEREE VALUE THEN PARENT QUERY WHERE CONDITION WILL TRUE
-- AND NAME WILL BE THERE . REMEMBER ALL HAVE TO BE TRUE

-- THE NAME OF PARENT QUERY WILL BE PRINTED IF  
-- PARENT QUERY SELECT NAME FROM SLAR WHERE SALARY >ANY(20000,25000,3000)
-- iT GREATER THAN ANY THAN PARENT QUERY WHERE IS TRUE



CREATE TABLE SLR(ID INT NOT NULL  AUTO_INCREMENT PRIMARY KEY,NAME VARCHAR(50),SALARY INT);
DESCRIBE SALARY;
INSERT INTO SLR(NAME,SALARY) VALUES
("FNAME1",30000),
("FNAME2",40000),
("FNAME3",25000),
("FNAME4",43000),
("FNAME5",38000),
("FNAME6",25000),
("FNAME7",30000),
("FNAME8",55000);







SELECT E.EmployeeID,E.EmployeeName FROM employees E WHERE E.EmployeeID = ANY(
SELECT EO.EmployeeID from employee_orders EO WHERE EO.Status = "Completed"); 

SELECT * FROM Orders;

SELECT EmployeeID,HandlingCost FROM employee_orders;
SELECT ROUND(OrderTotal/100 * 20) AS pct20Ordertotal FROM orders;

-- Use the ALL operator to identify the IDs of employees who earned a handling 
-- cost of "more than 20% of the order value" from all orders they have handled

USE lucky_shrub;
SELECT * FROM orders;
DESCRIBE ORDERS;
DELETE FROM Orders;
REPLACE INTO orders(OrderID,ClientID,PRoductID,Quantity,Cost) Values(11,'Cl1','P1',15,150);
SELECT * FROM ORders;

-- Two Up update method
-- Replace method can work as a insert method if it dont find anything to replce it
-- replace it or insert it
REPLACE INTO orders(OrderID,ClientID,PRoductID,Quantity,Cost) Values(11,'Cl1','P1',15,500);
SELECT * FROM Orders;
-- thats one way

-- the other way

REPLACE INTO orders Set OrderID = 11,ClientID = 'Cl1',PRoductID='P1',Quantity=100,Cost=150;
SELECT * FROM Orders;



-- CONSTRAINS

-- There are 3 types of constrains:
-- 1)Referential integrity constraint
-- 2)Domain constraint.
-- 3)Key constraint