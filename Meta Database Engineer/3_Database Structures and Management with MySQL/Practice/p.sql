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

-- LIST OF CONSTRAINTS
/*
1) NOT NULL
2) UNIQUE
3) DEFAULT
4) CHECK
5) PRIMARY KEY
6) FOREIGN KEY
*/


/*
WHAT GROUP BY DO IS BREAKS THE 
RESULT OF THE QUERY INTO SUBSETS
AND THEN RUN THE FUNCTIONS(COUNT,MAX,MIN,AVG)
ON INDIVIDUAL SUBSETS 
AND RETURN 1 ROW PER SUBSET 
THATS WHY GROUP BY COLUM MUST APPEAR AFTER
THE SELECT AND FROM AND WHERE 


*/
DESCRIBE `customers`;

INSERT INTO customers(FullName,PhoneNumber)
VALUES
("Tanvir Rahman",00001),
("Tanvir Rahman",00002),
("Tanvir Rahman",00003),
("Aaaron",00004),
("Aaaron",00005),
("Aaaron",00006),
("Hasnat",00007),
("Hasnat",00008),
("Hasnat",00009);
INSERT INTO customers(FullName,PhoneNumber)
VALUES
("Foysal",000010),
("Foysal",000011),
("Foysal",000012),
("Foysal",000013),
("Foysal",000014);



SELECT `customers`.`CustomerId`,
    `customers`.`FullName`,
    `customers`.`PhoneNumber`
FROM `little_lemon`.`customers`;

-- Select it group by name
-- how many phone number 
-- does 4 people has
SELECT Count(PhoneNumber),FullName FROM Customers GROUP BY FullName;
-- remember when agragate function and normal row
-- are in a select statement there will be a group by statement
-- to break the full result into subsets
-- it must happen

-- HAVING CLAUSE IS LIKE A WHERE CALUSE
-- BUT IT ONLY OPERATES ON THE GROUP BY
-- FILTER THE GROUP BY IS THE JOB OF HAVING CLAUSE
SELECT Count(PhoneNumber) AS NUM_OF_PHONE,FullName FROM Customers GROUP BY FullName HAVING (NUM_OF_PHONE > 3);
-- WE GROUP BY THE THE CUSTOMER WITH THE NUMBER OF PHONE NUMBER THEY HAS
-- AND WITH 'HAVING' WE FILTER WHO HAS MORE THAN 3
-- AFTER GROUP BY WHERE CLAUSE WONT WORK YOU HAVE TO USE HAVING
-- AND IF THERE IS NO GROUP BY STATEMENT
-- HAVING WORK LIKE WHERE CLAUSE 

SELECT * FROM Customers HAVING FullName = 'Tanvir Rahman';
-- here we use the having insted of where (not recomended)

-- bulk insert
-- we can take value/values from one o r multiple value and
-- insert into another table in one statement
-- bulk insert from one table and other
-- we can even put filter while inserting

-- create another table for that

CREATE TABLE CUSTOMERS_BACKUP
(
		CustomerId  INT(11)      NOT NULL PRIMARY KEY AUTO_INCREMENT,
        FullName    VARCHAR(100) NOT NULL,
        PhoneNumber INT(11)      NOT NULL UNIQUE

);

-- OR WE CAN JUST MAKE A DUPICATE TABLE WITH THIS COMMAND
-- CREATE TABLE CUSTOMERS_BACKUP LIKE Customers;


-- NOW BULK INSERT WHERE CUSTOMER PHONE NUMBER IS GREATER THAN 5

INSERT INTO CUSTOMERS_BACKUP 
SELECT * FROM Customers C
WHERE C.PhoneNumber >5;

SELECT * FROM CUSTOMERS_BACKUP;
-- it is now stored the value of the customers table having phonenumber 
-- greater than 5


-- 
SELECT DISTINCT FullName FROM CUSTOMERS_BACKUP;

-- we omit one data using not equal to operator '<>' 
SELECT DISTINCT
    FullName
