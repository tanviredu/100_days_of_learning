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







