-- INNER JOIN,OUTER JOIN,CROSS JOIN,
-- UNION,UNION ALL,
-- SUBQUERY,
-- WHEN USE JOIN AND WHEN USE SUBQUERY   
use sakila;

-- CREATE 2 TABLE
CREATE TABLE table1
(Id INT,Value VARCHAR(10));
CREATE TABLE table2
(Id INT,Value VARCHAR(10));

-- INSERT VALUE 
INSERT INTO table1(Id,Value) VALUES
(1,'First'),
(2,'Second'),
(3,'Third'),
(4,'Fourth'),
(5,'Fifth');

INSERT INTO table2(Id,Value) VALUES
(1,'First'),
(2,'Second'),
(3,'Third'),
(6,'Six'),
(7,'Seven'),
(8,'Eight');


SELECT * FROM table1;
SELECT * FROM table2;


-- INNER JOIN and equi JOIN

SELECT t1.*,t2.*
FROM table1 t1
INNER JOIN table2 t2
ON t1.Id = t2.Id;


-- MYSQL DONT SUPPORT FULL FULL OUTER JOIN
-- BUT WE CAN DO THAT WITH 
-- LEFT JOIN ,RIGHT JOIN, AND UNION



-- LEFT OUTER JOIN/LEFT JOIN

-- WHAT IS LEFT JOIN
-- SUPPOSE THERE IS TWO TABLE 
-- LEFT TABLE AND RIGHT TABLE
-- THINK ABOUT LIKE A SET
-- SET A REPREESENT TABLE A 
-- SET B REPRESENT TABLE B
-- THERE ARE COMMON PART AUB(A INTERSECTION B)
-- LEFT OUTER JOIN  RETURN THE COMPLETE LEFT TABLE AND THE COMMON PART
-- IF THERE IS NO COMMON PART THEN VALUE WILL BE NULL


-- THIS IS LEFT JOIN
SELECT t1.*,t2.*
FROM table1 AS t1
LEFT JOIN table2 t2
ON t1.Id = t2.Id;

-- ALL VALUE FROM THE TABLE 1
-- COMMON VALUE FROM THE TABLE 2
-- LEFT JOIN IS LEFT OUTER JOIN

SELECT t1.*,t2.*
FROM table1 AS t1
LEFT OUTER JOIN table2 t2
ON t1.Id = t2.Id;


-- RIGHT JOIN
-- ALL VALUE FROM TABLE 2
-- COMMON VALUE FROM TABLE1
-- RIGHT JOIN IS RIGHT OUTER JOIN

SELECT t1.*,t2.*
FROM table1 AS t1
RIGHT JOIN table2 t2
ON t1.Id = t2.Id;


-- IF YOU SWAP THE TABLE IN
-- THE LEFT JOIN YOU CAN GENERATE A RIGHT JOIN

SELECT t2.*,t1.*
FROM table2 AS t2
LEFT JOIN table1 t1
ON t2.Id = t1.Id;

-- LEFT JOIN IS THE MOST IMPORTANT JOIN FOR DEVELOPER

-- FULL OUTER JOIN
-- LEFT JOIN U RIGHT JOIN
-- TAKE BOTH LEFT AND RIGHT JOIN AND UNION THEM
-- YOU GET FULL OUTER JOIN

(SELECT t1.*,t2.*
FROM table1 AS t1
LEFT OUTER JOIN table2 t2
ON t1.Id = t2.Id)
UNION
(SELECT t1.*,t2.*
FROM table1 AS t1
RIGHT JOIN table2 t2
ON t1.Id = t2.Id);

-- THIS IS THE FULL OUTER JOIN

-- CROSS JOIN

-- CROSS JOIN IS A KARTESIAN JOIN
-- CROSS JOIN NEED NO  CLAUSE
-- EACH ROW OF TABLE 1 WILL BE MULTIPLIED BY EVERY ROW ON TABLE2
-- THIS IS CALL CROSS JOIN
-- TABLE 1 HAS 5 ROW
-- TABLE 2 6 ROW
-- AFTER CROSS JOIN TOTAL ROW IS 5*6 = 30 ROW
SELECT t1.*,t2.*
FROM table1 AS t1
CROSS JOIN table2 t2;


