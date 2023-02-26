SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION sampleFunc(FID_ORDER Orders.fid %TYPE
)RETURN int
is

	A NUMBER;
	OID_ORDER Orders.oid %TYPE;
	-- FID_ORDER Orders.fid %TYPE;
	SID_ORDER Orders.sid %TYPE;
	
	FID_Food Food.fid %TYPE;
	PRICE_Food Food.price %TYPE;
	SUMM int:= 0;
	
	SID_Server Server.sid %TYPE;
	SNAME_Server Server.sname %TYPE;
	SHIFTID_Server Server.shiftid %TYPE;	


BEGIN
	
	FOR F IN (SELECT * FROM Food) LOOP
		FID_Food := F.fid;
		PRICE_Food := F.price;
		--DBMS_OUTPUT.PUT_LINE(FID_ORDER); 
			IF FID_Food = FID_ORDER THEN
				SUMM := SUMM + PRICE_Food;
			END IF;
	END LOOP;
			
	DBMS_OUTPUT.PUT_LINE(SUMM); 
	return SUMM;

END sampleFunc;
/

