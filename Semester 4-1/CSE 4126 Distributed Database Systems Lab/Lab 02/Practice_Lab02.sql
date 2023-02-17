clear screen;

SET SERVEROUTPUT ON;

DROP TABLE money2;
CREATE TABLE money2(id number, name varchar2(50), taka number);

INSERT into money2 values(1,'A',500);
INSERT into money2 values(2,'B',600);
INSERT into money2 values(3,'C',700);

SET VERIFY OFF;

DECLARE 


-- Task 01
	A money2.taka%TYPE := &x;
	B money2.taka%TYPE := &y;
	C money2.taka%TYPE;


BEGIN
	C := A+B;
	DBMS_OUTPUT.PUT('VALUE of C: ');
	DBMS_OUTPUT.PUT_LINE(C);
	
	IF C<170 THEN
		DBMS_OUTPUT.PUT_LINE('C is less than 170');
		INSERT into money2 values(7,'A',C+10);
	ELSIF C>270 THEN
		INSERT into money2 values(7,'A',C+30);
	ELSE 
		INSERT into money2 values(7,'A',C);
	END IF;
END;
/



/*
-- Task 01

	A money2.id%TYPE := &x;
	B money2.name%TYPE := '&name';
	C money2.taka%TYPE := &z;
	
	NUM int:= 0;
BEGIN
	LOOP
		NUM := NUM+1;

		INSERT into money2 values(A+1,B,C);
		DBMS_OUTPUT.PUT_LINE(A);
		DBMS_OUTPUT.PUT_LINE(B);
		DBMS_OUTPUT.PUT_LINE(C);
		EXIT WHEN NUM = 5;
	
	END LOOP;
	
END;
/

*/
commit;
SELECT * FROM money2;