-- POP QUIZE

CREATE TABLE Students(StudentId INT,StudentName VARCHAR(50));

INSERT INTO Students(StudentId,StudentName) VALUES(1,'John');
INSERT INTO Students(StudentId,StudentName) VALUES(2,'Matt');
INSERT INTO Students(StudentId,StudentName) VALUES(3,'James');

SELECT * FROM Students;


CREATE TABLE Classes(ClassId INT,ClassName VARCHAR(50));

INSERT INTO Classes(ClassId,ClassName) VALUES(1,'Maths');
INSERT INTO Classes(ClassId,ClassName) VALUES(2,'Arts');
INSERT INTO Classes(ClassId,ClassName) VALUES(3,'History');

SELECT * FROM CLasses;



CREATE TABLE StudentClass(StudentId INT,ClassId INT);

INSERT INTO StudentClass(StudentId,ClassId) VALUES(1,1);
INSERT INTO StudentClass(StudentId,ClassId) VALUES(1,2);
INSERT INTO StudentClass(StudentId,ClassId) VALUES(3,1);
INSERT INTO StudentClass(StudentId,ClassId) VALUES(3,1);
INSERT INTO StudentClass(StudentId,ClassId) VALUES(3,1);


-- WHAT WILL BE THE BEST POSSIBLE JOIN IF WE WANT TO RETRIEVE
-- ALL STUDENTS WHO HAVE SIGNED UP FOR THE CLASSES IN SUMMER

-- WHAT WILL BE BEST POSSIBLE JOIN IF WE WANT TO RETRIVE ALL 
-- THE STUDENTS WHO HAVE SIGNED UP FOR NO CLASS 
-- IN SUMMER


-- solution 1
-- table 3 studentClass is the only table where 
-- which student took which class information is saved
-- if you take the table and join with the stuydent table to get the name
-- and join with the class table to get the class name will be the ans 
-- start with the studentclass table

SELECT st.StudentName,cs.ClassName 
FROM studentclass sc
INNER JOIN Students st on st.StudentId = sc.StudentId
INNER JOIN classes cs on cs.ClassId = sc.ClassId;


-- solution two find the student who does not take any class
-- 1) question says find the students so base table is students
-- 2) we left join with studentclass so that we find the corresponding classId
-- That student have and also null where student dont take any class
-- 3) That null row in classId is our result so add a where class
-- 4) filter the row where classid is null thats our student take no classes

SELECT st.StudentName,st.StudentId FROM Students st
LEFT JOIN studentclass sc On st.StudentId = sc.StudentId
WHERE sc.ClassId IS NULL; 




-- SELF JOIN
-- SELF JOIN IS WHEN A TABLE JOIN WITH ITSELF(ANOTHER COPY OF ITSELF)
-- SUPPOSE YOU HAVE AN EMPLOYEE TABLE
-- AND THAT HAS EMPOYEEID,EMPOYEENAME
-- BUT IS ALSO HAVE A COLUMN CALLED SUPERVISERID
-- NOW SUPERVISOR IS ALSO AN EMPLOYEE 
-- IF YOU HAVE TO FIND THE EMPLOYYE AND HIS SUPERVISER YOU HAVE 
-- TO A SELF JOIN

USE sakila;
CREATE TABLE IF NOT EXISTS Empoyee(
	EmployeeId INT PRIMARY KEY,
    Name VARCHAR(30),
    ManagerId INT
);

INSERT INTO Empoyee(EmployeeId,Name,ManagerId)
VALUES
(1,'Mike',3),
(2,'Devid',3),
(3,'Roger',NULL),
(4,'Marry',2),
(5,'Joseph',2),
(6,'Ben',2);


-- ROGER HAS NOT MANAGER BECAUSE HE IS THE TOP MANAGER
-- WE HAVE TO KEEP IN MIND THAT
-- MIKE AND DEVID ARE UNDER ROGER
-- MARRY JOSEPH AND BEN  ARE UNDER DEVID

SELECT * FROM empoyee;

