USE database;

CREATE TABLE Comensal(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),


	PRIMARY KEY(id),
	UNIQUE(id)
);

CREATE TABLE Plato (

	id INT NOT NULL,
	Comensal_id INT NOT NULL,
	nombre VARCHAR(50),
	descripcion VARCHAR(50),
	dificultad INT,
	calorias INT,
	foto VARCHAR(100),
	precio REAL,
	costo REAL,
	fecha DATE,

	PRIMARY KEY (id),
	UNIQUE (id),

	FOREIGN KEY (Comensal_id) REFERENCES Comensal(id)

);


CREATE TABLE Categoria (

	id INT NOT NULL,
	nombre VARCHAR(50),
	descripcion VARCHAR(50)

	PRIMARY KEY (id),
	UNIQUE (id)

);

CREATE TABLE Receta(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),


	PRIMARY KEY(id),
	UNIQUE(id)
);


CREATE TABLE Ingrediente (
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),


	PRIMARY KEY(id),
	UNIQUE(id)
);


CREATE TABLE relRecetaIngrediente(
	id INT NOT NULL AUTO_INCREMENT,
	Ingrediente_id INT NOT NUll,
	Receta_id INT NOT NUll,

	PRIMARY KEY(id),
	UNIQUE(id),
	FOREIGN KEY (Ingrediente_id) REFERENCES Ingrediente(id),
	FOREIGN KEY (Receta_id) REFERENCES Receta(id)
);



CREATE TABLE Domicilio(
	id INT NOT NULL AUTO_INCREMENT,
	Comensal_id Int NOT NULL,

	PRIMARY KEY (id),
	UNIQUE(id),
	FOREIGN KEY(Comensal_id) REFERENCES Comensal(id)

);

CREATE TABLE Mesa(
	id INT NOT NULL AUTO_INCREMENT,

	PRIMARY KEY (id),
	UNIQUE(id)

);


CREATE TABLE Pedido(
	id INT NOT NULL AUTO_INCREMENT,

	PRIMARY KEY (id),
	UNIQUE(id)
);