FROM
    CUSTOMERS_BACKUP
WHERE
    FullName <> 'Aaaron';
    
SELECT 
    *
FROM
    CUSTOMERS_BACKUP
WHERE
    PhoneNumber BETWEEN 7 AND 10;

CREATE DATABASE Little_Lemon;
USE Little_Lemon;

-- create a customer table with proper constrains
CREATE TABLE Customers (
    CustomerId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    PhoneNumber INT NOT NULL UNIQUE
);

SHOW COLUMNS FROM Customers;

CREATE TABLE Bookings
(
		BookingID      INT  NOT NULL PRIMARY KEY,
        BookingDate    DATE NOT NULL,
        TableNumber    INT NOT NULL,
        NumberOfGuests INT NOT NULL CHECK(NumberOfGuests <=8),
        CustomerId     INT NOT NULL,
        FOREIGN KEY(CustomerId)
        REFERENCES
        Customers(CustomerId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

SHOW COLUMNS FROM Bookings;




-- Exercise
CREATE TABLE CLIENTS 
(
		CLIENTID    INT NOT NULL PRIMARY KEY,
        FULLNAME    VARCHAR(100) NOT NULL,
        PHONENUMBER INT NOT NULL UNIQUE
);

CREATE TABLE ITEMS
(
		ITEMID   INT NOT NULL PRIMARY KEY,
        ITEMNAME VARCHAR(100) NOT NULL,
        PRICE    DECIMAL(5,2) NOT NULL

);

CREATE TABLE ORDERS
(
	ORDERID  INT NOT NULL PRIMARY KEY,
    CLIENTID INT NOT NULL,
    ITEMID   INT NOT NULL,
    QUANTITY INT NOT NULL CHECK(QUANTITY<=3),
    COST     DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (CLIENTID) REFERENCES CLIENTS(CLIENTID),
    FOREIGN KEY (ITEMID)   REFERENCES ITEMS(ITEMID)
);


-- TO CHANGE THE TABLE THERE IS ALTER TABLE COMMAND 
-- SOME COMMAND IS USED WITH ALTER TABLE COMMAND 
-- MODIFY -- MAKE CHANGES TO SPECFIC COLUMN
-- ADD -- ADD COLUMN TO TABLE
-- DROP -- DROP COLUMN TO A TABLE

-- ALTER TABLE <TABLE_NAME>
-- MODIFY/ADD/DROP <COLUMN_NAME>
-- <DATA TYPE(LENGTH)> <CONSTRAINT>

CREATE TABLE Machinery
(
		EmployeeID  VARCHAR(10),
		FullName    VARCHAR(100),
        County     VARCHAR(100),
        PhoneNumber INT

);

-- DROP TABLE Machinery;

DESCRIBE Machinery;


-- ALTER THE  Table
ALTER TABLE Machinery
		MODIFY EmployeeID  VARCHAR(10)  NOT NULL PRIMARY KEY,
        MODIFY FullName    VARCHAR(100) NOT NULL,
        MODIFY County      VARCHAR(100) NOT NULL,
        MODIFY PhoneNumber INT          NOT NULL UNIQUE;


DESCRIBE Machinery;

ALTER TABLE Machinery 
		ADD COLUMN Age INT CHECK(Age >=18);
        
DESCRIBE Machinery;



-- BACKUP 
-- COPY TABLE
SHOW TABLES;


USE little_lemon;

ALTER TABLE  clients
	ADD COLUMN Location VARCHAR(100) NOT NULL;

SELECT * FROM clients;
DESCRIBE clients;

INSERT INTO clients(CLIENTID,FULLNAME,PHONENUMBER,Location)
VALUES
(1,'Name1','00001','loc1'),
(2,'Name2','00002','loc2'),
(3,'Name3','00003','loc3'),
(4,'Name4','00004','loc4'),
(5,'Name5','00005','loc5');

SELECT * FROM clients;


-- COPY TABLE 
-- 1) FIRST CLIENT TABLE
-- SEE THE TABLE FIRST
--
-- 1) COPY AN EXISTING TABLE'S DATA TO NEW TABLE WITHIN THE SAME DATABASE
-- 2) COPY TO OTHER DATABASE
-- 3) COPY TABLE WITH CONSTRAINTS