SELECT e1.EmployeeId, e1.Name AS EmployeeName,e2.Name AS ManagerName FROM empoyee e1
INNER JOIN Empoyee e2
ON e1.ManagerId = e2.EmployeeId;


SELECT e1.EmployeeId, e1.Name AS EmployeeName,IFNULL(e2.Name,'Top Manager') AS ManagerName FROM empoyee e1
LEFT JOIN Empoyee e2
ON e1.ManagerId = e2.EmployeeId;

-- EXPLANATION OF THE CODE

-- HERE YOU SELECT THE EMPLOYEEID AND EMPLOYEE NAME FROM THE E1 TABLE
-- WHICH IS A EMPLOYEE TABLE
-- THEN JOIN WITH THE E2 WHICH IS ALSO EMPLOYEE TABLE 
-- AND TRY TO FETCH NAME BUT THIS TIME THAT NAME 
-- IS THE MANAGER NAME AND HOW YOU FIND THE MANAGER NAME
-- YOU TAKE THE MANAGER_ID FROM THE E1 TABLE AND MATCH WITH THE
-- EMPLOYEE TABLE AND THEN MATCH IT WITH THE EMPLOYEE_ID OF THE E2 TABLE
-- THEN WITH THIS RELATION WE FETCH THE NAME 
-- ------------------------------------------------------------------------

-- USING KEYWORD FOR JOINNING TWO TABLE 
-- -------------NOT RECOMENDED-------------------
-- WE ARE WORKING WITH TWO TABLE

SELECT t1.*,t2.* 
FROM table1 t1
INNER JOIN table2 t2
USING(Id);

SELECT t1.*,t2.*
FROM table1 t1
INNER JOIN table2 t2
USING(Id,Value);

-- IT MEANS WITH THE ID IN BOTH TABLE YOU WILL 
-- PERFORM THE JOIN
SELECT t1.*,t2.* 
FROM table1 t1
INNER JOIN table2 t2 
ON t1.Id = t2.Id AND t1.Value = t2.Value;


-- UNION AND UNION ALL
-- BEFORE UNION OR  UNION ALL
-- YOU MUST KNOW THAT
-- EACH SELECT STATEMENT OF UNION OPERATOT MUST HAVE THE SAME NUMBER 
-- OF COLUMN
-- IF YOU USE UNION IT WILL REMOVE THE DUPLICATE VALUE TABLE (A UNION B) = A+B-(A INSECTION B)
-- BUT IN UNION ALL IT WONT REMOVE THE DUPLICATE (A UNION B) = A+B 


SELECT * FROM table1;
SELECT * FROM table2;

-- NO DUPLICATE
SELECT * FROM table1
UNION
SELECT * FROM table2
ORDER BY Value;

-- WITH DUPLICATE

SELECT * FROM table1
UNION ALL
SELECT * FROM table2;



-- SUB QUERY
-- USE SAKILA DATABASE 
-- FIND CUSTOMERS WHO LIKE TO WATCH ACTION MOVIES
USE sakila;


SELECT category_id,Name FROM category;
SELECT category_id FROM category WHERE Name = 'Action'; -- result 1
SELECT * from film_category;
SELECT film_id FROM film_category WHERE category_id = 1;
SELECT COUNT(*) FROM film_category WHERE category_id = 1; -- 64 action film
SELECT * FROM inventory; -- all the inventory
SELECT COUNT(*) FROM inventory WHERE film_id IN(SELECT film_id FROM film_category WHERE category_id = 1);
SELECT * FROM rental WHERE inventory_id IN(SELECT inventory_id FROM inventory WHERE film_id IN(SELECT film_id FROM film_category WHERE category_id = 1));
SELECT customer_id FROM rental WHERE inventory_id IN(SELECT inventory_id FROM inventory WHERE film_id IN(SELECT film_id FROM film_category WHERE category_id = 1));
SELECT * FROM customer where customer_id IN(SELECT customer_id FROM rental WHERE inventory_id IN(SELECT inventory_id FROM inventory WHERE film_id IN(SELECT film_id FROM film_category WHERE category_id = 1)));
SELECT CONCAT(first_name,' ',last_name) AS FULLNAME  FROM customer  where customer_id IN(SELECT customer_id FROM rental WHERE inventory_id IN(SELECT inventory_id FROM inventory WHERE film_id IN(SELECT film_id FROM film_category WHERE category_id = 1)));


