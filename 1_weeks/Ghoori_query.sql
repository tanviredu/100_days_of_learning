
-- CREATE TABLE

CREATE TABLE Students(
    [ID]    INT,
    [Name]  VARCHAR(100),
    [Class] VARCHAR(100)    
);
GO

CREATE TABLE StudentGrades(
    [Grade_ID]   INT,
    [Student_ID] INT,
    [Subject]   VARCHAR(100),
    [Grade]     VARCHAR(100)

);
GO

CREATE TABLE Teachers(
    [tid]       INT,
    [t_name]    VARCHAR(20),
    [t_age]     INT
);
GO


-- DROP COLUMN IN A TABLE

ALTER TABLE Students DROP COLUMN [ID];

-- ALTER COLUMN ADD
ALTER TABLE Students ADD STUDENT_ID INT;

-- DROP TABLE
DROP TABLE Students;

-- ALLOW NULLLS 

ALTER TABLE Teachers ALTER COLUMN tid INT NULL;
ALTER TABLE Teachers ALTER COLUMN t_name VARCHAR(200) NULL;
ALTER TABLE Teachers ALTER COLUMN t_age INT NULL;





-- SELECT DATA
SELECT * FROM Students;
SELECT * FROM Teachers;
SELECT * FROM StudentGrades;


-- ALWAYS USE THE SINGLE QUOTE FOR STRING ENTRY
-- DOUBLE QUOTE WONT WORK

INSERT INTO Students (STUDENT_ID,Name,Class) VALUES(1,'Shuvo',3);
INSERT INTO Students (STUDENT_ID,Name,Class) VALUES(2,'Mahmud',3);
INSERT INTO Students (STUDENT_ID,Name,Class) VALUES(3,'Kashem',3);
INSERT INTO Students (STUDENT_ID,Name,Class) VALUES(4,'Ripon',3);
INSERT INTO Students (STUDENT_ID,Name,Class) VALUES(5,'Zahid',4);


-- UPDATE ROW IN TABLE
-- NEVER USE UPDATE  STATEMENT WITHOUT A WHERE CLAUSE

UPDATE Students
SET
    Class = '4'
WHERE
    STUDENT_ID = 4;
GO

-- DELETE STATEMENT
-- NEVER USE DELETE STATEMENT WITHOUT 
-- A WHERE CLAUSE

DELETE FROM Students WHERE STUDENT_ID = 4;
SELECT * FROM Students;
GO


SELECT * FROM StudentGrades;


 
EXEC sp_rename 'dbo.StudentGrades.Student_ID','STUDENT_ID','COLUMN';

-- ADDING THE MARKS COLUM IN THE StudentGrades Table

ALTER TABLE StudentGrades ADD Marks INT;


-- MORE INSERT DATA
INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (1,1,'Bangla', 'A',88);
INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (2,1,'English', 'A+',90);
INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (3,1,'Math', 'A', 85);

INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (4,2,'Bangla', 'A+', 91);
INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (5,2,'English', 'A',87);
INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (6,2,'Math', 'A+',96);

INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (7,3,'Bangla', 'B+', 81);
INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (8,3,'English', 'B-',78);
INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (9,3,'Math', 'A+',90);

INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (10,6,'Bangla', 'B+', 81);
INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (11,6,'English', 'B-',78);
INSERT INTO StudentGrades(Grade_ID, Student_ID, Subject, Grade, Marks) VALUES (12,6,'Math', 'A+',90);

GO

-- AGAIN CHECK WITH SELECT 
SELECT * FROM StudentGrades;





-- SELECT DATA FROM TABLE

SELECT * FROM Students;

-- COLUMN SPECFIC
SELECT STUDENT_ID,Class ,Name 
FROM Students;

-- SELECT WITH A SPECFIC NUMBER OF ROW

SELECT TOP 3 STUDENT_ID,Class,Name
FROM Students; 

SELECT * FROM StudentGrades;
SELECT TOP 5  Grade_ID,STUDENT_ID,SUBJECT,Grade,Marks FROM StudentGrades;


