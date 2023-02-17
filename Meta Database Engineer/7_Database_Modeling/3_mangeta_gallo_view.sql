USE mangata_gello;
SELECT * FROM orders;
SELECT * FROM delivery;
SELECT * FROM address;
CREATE VIEW orders_view
AS
SELECT O.OrderID,O.ClientID,C.FullName,P.ProductName,O.Quantity,O.TotalCost,D.DeliveryStatus,D.DeliveryDate,A.Street FROM orders O
INNER JOIN clients C ON C.ClientID = O.ClientID
INNER JOIN products P ON P.ProductID = O.ProductID
INNER JOIN delivery D ON D.OrderID = O.OrderID
INNER JOIN address A ON A.AddressID = D.AddressID;


SELECT * FROM orders_view;