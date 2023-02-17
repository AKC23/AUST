clear screen;

SET SERVEROUTPUT ON;

DROP TABLE money2;
CREATE TABLE money2(id number, name varchar2(50), taka number);

INSERT into money2 values(1,'A',500);
INSERT into money2 values(2,'B',600);
INSERT into money2 values(3,'C',700);

SET VERIFY OFF;

DECLARE 

	A money2.id%TYPE := &x;
	B VARCHAR2(50) := '&name';--have to take input string like this 'ABC' -- 
	C money2.taka%TYPE := &z;

	NUM int:= 0;
BEGIN
	LOOP
		NUM := NUM+1;
		A := A+1;
		INSERT into money2 values(A,B,C);
		EXIT WHEN NUM = 5;
	
	END LOOP;
	
END;
/


--commit;--
SELECT * FROM money2;


