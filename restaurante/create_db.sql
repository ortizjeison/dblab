USE database;

CREATE TABLE Plato (

	idPlato INT NOT NULL,
	nombrePlato VARCHAR(50),
	descripcionPlato VARCHAR(50),
	nivelDeDificultadPlato INT,
	calorias INT,
	urlFotoPlato VARCHAR(100),
	precioFinalPLato REAL,
	costoTotalPlato REAL.

	PRIMARY KEY (idPlato),
	UNIQUE (idPlato) 

);


CREATE TABLE Categoria (

	idCategoria INT NOT NULL,
	nombreCategoria VARCHAR(50),
	descripcionCategoria VARCHAR(50)

	PRIMARY KEY (idCategoria),
	UNIQUE (idCategoria)

);

CREATE TABLE Receta(
	idReceta INT NOT NULL AUTO_INCREMENT,
	nombreReceta VARCHAR(50),


	PRIMARY KEY(idReceta),
	UNIQUE(idReceta),
);


CREATE TABLE Ingrediente (
	idIngrediente INT NOT Null AUTO_INCREMENT,
	nombreIngrediente VARCHAR(50),

	PRIMARY KEY(idIngrediente),
	UNIQUE (idIngrediente),
);


CREATE TABLE relRecetaIngrediente(
	idRelRecetaIngrediente INT NOT NULL AUTO_INCREMENT,
	idIngrediente INT NOT Null,
	idReceta INT NOT Null,

	PRIMARY KEY(idRelRecetaIngrediente),
	UNIQUE(idRelRecetaIngrediente),
	FOREIGN KEY (idIngrediente) REFERENCES Ingrediente(idIngrediente),
	FOREIGN KEY (idReceta) REFERENCES Receta(idReceta),
);

CREATE TABLE Comensal(
	idComensal INT NOT Null AUTO_INCREMENT,
	nombreComensal VARCHAR(50),


);


CREATE TABLE Domicilio(

);