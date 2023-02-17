clear screen;

SET SERVEROUTPUT ON;

DROP TABLE player;

/*
3 categories of player based on their ages
1. <20 -> Inexperienced
2. 20-40 -> Professional
3. >40 -> Legend
*/

CREATE TABLE player(id number, name varchar2(50), age number, category varchar2(50));

INSERT into player values(1,'Pele',82,'legend');
INSERT into player values(2,'Maradona',60,'legend');
INSERT into player values(3,'Messi',35,'professional');
INSERT into player values(4,'Ronaldo',37,'professional');
INSERT into player values(5,'Enzo',19,'inexperienced');


SET VERIFY OFF;

DECLARE 

	/*Task 01: Take input(name and age) categorize the player based on his age*/
	A player.id%TYPE := 5;
	B player.name%TYPE;
	C player.age%TYPE;
	D player.category%TYPE;
	
	NUM int:= 0;
	
BEGIN
	B := '&NAME';
	C := &AGE;

	IF C > 40 THEN
		D := 'legend';
		INSERT into player VALUES(A+1,B,C,D); 
	ELSIF C <= 20 THEN
		D := 'inexperienced';
		INSERT into player VALUES(A+1,B,C,D); 
	ELSE 
		D := 'professional';
		INSERT into player VALUES(A+1,B,C,D); 
	END IF;
	
	
	/*Task 2: Take 5 inputs where ID will be sequential and set Name = "Unknown player" 
	and Category = "Not verified" for all*/
	B := 'Unknown player';
	D := 'Not verified';
	A := 6;
	LOOP
		NUM := NUM + 1;
		A := A+1;
		IF MOD(NUM,2) = 0 THEN
			C := 30 + (NUM * 3); 
			INSERT into player VALUES(A,B,C,D); 
		ELSE
			C := 30 - (NUM * 3); 
			INSERT into player VALUES(A,B,C,D);
		END	IF;
		EXIT WHEN NUM = 5;
	END LOOP;
	
	/*Task 3: Finally update all categories based on their age */
	UPDATE player SET category = 'retired' WHERE age>40;
	UPDATE player SET category = 'inexperienced' WHERE age <=20;
	UPDATE player SET category = 'professional' WHERE 40 > age AND age >= 20;   
END;
/

commit;
SELECT * FROM player;