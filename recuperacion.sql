CREATE DATABASE IF NOT EXISTS recuperacion;
use recuperacion;

CREATE TABLE IF NOT EXISTS caja_fuerte(
	id char(2) NOT NULL UNIQUE,
	A INT,
	B INT,
	C INT,
	D INT
);

INSERT INTO caja_fuerte (id,A,B,C,D) VALUES ('R1','5','6','7','8');

INSERT INTO caja_fuerte (id,A,B,C,D) VALUES ('R2','16','1','2','9');

INSERT INTO caja_fuerte (id,A,B,C,D) VALUES ('R3','15','3','4','10');

INSERT INTO caja_fuerte (id,A,B,C,D) VALUES ('R4','14','13','12','11');


#_____________________
#|     A   B   C   D  |
#|R1   5   6   7   8  |	
#|R2   16          9  |
#|R3   15          10 |
#|R1   14  13  12  11 |
#|____________________|

#_____________________
#|     A   B   C   D  |
#|R1          	      |	
#|R2       1   2      |
#|R3       3   4      |
#|R1   		      |
#|____________________|


CREATE TABLE IF NOT EXISTS Movimiento(
	id INT NOT NULL AUTO_INCREMENT UNIQUE,
	direccion varchar(3),
	anillo char(1),
	cantidad INT
);


DELIMITER $
CREATE PROCEDURE girarE (dir varchar(3))
	BEGIN

		#Get R1 values
		SET @A_R1 = (SELECT A FROM caja_fuerte WHERE caja_fuerte.id = 'R1'); 
		SET @B_R1 = (SELECT B FROM caja_fuerte WHERE caja_fuerte.id = 'R1');
		SET @C_R1 = (SELECT C FROM caja_fuerte WHERE caja_fuerte.id = 'R1'); 
		SET @D_R1 = (SELECT D FROM caja_fuerte WHERE caja_fuerte.id = 'R1');  

		#Get R2 values
		SET @A_R2 = (SELECT A FROM caja_fuerte WHERE caja_fuerte.id = 'R2'); 
		SET @D_R2 = (SELECT D FROM caja_fuerte WHERE caja_fuerte.id = 'R2'); 
		
		#Get R3 values
		SET @A_R3 = (SELECT A FROM caja_fuerte WHERE caja_fuerte.id = 'R3'); 
		SET @D_R3 = (SELECT D FROM caja_fuerte WHERE caja_fuerte.id = 'R3'); 
		
		#Get R4 values
		SET @A_R4 = (SELECT A FROM caja_fuerte WHERE caja_fuerte.id = 'R4'); 
		SET @B_R4 = (SELECT B FROM caja_fuerte WHERE caja_fuerte.id = 'R4');
		SET @C_R4 = (SELECT C FROM caja_fuerte WHERE caja_fuerte.id = 'R4'); 
		SET @D_R4 = (SELECT D FROM caja_fuerte WHERE caja_fuerte.id = 'R4');  

		IF (dir = 'MR') THEN

			#Update first row
			UPDATE caja_fuerte SET A = (@A_R2) WHERE caja_fuerte.id = 'R1';
			UPDATE caja_fuerte SET B = (@A_R1) WHERE caja_fuerte.id = 'R1';
			UPDATE caja_fuerte SET C = (@B_R1) WHERE caja_fuerte.id = 'R1';
			UPDATE caja_fuerte SET D = (@C_R1) WHERE caja_fuerte.id = 'R1';

			#Update second row
			UPDATE caja_fuerte SET A = (@A_R3) WHERE caja_fuerte.id = 'R2';
			UPDATE caja_fuerte SET D = (@D_R1) WHERE caja_fuerte.id = 'R2';

			#Update third row
			UPDATE caja_fuerte SET A = (@A_R4) WHERE caja_fuerte.id = 'R3';
			UPDATE caja_fuerte SET D = (@D_R2) WHERE caja_fuerte.id = 'R3';

			#Update last row
			UPDATE caja_fuerte SET A = (@B_R4) WHERE caja_fuerte.id = 'R4';
			UPDATE caja_fuerte SET B = (@C_R4) WHERE caja_fuerte.id = 'R4';
			UPDATE caja_fuerte SET C = (@D_R4) WHERE caja_fuerte.id = 'R4';
			UPDATE caja_fuerte SET D = (@D_R3) WHERE caja_fuerte.id = 'R4';

		ELSE

			#Update first row
			UPDATE caja_fuerte SET A = (@B_R1) WHERE caja_fuerte.id = 'R1';
			UPDATE caja_fuerte SET B = (@C_R1) WHERE caja_fuerte.id = 'R1';
			UPDATE caja_fuerte SET C = (@D_R1) WHERE caja_fuerte.id = 'R1';
			UPDATE caja_fuerte SET D = (@D_R2) WHERE caja_fuerte.id = 'R1';

			#Update second row
			UPDATE caja_fuerte SET A = (@A_R1) WHERE caja_fuerte.id = 'R2';
			UPDATE caja_fuerte SET D = (@D_R3) WHERE caja_fuerte.id = 'R2';

			#Update third row
			UPDATE caja_fuerte SET A = (@A_R2) WHERE caja_fuerte.id = 'R3';
			UPDATE caja_fuerte SET D = (@D_R4) WHERE caja_fuerte.id = 'R3';

			#Update last row
			UPDATE caja_fuerte SET A = (@A_R3) WHERE caja_fuerte.id = 'R4';
			UPDATE caja_fuerte SET B = (@A_R4) WHERE caja_fuerte.id = 'R4';
			UPDATE caja_fuerte SET C = (@B_R4) WHERE caja_fuerte.id = 'R4';
			UPDATE caja_fuerte SET D = (@C_R4) WHERE caja_fuerte.id = 'R4';

		END IF;
	END $