-- THIS CAN BE ALSO ACHIEVED WITH THE JOIN QUERY
-- BUT NOT ALL FOR EXAMPLE THIS CANT BE DONE WITH JUST 
-- JOIN QUERY





-- EASY QUERY COMPLETELY UNDERSTAND
SELECT fm.title,cat.name,dt.COUNT_OF_CATEGORY FROM film fm
INNER JOIN film_category fc
ON fm.film_id = fc.film_id
INNER JOIN category cat 
ON fc.category_id = cat.category_id
INNER JOIN
	(
		SELECT COUNT(*) AS COUNT_OF_CATEGORY,fc.category_id FROM film_category fc
		GROUP BY fc.category_id

	) AS dt ON dt.category_id = fc.category_id;
;

-- WE GETTHE TITLE FROM THE FROM THE FILM -- PART 1 EASY
-- NOW WE NEED THE CATEGORY WHICH IS IN THE CATEGORY TABLE
-- YOU CANT GET THE CATEGORY NAME FROM THE FILM TABLE DIRECTLY
-- YOU NEED TO GO THROUGH THE FILMMCATEGORY TABLE
-- SO JOIN FILM CATEGORY YOU GOT THE CATEGORY ID OF THE FILM ID
-- THEN JOIN CATEGORY AND GET THE NAME -- PART 2 EASSY

-- NOW WE NEED THE TOTAL AMMOUNT OF MOVIE OF THAT CATEGORY
-- SO WE NEED A TABLE THAT HAS TWO PROPERTIES
-- 1) SUM OF THE MOVIE
-- 2) CATEGORY ID
-- WE MAKE A SUB QUERY FOR COUNT(ROW) FROM FILM_CATEGORY GROUP BY CATEGORY ID
--  THAT MEANS RETURN TOTAL NUMBER OF ROW OF EACH CATEGORY ID
-- THEN ALIAS THE WHOLE TABLE AS DT AND THEN 
-- ON CONDITION FOR INNER JOIN WITH CATEGORY ID OF INSIDE DT.CATEGORYID = FC CATEGORY




-- CORRELATED SUBQUERY
-- EASY
-- FOR EVERY CUSTOMER INSIDE SUBQURY WILL RUN AND RETUEN A AVERAGE PAYMENT
SELECT POUTER.PAYMENT_ID,CUS.CUSTOMER_ID,AMOUNT,CONCAT(CUS.first_name,' ',last_name) AS NAME FROM PAYMENT POUTER
JOIN CUSTOMER CUS ON POUTER.customer_id = CUS.customer_id
WHERE AMOUNT >(SELECT AVG(PINNER.AMOUNT) AS AVERAGE_PAYMENT FROM PAYMENT PINNER WHERE 
PINNER.CUSTOMER_ID = POUTER.CUSTOMER_ID );



-- CONVERSION BETWEEN SubQuery AND join
-- SELECT VALUE THAT ARE IN TABLE1 AND NOT IN TABLE2
-- WITH SUBQUERY

SELECT t1.* FROM table1 t1 WHERE t1.Id NOT IN (SELECT t2.Id FROM table2 t2);

SELECT t1.Id,t1.Value FROM table1 t1 LEFT JOIN table2 t2
ON t1.Id = t2.Id 
WHERE t2.Id IS NULL;

-- FIND ASCII VALUE
SELECT ASCII('a'),ASCII('A');

-- LENGTH OF A STRING
SELECT LENGTH("My Name is Tanvir Rahman"); -- 24
SELECT LENGTH("   "); -- 3 
SELECT CONCAT('tanvir',' ','rahman');


-- SAME WORK IN TWO FUNCTIOPN
SELECT UPPER("tanvir");
SELECT UCASE('tanvir');


SELECT LOWER('TANVIR');
SELECT LCASE('TANVIR');

SELECT LEFT("LOREM IPSUM DOLOR SIT AMET",4);
SELECT RIGHT("LOREM IPSUM DOLOR SIT AMET",4);

