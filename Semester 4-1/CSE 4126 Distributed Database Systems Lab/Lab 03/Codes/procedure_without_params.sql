SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE sampleProcedure
IS

BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello world');

END sampleProcedure;
/


/*
BEGIN
	sampleProcedure;
END;
/
*/


--EXEC sampleProcedure;