DELIMITER ;


DELIMITER //
CREATE PROCEDURE girarI (dir varchar(3))
	BEGIN
		
		#Get R2 values
		SET @B_R2 = (SELECT B FROM caja_fuerte WHERE caja_fuerte.id = 'R2'); 
		SET @C_R2 = (SELECT C FROM caja_fuerte WHERE caja_fuerte.id = 'R2'); 
		
		#Get R3 values
		SET @B_R3 = (SELECT B FROM caja_fuerte WHERE caja_fuerte.id = 'R3'); 
		SET @C_R3 = (SELECT C FROM caja_fuerte WHERE caja_fuerte.id = 'R3'); 
		
		IF (dir = 'MR') THEN

			#Update second row
			UPDATE caja_fuerte SET B = (@B_R3) WHERE caja_fuerte.id = 'R2';
			UPDATE caja_fuerte SET C = (@B_R2) WHERE caja_fuerte.id = 'R2';

			#Update third row
			UPDATE caja_fuerte SET B = (@C_R3) WHERE caja_fuerte.id = 'R3';
			UPDATE caja_fuerte SET C = (@C_R2) WHERE caja_fuerte.id = 'R3';

		ELSE

			#Update second row
			UPDATE caja_fuerte SET B = (@C_R2) WHERE caja_fuerte.id = 'R2';
			UPDATE caja_fuerte SET C = (@C_R3) WHERE caja_fuerte.id = 'R2';

			#Update third row
			UPDATE caja_fuerte SET B = (@B_R2) WHERE caja_fuerte.id = 'R3';
			UPDATE caja_fuerte SET C = (@B_R3) WHERE caja_fuerte.id = 'R3';

		END IF;
	END //
DELIMITER ;




DELIMITER $$
CREATE PROCEDURE girar (dir varchar(3), a char(1), cant int)
	

	BEGIN
		
		SET @i = 0;

		WHILE(@i<cant) DO
		
		IF (dir = 'MR') THEN

			IF (a = 'E') THEN
				CALL girarE('MR');
			ELSE
				CALL girarI('MR');
			END IF;

		ELSE
			IF (a = 'E') THEN
				CALL girarE('Inv');
			ELSE
				CALL girarI('Inv');
			END IF;

		END IF;

		END WHILE;

	END $$

DELIMITER ;
