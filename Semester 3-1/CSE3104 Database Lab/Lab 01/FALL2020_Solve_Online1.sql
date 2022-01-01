DROP DATABASE SampleDB
CREATE DATABASE SampleDB

DROP TABLE SALESMAN3
DROP TABLE CUSTOMER3
DROP TABLE ORDER3

CREATE TABLE SALESMAN3
(
Salesman_ID int IDENTITY(1001,1),
LastName varchar(50),
FirstName varchar(50),
Area VARCHAR(50),
YearOfService int,
Salary int,

CONSTRAINT PK_S_ID3 PRIMARY KEY(Salesman_ID)
)

INSERT INTO SALESMAN3  VALUES
('Khan','Rahim','Gulshan',5,3800),
('Rahman','Fahim','Mirpur',2,4200),
('Molla','Aziz','Badda',3,2000)

SELECT * FROM SALESMAN3

DROP TABLE CUSTOMER3

CREATE TABLE CUSTOMER3
(
Customer_ID int IDENTITY(101,10),
CustomerName varchar(50),
Location VARCHAR(50),
PinCode int,
Class VARCHAR(50) DEFAULT 'C',

CONSTRAINT PK_C_ID3 PRIMARY KEY (Customer_ID)
)

INSERT INTO CUSTOMER3  VALUES
('ABC','Dhaka',1200,'A'),
('DEF','Sylhet',1188,DEFAULT),
('XYZ','Barishal',555,'B')

SELECT * FROM CUSTOMER3

TRUNCATE TABLE CUSTOMER3

DROP TABLE ORDER3

CREATE TABLE ORDER3
(
Order_ID int IDENTITY(3001,1),
Customer_ID int,
Salesman_ID int,
OrderDate DATE,
OrderAmount NUMERIC(7,2),

CONSTRAINT PK_O_ID3 PRIMARY KEY (Order_ID)
)

ALTER TABLE ORDER3
ADD CONSTRAINT FK_C_ID3 FOREIGN KEY(Customer_ID) REFERENCES CUSTOMER3(Customer_ID)

ALTER TABLE ORDER3
ADD CONSTRAINT FK_SID3 FOREIGN KEY(Salesman_ID) REFERENCES SALESMAN3(Salesman_ID)

ALTER TABLE ORDER3
DROP FK_C_ID3

ALTER TABLE ORDER3
DROP FK_SID3

INSERT INTO ORDER3  VALUES
(101,1002,'2020-12-01',1005),
(111,1001,'2021-05-05',2003),
(121,1003,'2020-12-09',3503),
(101,1001,'2021-08-10',3002)

SELECT * FROM SALESMAN3
SELECT * FROM CUSTOMER3
SELECT * FROM ORDER3

DELETE FROM CUSTOMER3
WHERE Customer_ID = 131

-- 1. Display all the information about each salesman with appropriate headings 
-- such as Salesman’s Full Name, City, and Salary Earned

SELECT FirstName + ' ' + LastName AS FULLNAME, Area AS CITY, Salary AS SalaryEarned FROM SALESMAN3

-- 2. List all the salesmen that live outside the “Gulshan” area.

SELECT FirstName + ' ' + LastName AS FULLNAME, Area AS CITY, Salary AS SalaryEarned FROM SALESMAN3
WHERE Area <> 'Gulshan'


-- 3. Display class 'A' customers with their name and location.
SELECT CustomerName, Location FROM CUSTOMER3 WHERE CLASS = 'A'

-- 4. Retrieve the areas from which the salespersons belong.
SELECT Area FROM SALESMAN3

-- 5. Change the class of the customers to ‘A’ who live in “Sylhet” area.

UPDATE Customer3 SET Class = 'A' WHERE Location = 'Sylhet' 
SELECT * FROM CUSTOMER3

-- 6. List the information of all the customers who are located in “Barishal”.

SELECT * FROM CUSTOMER3 WHERE LOCATION = 'Barishal'

-- 7. List the name of all the salesmen whose salary is greater than 20000.00 BDT

SELECT Salesman_ID, FirstName + ' ' + LastName AS FullName, Area, YearOfService FROM SALESMAN3 
WHERE Salary > 2000  

-- 8. Change the order amount for the order id 3004.

UPDATE ORDER3 SET OrderAmount = 5000 WHERE Order_ID = 3004 
SELECT * FROM ORDER3

