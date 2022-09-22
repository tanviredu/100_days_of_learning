CREATE DATABASE TestDB;
DROP DATABASE TestDB;
-- CREATE DATABASE cm_devices;
USE cm_devices;
-- SHOW TABLES;
-- CREATE TABLE devices(deviceID int,deviceName varchar(50),price decimal);
-- SHOW COLUMNS FROM devices;
-- CREATE TABLE customers(username CHAR(9),fullname VARCHAR(100),email VARCHAR(255));
-- SHOW COLUMNS FROM customers;
-- CREATE TABLE feedback(feedbackID CHAR(8),feedbackType VARCHAR(100),comment TEXT(500));
-- SHOW COLUMNS FROM feedback;
-- CREATE TABLE address (id int NOT NULL,  street VARCHAR(255), postcode VARCHAR(10) DEFAULT "HA97DE", town VARCHAR(30) DEFAULT "Harrow"); 
SHOW COLUMNS FROM address;
-- CREATE TABLE invoice(customerName VARCHAR(50),orderDATE DATE,quantity INT,price DECIMAL);
SHOW COLUMNS FROM invoice;


-- SQL ALTER STATEMENT
-- for adding column
ALTER TABLE table_name ADD(column_name DATATYPE)
ALTER TABLE students ADD(age INT,country VARCHAR(50),nationality VARCHAR(250);

-- for removing column 
ALTER TABLE table_name DROP COLUMN column_name
ALTER TABLE students DROP COLUMN nationality;



-- ALTER TABLE table_name MODIFY column_name DATATYPE(LENGTH)
-- Modify table 
ALTER TABLE students MODIFY country VARCHAR(100);


-- INSERT STATEMENT
INSERT INTO table_name(Id,name,age,startdate) VALUES (1,"Tanvir",21,"2020-10-15"); 


-- SELECT STATEMENT
SELECT * FROM table_name;


CREATE DATABASE IF NOT EXISTS shopping_cart_db;
USE shopping_cart_db;

CREATE TABLE customer(
    customer_id  INT,
    name         VARCHAR(100),
    address      VARCHAR(255),
    email        VARCHAR(100),
    phone        VARCHAR(10),

    PRIMARY KEY (customer_id)

);


CREATE TABLE product(
	product_id   INT,
    name         VARCHAR(100),
    price        NUMERIC(8,2),
    description  VARCHAR(255),
    PRIMARY KEY  (product_id)
);



CREATE TABLE cart_order(
	order_id    INT,
    customer_id INT,
    product_id  INT,
    quantity    INT,
    order_date  DATE,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (product_id)  REFERENCES product(product_id)
);


 -- create an employee table

CREATE TABLE employee(
    id   INT,
    name VARCHAR(50),
    salary INT

);






[Inshalah Will be Added]