-- RETURN UNIQUE VALUE FROM THE
SELECT DISTINCT Grade FROM StudentGrades;
SELECT DISTINCT Subject FROM StudentGrades;


-- IF YOU USE MULTIPLE COLUM 
-- THEN IT WILL RETURN AN UNIQUE 
-- COMBINATION
SELECT DISTINCT Grade,Subject FROM StudentGrades;

SELECT * FROM Students;



-- USE OF ORDER BY
SELECT * FROM Students ORDER BY Name;

-- GET THE DISTINCT VALUE FROM THE CLASS
-- AND ORDER THEM BY CLASS AND DESCENDING ORDER

SELECT DISTINCT Class FROM Students ORDER BY Class Desc;

-- GROUPBY


 
SELECT * FROM StudentGrades;


-- YOU CAN USE AGGRATE FUNCTION WITH 
-- GROUP BY STATEMENT
SELECT STUDENT_ID,COUNT(*) AS TOTALSUBJECT  FROM StudentGrades
GROUP BY STUDENT_ID;

-- EVERY STUDENTS AVG MARKS WITH GROUPBY
-- AND AGGRAGATE FUNCTION


SELECT STUDENT_ID,SUM(Marks) AS TOTALMARKS  FROM StudentGrades
GROUP BY STUDENT_ID
ORDER BY SUM(Marks) desc;

-- AGGRAGATE FUNCTION CAN BE DONE WITH
-- GROUP BY CLAUSE


-- MINIMUM NUMBER BY DIFFERENT SUBJECT
SELECT STUDENT_ID,MIN(Marks) AS TOTALMARKS  FROM StudentGrades
GROUP BY STUDENT_ID

-- GET AVG NUMBER BY THE STUDENT 
-- WITH GROUP BY
-- AND AGGRAGATE FUNCTION

SELECT STUDENT_ID,AVG(Marks) AS AVERAGEMARKS FROM 
StudentGrades 
GROUP BY STUDENT_ID
ORDER BY AVG(Marks) DESC;


-- JOIN QUERY 

SELECT * FROM [MyTestDB].[dbo].[Students]
SELECT * FROM [MyTestDB].[dbo].[StudentGrades];

-- INNER JOIN
-- ONLY THE INTERSECTION [Common between two will be appear here]
-- otherwise not
USE MyTestDB;

SELECT 
    A.STUDENT_ID,
    A.Name,
    A.Class,


    B.Subject,
    B.Grade,
    B.Marks    
FROM 
    Students A 
INNER JOIN 
    StudentGrades B
ON 
    A.STUDENT_ID = B.STUDENT_ID;


-- REMEMBER INNER JOIN ONLY WORKS FOR THE COMMON DATA

-- LEFT JOIN

SELECT 
    A.STUDENT_ID,
    A.NAME,
    A.Class,
    B.Subject,
    B.Grade,
    B.Marks
FROM
    Students A
LEFT JOIN 
    StudentGrades B
ON 
A.STUDENT_ID = B.STUDENT_ID

-- IN THE LEFT JOIN
-- THE LEFT TABLE DATA WILL
-- ALL SHOW UP
-- AND FROM THE RIGHT TABLE 
-- ONLY THE COMMON WILL SHOW
-- UP IF THERE IS NOTHING IS COMMON
-- THEN NULL WILL SHOW UP

-- RIGHT JOIN
SELECT * FROM StudentGrades;

-- IN THE RIGHT JOIN
-- THE RIGHT TABLE DATA WILL
-- ALL SHOW UP
-- AND FROM THE LEFT TABLE 
-- ONLY THE COMMON WILL SHOW
-- UP IF THERE IS NOTHING IS COMMON
-- THEN NULL WILL SHOW UP
SELECT
    A.Student_ID,
    A.Name,
    A.Class,
    B.Subject,
    B.Grade,
    B.Marks 
FROM 
    Students A
RIGHT JOIN 
    StudentGrades B
ON
A.STUDENT_ID = B.STUDENT_ID;

