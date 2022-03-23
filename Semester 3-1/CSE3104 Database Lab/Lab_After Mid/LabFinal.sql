
DROP DATABASE LABFINAL
CREATE DATABASE LABFINAL

DROP TABLE EMPLOYEEX

CREATE TABLE EMPLOYEEX
(
EmpId int identity(101,1),
FirstName varchar(255),
LastName varchar(255),

CONSTRAINT PK_EmpId Primary Key(EmpId)

)

ALTER TABLE EMPLOYEEX 
ADD CONSTRAINT pk_EMPID PRIMARY KEY (EmpId) 
/* Alter table Employeex
	Drop CONSTRAINT pk_EMPID   */

INSERT INTO EMPLOYEEX VALUES
('John', 'Doe'),
('Samantha', 'Simpson'),
('Kuldeep', 'Rana'),
('James', 'Hoog'),
('Nail', 'Knite'),
('Pit', 'Alex'),
('Mc', 'Lyon'),
('Paul', 'Adam'),
('Lauson', 'Hen'),
('Albert', 'Thomson'),
('Robert', 'Ford'),
('Alex', 'Gomez')

select * from EMPLOYEEX

DROP TABLE "CALLX" 

CREATE TABLE "CallX"
(
callId int,
EmpId int,
start_time datetime,
end_time datetime
)

ALTER TABLE "CallX" 
ADD CONSTRAINT FK_EmpId FOREIGN KEY (EmpId) REFERENCES EMPLOYEEX(EmpId)
														
ALTER TABLE "CallX" 
ADD CHECK (EmpId>0) 

INSERT INTO "CallX" VALUES
(1, 101, '2020-01-11 09:00:15:000','2020-01-11 09:12:22:000'),
(2, 101,' 2020-01-11 09:14:50:000','2020-01-11 09:20:01:000'),
(4, 201 ,'2020-01-11 09:24:15:000','2020-01-11 09:25:05:000'),
(5, 801 ,'2020-01-11 09:26:23:000','2020-01-11 09:33:45:000'),
(6, 505, '2020-01-11 09:40:31:000 ','2020-01-11 09:42:32:000'),
(8, 101, '2020-01-11 09:42:32:000','2020-01-11 09:46:53:000')

select * from "CallX"


/*Like operator   */

select * From EmployeeX
where FirstName like '%a%'

select * From EmployeeX
where FirstName like '%a'

select * From EmployeeX
where FirstName like 'a%'


select * From EmployeeX
where FirstName like 'A_be_t'

select * from EMPLOYEEX

select * From EmployeeX
where FirstName like '[!Asp]%'				   /* persons with a last name that starts with "A" or "s" or "p" */

SELECT * FROM EmployeeX 
WHERE (FirstName + ' ' + LastName LIKE '%a%i%n%') 

/* In Operator */

SELECT * FROM EmployeeX
WHERE LastName IN('Rana');


/* Sorting  */

SELECT LastName FROM EmployeeX 
ORDER BY LastName DESC 

SELECT LastName 
FROM EmployeeX 
ORDER BY LastName ASC










drop Database LabMid
Create Database LabMid

drop table Branch
create table Branch
(
branch_name varchar(255) primary key,
branch_city varchar(255),
assets int

)

insert into Branch   values
('Agrabad','Chittagong',1025000),
('Banani','Dhaka',157500),
('Gulshan','Dhaka',17000000)



select * from Branch

drop table Borrower
create table Borrower
(
customer_id int,
loan_number int,
primary key(customer_id,loan_number)
)

insert into Borrower  values
(105,1002),
(102,1004),
(103,1005),
(105,1001),
(106,1000)

select * from Borrower


drop table Loan
create table Loan
(
loan_number int primary key,
branch_name varchar(255),
amount int
)

insert into Loan values
(1000,'Banani',150000),
(1001,'Agrabad',500000),
(1002,'Agrabad',325000),
(1003,'Gulshan',175000),
(1004,'Agrabad',225000),
(1005,'Banani',325000)


select * from Loan

drop table Account
create table Account
(
account_number int primary key,
branch_name varchar(255),
balance int
)

insert into Account values
(10200,'Agrabad',10500),
(10201,'Agrabad',85000),
(10202,'Gulshan',60000),
(10203,'Agrabad',15000),
(10204,'Agrabad',52000),
(10205,'Gulshan',102000)

