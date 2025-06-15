CREATE DATABASE ToysGroup;
USE ToysGroup;
#TASK 2 DDL
CREATE TABLE Region (
	RegionID INT auto_increment PRIMARY KEY NOT NULL,
    RegionName VARCHAR(50)
    )
;

CREATE TABLE State (
	StateID INT auto_increment PRIMARY KEY NOT NULL,
    StateName VARCHAR (50),
    RegionID INT,
    CONSTRAINT FK_REGIONKEY
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
    )
;

CREATE TABLE Category (
	CategoryID INT auto_increment PRIMARY KEY NOT NULL,
    CategoryName VARCHAR(100)
    )
;

CREATE TABLE Product (
	ProductID INT auto_increment PRIMARY KEY NOT NULL,
    ProductName VARCHAR (50),
	CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    Price DECIMAL (10,2) NOT NULL
    )
;


SELECT * FROM Region;
DESC Region;
DESC State;

INSERT INTO Region (RegionName) VALUES
	('NORTH AMERICA'),
    ('SOUTH AMERICA'),
    ('WEST EUROPE'),
    ('EAST EUROPE'),
    ('NORTH ASIA'),
    ('SOUTH ASIA'),
    ('AFRICA'),
    ('AUSTRALIA')
;

SELECT * FROM State;

INSERT INTO State (StateName, RegionID) VALUES 
	('Calvada', '1'),
    ('Santarosa', '2'),
    ('Koalora', '8'),
	('Andespera', '2'),
	('Texahoma', '1'),
    ('Normedale', '3'),
	('Lusiton', '3'),
    ('Volgravia', '4'),
    ('Nepkora', '6'),
	('Bangrana', '6'),
	('New Cascadia', '1'),
	('Rio Verde', '2'),
	('Bavernia', '3'),
	('Karpatia', '4'),
	('Nilecrest', '7'),
	('Baltorusk', '4'),
	('Sibersk', '5'),
	('Altayra', '5'),
	('Indobad', '6'),
	('Saharawi', '7'),
	('Sunreach', '8'),
	('Yakutara', '5'),
	('Tropelands', '8')
;

SELECT * FROM Category;
INSERT INTO Category (CategoryName) VALUES
	('DOLLS & PLUSHIES'),
    ('TOY CARS'),
    ('PUZZLES'),
    ('BUILD BLOCKS'),
    ('BOOKS')
;

SELECT * FROM Product;

INSERT INTO Product (ProductName, CategoryID, Price) VALUES
	('Cuddly Bear', 1, 14.99);

INSERT INTO Product (ProductName, CategoryID, Price) VALUES
('Fairy Princess Doll', 1, 19.99),
('Monster Truck Max', 2, 11.25),
('Police Cruiser Mini', 2, 6.75),
('Tiny Bunny Plush', 1, 9.49),
('100-piece Animal Puzzle', 3, 8.50),
('Super Soft Lion', 1, 12.50),
('Speed Racer Car', 2, 7.99),
('Creative Bricks Kit', 4, 18.75),
('Mega Builder Pack', 4, 22.50),
('Fire Truck Hero', 2, 10.99),
('Learn ABC with Fun', 5, 6.50),
('Bedtime Tales', 5, 7.20),
('My First Animal Book', 5, 5.49),
('Wooden Shape Puzzle', 3, 7.25),
('Color Stack Blocks Set', 4, 15.99),
('The Jungle Storybook', 5, 5.99),
('World Map Puzzle', 3, 12.00),
('Dino Puzzle Adventure', 3, 9.99),
('Tiny Tots Blocks', 4, 13.99)
;

SELECT * FROM Product;

CREATE TABLE SalesOrder (
	SalesOrderID INT auto_increment PRIMARY KEY NOT NULL,
    ProductID INT,
    CONSTRAINT FK_PRODUCTID
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    StateID INT,
    CONSTRAINT FK_STATEID
    FOREIGN KEY (StateID) REFERENCES State(StateID),
    OrderDate DATE,
    ShipDate DATE,
    Quantity INT NOT NULL
    )
