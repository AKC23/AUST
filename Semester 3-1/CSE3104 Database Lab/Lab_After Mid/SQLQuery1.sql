
drop database SQL_PractiseALL

create database SQL_PractiseALL

drop table OfficeX

create table OfficeX
(
O_Id int,
salary int,
dept varchar(255),
name varchar(255)
)

INSERT INTO OfficeX VALUES
(1, 20000, 'hr','JAMAL'),  
(2, 25000, 'accounts','AHMED'),  
(3, 55000, 'manager','SADIA'),  
(4, 15000, 'hr','ILMA'),  
(5, 28000, 'accounts',''), 
(6, 35000, 'manager','')

select * from OfficeX

select AVG(salary) AS SalaryColumn from OfficeX								/* Finding average salary*/

select AVG(salary) AS SalaryColumn from OfficeX	WHERE DEPT='hr'				/* Finding average salary of distinct department*/

SELECT COUNT (dept) AS DEPT FROM OfficeX									/* Counting Total depts */

SELECT MAX(salary) AS MaxSalary FROM OfficeX								/* Finding Maximum salary */

SELECT MIN(salary) AS MinSalary FROM OfficeX								/* Finding Minimum salary */

SELECT SUM(salary) AS Salary FROM OfficeX where dept='hr'					/* Finding total salary of HR Department */

SELECT dept,salary FROM OfficeX												/* Finding every salary of every Departments */
SELECT dept,MAX(salary) AS 'Salary' FROM OfficeX group by dept,salary

SELECT dept,MAX(salary) AS 'Salary' FROM OfficeX  group by O_Id, dept		/* Selecting each salary of every Departments */

SELECT dept,MAX(salary) AS 'Salary' FROM OfficeX group by dept				/* Finding max salary of every Departments */

SELECT dept,SUM(salary) AS 'Salary' FROM OfficeX group by dept				/* Finding total salary of every Departments */ 

SELECT * FROM OfficeX WHERE name LIKE 'A%'									/* Finding where first letter is A */
 
SELECT * FROM OfficeX WHERE name LIKE '%A%'									/* Finding where letter A is found */

SELECT * FROM OfficeX WHERE name LIKE '%A'									/* Finding where last letter is */		   

SELECT NAME as 'Name' ,dept as 'Department',MAX(salary) as 'salary' from OfficeX	/* Finding name, salary and department where NAME have letter s */
group by name,dept having NAME like '%s%'

select MAX(salary) - MIN(salary) as 'salarydiff' from OfficeX						/* Finding difference between max and min elements */

select dept as 'Departments',MAX(salary) - MIN(salary) as 'salarydiff' 
from OfficeX group by dept															/* Finding difference of each departments */


SELECT COUNT(DISTINCT dept) FROM OfficeX											/* Counting DISTINCT departments */

select * from OfficeX

select top 1 * from OfficeX order by salary	desc									/* Max salary of all */
select top 1 * from OfficeX order by salary	asc										/* Min salary of all */


select top 1 * from OfficeX 														/* Top salary of the list */
select top 1 * from OfficeX order by o_id desc										/* Bottom salary of all  */

/* select top 1 * from OfficeX group by NAME order by salary desc	  */

SELECT First(salary) AS 'Salary' FROM OfficeX

SELECT salary FROM OfficeX ORDER BY O_Id LIMIT 1 


SELECT name,SUM(salary) as 'Salary' FROM OfficeX GROUP BY name								 /*People who have 'Name', show their salary	  */
SELECT name,SUM(salary) as 'Salary' FROM OfficeX GROUP BY name HAVING SUM(salary)<30000		 /*People who have 'Name', show their salary<30000	  */

SELECT * FROM  OfficeX

SELECT name,SUM(salary) as 'Salary' FROM OfficeX									 /*name = 'Sadia' or 'Ilma' have more than 25000 salary  */
WHERE name='ILMA' OR name='SADIA' 
GROUP BY name 
HAVING SUM(salary)>25000

SELECT dept,SUM(salary) as 'Salary' FROM OfficeX									  /* Dept and name = 'Sadia' or 'Ilma' have more than 25000 salary  */
WHERE name='ILMA' OR name='SADIA' 
GROUP BY dept 
HAVING SUM(salary)>10000

Select name,salary from OfficeX group by name,salary having salary<25000


drop database Practise06

create database Practise06

drop table Exam3

create table Exam3
(
	Rollno int,
	S_code varchar(255),
	Marks int,
	B_Code varchar(255)
)

drop table Student3

create table Student3
(
	Rollno int,
	Name varchar(255),
	Branch varchar(255)
)

Select * from Exam3
Select * from Student3

insert into Exam3 values
(1,'CS111',50,'CSE'),
(1,'CS112',60,'CSE'),
(2,'EC101',66,'ECE'),
(2,'EC102',66,'CSE'),
(3,'EC102',70,'CSE'),
(3,'CS122',80,'CSE'),
(4,'EC102',50,'CSE'),
(4,'CS122',60,'CSE'),
(6,'EC201',50,'ECE')