SELECT * FROM clients;
-- now we copy the table to another table we can copy all the column with *
-- or we can specfy the column
-- but remember this process does not copy the constraints

CREATE TABLE NEW_CLIENT_TABLE_1 
SELECT * FROM clients;

CREATE TABLE NEW_CLIENT_TABLE_2
SELECT FULLNAME,PHONENUMBER FROM clients
WHERE PHONENUMBER >4;



SELECT * FROM NEW_CLIENT_TABLE_1;
SELECT * FROM NEW_CLIENT_TABLE_2;
DESCRIBE clients;
DESCRIBE NEW_CLIENT_TABLE_1; -- keys are missing

--  we need two steps process to keep the constraints while 
--  copying the table
--  FIRST CREATE NEW TABLE BY COPYING OLD TABLES STRUCTURE(FIRST COPY THE STRUCTURE)
--  THEN INSERT THE DATA

-- THIS WILL
CREATE TABLE NEW_CLIENT_TABLE_3 LIKE clients;

DESCRIBE NEW_CLIENT_TABLE_3;
DESCRIBE clients;

SELECT * FROM NEW_CLIENT_TABLE_3;

-- now insert the value of the clients table 
-- to new one
INSERT INTO NEW_CLIENT_TABLE_3
SELECT * FROM clients;

SELECT * FROM NEW_CLIENT_TABLE_3;


-- Subquery
CREATE  DATABASE LITTLE_LEMON2;
USE LITTLE_LEMON2;

CREATE TABLE Employees
(
		EmployeeID   INT          NOT NULL PRIMARY KEY,
        EmployeeName VARCHAR(100) NOT NULL,
        Role         VARCHAR(100) NOT NULL,
        AnnualSalary INT          NOT NULL

);

INSERT INTO Employees
(EmployeeID,EmployeeName,Role,AnnualSalary)
VALUES
(1,'Mario Gollini','Manager',70000),
(2,'Adrian Gollini','Assistant Manager',65000),
(3,'Giorgos Dioudis','Head Chef',50000),
(4,'Fatma Kaya','Assistant Chef',45000),
(5,'Elena Salvai','Head Waiter',40000),
(6,'John Miller','Receptionist',35000);

SELECT * FROM Employees;

-- NOW IDENTIFY WHICH EMPLOYEES EARN SALARY
-- HIGHER THEN ASSISTANT CHEF
-- DO IT WITH SUBQUERY

SELECT * FROM Employees  
WHERE AnnualSalary 
>(SELECT AnnualSalary FROM Employees WHERE Role = 'Assistant Chef');

-- SUB QUERIES AND COMPLEX DATA RETRIVAL

-- OPERATORS
-- ANY
-- ALL
-- SOME
-- EXISTS
-- NOT EXISTS


-- CHALLANGE 
-- IDENTIFY ALL EMPLOYEES WHOSE ANUAL SALARY IS LESS THAN OR EQUAL
-- THE EMPLOYEES WHO HAS ROLE 'MANAGER','ASSISTANT MANAGER','HEAD CHEF','HEAD WAITER'

SELECT * FROM Employees WHERE AnnualSalary <= ALL(SELECT AnnualSalary from Employees WHERE Role IN('Manager','Assistant Manager','Head Chef','Head Waiter'));

-- THIS QUERY RETURN TWO PERSON . THAT MEANS THIS TWO PERSON HAVE LESS OR EQUAL
-- THEN THE ALL EMPLOYEE WORKING AS 'MANAGER','ASSISTANT MANAGER','HEAD CHEF','HEAD WAITER'

-- CHALLANGE 
-- IDENTIFY ALL EMPLOYEES WHOSE ANUAL SALARY IS GREATER THAN OR EQUAL TO ANY
-- EMPLOYEES WHO HAS ROLE 'MANAGER','ASSISTANT MANAGER','HEAD CHEF','HEAD WAITER'