select * from Account


drop table Customer9
create table Customer9
(
customer_id int primary key,
customer_name varchar(255),
customer_street varchar(255),
customer_city varchar(255)
)

insert into Customer9 values
(100,'A','Motijheel','Dhaka'),
(101,'B','Agrabad','Chittagong'),
(102,'C','Hathazari','Chittagong'),
(103,'D','Banani','Dhaka'),
(104,'E','Gulshan','Dhaka')

select * from Customer9;

SELECT customer_name as cName, customer_street as cStreet 
FROM Customer9 INNER JOIN borrower 
on customer9.customer_id = 
borrower.customer_id 
WHERE loan_number between 1002 and 1004;

SELECT sum(loan.amount) as TotalLoan FROM loan INNER JOIN 
branch ON branch.branch_name = loan.branch_name WHERE 
branch.branch_name = 'Banani' OR branch.branch_city = 'Chittagong';


SELECT account_number, balance*0.5 as updatedBalance FROM 
account WHERE account_number > 10204 and account.branch_name = 
'Chittagong';
SELECT customer9.customer_id FROM customer9 WHERE 
customer_street LIKE '%tha';


DROP TABLE SALESREPS
create table SALESREPS
(
EMPL_NUM INT,
NAME VARCHAR(255),
AGE	INT,
TITLE  VARCHAR(255),
OFFICE   VARCHAR(255),
HIRE_DATE  DATE,
QUOTA  VARCHAR(255),
MANAGER_NUM	INT,
)

INSERT INTO SALESREPS VALUES
(1,'A',27,'EMPLOYEE','X','2020-01-11','M','1'),
(2,'B',25,'EMPLOYEE','Y','2020-06-16','N','2'),
(1,'C',27,'SECONDARY OFFICER','Z','2020-07-17','O','3')

SELECT * FROM SALESREPS

DROP TABLE OFFICES
create table OFFICES
(
CITY VARCHAR(255),
"TARGET"  VARCHAR(255),
REGION   VARCHAR(255),
OFFICE VARCHAR(255),
SALES INT,
)

INSERT INTO OFFICES VALUES
('DHAKA','A','BD','X',1200),
('CTG','B','BD','Y',2000),
('RANGPUR','C','BD','Z',5000)

SELECT * FROM OFFICES

DROP TABLE PRODUCTS3
create table PRODUCTS3
(
PRODUCT_ID INT,
MFR_ID INT,
"DESCRIPTION" VARCHAR(255),
PRICE INT,
)

INSERT INTO PRODUCTS3 VALUES
(1,27,'RICE',500),
(2,34,'ONION',200),
(3,44,'CHIPS',50)

SELECT * FROM PRODUCTS3

DROP TABLE CUSTOMERS3
create table CUSTOMERS3
(
CUST_NUM INT,
COMPANY VARCHAR(255),
EMP_NUM VARCHAR(255),
CREDIT_LIMIT INT,
)

INSERT INTO CUSTOMERS3 VALUES
(1,'C1',1,500),
(2,'C2',2,200),
(3,'C3',3,100)

SELECT * FROM CUSTOMERS3

DROP TABLE ORDERS3
create table ORDERS3
(
ORDER_NUM INT,
ORDER_DATE DATE,
EMP_NUM INT,
CUST_NUM INT,
MFR_ID INT,
PRODUCT_ID INT,
QUANTITY INT,
AMOUNT INT
)

INSERT INTO ORDERS3 VALUES
(1,'2020-02-11',1,2,1,1,5,1000),
(2,'2020-03-11',2,3,2,1,10,3000),
(3,'2020-04-11',3,4,3,2,11,2000)

SELECT * FROM ORDERS3

/* Find out each salesperson number, name and the city and region 
where they work.		 */

SELECT * FROM SALESREPS
SELECT * FROM OFFICES


SELECT SALESREPS.EMPL_NUM,NAME,OFFICES.CITY,OFFICES.REGION
FROM SALESREPS INNER JOIN OFFICES
ON SALESREPS.OFFICE = OFFICES.OFFICE

/* Find the customers who ordered maximum amount (quantity) of products.	  */

SELECT SALESREPS.EMPL_NUM,NAME,OFFICES.CITY,OFFICES.REGION
FROM SALESREPS INNER JOIN OFFICES
ON SALESREPS.OFFICE = OFFICES.OFFICE

















