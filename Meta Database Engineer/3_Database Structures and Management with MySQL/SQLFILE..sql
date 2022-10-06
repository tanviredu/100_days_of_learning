CREATE DATABASE IF NOT EXISTS Lucky_Shrub;
USE Lucky_Shrub;
CREATE TABLE Orders(OrderID INT NOT NULL PRIMARY KEY,ClientID VARCHAR(10),ProductID VARCHAR(10),Quantity INT,Cost DECIMAL(6,2));
INSERT INTO Orders (OrderID, ClientID, ProductID , Quantity, Cost) VALUES 
(1, "Cl1", "P1", 10, 500),
(2, "Cl2", "P2", 5, 100),
(3, "Cl3", "P3", 20, 800),
(4, "Cl4", "P4", 15, 150),
(5, "Cl3", "P3", 10, 450),
(6, "Cl2", "P2", 5, 800),
(7, "Cl1", "P4", 22, 1200),
(8, "Cl3", "P1", 15, 150),
(9, "Cl1", "P1", 10, 500),
(10, "Cl2", "P2", 5, 100);

SELECT * FROM Orders WHERE Cost <250;
SELECT * FROM Orders WHERE Cost BETWEEN 50 AND 750;
SELECT * FROM Orders WHERE Cost >=50 AND Cost <=750;
SELECT * FROM Orders WHERE ClientID = 'Cl3' AND Cost > 100;
SELECT * FROM Orders WHERE (ProductID = 'P1' OR ProductID = 'P2') AND QUantity > 2;
                        
CREATE TABLE employees (
  EmployeeID int NOT NULL,
  EmployeeName varchar(150) DEFAULT NULL,
  Department varchar(150) DEFAULT NULL,
  ContactNo varchar(12) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  AnnualSalary int DEFAULT NULL,
  PRIMARY KEY (EmployeeID)
);

INSERT INTO employees VALUES 
(1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
(2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@ luckyshrub.com',75000), 
(3,'Simon Tolo', 'Marketing', '351930582','Simon.t@ luckyshrub.com',40000), 
(4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@ luckyshrub.com',45000), 
(5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@ luckyshrub.com',35000), 
(6,'Maria Carter', 'Human Resources', '351022508','Maria.c@ luckyshrub.com',55000),
(7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);
                        
SELECT * FROM employees;
-- select employee whose annual salary is 50000 or more
-- and in Marketing Department

SELECT * FROM employees WHERE AnnualSalary >= 50000 AND Department = 'Marketing';
                        
-- select employee whose salary is not more than or equal 5000;

-- 1)
SELECT * FROM employees WHERE AnnualSalary < 50000;
-- 2) 
SELECT * FROM employees WHERE NOT AnnualSalary>=50000;

-- select the employee whose either in Marketing ,Finance and 
-- Legal Department and their salary is less than 50000 

SELECT * FROM employees WHERE AnnualSalary < 50000 AND Department
IN ('Marketing','Finance','Legal');              

SELECT * FROM employees WHERE AnnualSalary BETWEEN 10000 
AND 50000;

-- name starts with S and then must be 3 character ___
-- and then whatever added
-- so two things we can be make sure of
-- the name must be at least 4 character S___ (S and 3 _)
-- and after that anything can be added

SELECT * FROM employees WHERE EMployeeName Like 'S___%';



-- JOINING TABLE
-- ALIASES
-- SELECT EmployeeID AS Id FROM Job;
-- NOW THE AS KEYWORD WORKED AS AN ALIASES


CREATE TABLE Customers(CustomerID INT NOT NULL AUTO_INCREMENT,
					   FullName VARCHAR(100),
                       PhoneNumber VARCHAR(100),
                       PRIMARY KEY(CustomerID)
);  

INSERT INTO Customers(FullName,PhoneNumber) 
VALUES 
('Vanessa McCarthy',757536378),
('Marcos Romero',757536379),
('Hiroki Yamane',757536376),
('Anna Iversen',757536375),
('Diana Pinto',757536374);

SELECT * FROM Customers;

CREATE TABLE Bookings (BookingID INT NOT NULL,
BookingDate Date,TableNumber INT,
NumberOfGuests INT,CustomerID INT);

DROP TABLE Bookings;

-- date should be inside the single quote

INSERT INTO Bookings (BookingID,BookingDate,TableNumber,NumberOfGuests,CustomerID)
VALUES 
(10,'2021-11-11',7,5,1),
(11,'2021-10-11',5,2,4),
(12,'2021-10-11',3,2,4);
SELECT * FROM Bookings;

SELECT * FROM Customers;
SELECT * FROM Bookings;

SELECT * 
FROM Customers C 
INNER JOIN Bookings B
ON
C.CUstomerID = B.CUstomerID;



SELECT C.FullName,B.BookingID 
FROM Customers C 
INNER JOIN Bookings B
ON
C.CUstomerID = B.CUstomerID;


-- LEFT JOIN 
-- IF THE RIGHT COLUMN IS NULL THEN ALSO IT WILL SHOW

SELECT C.FullName,B.BookingID 
FROM Customers C 
LEFT JOIN Bookings B
ON
C.CUstomerID = B.CUstomerID;



SELECT C.FullName,B.BookingID 
FROM Customers C 
RIGHT JOIN Bookings B
ON
C.CUstomerID = B.CUstomerID;
