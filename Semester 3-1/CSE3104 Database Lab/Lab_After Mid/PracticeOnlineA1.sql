
drop database onlinetest2

create database onlinetest2

drop table orderstest2

create table orderstest2
(
ord_no int,
purch_amt float,
ord_date date,
customer_id int,
salesman_id int
)

insert into orderstest2 values 
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.6,'2012-04-25',3002,5001)

SELECT * FROM orderstest2

drop table Salesmantest2
create table Salesmantest2
(
	salesman_id int,
	name varchar(255),
	city varchar(255),
	comission numeric(3,2)
)

insert into Salesmantest2 values 
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12)

SELECT * FROM Salesmantest2


/* ANSWER 1 */
SELECT salesman_id, MAX(purch_amt) as MaximumPurchaseAmount from orderstest2
where salesman_id>= 5003 AND salesman_id <= 5008
group by salesman_id

SELECT SALESMAN_ID, MAX(PURCH_AMT) AS MAXIMUMPURCHASEAMOUNT FROM ORDERSTEST2
GROUP BY SALESMAN_ID
HAVING SALESMAN_ID>=5003 AND SALESMAN_ID<=5008


/* ANSWER 2 */
SELECT CUSTOMER_ID,ORD_DATE, MAX(PURCH_AMT) AS MAXIMUMPURCHASEAMOUNT FROM ORDERSTEST2
WHERE PURCH_AMT>= 2000 AND PURCH_AMT<=6000
GROUP BY CUSTOMER_ID,ORD_DATE

/* ANSWER 3 */
SELECT salesmantest2.salesman_id,salesmantest2.name, MAX(Orderstest2.purch_amt) 
AS MaximumPurchaseAmount 
from salesmantest2
right join orderstest2
on salesmantest2.salesman_id = orderstest2.salesman_id 
where ord_date = '2012-08-17'
group by salesmantest2.salesman_id, salesmantest2.name



/* ANSWER 4 */

Select salesmantest2.salesman_id,salesmantest2.name, Orderstest2.customer_id,
COUNT(Orderstest2.purch_amt) AS HighestNumberOfPurchase
From salesmantest2
Right join Orderstest2
on Salesmantest2.salesman_id = Orderstest2.salesman_id
group by salesmantest2.salesman_id, salesmantest2.name,Orderstest2.customer_id  



SELECT ORDERSTEST2.customer_id,Salesmantest2.salesman_id,Salesmantest2.name,
COUNT(ORDERSTEST2.PURCH_AMT) AS TOTALNUMBEROFPURCHASE FROM SALESMANTEST2
RIGHT JOIN ORDERSTEST2 
ON Salesmantest2.salesman_id = Orderstest2.salesman_id
GROUP BY ORDERSTEST2.customer_id,Salesmantest2.salesman_id,Salesmantest2.name






/*Practice online */

drop table EmployeeDetails
create table EmployeeDetails
(
EmpId int,
FullName varchar(255),
ManagerId int,
DateOfJoining date,
City varchar(255)
)


insert into EmployeeDetails values 
(121,'John Doe',321,'2014-01-31','Toronto'),
(321,'Samantha Simpson',986,'2015-01-30','California'),
(421,'Kuldeep Rana',876,'2016-11-27','New Delhi'),
(621,'James Hoog',598,'2010-08-17','Miami'),
(821,'Nail Knite',621,'2017-09-10','Orlando'),
(221,'Pit Alex',986,'2018-07-27','Las Vegas'),
(521,'Mc Lyon',889,'2018-09-10','California'),
(921,'Paul Adam',489,'2012-10-10','Las Vegas'),
(131, 'Lauson Hen', 115, '2018-10-10', 'California'),
(531, 'Albert Thomson', 921, '2015-06-27', 'Orlando'),
(631, 'Robert Ford', 567, '2015-08-17', 'Toronto'),(831, 'Alex Gomez', 867, '2016-04-25', 'Toronto')

select * from EmployeeDetails 

drop table EmployeeSalary

create table EmployeeSalary
(
EmpId int,
Project varchar(255),
Salary int,
Variable int
)

insert into EmployeeSalary values
(121, 'P1', 8000, 500),(321, 'P2', 10000, 1000),
(321, 'P1', 10000, 0),
(121, 'P3', 20000, 600),
(921, 'P3', 10000, 100),
(321, 'P2', 15000, 300)

select * from EmployeeSalary


/*Answer 01 */
SELECT EmpId, Project from EmployeeSalary
where (Salary>= 5000 or Salary <= 10000) AND (Project <> 'p1')

/*
SELECT EmpId,Project FROM EmployeeSalary
group by EmpId,Salary,Project having 
Salary >=5000 and Salary<=10000 and Project!='p1'
*/

/*Answer 02 */

select EmpId,AVG(Salary+Variable) AS Salary from EmployeeSalary
group by EmpId, Salary 
having avg(Salary+Variable) > Salary

select EmpId,Salary AS Salary from EmployeeSalary
where Salary > (SELECT avg(Salary+Variable) FROM EmployeeSalary) 
group by EmpId, Salary 