SELECT LENGTH(TRIM("  Tanvir Rahman  "));
SELECT LENGTH(RTRIM("  Tanvir Rahman  "));
SELECT LENGTH(LTRIM("  Tanvir Rahman  "));

SELECT STRCMP('Tanvir','Tanvir'); -- IF ZERO THEN MATCHED 
SELECT STRCMP('Tanvir','Tanvir'); -- IF NOT ZERO THEN NOT MATCHED

SELECT CONCAT(first_name,' ',last_name) AS FULL_NAME,
	   REVERSE (CONCAT(first_name,' ',last_name)) AS REVERSE_FULL_NAME
FROM sakila.actor;

SELECT DEGREES(PI());
SELECT DEGREES(PI()/2);
SELECT ROUND(POW(3,3)+2.79999999,2);
SELECT FLOOR(POW(3,3)+2.79999999);
SELECT CEIL(POW(3,3)+2.79999999);

SELECT current_date(),current_time(),current_timestamp();
SELECT NOW(),DATE(NOW()),TIME(NOW()),YEAR(NOW()),MONTH(NOW()),DAYNAME(NOW());



-- -------------------------CONTROL FLOW FUNCTION ------------------------
-- CASE;
-- IF();
-- IFNULL();
-- NULLIF();


-- Syntax is
-- SET @variable = value
-- SELECT CASE 
-- WHEN @variable  = value THEN new_value
-- ELSE value
-- END
-- AS OUTPUTCOLUMNNAME 

SET @var = 1;
SELECT CASE
WHEN @var = 1 THEN 'one'
WHEN @var = 2 THEN 'two'
ELSE 'more'
END
AS RESULT;


SET @VAR1 = 11;
SET @VAR2 = 12;

-- THIS IS THE SWITCH CASE STATEMENT IN SQL LANGUAGE

SELECT CASE
WHEN (@VAR1 = 11 AND @VAR2 = 13) THEN 'ONE'
WHEN @VAR2 = 12 THEN 'TWO'
ELSE 'MORE'
END
AS RESULT;


-- THIS IS THE IF ELSE STATEMENT IN SQL LANGUAGE
-- IF(CONDITION,IF_TRUE_THEN,IF_FALSE_THEN)
SELECT IF(1 < 2 ,'CORRECT','INCORRECT');

-- THIS STATEMENT IS VERY IMPORTANT 
SELECT IF(YEAR(NOW())=2022,'CORRECT','INCORRECT');

-- IFNULL() IS THE MOST IMPORTANT 
-- IFNULL(VALUE/NULL,VALUE)
-- IF THE FIRST ARGUMENT IS NULL THEN RETURN THE SECOND VALUE
-- IF FIRST ARGUMENT IS NOT NULL THEN RETURN THE FIRST VALUE

-- LETS HAVE AN EXAMPLE

SELECT * FROM STUDENTS;
SELECT * FROM CLASSES;
SELECT * FROM  studentclass;
-- PROBLEM
-- WITH THIS THREE TABLE FIND THE 
SELECT S.STUDENTNAME,IFNULL(SC.ClassId,'ABSENT'),IFNULL(C.CLASSNAME,'ABSENT') FROM STUDENTS S
LEFT JOIN studentclass SC
ON S.STUDENTID = SC.StudentId
LEFT JOIN CLASSES AS C
ON C.CLASSID = SC.CLASSID;


-- -----------------------TYPE CONVERT-------------------





-- ------------------------------------------------------------



-- ----------------------------------------------------------------
SELECT CURRENT_USER();
SELECT USER();
SELECT DATABASE();
SELECT VERSION();
SELECT RAND();
SELECT IS_IPV4('10.0.0.1');
SELECT IS_IPV4('10.0.0.1.1');
SELECT IS_IPV4('192.168.0.10');
SELECT IS_IPV6('2001:db8::8a2e:370:7334');
SELECT IS_IPV6('2001:db8::8a2e7');
SELECT UUID();
SELECT UUID_SHORT();
-- -----------------------------AGGREGATE FUNCTION-----------------------------------
-- AGGRATE FUNCTION OPERATES ON A SERIES OF VALUE AND RETURN SINGLE VALUE
-- IT IS KNOWN AS COLUMN FUNCTION.AS IT TYPICALLY WORKS ON VALUE OF COLUMN
-- AVG() , SUM() ,MIN(), MAX(), COUNT()
-- THESE ARE AGGARGATE FUNCTION

