USE database;

CREATE TABLE Plato (

	idPlato INT NOT NULL,
	nombrePlato VARCHAR(50),
	descripcionPlato VARCHAR(50),
	nivelDeDificultadPlato INT,
	calorias INT,
	urlFotoPlato VARCHAR(100),
	precioFinalPLato REAL,
	costoTotalPlato REAL,
	horaPlato DATE,

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
	idIngrediente INT NOT NUll AUTO_INCREMENT,
	nombreIngrediente VARCHAR(50),

	PRIMARY KEY(idIngrediente),
	UNIQUE (idIngrediente),
);


CREATE TABLE relRecetaIngrediente(
	idRelRecetaIngrediente INT NOT NULL AUTO_INCREMENT,
	idIngrediente INT NOT NUll,
	idReceta INT NOT NUll,

	PRIMARY KEY(idRelRecetaIngrediente),
	UNIQUE(idRelRecetaIngrediente),
	FOREIGN KEY (idIngrediente) REFERENCES Ingrediente(idIngrediente),
	FOREIGN KEY (idReceta) REFERENCES Receta(idReceta),
);

CREATE TABLE Comensal(
	idComensal INT NOT NUll AUTO_INCREMENT,
	nombreComensal VARCHAR(50),

);


##Ahora que ya existe la tabla comensal, agregar la FK a la tabla plato:

ALTER TABLE Plato ADD FOREIGN KEY (idComensal) REFERENCES comensal(idComensal);


CREATE TABLE Domicilio(
	idDomicilio INT NOT NULL AUTO_INCREMENT,
	idComensal Int NOT NULL,

	PRIMARY KEY (idDomicilio),
	UNIQUE(idDomicilio),
	FOREIGN KEY(idComensal) REFERENCES Comensal(idComensal),

);

CREATE TABLE Mesa(
	idMesa INT NOT NULL AUTO_INCREMENT,

);


CREATE TABLE Pedido(
	idPedido
);