SELECT * FROM Employees WHERE AnnualSalary >= ANY(SELECT AnnualSalary from Employees WHERE role IN ('Manager','Assistant Manager','Head Chef','Head Waiter'));

CREATE TABLE Bookings
(
		BookingID         INT NOT NULL PRIMARY KEY,
        TableNO           INT NOT NULL,
        GuestFirstName    VARCHAR(100),
        GuestLastName     VARCHAR(100),
        BookingSlot       DATETIME,
        EmployeeID        INT
        
);

INSERT INTO Bookings(BookingID,TableNO,GuestFirstName,GuestLastName,BookingSlot,EmployeeID)
VALUES (1,12,'Anna','Iversion','2022-12-23',1);
INSERT INTO Bookings(BookingID,TableNO,GuestFirstName,GuestLastName,BookingSlot,EmployeeID)
VALUES (2,12,'joakim','Iversion','2022-12-23',1),
(3,19,'Venesa','Mckarthy','2022-12-23',3),
(4,15,'Macros','Romio','2022-12-23',4),
(5,5,'Hiroki','Yamne','2022-12-23',2),
(6,8,'Diana','Pinto','2022-12-23',5);
		

SELECT * FROM Bookings;
-- find if the HeadChef and Head waiter are in the booking or not
-- in subquery
-- sub query will return true and false
-- and exists work in true and false
-- this is a co related query
-- for each of the inner query out query will run

SELECT 
    *
FROM
    Employees E
WHERE
    EXISTS( SELECT 
            *
        FROM
            Bookings B
        WHERE
            B.EmployeeID = E.EmployeeID
                AND Role IN ('Head Chef' , 'Head Waiter'));

-- in the sub query 1) first check if the employee id there 
--  				2) then it checks  if he in the ('Head Chef','Head Waiter')
--                  3) if true then outer query print the employee details of that iteration

-- the other way around
SELECT 
    *
FROM
    Employees E
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            Bookings B
        WHERE
            B.EmployeeID = E.EmployeeID
                AND Role IN ('Head Chef' , 'Head Waiter'));



-- creating view
-- syntax

-- CREATE VIEW <VIEW_NAME> AS
-- QUERY FROM TABLE WHERE CONDITION

-- RENAME THE  TABLE (NORMAL AND VIRTUAL)
-- RENAME TABLE <OLD_NAME> TO <NEW_NAME>
-- REMOVE VIEW
-- DROP VIEW <VIEW_NAME>


-- ------------------MYSQL FUNCTION -------------------
CREATE TABLE Employees2
(
		EmployeeID   INT          NOT NULL PRIMARY KEY,
        EmployeeName VARCHAR(100) NOT NULL,
        Role         VARCHAR(100) NOT NULL,
        AnnualSalary DOUBLE          NOT NULL

);

INSERT INTO Employees2
(EmployeeID,EmployeeName,Role,AnnualSalary)
VALUES
(1,'Mario Gollini','Manager',70000.123342),
(2,'Adrian Gollini','Assistant Manager',65000.214231),
(3,'Giorgos Dioudis','Head Chef',50000.346546),
(4,'Fatma Kaya','Assistant Chef',45000.3452),
(5,'Elena Salvai','Head Waiter',40000.3425),
(6,'John Miller','Receptionist',35000.456);


SELECT * FROM Employees2;



-- SEPARATE TEST BEFORE CREATING TRIGGER
-- SUBSTRING(string, startindex, length)
SELECT SUBSTRING("tanVIR",2,2);
SELECT UPPER(SUBSTRING("tanVIR",1,1));
SELECT SUBSTRING("tanVIR",2,LENGTH("tanvVIR"));
SELECT LOWER(SUBSTRING("tanVIR",2,LENGTH("tanvIR")));
SELECT CONCAT(UPPER(SUBSTRING("tanVIR",1,1)),LOWER(SUBSTRING("tanVIR",2,LENGTH("tanVIR"))));




