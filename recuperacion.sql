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


CREATE TABLE IF NOT EXISTS Movimiento(
	id INT NOT NULL AUTO_INCREMENT UNIQUE,
	direccion varchar(3),
	anillo char(1),
	cantidad INT
);


DELIMITER $
CREATE PROCEDURE girarE (dir varchar(3))
	BEGIN

	END $
DELIMITER ;


DELIMITER $
CREATE PROCEDURE girarI (dir varchar(3))
	BEGIN

	END $
DELIMITER ;




DELIMITER $
CREATE PROCEDURE girar (dir varchar(3), a char(1), cant int)
	

	BEGIN
		


		WHILE(@i<cant)
		
		IF (dir = 'MR') THEN

			IF (a = 'E')
				CALL girarE('MR');
			ELSE
				CALL girarI('MR');
			END IF

		ELSE
			IF (a = 'E')
				CALL girarE('Inv');
			ELSE
				CALL girarI('Inv');
			END IF

		END IF

		END WHILE

	END $

DELIMITER ;
