DROP TABLE CUSTOMERX
TRUNCATE TABLE CUSTOMERX

CREATE TABLE CUSTOMERX
(
Customer_ID INT IDENTITY(1010,10),
Customer_Name VARCHAR(50) NOT NULL,
CITY VARCHAR(50) UNIQUE,
)


SELECT * FROM CUSTOMERX

INSERT INTO CUSTOMERX VALUES
('Akram', 'Dhaka'),
('Shahin', 'Khulna'),
('Rabeya', 'Barishal'),
('Ali', 'Rajshahi'),
('Tania', 'Sylhet')




CREATE TABLE "ORDERX"
(
OrderId INT IDENTITY(111,1),
MFG_DATE Date,
Quantity INT,
Customer_ID INT,
Customer_Name VARCHAR(50),

CONSTRAINT CHK_QUANTITY CHECK (Quantity > 0)	   --Answer 03
)

--ALTER TABLE "ORDER"
--ADD CHECK (CHK_QUANTITY>0)

INSERT INTO "ORDERX" VALUES
('2020-12-01',5,1010,'Akram'),
('2020-07-05',3,1020,'Shahin'),
('2021-01-04',7,1030,'Rabeya'),
('2021-11-20',2,1040,'Ali'),
('2018-01-01',9,1050,'Tania')

--DROP TABLE "ORDERX"

--Answer 01
SELECT * FROM CUSTOMERX
SELECT * FROM "ORDERX"

--Answer 02
ALTER TABLE CUSTOMERX
ADD CONSTRAINT PK_C_ID_NAME PRIMARY KEY(Customer_ID,Customer_Name)			

--Answer 04
SELECT * FROM CUSTOMERX
WHERE ((Customer_Name LIKE '%a%%a%') AND (CITY='Dhaka' OR CITY='Sylhet')) 

--Answer 05
ALTER TABLE "ORDERX"
ADD CONSTRAINT FK_Customer_ID FOREIGN KEY(Customer_ID,Customer_Name) REFERENCES CUSTOMERX(Customer_ID,Customer_Name)



--Practice

--Between Operator
SELECT * FROM "ORDERX" 
WHERE Customer_Name BETWEEN 'AKRAM' AND 'ALI'
 
SELECT * FROM "ORDERX" 
WHERE Customer_ID BETWEEN 111 AND 115

--SQL ALIAS

SELECT Customer_Name AS C_NAME
FROM CUSTOMERX