-- MYSQL HAS 5 TYPES OD FUNCTION
/*
	1) NUMERIC FUNCTIONS
		*) AGGRAGATE FUNCTION
			->SUM()
            ->AVG()
            ->MAX()
            ->MIN()
            ->COUNT()
            
        *) MATH FUNCTION
			->ROUND()
				
            ->MOD()
    2) STRING FUNCTIONS
    3) DATE FUNCTIONS
    4) COMPARISON FUNCTIONS
    5) CONTROL FLOW FUNCTIONS

*/


-- ROUND FUNCTION 
SELECT * FROM Employees2;
SELECT AnnualSalary FROM Employees2;
-- now round it to two decimal point
SELECT AnnualSalary, ROUND(AnnualSalary,2) AS ROUNDED FROM Employees2;

-- MATH MOD FUNCTION
SELECT AnnualSalary,MOD(ROUND(AnnualSalary),2) AS MODVALUE FROM Employees2;
SELECT MOD(ROUND(111),2) AS MODVALUE;

-- create a procedure to get the rounded value
-- input a big decimal
-- output rounded 2 decimal

DELIMITER //
CREATE PROCEDURE CONVERT_ROUNDED(IN INPUTNUM DOUBLE,OUT OUTPUTNUM DOUBLE)
BEGIN
	SELECT ROUND(INPUTNUM,2) INTO OUTPUTNUM;
END//
DELIMITER ;


-- FORMAT NAME 
SELECT CONCAT(UCASE(SUBSTR('taAvir',1,1)),LCASE(SUBSTR('taAvir',2,LENGTH('taAvir'))));


-- DATE FUNCTION
SELECT CURRENT_DATE();
SELECT CURRENT_TIME();
SELECT CURRENT_TIMESTAMP();
SELECT DATE_FORMAT('1993-12-23',"%a");
SELECT DATE_FORMAT('1993-12-23',"%M");
SELECT DATE_FORMAT('1993-12-23',"%Y");
SELECT DATE_FORMAT('1993-12-23',"%c");
SELECT DATE_FORMAT('1993-12-23',"%D %M");

SELECT DATEDIFF('2022-10-16','1993-12-23');

-- make a stored procedure with that
SELECT DATE_FORMAT('1993-12-23',"%D %M");

DELIMITER //
CREATE PROCEDURE DATE_CONVERSION(IN DATE_Y_M_D VARCHAR(100),OUT OUTPUT VARCHAR(100))
BEGIN 
	SELECT DATE_FORMAT(DATE_Y_M_D,"%D %M") INTO OUTPUT;
END//
DELIMITER ;

CALL DATE_CONVERSION('1993-12-23',@out);
SELECT @out;

/*
Format	Description
%a	Abbreviated weekday name (Sun to Sat)
%b	Abbreviated month name (Jan to Dec)
%c	Numeric month name (0 to 12)
%D	Day of the month as a numeric value, followed by suffix (1st, 2nd, 3rd, ...)
%d	Day of the month as a numeric value (01 to 31)
%e	Day of the month as a numeric value (0 to 31)
%f	Microseconds (000000 to 999999)
%H	Hour (00 to 23)
%h	Hour (00 to 12)
%I	Hour (00 to 12)
%i	Minutes (00 to 59)
%j	Day of the year (001 to 366)
%k	Hour (0 to 23)
%l	Hour (1 to 12)
%M	Month name in full (January to December)
%m	Month name as a numeric value (00 to 12)
%p	AM or PM
%r	Time in 12 hour AM or PM format (hh:mm:ss AM/PM)
%S	Seconds (00 to 59)
%s	Seconds (00 to 59)
%T	Time in 24 hour format (hh:mm:ss)
%U	Week where Sunday is the first day of the week (00 to 53)
%u	Week where Monday is the first day of the week (00 to 53)
%V	Week where Sunday is the first day of the week (01 to 53). Used with %X
%v	Week where Monday is the first day of the week (01 to 53). Used with %x
%W	Weekday name in full (Sunday to Saturday)
%w	Day of the week where Sunday=0 and Saturday=6
%X	Year for the week where Sunday is the first day of the week. Used with %V
%x	Year for the week where Monday is the first day of the week. Used with %v
%Y	Year as a numeric, 4-digit value
%y	Year as a numeric, 2-digit value
*/


