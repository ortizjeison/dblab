CREATE TABLE Cliente(	
	id INT NOT NULL AUTO_INCREMENT,

);

CREATE TABLE Persona(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	Cliente_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE(id),
	FOREIGN KEY (Cliente_id) REFERENCES Cliente(id)
);


CREATE TABLE Empresa(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	numeroEmpleados INT,
	Cliente_id INT NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (Cliente_id) REFERENCES Cliente(id)
);