-- IF AGGRAGATE FUNCTION AND A NON AGGRATE COLUMN ARE IN A SELECT STATEMENT 
-- WE NEED TO USE GROUP_BY() FUNCTION
-- ---------------------------------------------------------------------

SELECT COUNT(*) from sakila.rental Where customer_id = 130;


-- how much rental is taken with customer
-- max() will return 
Select Count(*) AS NUMBER_OF_RENTAL,customer_id from sakila.rental GROUP BY customer_id;

-- find the latest rental
select max(rental_date),customer_id from sakila.rental GROUP BY customer_id;

SELECT AVG(AMOUNT) AVG_PAYMENT,SUM(AMOUNT) TOTAL_SPEND,COUNT(RENTAL_ID) TOTAL_NUMBER_RENTALS,CUSTOMER_ID
FROM PAYMENT
GROUP BY CUSTOMER_ID;
-- --------------------------------------------------------------------------------------------------------------
-- ------------------------  VIEWS ----------------------------------------------------------
-- IN REAL LIFE WE HAVE TO QUERY FROM MULTIPLE TABLE 
-- AND THE QUERY GET VERY COMPLICATED AND BIG
-- IF WE HAVE TO USE IT MORE THAN ONE PLACE THEN WE NEED
-- TO WRITE THE SAME QUERY AGAIN AND AGAIN

-- UNLESS YOU USE VIEWS
-- YOU CAN MAKE A VIEW WITH THE QUERY
-- AND THEN QUERY WITH THAT VIEW
-- THATS WHY IT IS CALLED VIRTUAL TABLE
-- YOU CAN READ THE DATA JOIN WITH OTHER TABLE
-- BUT IF YOU WANT TO INSERT THE DATA THIS VIEW SHOULD CME FROM
-- ONLY ONE BASE TABLE NOT MULTIPLE
-- VIEWS FETCH THE DATA AT RUNTIME
-- YOU CAN MAKE A VIEW THAT DATA COMING FROM A ANOTHER VIEW
-- MEANS YOU CAN WRITE NESTED VIEWS


USE SAKILA;

SELECT * FROM ACTOR;

CREATE VIEW VW_ACTOR
AS 
SELECT *
FROM ACTOR;


SELECT FIRST_NAME FROM VW_ACTOR
WHERE FIRST_NAME LIKE 'A%';


-- --------------------------------NESTED VIEW ---------------------------
-- WE CAN CREATE A VIEW WITH THIS 
CREATE VIEW VW_ACTOR_A
AS
SELECT FIRST_NAME FROM VW_ACTOR
WHERE FIRST_NAME LIKE 'A%';
SELECT * FROM VW_ACTOR_A;

CREATE VIEW VW_ACTOR_AA
AS
SELECT * FROM VW_ACTOR
WHERE FIRST_NAME LIKE '%A%';

-- YOU CAN AFF ORDER BY CLAUSE WITH VIEWS
SELECT * FROM VW_ACTOR_AA ORDER BY FIRST_NAME;

-- DROP VIEW
DROP VIEW VW_ACTOR;
DROP VIEW VW_ACTOR_A;
DROP VIEW VW_ACTOR_AA;

-- SIMPLIFIED QUERY
-- IT CAN FETCH DATA FROM VARIOUS TABLE AND THEN SHOW IN A CONVENIENT TABLE TO WORK WITH
-- JUST LIKE WORKING WITH THE BASE TABLE
-- SECURITY : IF YOU WANT TO HIDE SOME COLUMN THAT USER DONT SEE
-- THEN USE VIWE OF THE BASE TABLE AND THEN IN THE CIEW DONT 
-- INCLUDE THE COLUMN SO THE USER CANT ACCESS IT