-- IN THE RIGHT JOIN ALL THE DATA FROM THE RIGHT 
-- TABLE WILL SHOW UP BUT ONLY THE COMMON DATA 
-- SHOW UP IN THE LEFT TABLE AND EMPTY FIELD 
-- ARE SHOWN NULL


-- FULL JOIN
-- EVERYTHING WIWLL SHOW FROM THE BOTH 
-- RIGHT AND LEFT TABLE AND THE 
-- ABSENCE OF THE DATA WILL SHOW NULL
-- HERE

SELECT 
    A.Student_ID,
    A.Name,
    A.Class,
    B.Subject,
    B.Grade,
    B.Marks 

FROM 
    Students A
FULL JOIN 
    StudentGrades B
ON 
    A.STUDENT_ID = B.STUDENT_ID;




-- CONSTRAINS 

-- CONSTRAINT ARE SOME RULE THAT YOU CAN ASSIGN
-- WHEN INSERTING DATA

--  1) NULL AND NOT NULL
--  NULL WILL ALLOW YOU TO INSERT NOTHING IN A COLUM 
--  NOT NULL WILL THROW AN ERROR

-- MAKE THE StudentGrades.Marks Column null 
-- Rules of making null and not null with alter colums

-- ALTER TABLE [TABLE_NAME] ALTER COLUMN [COLUMN_NAME] [DATATYPE] [CONSTRAINS] 

Alter Table StudentGrades Alter COLUMN Marks INT NOT NULL;

SELECT * FROM StudentGrades;

-- Add  a adata without marks
INSERT INTO StudentGrades(Grade_ID,STUDENT_ID,Subject,Grade) VALUES (12,6,'Math','A+');
-- it will show a not null error

-- now make this marks column nullable then try again
Alter table StudentGrades Alter column Marks int Null;

-- NOW ADD THE SAME DATA
INSERT INTO StudentGrades(Grade_ID,STUDENT_ID,Subject,Grade) VALUES (12,6,'Math','A+');
SELECT * FROM StudentGrades;



-- UNIQUE NOT UNIQUE

-- you can force a column to hold only unique and avoid duplicate
-- with the constrains UNIQUE
-- to make a already data filled column unique
-- you need to make sure that column has no duplicate value


-- SYNTAX
-- ALTER TABLE [TABLE_NAME] ADD CONSTRAINT [GIVE_A_NAME_FOR_THAT_RULES] UNIQUE(COLUMN_NAME);
DELETE FROM StudentGrades WHERE Grade_ID = 12;
SELECT * FROM StudentGrades;

ALTER TABLE StudentGrades ADD CONSTRAINT gradeidunique UNIQUE(Grade_ID);

-- now add a duplicate row with similler gradeID
INSERT INTO StudentGrades(Grade_ID,STUDENT_ID,Subject,Grade) VALUES (12,6,'Math','A+');
INSERT INTO StudentGrades(Grade_ID,STUDENT_ID,Subject,Grade) VALUES (12,6,'Math','A+');

-- DROP the constraint
-- syntax
-- ALTER TABLE [Table_Name] DROP CONSTRAINT [constraint_name] 

ALTER TABLE StudentGrades DROP CONSTRAINT gradeidunique;
-- it will drop the unique constraint

-- HOW EVER YOU DONT NEED TO ALWAYS USE THE ALTER COLUMN
-- WHEN CREATING TABLE YOU CAN ADD THIS 


-- PRIMARY KEY ADD
-- PRIMARY KEY IS THE COMBINATION OF THE
-- NOT NULL
-- AND UNIQUE

-- IT CAN BE ONE TABLE AND THE MULTIPLE TABLE
-- THEAT COMBINELY UNIQUELY IDENTIFY A ROW


-- ADDING PRIMARY KEY
-- REMEMBER the column have to be not nullable
-- if you set it with alter table syantax

--SYNTAX
-- 1) First make the column not null
ALTER Table StudentGrades ALTER COLUMN Grade_ID int not null;


ALTER TABLE StudentGrades Add PRIMARY KEY (Grade_ID);
SELECT * FROM StudentGrades;