;

ALTER TABLE SalesOrder
MODIFY ProductID INT NOT NULL;
DESC SalesOrder;

ALTER TABLE SalesOrder
MODIFY StateID INT NOT NULL;

SELECT * FROM SalesOrder;

INSERT INTO SalesOrder (ProductID, StateID, OrderDate, ShipDate, Quantity) VALUES
(18, 6, '2024-01-06', '2024-01-09', 5),
(4, 4, '2024-01-16', '2024-01-19', 3),
(15, 6, '2024-01-23', '2024-01-26', 4),
(2, 15, '2024-02-01', '2024-02-04', 1),
(19, 9, '2024-02-15', '2024-02-17', 1),
(7, 3, '2024-03-01', '2024-03-04', 5),
(5, 1, '2024-03-17', '2024-03-19', 2),
(8, 7, '2024-03-28', '2024-03-31', 4),
(1, 2, '2024-04-04', '2024-04-07', 1),
(6, 13, '2024-04-20', '2024-04-22', 2),
(20, 13, '2024-05-05', '2024-05-09', 2),
(3, 9, '2024-05-18', '2024-05-21', 1),
(10, 2, '2024-06-06', '2024-06-09', 3),
(17, 11, '2024-06-19', '2024-06-22', 3),
(13, 10, '2024-07-10', '2024-07-13', 2),
(6, 14, '2024-08-03', '2024-08-06', 4),
(14, 10, '2024-08-15', '2024-08-18', 5),
(16, 15, '2024-09-05', '2024-09-07', 3),
(5, 9, '2024-09-18', '2024-09-21', 5),
(10, 1, '2024-10-02', '2024-10-06', 2),
(11, 6, '2024-10-28', '2024-10-30', 1),
(9, 14, '2024-11-15', '2024-11-18', 4),
(1, 5, '2024-12-01', '2024-12-04', 2),
(3, 11, '2024-12-19', '2024-12-22', 3),
(2, 5, '2025-01-04', '2025-01-06', 3),
(8, 2, '2025-01-25', '2025-01-27', 4),
(14, 3, '2025-02-12', '2025-02-14', 5),
(7, 12, '2025-02-25', '2025-02-28', 3),
(12, 8, '2025-03-10', '2025-03-13', 1),
(13, 5, '2025-03-22', '2025-03-25', 4),
(4, 14, '2025-04-04', '2025-04-07', 2),
(15, 8, '2025-04-20', '2025-04-23', 5),
(18, 12, '2025-05-06', '2025-05-08', 1),
(19, 8, '2025-06-02', '2025-06-06', 5)
;

#mostra come è impostata Primary Key e che siano univoci
SELECT * FROM SalesOrder;
DESC SalesOrder; 

SELECT COUNT(*)
FROM Product
where ProductID is null
;

#codice documento, la data, il nome del prodotto, la categoria del prodotto, 
#il nome dello stato, il nome della regione di vendita e 
#un campo booleano valorizzato in base alla condizione che siano passati più di 180 giorni dalla data vendita o meno 
#(>180 -> True, <= 180 -> False)

CREATE VIEW SalesTransaction AS (
	SELECT SO.SalesOrderID AS OrderID,
    P.ProductName AS Product,
    C.CategoryName AS Category,
    S.StateName AS SalesState,
    R.RegionName AS SalesRegion,
    P.Price AS UnitPrice,
    SO.Quantity AS TotalQuantity,
    (SO.Quantity * P.Price) AS TotalAmount,
    OrderDate,
    IF(DATEDIFF(CURRENT_DATE, SO.OrderDate)> 180, 'OVER', 'UNDER' ) AS Over180Days
    #(SELECT DATEDIFF(CURRENT_DATE, SO.OrderDate) AS Over180Days FROM SalesOrder)
	FROM SalesOrder SO
		JOIN Product P ON SO.ProductID = P.ProductID
        JOIN Category C ON P.CategoryID = C.CategoryID
		JOIN State S ON SO.StateID = S.StateID 
		JOIN Region R ON S.RegionID = R.RegionID 
	ORDER BY OrderID ASC
)
;

