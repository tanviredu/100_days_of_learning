CREATE DATABASE Lucky_Shurb3;
USE Lucky_Shurb3;

CREATE TABLE Orders 
(
		OrderID   INT NOT NULL PRIMARY KEY,
        ClientID  VARCHAR(10),
        ProductID VARCHAR(10),
        Quantity  INT,
        Cost      DECIMAL(6,2),
        Date      DATE
);

DESCRIBE Orders;

-- inserting the data
INSERT INTO Orders(OrderID, ClientID, ProductID , Quantity, Cost, Date) VALUES
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


SELECT * FROM Orders;
SELECT Cost FROM Orders;
SELECT Cost FROM Orders WHERE OrderID = 5;

-- input the order id returns the cost
DELIMITER //
CREATE FUNCTION FindCost(OrderID INT) RETURNS INT DETERMINISTIC
BEGIN
	DECLARE c INT;
    SELECT O.Cost
    INTO c
    FROM Orders O
    WHERE O.OrderID = OrderID;
    RETURN c; -- no parenthesis
END//
DELIMITER ;
SELECT FindCost(2);

DROP FUNCTION FindCost;


SELECT Quantity FROM Orders;

DELIMITER //
CREATE PROCEDURE GetDiscount2(IN OrderID INT)
BEGIN
	DECLARE qt INT;
    DECLARE co DECIMAL(5,2);
    DECLARE cost_after_discount DECIMAL(5,2);
	SELECT O.Quantity INTO qt FROM Orders O WHERE O.OrderID = OrderID;
    SELECT O.Cost INTO co FROM Orders O WHERE O.OrderID = OrderID;
	IF (qt>=20) THEN
		SET cost_after_discount = co - (co*0.2);
	ELSEIF (qt >=10) THEN
		SET cost_after_discount = co - (co*0.1);
	ELSE 
		SET cost_after_discount = co;
	END IF;
    SELECT cost_after_discount;
END//
DELIMITER ;

CALL GetDiscount2(5);
DROP PROCEDURE GetDiscount2;

CREATE TABLE Products
(
	ProductID     VARCHAR(10),
    ProductName   VARCHAR(100),
    BuyPrice      DECIMAL(6,2),
    SellPrice     DECIMAL(6,2),
    NumberOfItems INT
);

INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfITems)

VALUES ("P1", "Artificial grass bags ", 40, 50, 100),  
("P2", "Wood panels", 15, 20, 250),  
("P3", "Patio slates",35, 40, 60),  
("P4", "Sycamore trees ", 7, 10, 50),  
("P5", "Trees and Shrubs", 35, 50, 75),  
("P6", "Water fountain", 65, 80, 15);

SELECT * FROM Products;

CREATE TABLE Notifications
(
	NotificationID INT AUTO_INCREMENT,
    Notification   VARCHAR(255),
    DateTime       TIMESTAMP NOT NULL,
    PRIMARY KEY(NotificationID)
    
);

/*

Create an INSERT trigger called "ProductSellPriceInsertCheck". This trigger must
check if the SellPrice of the product is less than the BuyPrice after a new product
is inserted in the Products table. If this occurs, then a notification must be
added to the notifications table to inform the sales department. The sales department
can then ensure that the incorrect values were not inserted by mistake.
The notification message should be in the following
format: 'A SellPrice less than the BuyPrice was inserted for ProductID ' + ProductID

*/
SELECT * FROM Products;

DELIMITER //
CREATE TRIGGER ProductSellPriceInsertCheck
AFTER INSERT ON Products 
FOR EACH ROW
BEGIN
	IF NEW.SellPrice < NEW.BuyPrice THEN
		INSERT INTO Notifications(Notification,DateTime) VALUES(CONCAT('A SellPrice less than the BuyPrice was inserted for ProductID ' , NEW.ProductID),NOW());
	END IF;
END//

DELIMITER ;

INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfITems)
VALUES ("P8", "ProductP8 ", 60, 150, 100);
SELECT * FROM Notifications;
INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfITems)
VALUES ("P9", "ProductP9 ", 190, 170, 100);
SELECT * FROM Notifications;
-- TRUNCATE TABLE Notifications;
DROP Trigger ProductSellPriceInsertCheck;

DELIMITER //
CREATE TRIGGER ProductSellPriceUpdateCheck
AFTER UPDATE ON Products 
FOR EACH ROW
BEGIN
	IF NEW.SellPrice <= NEW.BuyPrice THEN
		INSERT INTO Notifications(Notification,DateTime) VALUES(CONCAT(NEW.ProductID ,' was updated with a SellPrice of ',NEW.SellPrice,' which is the same or less than the BuyPrice'),NOW());
	END IF;
END//

DELIMITER ;

UPDATE Products P
SET SellPrice = 40.00
WHERE P.ProductID = 'P1';
SELECT * FROM Notifications;

UPDATE Products P
SET SellPrice = 42000.00
WHERE P.ProductID = 'P2';
SELECT * FROM Notifications;

SELECT * FROM Products;

DELIMITER //
CREATE TRIGGER NotifyProductDelete AFTER DELETE ON Products  FOR EACH ROW
BEGIN
		INSERT INTO Notifications(Notification,DateTime) VALUES( CONCAT('The product with a ProductID ',OLD.ProductID,' was deleted'),NOW());
		-- it is not replacing it is deleteing so no new value so no NEW Column
END//
DELIMITER ;

DROP TRIGGER NotifyProductDelete;

DELETE FROM Products WHERE ProductID = 'P7';
SELECT * FROM Notifications;