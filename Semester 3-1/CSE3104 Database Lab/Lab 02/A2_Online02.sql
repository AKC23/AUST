
drop table CUSTOMER

CREATE TABLE CUSTOMER
(
Customer_ID INT IDENTITY(1010,10),
Customer_Name VARCHAR(50) NOT NULL,
CITY VARCHAR(50) DEFAULT 'DHAKA',
DateOfBirth DATE,
)

INSERT INTO CUSTOMER VALUES
('Akram', 'Dhaka','1995-05-14'),
('Shahin', 'Khulna','1980-01-31'),
('Rabeya', 'Barishal','2000-07-12'),
('Ali', 'Rajshahi','1991-01-01'),
('Tania', 'Sylhet','1987-11-21')


DROP TABLE "ORDER"

CREATE TABLE "ORDER"
(
OrderId INT IDENTITY(111,1),
Quantity INT,
)


INSERT INTO "ORDER" VALUES
(20),
(10),
(20),
(20),
(30)

--> 01
select * from CUSTOMER
select * from "order"


--> 02

ALTER TABLE CUSTOMER
ADD CONSTRAINT PK_CIDNAME PRIMARY KEY(Customer_ID,Customer_Name)	


--> 03
select * from CUSTOMER 
ORDER BY DateOfBirth ASC


--> 04
-- ALTER TABLE CUSTOMER
ALTER TABLE CUSTOMER 
ADD UNIQUE (CITY)  

-->	05

ALTER TABLE "ORDER"
ADD Customer_ID INT 


ALTER TABLE "ORDER"
ADD Customer_Name  VARCHAR(50)


ALTER TABLE "ORDER"
ADD CONSTRAINT FK_CIDNAME FOREIGN KEY(Customer_ID,Customer_Name) REFERENCES CUSTOMER(Customer_ID,Customer_Name) 


SELECT * FROM "ORDER"











