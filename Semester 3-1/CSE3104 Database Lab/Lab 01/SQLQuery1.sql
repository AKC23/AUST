DROP TABLE CUSTOMER

CREATE TABLE CUSTOMER
(
CustomerID INT PRIMARY KEY IDENTITY(1001,1),
CustomerNumber INT NOT NULL UNIQUE  CHECK (CustomerNumber>100),
LastName VARCHAR(255),
FirstName VARCHAR(255),
AreaCode int,
Address VARCHAR(255) DEFAULT 'Dhaka',						   --SET DEFAULT - 'DHAKA'
Phone VARCHAR(50)
);

SELECT * FROM CUSTOMER

TRUNCATE TABLE CUSTOMER

INSERT INTO CUSTOMER VALUES
(101,'Khan', 'Rahim', 1307, 'Gulshan', '01677515829'),
(102,'Rahman', 'Kahim', 1202, 'Dhanmondi', '01912584949'),
(103,'Mehedi', 'Hashim', 1307, 'Gulshan', '01645789544'),
(104,'AFASDF', 'ASRGWE', 1307,DEFAULT, '01634789544')				 --DEFAULT IS GIVEN

INSERT INTO CUSTOMER VALUES
(1244,'Khan', 'Rahim', 1307, 'Gulshan', '01677515829')

DELETE FROM CUSTOMER WHERE CustomerNumber = '1244'


TRUNCATE TABLE "ORDER"

CREATE TABLE "ORDER"
(
OrderId	INT IDENTITY(101,1),
CustomerId INT NOT NULL,
OrderDate Date,
OrderAmount INT,
PRIMARY KEY(OrderId),
FOREIGN KEY(CustomerId) REFERENCES Customer(CustomerId)
);

SELECT * FROM "ORDER"

INSERT INTO "ORDER" VALUES
(1001,'2020-12-01',3),
(1001,'2020-11-01',5),
(1003,'2020-12-01',3),
(1004,'2020-12-01',3),
(1002,'2020-12-01',3)


DELETE FROM "ORDER"
WHERE OrderId = '101'

ALTER TABLE "ORDER"
DROP COLUMN OrderID

DROP TABLE PRODUCT
DROP TABLE CUSTOMER
DROP TABLE "ORDER"


CREATE TABLE PRODUCT
(
ProductId INT IDENTITY(101,1),
OrderId INT NOT NULL,
ProductAmount INT,
)

SELECT * FROM PRODUCT

ALTER TABLE PRODUCT
ADD CONSTRAINT PK_ProductID PRIMARY KEY(ProductId)

ALTER TABLE PRODUCT
ADD CONSTRAINT FK_OrderId FOREIGN KEY(OrderId) REFERENCES "ORDER"(OrderId)


ALTER TABLE PRODUCT									 --DROP PRODUCT KEY WITH CONSTRAINT
DROP CONSTRAINT PK_ProductID

ALTER TABLE PRODUCT									 --DROP FOREIGN KEY WITH CONSTRAINT
DROP CONSTRAINT FK_OrderId