SELECT * FROM SalesTransaction;

#8)	Creare una vista sui prodotti in modo tale da esporre una 
#“versione denormalizzata” delle informazioni utili 
#(codice prodotto, nome prodotto, nome categoria)

CREATE VIEW PRODUCT_INFO AS (
	SELECT P.ProductID AS ProductID, 
    P.ProductName AS ProductName, 
    C.CategoryName AS Category
	FROM Product P
	JOIN Category C ON P.CategoryID = C.CategoryID
    ORDER BY ProductID ASC
    )
;

select * from PRODUCT_INFO;

#9)	Creare una vista per le informazioni geografiche
CREATE VIEW SALES_STATE AS (
SELECT StateID, StateName, R.RegionName AS Region
FROM STATE S
JOIN Region R on S.RegionID = R.RegionID
ORDER BY StateID ASC
)
;


SELECT * FROM SALES_STATE;

#4)	Esporre l’elenco dei soli prodotti venduti 
#e per ognuno di questi il fatturato totale per anno. 

SELECT P.ProductID AS ID,
	P.ProductName AS Product,
	SUM(SO.Quantity * P.Price) AS TotalAmount,
YEAR(SO.OrderDate) AS Year
FROM SalesOrder SO
JOIN Product P ON SO.ProductID = P.ProductID
GROUP BY P.ProductID,
	YEAR(SO.OrderDate)
ORDER BY Year ASC
;


#5)	Esporre il fatturato totale per stato per anno. 
#Ordina il risultato per data e per fatturato decrescente.

SELECT S.StateID AS ID,
	S.StateName AS State,
    SUM(SO.Quantity * P.Price) AS TotalAmount,
	YEAR(SO.OrderDate) AS SalesYear
FROM SalesOrder SO
JOIN State S ON SO.StateID = S.StateID
JOIN Product P ON SO.ProductID = P.ProductID
GROUP BY S.StateID, YEAR(SO.OrderDate)
ORDER BY TotalAmount DESC, SalesYear ASC
;


#3)	Esporre l’elenco dei prodotti che hanno venduto, in totale, 
#una quantità maggiore della media delle vendite realizzate nell’ultimo anno censito. 
#(ogni valore della condizione deve risultare da una query e non deve essere inserito a mano). 
#Nel result set devono comparire solo il codice prodotto e il totale venduto.

#CREATE VIEW ProductSales AS (

SELECT P.ProductID,
	SUM(SO.Quantity * P.Price) AS TotalSales
	FROM Product P
	JOIN SalesOrder SO ON SO.ProductID = P.ProductID
    GROUP BY P.ProductID
;



SELECT P.ProductID,
	SUM(SO.Quantity) AS TotalSales
FROM Product P
JOIN SalesOrder SO ON SO.ProductID = P.ProductID
WHERE YEAR(SO.OrderDate) = (SELECT MAX(YEAR(SO2.OrderDate))
							FROM SalesOrder SO2)
GROUP BY P.ProductID
HAVING SUM(SO.Quantity) > (SELECT AVG (SO1.Quantity)
			FROM (SELECT SUM(SO1.Quantity) AS TotalSales1
				FROM SalesOrder SO1
				JOIN Product P1 ON SO1.ProductID = P1.ProductID
				WHERE YEAR(SO1.OrderDate) = MIN(YEAR(SO1.OrderDate))
				GROUP BY P1.ProductID)
			GROUP BY P.ProductID)
;#mi sono un po arresa qui sincera


SELECT * FROM SALESORDER;

SELECT * FROM SalesOrder;
SELECT * FROM State;
SELECT * FROM Region;
SELECT * FROM Product;
SELECT * FROM Category;
#esportati con csv per report