-- ________________COMPARISON FUNCTION______________

-- FIRST REMEMBER MAX(),MIN()  ARE COLUMN FUNCTION
-- THEY FIND THE MAX VALUE AND MIN VALUE IN THE COLUMN
-- BUT SUPPOSE INA TTABLE THERE ARE TWO DIFFERENT COLUM
-- AND PRICE1 AND PRICE2
-- A RECORD/ROW HAS VALUE IN PRICE1 AND PRICE2
-- IF YOU WANT THE ROW BASE CALCULATION WHICH ONE IS
-- MAXIMUN AND WHICH ONE IS MINIMUM THEN 
-- THREE ROW BASE COMPARISON FUNCTION

-- GREATEST();
-- LEAST();
-- ISNULL();
CREATE TABLE AUDITTABLE (
    ItemID INT NOT NULL PRIMARY KEY,
    INV_INCOME1 DECIMAL NOT NULL,
    INV_INCOME2 DECIMAL NOT NULL,
    INV_INCOME3 DECIMAL NOT NULL,
    INV_INCOME4 DECIMAL NOT NULL
);




DELIMITER //
CREATE PROCEDURE INSERTAUDITTABLE(IN VItemID INT,IN VINV_INCOME1 DOUBLE,IN VINV_INCOME2 DOUBLE,IN VINV_INCOME3 DOUBLE,IN VINV_INCOME4 DOUBLE)
BEGIN
	INSERT INTO AUDITTABLE(ItemID,INV_INCOME1,INV_INCOME2,INV_INCOME3,INV_INCOME4)
	VALUES
    (VItemID,VINV_INCOME1,VINV_INCOME2,VINV_INCOME3,VINV_INCOME4);
END//
DELIMITER ;

CALL INSERTAUDITTABLE(1,125000.00,500000.00,100000.00,138000.00);

CALL INSERTAUDITTABLE(2,30000.00,200000.00,100000.00,35000.00);
CALL INSERTAUDITTABLE(3,30000.00,1500000.00,23000.00,29000.00);
CALL INSERTAUDITTABLE(4,28000.00,700000.00,17000.00,110000.00);
CALL INSERTAUDITTABLE(5,100000.00,350000.00,84000.00,52000.00);
CALL INSERTAUDITTABLE(6,90000.00,540000.00,85000.00,95000.00);

SELECT * FROM AUDITTABLE;
SELECT ItemID,INV_INCOME1,INV_INCOME2,INV_INCOME3,INV_INCOME4 FROM AUDITTABLE;
SELECT ItemID,GREATEST(INV_INCOME1,INV_INCOME2,INV_INCOME3,INV_INCOME4) AS HEIGHST_INCOME, LEAST(INV_INCOME1,INV_INCOME2,INV_INCOME3,INV_INCOME4) AS LOWEST_INCOME FROM AUDITTABLE;

-- ____________________CONTROL FLOW(IF ELSE CONDITION) IN SQL_____________________________

-- syntax


SELECT * FROM AUDITTABLE;

SELECT ItemID,
	CASE
		WHEN LEAST(INV_INCOME1,INV_INCOME2,INV_INCOME3,INV_INCOME4) >= 230 THEN "LOSS"
	    ELSE "Profit"
    END AS PROFIT_OR_LOSS
FROM  AUDITTABLE;

/*
CASE
	WHEN<condition> THEN <result>,
    WHEN<condition> THEN <result>,
    WHEN<condition> THEN <result>,
    WHEN<condition> THEN <result>,.
    ....
    ELSE result
    
END AS ALIAS

*/