-- TEST
-- 1) FIND ALL THE CUSTOMER PAYMENTS WHICH ARE OVER THEIR AVERAGE PAYMENT
-- AVG() IS A COLUMN FUNCTION YOU WORK WITH THE CORRELATED SUBQUERY 
-- TO GET THE RESULT
SELECT PT.PAYMENT_ID,PT.AMOUNT,PT.RENTAL_ID,CONCAT(CUS.FIRST_NAME,' ',CUS.LAST_NAME) 
FROM PAYMENT pt
LEFT JOIN CUSTOMER CUS
ON PT.CUSTOMER_ID = CUS.CUSTOMER_ID
WHERE PT.AMOUNT <
	(
		SELECT AVG(PT1.AMOUNT) FROM PAYMENT PT1
        WHERE PT1.CUSTOMER_ID = PT.CUSTOMER_ID
    );

DROP VIEW MOD_PAYMENY_TABLE;
-- CREATE VIEW
CREATE VIEW MOD_PAYMENY_TABLE
AS
SELECT PT.PAYMENT_ID,PT.AMOUNT,PT.RENTAL_ID,CONCAT(CUS.FIRST_NAME,' ',CUS.LAST_NAME) AS FULLNAME 
FROM PAYMENT pt
LEFT JOIN CUSTOMER CUS
ON PT.CUSTOMER_ID = CUS.CUSTOMER_ID
WHERE PT.AMOUNT <
	(
		SELECT AVG(PT1.AMOUNT) FROM PAYMENT PT1
        WHERE PT1.CUSTOMER_ID = PT.CUSTOMER_ID
    );


SELECT FULLNAME FROM MOD_PAYMENY_TABLE;


-- ---------------DATA SECURITY WITH VIEW
-- SUPPOSE YOU WANT TO GIVE DATA OF CUSTOMER HAVING THEIR 
-- PAYMENT ID >= 10
-- SO YOU CREATE A VIEW AND THEN GIVE THE USER THAT VIEW SO THEY CANT ACCESS ANY 
-- DATA WHERE CUSTOMER ID <= 10
-- YOU CAN OMIT SOME COLUMN FROM THE BASE TABLE IN MAKING VIEW
-- NO USER CANT ACCESS IT IN THE VIRTUAL TABLE IF THEY QUERY


CREATE VIEW PAYMENT_MORE_100
AS
SELECT PT.PAYMENT_ID,PT.AMOUNT,PT.RENTAL_ID,CONCAT(CUS.FIRST_NAME,' ',CUS.LAST_NAME) AS FULLNAME 
FROM PAYMENT pt
LEFT JOIN CUSTOMER CUS
ON PT.CUSTOMER_ID = CUS.CUSTOMER_ID
WHERE PT.AMOUNT > 10;


SELECT AMOUNT FROM PAYMENT_MORE_100 WHERE AMOUNT =2; -- GET EMPTY RESULT
	

-- ---------------------STORED PROCEDURE ---------------
-- COMPILED QUERY SO WORK FASTER
-- lESS NETWORK TRAFFIC
-- ENCAPSULATION OF BUSINESS LOGIC
-- GOOD FOR THE SECURITY
-- IT IS IN THE DATABASE AND YOUR PROGRAM DOES NOT HAS THE LOGIC;
-- ACCESS CONTROLL
-- SQL INJECTION AVOIDING


-- we already have a delimiter ; for end of statement
-- we need another one 
-- one for ending the query and one for ending the procedure

DELIMITER //
CREATE PROCEDURE GET_LANGUAGE()
BEGIN
	SELECT * FROM sakila.language;
END//
-- RESTTING THE DELIMITER
DELIMITER ;



CALL GET_LANGUAGE();
DROP PROCEDURE GET_LANGUAGE;

DELIMITER //
CREATE PROCEDURE EXLOOP()
BEGIN
	DECLARE I INT DEFAULT 1;
    WHILE I < 6 DO
		SELECT POW(I,I);
        SET I = I+1;
	END WHILE;
END //
DELIMITER ;
CALL EXLOOP();
DROP PROCEDURE EXLOOP;


-- CREATE STORE PROCEDURE DOR CONCATING TWO NAMES