-- 9. List Salesman’s Name & Area in sorted order by their salary.
SELECT FirstName + ' ' + LastName AS FullName, Area FROM SALESMAN3
ORDER BY Salary ASC

-- 10. List order related information from the ORDER table for 
-- Customer Id 101 (show the current orders at first).

SELECT * FROM ORDER3 WHERE Customer_id = 101 ORDER BY OrderDate ASC

-- 11. Update the SALESMAN table to provide the bonus of 2.5% BDT 
-- whose year of service greater than 2 years. 

UPDATE SALESMAN3 SET Salary = Salary * 2.5 WHERE YearOfService>2
SELECT * FROM SALESMAN3

-- 13. List the DISTINCT areas FROM where the customers belong.
SELECT DISTINCT LOCATION FROM CUSTOMER3	ORDER BY LOCATION DESC

-- 14. Give .5% discount to all the orders greater than 3000.00 BDT.
SELECT OrderAmount FROM ORDER3

UPDATE ORDER3 SET ORDERAMOUNT = 1005 WHERE ORDER_ID = 3001		 --Code have changed a lot that's why updated values again
UPDATE ORDER3 SET ORDERAMOUNT = 2003 WHERE ORDER_ID = 3002
UPDATE ORDER3 SET ORDERAMOUNT = 3503 WHERE ORDER_ID = 3003
UPDATE ORDER3 SET ORDERAMOUNT = 3002 WHERE ORDER_ID = 3004
SELECT * FROM ORDER3


UPDATE ORDER3 SET ORDERAMOUNT = ORDERAMOUNT - (ORDERAMOUNT*.5) WHERE ORDERAMOUNT >3000
SELECT * FROM ORDER3

-- 15. Delete the order related information of the orders less than 1500.00 BDT

DELETE FROM ORDER3 WHERE ORDERAMOUNT<1500
SELECT * FROM ORDER3

-- E1. Show the information of the Salesman whose firstname contains 'a','h','i'
-- and year of service is greater than 3

SELECT * FROM SALESMAN3 WHERE ( (FirstName LIKE '%a%h%i%') AND (YEAROFSERVICE > 3))

-- E2. Show the information of the Salesman whose firstname and last name contains 'a','h','i'

SELECT * FROM SALESMAN3 
WHERE (FirstName + ' ' + LastName LIKE '%a%i%n%') 

-- E3. Show the information of the Salesman whose CustomerName is "Fahim" or Location is "Barishal"

SELECT * FROM CUSTOMER3 WHERE (CustomerName LIKE 'ABC') OR (Location LIKE 'Barishal')

-- E4. Show the information of the Orders whose ID is between 3001 and 3004

SELECT ORDER_ID FROM ORDER3 WHERE ORDER_ID BETWEEN 3001 AND 3004

SELECT * FROM ORDER3 WHERE ORDER_ID BETWEEN 3001 AND 3004

-- E5. Show the information of the Orders whose ORDERDATE is between '2020-01-01' AND '2021-01-12'

SELECT * FROM ORDER3 WHERE OrderDate BETWEEN '2020-01-01' AND '2021-01-12'

-- E6. Show the information of the Orders whose LASTNAME is NOT "Molla" 

SELECT * FROM SALESMAN3 WHERE LastName <> 'Molla'

-- E7. Show the information of the Orders whose LASTNAME is "Molla" or "khan"

SELECT * FROM SALESMAN3 WHERE LastName IN ('Molla', 'khan')

-- E8. Check ORDER AMOUNT > 1000 OR NOT

ALTER TABLE ORDER3
ADD CONSTRAINT CHK_OA CHECK (OrderAmount>1000)

INSERT INTO ORDER3	VALUES
(101,1001,'2021-08-10',350)		--ORDER AMOUNT < 1000 SO WON'T WORK
											 
-- E9. Make Unique For ORDER DATE, so that duplicate is NOT allowed

ALTER TABLE ORDER3
ADD CONSTRAINT UC_O_DATE3 UNIQUE (OrderDate)

-- ALTER TABLE ORDER3
-- DROP UC_O_ID3

INSERT INTO ORDER3	VALUES
(101,1001,'2021-08-10',3500)	--ORDER DATE IS NOT UNIQUE SO WON'T WORK








