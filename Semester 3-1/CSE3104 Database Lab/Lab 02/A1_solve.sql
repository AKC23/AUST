CREATE TABLE PERSONS1(
P_ID INT,
FIRSTNAME VARCHAR(255),
LASTNAME VARCHAR(255),
DateOfBirth DATE,
CITY VARCHAR(255)
)

SELECT * FROM PERSONS1

INSERT INTO PERSONS1 VALUES(1001,'Kamal', 'Uddin','1980-12-09','Dhaka'),
(1002,'Sonia', 'Akhter','1996-05-10','Comilla'),
(1003,'Abdur', 'Rahim','1996-01-10','Dhaka'),
(1004,'Nurul', 'Islam','1994-05-23','Khulna'),
(1005,'Tania', 'Khatun','1989-10-31','Sylhet')

SELECT * FROM PERSONS1
													--CHANGE DOB OF RAHIM
UPDATE PERSONS1 SET DateOfBirth = '1960-01-01' WHERE LASTNAME = 'Rahim'

SELECT * FROM PERSONS1

UPDATE PERSONS1 SET DateOfBirth = '1989-10-31' WHERE P_ID = 1005

SELECT DATEDIFF(YY,DateOfBirth, GETDATE())
FROM PERSONS1

--PROCEDURE 01
SELECT DATEDIFF(YY,DateOfBirth,GETDATE()) AS AGE1
FROM PERSONS1
 


SELECT 
CASE WHEN DATEADD(YEAR,DATEDIFF(YY,DateOfBirth, GETDATE()),DateOfBirth ) > 30
THEN DATEDIFF(YY,DateOfBirth, GETDATE()) - 1
ELSE
DATEDIFF(YY,DateOfBirth, GETDATE()) END AS AGE
FROM PERSONS1
WHERE MONTH(DateOfBirth) = 11

--SELECT * FROM PERSONS1 WHERE TRUNC(SYSDATE - PERSONS1.DateOfBirth))>30;
--SELECT ID,SYSDATE(),DOB,DATEDIFF(SYSDATE(),DOB)/365 AS AGE from emp_tbl WHERE(DATEDIFF(SYSDATE(), DOB)/365)>30;


SELECT DISTINCT CITY FROM PERSONS1	  --SHOW DISTINCT CITY




ALTER TABLE PERSONS1	 --PHONE COLUMN ADDED
ADD Phone INT








