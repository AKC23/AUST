SET SERVEROUTPUT ON;
SET VERIFY OFF;

DROP TABLE worksOn CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE PROJECT CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;

CREATE TABLE PROJECT(
    pId INT,
    title VARCHAR(20),
    estimatedDuration INT,
	primary key (pId)
);

CREATE OR REPLACE TRIGGER PROJECT_Trigg 
After INSERT 
ON PROJECT
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('PROJECT Table is created');
END;
/
INSERT INTO project VALUES (1, 'ABCD', 2);
INSERT INTO project VALUES (2, 'EFGH', 5);
INSERT INTO project VALUES (3, 'IJKL', 3);
INSERT INTO project VALUES (4, 'MNOP', 1);
INSERT INTO project VALUES (5, 'QRST', 6);


CREATE TABLE DEPARTMENT (
   dID INT,
   dName VARCHAR(20),
   supID INT,
   primary key (dID)
);

CREATE OR REPLACE TRIGGER DEPARTMENT_Trigg 
After INSERT 
ON DEPARTMENT
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('DEPARTMENT Table is created');
END;
/
INSERT INTO department VALUES (1, 'HR', 5);
INSERT INTO department VALUES (2, 'Customer Service', 3);
INSERT INTO department VALUES (3, 'IT', 6);
INSERT INTO department VALUES (4, 'Finance', 4);


CREATE TABLE EMPLOYEE(
    eID INT,
    eName VARCHAR(20),
    age INT,
    gender VARCHAR(20),
    salary INT,
    dID INT,
	primary key (eID),
	FOREIGN KEY (dID) REFERENCES department(dID)
);
CREATE OR REPLACE TRIGGER EMPLOYEE_Trigg
After INSERT 
ON EMPLOYEE
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('EMPLOYEE Table is created');
END;
/
INSERT INTO EMPLOYEE VALUES (1, 'A', 32, 'M', 32000, 3);
INSERT INTO EMPLOYEE VALUES (2, 'B', 45, 'F', 39000, 2);
INSERT INTO EMPLOYEE VALUES (3, 'C', 48, 'M', 40000, 2);
INSERT INTO EMPLOYEE VALUES (4, 'D', 25, 'F', 25000, 4);
INSERT INTO EMPLOYEE VALUES (5, 'E', 56, 'M', 60000, 1);
INSERT INTO EMPLOYEE VALUES (6, 'F', 49, 'F', 42000, 3);



CREATE TABLE WorksOn(
	pId INT,
	eId INT,
	FOREIGN KEY (pId) REFERENCES PROJECT(pId),
	FOREIGN KEY (eId) REFERENCES EMPLOYEE(eId)
);

CREATE OR REPLACE TRIGGER WorksOn_Trigg 
After INSERT 
ON WorksOn
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('WorksOn Table created');
END;
/ 
INSERT INTO WorksOn VALUES (1, 2);
INSERT INTO WorksOn VALUES (2, 3);
INSERT INTO WorksOn VALUES (3, 4);
INSERT INTO WorksOn VALUES (3, 5);
INSERT INTO WorksOn VALUES (3, 6);
INSERT INTO WorksOn VALUES (4, 3);
INSERT INTO WorksOn VALUES (5, 4);
INSERT INTO WorksOn VALUES (1, 5);

commit;



Accept DID number prompt "Enter department id:  "

CREATE OR REPLACE PACKAGE Pack1 AS
FUNCTION FindOldestAge(i IN DEPARTMENT.dId%TYPE)
RETURN EMPLOYEE.age%TYPE;
PROCEDURE FindEmployee(s IN EMPLOYEE.age%TYPE);
end Pack1;
/

CREATE OR REPLACE PACKAGE Body Pack1 AS

FUNCTION FindOldestAge(i IN DEPARTMENT.dId%TYPE)
RETURN EMPLOYEE.age%TYPE
IS 
   X EMPLOYEE.age%TYPE;
   
   CURSOR age 
   IS
   SELECT MAX(EMPLOYEE.age)  FROM 
   EMPLOYEE INNER JOIN WorksOn ON EMPLOYEE.eID = WorksOn.eID 
   WHERE EMPLOYEE.dID = i;
   
BEGIN
	OPEN age;
       FETCH age INTO X;
	CLOSE age;
	RETURN X;
end FindOldestAge;


PROCEDURE FindEmployee(s IN EMPLOYEE.age%TYPE)
IS	
BEGIN
	FOR i IN (select EMPLOYEE.eName,EMPLOYEE.age,EMPLOYEE.gender,EMPLOYEE.salary,DEPARTMENT.dName 
	FROM EMPLOYEE INNER JOIN DEPARTMENT 
	ON EMPLOYEE.dID = DEPARTMENT.dID WHERE EMPLOYEE.age = s) LOOP
		DBMS_OUTPUT.PUT_LINE('Name: ' || i.eName);
		DBMS_OUTPUT.PUT_LINE('Age: ' || i.age);
		DBMS_OUTPUT.PUT_LINE('Gender: ' || i.gender);
		DBMS_OUTPUT.PUT_LINE('Salary: ' || i.salary);
		DBMS_OUTPUT.PUT_LINE('Department: ' || i.dName);
	END LOOP;
END FindEmployee;

END Pack1;
/	
	
DECLARE
	oldest employee.age%TYPE;
	d_ID NUMBER;
    DefException EXCEPTION;

BEGIN
    d_ID := &DID;
    oldest := Pack1.FindOldestAge(d_ID);
	
	IF oldest IS NULL THEN
		RAISE DefException;
	END IF;
	Pack1.FindEmployee(oldest);
	
EXCEPTION
	WHEN DefException THEN
		DBMS_OUTPUT.PUT_LINE('Department does not exist');	
END;
/