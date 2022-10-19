use sakila;
SELECT @@VERSION;           -- show the version of the database
SELECT CURRENT_USER();      -- show the current user
SELECT CONNECTION_ID();     -- show your conection ID
SELECT DATABASE();          -- show the current database
USE little_lemon;		    -- changing the database 
SELECT DATABASE();          -- show the current database
USE SAKILA;                 -- back to sakila

SELECT CURRENT_TIMESTAMP(); -- show the current Date and Time
SELECT CURRENT_DATE();      -- show only the current date portion
SELECT CURRENT_TIME();      -- show only the current date portiom

SELECT 
DATEDIFF('2024-12-23 23:59:59',
CURRENT_TIMESTAMP());             -- it shows the date  difference and ignores the time

SELECT 
TIMEDIFF
('24:0:0','12:0:0');              -- it shows the current time Difference

SELECT GET_FORMAT(DATE,'USA');    -- geting the DateFormat for different zone
SELECT GET_FORMAT(DATE,'EUR');
SELECT GET_FORMAT(TIME,'USA');    -- Getting the Time Format for different zone
SELECT GET_FORMAT(TIME,'EUR');
SELECT GET_FORMAT(DATETIME,'EUR'); --  getting Datetime 
SELECT GET_FORMAT(DATETIME,'USA');

SELECT DATE_FORMAT(CURRENT_TIMESTAMP(),'%D-%M-%Y');
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(),'%d-%m-%Y');
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(),GET_FORMAT(DATE,'USA')); -- get the only Date part with proper Format in USA 
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(),GET_FORMAT(TIME,'USA')); -- get the only Time part with proper Format in 
SELECT GET_FORMAT(TIME,'USA');
-- get it  now apply it manually
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(),'%h:%i:%s %p');
-- or
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(),GET_FORMAT(TIME,'USA'));