DELIMITER //
CREATE PROCEDURE CONCATNAME(FIRST_NAME VARCHAR(100),LAST_NAME VARCHAR(100))
BEGIN
	DECLARE FULLNAME VARCHAR(200);
    SET FULLNAME  = CONCAT(FIRST_NAME,' ',LAST_NAME);
    SELECT FULLNAME;
END//
DELIMITER ;

DROP PROCEDURE CONCATNAME;
CALL CONCATNAME('TANVIR','RAHMAN');





-- INSERT OPERATION WITH STORED PROCEDURE

SELECT * FROM sakila.language;
USE sakila;
DELIMITER //
CREATE PROCEDURE INSERTLANG(NAMELANG VARCHAR(100))
BEGIN
	INSERT INTO LANGUAGE(name,last_update) 
    VALUES(NAMELANG,NOW());
    SELECT LAST_INSERT_ID();
END//
DELIMITER ;

CALL INSERTLANG('HIBRU');
CALL INSERTLANG('URDU');
CALL INSERTLANG('BANGLA');
CALL INSERTLANG('POLISH');
SELECT * FROM sakila.language;


-- INSERT OPERATION WITH STORED PROCEDURE WITH RETURN TYPE
DELIMITER //
CREATE PROCEDURE INSERTLANGRETURN(IN LANGNAME VARCHAR(100),OUT NEWLANGID INT)
BEGIN
	INSERT INTO LANGUAGE(name,last_update)
    VALUES (LANGNAME,NOW());
    SET NEWLANGID = LAST_INSERT_ID();
END//
DELIMITER ;

CALL INSERTLANGRETURN('KWIWI',@VAR);
SELECT @VAR; -- YOU GET THE RESULT HERE

SELECT CONCAT("LAST INSERTED IS"," ",@VAR) AS STATUS;




-- USER DEFINED FUNCTION
-- CAN DO ONLY SELECT 
-- AND RETURN ONLY A SINGLE VALUE 
-- NO INSERT UPDATE OR DELETE
-- ONLY ALLOW INPUT ARGUMENT


SELECT * FROM FILM ;
SELECT * FROM LANGUAGE ;
DELIMITER //
CREATE FUNCTION GET_LANGUAGE(LANG_ID INT) RETURNS VARCHAR(100)
BEGIN
	DECLARE LANG_NAME VARCHAR(100);
    SELECT NAME 
    INTO LANG_NAME
    FROM LANGUAGE
    WHERE LANGUAGE_ID = LANG_ID;
    RETURN(LANG_NAME);
END//
DELIMITER ;

DROP FUNCTION GET_LANGUAGE;

SELECT TITLE,DESCRIPTION,GET_LANGUAGE(LANGUAGE_ID) FROM FILM;


-- SAME CAN BE DONE WITH A JOIN QUERY

SELECT F.TITLE,F.DESCRIPTION,L.NAME FROM FILM F
LEFT JOIN LANGUAGE L
ON F.LANGUAGE_ID = L.LANGUAGE_ID;



-- TEST WITH FUNCTION
-- CHECK THE RENTAL TABLE FIRST
-- MAKE A VIEW THEN FILTER WITH FUNCTION
SELECT * FROM RENTAL LIMIT 10;

CREATE VIEW RENTALCOUNT2
AS
SELECT COUNT(RENTAL_ID) AS NRENTAL ,CUSTOMER_ID FROM RENTAL GROUP BY CUSTOMER_ID;

SELECT * FROM RENTALCOUNT2;

DELIMITER //
CREATE FUNCTION GETRENTALBYCUSTOMER(CUS_ID INT) RETURNS INT
BEGIN
	DECLARE RENTALCOUNT INT;
    SELECT NRENTAL
    INTO RENTALCOUNT
    FROM RENTALCOUNT2
    WHERE CUSTOMER_ID = CUS_ID;
    RETURN (RENTALCOUNT);
END//
DELIMITER ;

SELECT COUNT(RENTAL_ID) AS NRENTAL ,CUSTOMER_ID FROM RENTAL GROUP BY CUSTOMER_ID;

SELECT CUSTOMER_ID,GETRENTALBYCUSTOMER(CUSTOMER_ID) FROM RENTAL gROUP BY CUSTOMER_ID;