/*Answer 03 */
SELECT EmployeeDetails.FullName, Count(EmployeeSalary.Project) AS MoreThan2Projects 
FROM EmployeeDetails
inner join EmployeeSalary
on EmployeeDetails.EmpId = EmployeeSalary.EmpId 
group by EmployeeDetails.FullName
having Count(EmployeeDetails.FullName) > 2


SELECT EMPLOYEEDETAILS.FULLNAME,COUNT(EMPLOYEEDETAILS.EMPID) AS TOTALPROJECTS
FROM EMPLOYEEDETAILS,EMPLOYEESALARY
WHERE EMPLOYEEDETAILS.EMPID=EMPLOYEESALARY.EMPID
GROUP BY EMPLOYEEDETAILS.FULLNAME
having Count(EmployeeSalary.Project) > 2 


SELECT EmployeeDetails.FullName, COUNT(EMPLOYEEDETAILS.EmpId) AS PROJECT 
FROM EMPLOYEEDETAILS INNER JOIN EMPLOYEESALARY 
ON EmployeeDetails.EmpId=EmployeeSalary.EmpId 
GROUP BY FullName
HAVING COUNT(EMPLOYEEDETAILS.FullName)>2




/*Answer 04 */
SELECT EmpId, FullName 
FROM EmployeeDetails INNER JOIN 
(SELECT ManagerId FROM EmployeeDetails 
WHERE YEAR(DateOfJoining)<2018) 
AS NEWER ON EmployeeDetails.EmpId=NEWER.ManagerId


SELECT EmpId,FullName
FROM EmployeeDetails
where YEAR(DateOfJoining)<getdate()
group by EmpId,FullName





select EmpId, FullName from	EmployeeDetails
where (EmpId = ManagerId OR (Datediff(year,DateOfJoining,getdate()) >=4) ) 
group by EmpId, FullName
/* having Datediff(year,DateOfJoining,getdate()) >=4		  */

select EmpId,FullName from EmployeeDetails 
where Datediff(year,DateOfJoining,getdate()) >=4


SELECT salesmantest2.salesman_id,salesmantest2.name, MAX(Orderstest2.purch_amt) 
AS MaximumPurchaseAmount 
from salesmantest2
right join orderstest2
on salesmantest2.salesman_id = orderstest2.salesman_id 
where ord_date = '2012-08-17'
group by salesmantest2.salesman_id, salesmantest2.name







CREATE TABLE  EMPLOYEES(
EMPID INT,
FIRSTNAME VARCHAR(50),
LASTNAME VARCHAR(50)
)

INSERT INTO  EMPLOYEE VALUES 
(101,'JOHN','DOE'),
(301,'SAMANTHA','SIMPSON'),
(401,'KULDEEP','RANA'),
(601,'JAMES','HOOG'),
(801,'NAIL','KNITE'),
(201,'PIT','ALEX'),
(501,'MC','LYON'),
(901,'PAUL','ADAM'),
(102,'HEN','LAUSON'),
(505,'ALBERT','THOMSON'),
(602,'ROBERT','FORD'),
(805,'ALEX','GOMEZ')


CREATE TABLE  CALLS(
CALLERID INT,
EMPLOYEEID INT,
START_TIME DATETIME,
END_TIME DATETIME



)

INSERT INTO CALLS   VALUES 
(1,101,'2020-01-11 09:00:15:000','2020-01-11 09:12:22:000'),
(2,101,'2020-01-11 09:14:50:000','2020-01-11 09:20:01:000'),
(4,201,'2020-01-11 09:24:15:000','2020-01-11 09:25:05:000'),
(5,801,'2020-01-11 09:26:23:000','2020-01-11 09:33:45:000'),
(6,505,'2020-01-11 09:40:31:000','2020-01-11 09:42:32:000'),
(8,101,'2020-01-11 09:42:32:000','2020-01-11 09:46:53:000')



--1

SELECT CALLERID,EMPLOYEEID,DATEDIFF(SECOND,START_TIME,END_TIME) AS 'SECOND' FROM CALLS


--2


SELECT EMPLOYEEID,DATEDIFF(SECOND,START_TIME,END_TIME) AS 'AVERRAGE CALL DURATION' 
FROM CALLS GROUP BY EMPLOYEEID,START_TIME,END_TIME HAVING DATEDIFF(SECOND,START_TIME,END_TIME) > (SELECT AVG(DATEDIFF(SECOND,START_TIME,END_TIME)  )FROM CALLS)



--3

SELECT CALLERID FROM CALLS 

SELECT EMPLOYEES.EMPID , EMPLOYEES.FIRSTNAME,EMPLOYEES.LASTNAME
FROM EMPLOYEES  LEFT JOIN CALLS
ON EMPLOYEES.EMPID=CALLS.EMPLOYEEID 
HAVING  COUNT(EMPLOYEES.EMPID) >1 



--4

SELECT EMPLOYEES.FIRSTNAME,EMPLOYEES.LASTNAME,COUNT(DATEDIFF("SECOND",CALLS.START_TIME, CALLS.END_TIME)) AS 'LATEST'
FROM CALLS
INNER JOIN EMPLOYEES
ON CALLS.EMPLOYEEID = EMPLOYEES.EMPID 
GROUP BY EMPLOYEES.FIRSTNAME,EMPLOYEES.LASTNAME
HAVING COUNT(DATEDIFF("SECOND",CALLS.START_TIME, CALLS.END_TIME))>1



