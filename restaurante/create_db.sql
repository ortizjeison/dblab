USE database;

#Usuarios

CREATE TABLE Usuario (

	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),

	PRIMARY KEY (id),
	UNIQUE (id)

);

CREATE TABLE Auditoria (

	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	Auditoria_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Auditoria_id) REFERENCES Usuario(id)

);


CREATE TABLE Empleado (

	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	Usuario_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)

);

CREATE TABLE Mesero (

	id INT NOT NULL AUTO_INCREMENT,
	Empleado_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Empleado_id) REFERENCES Empleado(id)

);


CREATE TABLE Chef (

	id INT NOT NULL AUTO_INCREMENT,
	Empleado_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Empleado_id) REFERENCES Empleado(id)

);


CREATE TABLE Administrativo (

	id INT NOT NULL AUTO_INCREMENT,
	Empleado_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Empleado_id) REFERENCES Empleado(id)

);

CREATE TABLE Jefe (

	id INT NOT NULL AUTO_INCREMENT,
	Empleado_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Empleado_id) REFERENCES Empleado(id)

);


#Negrito

CREATE TABLE Comensal(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),

	PRIMARY KEY(id),
	UNIQUE (id)
);

CREATE TABLE Categoria (

	id INT NOT NULL,
	nombre VARCHAR(50),
	descripcion VARCHAR(50),

	PRIMARY KEY (id),
	UNIQUE (id)

);

CREATE TABLE Plato (

	id INT NOT NULL,
	Comensal_id INT NOT NULL,
	Categoria_id INT NOT NULL,
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
	FOREIGN KEY (Comensal_id) REFERENCES Comensal(id),
	FOREIGN KEY (Categoria_id) REFERENCES Categoria(id)

);

CREATE TABLE Ingrediente (
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),

	PRIMARY KEY(id),
	UNIQUE (id)
);

CREATE TABLE Receta(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),

	PRIMARY KEY(id),
	UNIQUE (id)
);


CREATE TABLE relRecetaIngrediente(
	id INT NOT NULL AUTO_INCREMENT,
	Ingrediente_id INT NOT NUll,
	Receta_id INT NOT NUll,

	PRIMARY KEY(id),
	UNIQUE (id),
	FOREIGN KEY (Ingrediente_id) REFERENCES Ingrediente(id),
	FOREIGN KEY (Receta_id) REFERENCES Receta(id)
);


CREATE TABLE Mesa(
	id INT NOT NULL AUTO_INCREMENT,
	Mesero_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Mesero_id) REFERENCES Mesero(id)

);

CREATE TABLE Pedido(
	id INT NOT NULL AUTO_INCREMENT,
	Mesa_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Mesa_id) REFERENCES Mesa(id)

); 

CREATE TABLE Factura(
	id INT NOT NULL AUTO_INCREMENT,
	Pedido_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Pedido_id) REFERENCES Pedido(id)

); 


CREATE TABLE Premio(
	id INT NOT NULL AUTO_INCREMENT,
	ciudad VARCHAR(50),
	nivel INT,
	Plato_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Plato_id) REFERENCES Plato(id)

); 

CREATE TABLE Mensajero(
	id INT NOT NULL AUTO_INCREMENT,
	Mensajero_id INT NOT NULL,
	nombre VARCHAR(50),
	pase VARCHAR(50),
	tipo VARCHAR(50),
	cedula VARCHAR(50),

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Mensajero_id) REFERENCES Mensajero(id)

);


CREATE TABLE MedioDeTransporte(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	matricula VARCHAR(50),
	tecnomecanica VARCHAR(50),
	Mensajero_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Mensajero_id) REFERENCES Mensajero(id)

); 

CREATE TABLE Domicilio(
	id INT NOT NULL AUTO_INCREMENT,
	Comensal_id Int NOT NULL,
	Mensajero_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Comensal_id) REFERENCES Comensal(id),
	FOREIGN KEY (Mensajero_id) REFERENCES Mensajero(id)

);



CREATE TABLE Proveedor(
	id INT NOT NULL AUTO_INCREMENT,
	icontec boolean,
	manipulacion boolean,

	PRIMARY KEY (id)
);


CREATE TABLE Certificacion(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	fecha Date,

	PRIMARY KEY (id)

);


CREATE TABLE relProveedorCertificacion(
	id INT NOT NULL AUTO_INCREMENT,
	Proveedor_id INT NOT NUll,
	Cerficicacion_id INT NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (Proveedor_id) REFERENCES Proveedor(id),
	FOREIGN KEY (Cerficicacion_id) REFERENCES Certificacion(id)
);
 
CREATE TABLE Egreso(
	id INT NOT NULL AUTO_INCREMENT,
	valor INT,
	fecha DATE,

	PRIMARY KEY (id)
	
);

CREATE TABLE PQRS(
	id INT NOT NULL AUTO_INCREMENT,
	Mesero_id INT NOT NUll,
	Plato_id INT NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (Mesero_id) REFERENCES Mesero(id),
	FOREIGN KEY (Plato_id) REFERENCES Plato(id) 
);