INSERT INTO StudentGrades(Grade_ID,STUDENT_ID,Subject,Grade) VALUES (12,6,'Math','A+');
-- this insert statement will throw and error
-- because primary key cant have any duplicate colmn
-- and it cant be null



-- VIEW
-- A SET OF SQL STATEMENT COMBINED INTO ONE BLOCK
-- YOU CAN CAN JUST CALL IT 
-- AND IT IS FASTER THEN DRECT MULTIPLE QUERY
-- IT JUST MULTIPLE SQL STATEMENT IN A SINGLE SECTION

-- SYNTAX

-- CREATE VIEW [VIEW_NAME] AS [QUERY_STATEMENT] GO;



-----------------------------------------------------------
-- DEPENDING ON THE QUERY [CAN BE JOIN THAT USES MULTIPLE TABELE]
-- IT WILL CREATE A VIRTUAL TABLE
-- THE VIEW_NAME WILL BE A TABLE NAME , A VIRTUAL TABLE
-- YOU CAN QUERY FROM THE TABLE JUST LIKE A 
-- REGULAR TABLE
-- REMEMBER View
-- IS FOR SIMPLE SHOWCASING OF THE 
-- DATA

------------------------------------------------------------



-----------------------------------------------------------

-- here i am creating a virtual table for 
-- i query with columns and join two table
-- and the query retuen a table (virtual table)
-- and this table is named as Students_with_marks
-- i can query this table just like a regular table


CREATE VIEW Students_with_marks
AS
SELECT 
    A.Student_ID,
    A.Name,
    A.Class,
    B.Subject,
    B.Grade,
    B.Marks 

FROM 
    Students A
FULL JOIN 
    StudentGrades B
ON 
    A.STUDENT_ID = B.STUDENT_ID;

GO








-- query

SELECT * FROM Students_with_marks;
SELECT NAME,SUBJECT,GRADE FROM Students_with_marks;

-- Students_with_marks is a virtual table name
-- that is created by the join query 
-- that merge two table

-- another view

SELECT 
    A.STUDENT_ID,
    A.NAME,
    A.CLASS,
    B.GRADE,
    B.SUBJECT,
    B.MARKS
FROM 
    Students A
FULL JOIN 
    StudentGrades B
ON 
    A.STUDENT_ID = B.STUDENT_ID

CREATE VIEW main_table
AS 
SELECT 
    A.STUDENT_ID,
    A.NAME,
    A.CLASS,
    B.GRADE,
    B.SUBJECT,
    B.MARKS
FROM 
    Students A
FULL JOIN 
    StudentGrades B
ON 
    A.STUDENT_ID = B.STUDENT_ID

GO



SELECT STUDENT_ID,GRADE,MARKS FROM main_table;

SELECT * FROM main_table;







-- stored procedure
---------------------------------------------------
-- STORE PROCEDURE
-- IS A COMBINATION OF 
-- MULTIPLE PARAMETERIZED
-- SQL QUERY
-- IT TAKES ARGUMENT AND THEN 
-- IT CAN RUN SQL STATEMENT 
-- BASED OM THE PARAMETER


-- stored procedure
-- for exqample create a student in raw sql
SELECT TOP(10) * FROM Students;
INSERT INTO Students(STUDENT_ID,Name,Class) VALUES(100,'Tanvir',3);
SELECT * FROM Students;



-- DO THAT WITH THE STORED PROCEDURE
CREATE PROC Add_Student(
    @STUDENT_ID int,
    @Class VARCHAR(50),
    @Name VARCHAR(50)
)
AS 
INSERT INTO Students(STUDENT_ID,Name,Class) VALUES(@STUDENT_ID,@Name,@Class);
GO

-- NOW EXEC the stored procedute

EXEC Add_Student 20,'5',"Hasan";
SELECT * FROM main_table;




-- CREATE AND SHOW PROCEDURE
SELECT TOP(2) * FROM Students;

CREATE PROC ADD_SHOW(
        @STUDENT_ID INT,
        @NAME VARCHAR(50),
        @CLASS VARCHAR(50)
)
AS
        INSERT INTO Students(STUDENT_ID,Name,Class)VALUES(@STUDENT_ID,@NAME,@CLASS);
        SELECT * FROM Students WHERE STUDENT_ID = @STUDENT_ID;