insert into student3 values
(1,'Jay','CSE'),
(2,'Suhani','ECE'),
(3,'Kriti','ECE'),
(4,'Selim','CSE'),
(5,'Hasan','ECE')

Select * from Exam3
Select * from Student3

/*Left Join*/
Select student3.Rollno, student3.Name, student3.Branch,Exam3.Marks,Exam3.B_Code,Exam3.S_code
From student3 
left join Exam3
on student3.Rollno = Exam3.Rollno

/*Right Join*/
Select student3.Rollno, student3.Name, student3.Branch,Exam3.Marks,Exam3.B_Code,Exam3.S_code
From student3 
right join Exam3
on student3.Rollno = Exam3.Rollno

/*Left Join from Exam3 */
Select student3.Rollno, student3.Name, student3.Branch,Exam3.Marks,Exam3.B_Code,Exam3.S_code
From Exam3
left join Student3
on Exam3.Rollno = Student3.Rollno

/*Right Join from Exam3*/
Select Exam3.Rollno, Exam3.S_code, Exam3.Marks, Exam3.B_Code, Student3.Name
From Exam3
right join Student3
on Exam3.Rollno = Student3.Rollno

/*Inner Join*/
Select student3.Rollno, student3.Name, Branch,Marks,B_Code,S_code,Exam3.Rollno
From student3 
inner join Exam3
on student3.Rollno = Exam3.Rollno

/*Join and Inner join is the same.*/
Select student3.Rollno, student3.Name, student3.Branch, Exam3.Marks,Exam3.B_Code,Exam3.S_code,Exam3.Rollno
From student3 
join Exam3
on student3.Rollno = Exam3.Rollno

/*Full Join*/
Select student3.Rollno, student3.Name, student3.Branch,Exam3.Marks,Exam3.B_Code,Exam3.S_code,Exam3.Rollno
From student3 
full join Exam3
on student3.Rollno = Exam3.Rollno

/* union -> number of columns selected must be equal from both tables and data types must match */

Select Name as 'Name&Branch', Branch as 'Department' from student3
union
Select s_code,B_Code from Exam3

/*Union all selects everything from both the tables*/

Select Name as 'Name&Branch',Branch as 'Department' from student3
union all
Select s_code,B_Code from Exam3


SELECT Name,Branch
from student3
INTERSECT
SELECT s_code,B_Code 
from Exam3


drop table Student3

drop DATABASE ONLINETEST1
CREATE DATABASE ONLINETEST1


CREATE TABLE ORDERSTEST1
(
	ORD_NO INT,
	purch_amt FLOAT,
	ord_date DATE,
	customer_id INT,
	salesman_id INT
)
INSERT INTO ORDERSTEST1 VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65 ,'2012-09-10' ,3001 ,5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004 ,110.5, '2012-08-17' ,3009 ,5003),
(70007, 948.5, '2012-09-10', 3005 ,5002),
(70005 ,2400.6 ,'2012-07-27 ',3007 ,5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010 ,1983.43, '2012-10-10' ,3004 ,5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012 ,250.45, '2012-06-27 ',3008 ,5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013 ,3045.6, '2012-04-25' ,3002 ,5001);

SELECT * FROM ORDERSTEST1

CREATE TABLE SALESMANTEST1
(
	salesman_id INT,
	name VARCHAR(255),
	city VARCHAR(255),
	commission FLOAT,
)	

INSERT INTO SALESMANTEST1 VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002 ,'Nail Knite' ,'Paris ',0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006 ,'Mc Lyon', 'Paris ',0.14),
(5007, 'Paul Adam',' Rome', 0.13),
(5003 ,'Lauson Hen' ,'San Jose' ,0.12);

SELECT * FROM SALESMANTEST1

select salesman_id,MAX(purch_amt) AS maximum_purchase_amount  from ORDERSTEST1
where salesman_id>=5003 and salesman_id<=5008
group by salesman_id


select customer_id,ord_date,MAX(purch_amt) AS maximum_purchase_amount from ORDERSTEST1
where purch_amt>=2000 and purch_amt<=6000
group by customer_id,ord_date

SELECT salesman_id, COUNT(SALESMANTEST1.salesman_id) as total_salesman
FROM orders
JOIN SALESMANTEST1
  ON orders.salesman_id = SALESMANTEST1.salesman_id
GROUP BY orders.customer_id
having COUNT(salesman.salesman_id)>1
ORDER BY orders.salesman_id;

SELECT customer_id, COUNT(salesman.salesman_id) as total_salesman
FROM orders
JOIN salesman
  ON orders.salesman_id = salesman.salesman_id
GROUP BY orders.customer_id
having COUNT(salesman.salesman_id)>1
ORDER BY orders.customer_id;






















