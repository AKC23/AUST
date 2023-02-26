SET SERVEROUTPUT ON;

DECLARE
  A money.id%TYPE;
  B money.taka%TYPE;
  c money.NAME%TYPE;
  
BEGIN
	FOR R IN (SELECT * FROM money) LOOP
		A := R.id;
		B := R.taka;
		C := R.NAME;
		DBMS_OUTPUT.PUT_LINE(A || ' ' || B || ' ' || C);
		
	END LOOP;
END;
/

select * from money;