GO
EXEC ADD_SHOW 15,'Tanvir Rahman','10';
SELECT * FROM Students;





-- CREATE A VARIABLE
DECLARE @myvar AS VARCHAR(100)
SET @myvar = 'Hello world'
PRINT @myvar



DECLARE @myvar AS VARCHAR(100)
SELECT TOP(1) @myvar =  Name FROM Students;
PRINT @myvar;





-- CREATE FUNCTIONS


CREATE FUNCTION student_complement(@grade int) RETURNS VARCHAR(50) AS BEGIN 
-- logic of the function goes here
DECLARE @res VARCHAR(50)
If @grade >90
    SET @res = 'Very Good'
Else
    SET @res = 'OK'

RETURN @res;
END;

SELECT NAME,CLASS,GRADE,Subject,Marks,dbo.student_complement(Marks) AS COMPLEMENT FROM main_table;




-- T SQL

-- DECLARING A VARIABLE IN TSQL
-- YOU NEED TO DECLARE SET AND PRINT AT A TIME
-- CONSIDER THIS AS A SINGLE QUERY


-- CREATE A FUNCTION THAT EXPRESS YES!!!!! IF GRADE IS A+
-- EXPRESS OK!!! IF IT IS AN A
-- and NO!!! if less than that



CREATE FUNCTION student_complement4(@grade VARCHAR(100)) RETURNS VARCHAR(100) AS BEGIN
DECLARE @myres VARCHAR(100)
IF @grade = 'A+'
    SET @myres = 'YES!!!!'
ELSE IF  @grade = 'A'
    SET @myres = 'OK!!!'
ELSE
    SET @myres = 'NO!!!'
RETURN @myres
END;


SELECT * FROM main_table;
SELECT NAME,CLASS,SUBJECT,GRADE,MARKS,dbo.student_complement4(GRADE) AS EXPRESSION
FROM main_table; 

SELECT Grade FROM dbo.StudentGrades where Grade = 'A+';



-- Create a temporary table in tsql
SELECT
    NAME,
    Class
INTO #tmp_students
FROM
    Students;

SELECT * From #tmp_students;
DROP Table #tmp_students;

-- another way

CREATE TABLE #tmp_students(
    t_name VARCHAR(100),
    t_class VARCHAR(100)
);
INSERT INTO #tmp_students
SELECT 
    Name,
    Class
FROM Students;

SELECT * FROM #tmp_students;



SELECT * FROM Students;
-- CREATE A  STORED PROCEDURE WITH PROPER ERROR 
-- HANDLING
CREATE PROC ADDSTUDENT(
    @STUDENT_ID INT,
    @NAME VARCHAR(100),
    @Class VARCHAR(100)
)
AS 
    BEGIN TRY 
        INSERT INTO Students(STUDENT_ID,NAME,Class) VALUES(@STUDENT_ID,@NAME,@Class);
    END TRY

    BEGIN CATCH
        SELECT 
            ERROR_NUMBER() AS ERROR_NUMBER,
            ERROR_STATE() AS ERROR_STATE,
            ERROR_SEVERITY() AS ERROR_SEVERITY,
            ERROR_PROCEDURE() AS ERROR_PROCEDURE,
            ERROR_LINE() AS ERROR_LINE,
            ERROR_MESSAGE() AS MESSAGE
    END CATCH

GO

EXEC ADDSTUDENT 200,'Ornob','5';
SELECT * FROM Students;
EXEC ADDSTUDENT 200,'Ornob','5';

ALTER TABLE Students ALTER COLUMN STUDENT_ID int Not null;
ALTER TABLE Students ADD PRIMARY KEY(STUDENT_ID);
DELETE FROM Students WHERE STUDENT_ID = 200;
EXEC ADDSTUDENT 200,'Ornob','5';
SELECT * FROM Students;
EXEC ADDSTUDENT 200,'Ornob','5';
SELECT * FROM Students;

-- it will show the details error in a table

