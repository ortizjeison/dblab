USE database;

#Usuarios

CREATE TABLE Usuario (

	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	password VARCHAR(50),
	lastAccess Date,

	PRIMARY KEY (id),
	UNIQUE (id)

);

CREATE TABLE Auditoria (

	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	Usuario_id INT NOT NULL,
	operaracion VARCHAR(50),
	tipoOperacion VARCHAR(50),
	fechaOperacion Date,
	interesOperacion boolean,


	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)

);


CREATE TABLE Empleado (

	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	Usuario_id INT NOT NULL,
	Sede_id INT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Usuario_id) REFERENCES Usuario(id),
	FOREIGN KEY (Sede_id) REFERENCES Sede(id)


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

CREATE TABLE relRecetaProveedor(
	id INT NOT NULL AUTO_INCREMENT,
	Ingrediente_id INT NOT NUll,
	Proveedor_id INT NOT NUll,

	PRIMARY KEY(id),
	UNIQUE (id),
	FOREIGN KEY (Ingrediente_id) REFERENCES Ingrediente(id),
	FOREIGN KEY (Proveedor_id) REFERENCES Proveedor(id)
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


CREATE TABLE PlanAlimenticio (
	id INT NOT NULL AUTO_INCREMENT,
	fechaInicio Date,
	fechaFin Date,
	valorNeto INT,
	valorDescuento INT,


	PRIMARY KEY (id),
	UNIQUE (id)
);



CREATE TABLE Cliente(	
	id INT NOT NULL AUTO_INCREMENT,
	PlanAlimenticio_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (PlanAlimenticio_id) REFERENCES PlanAlimenticio(id)

);

CREATE TABLE Sede (
	id INT NOT NULL AUTO_INCREMENT,
	Cliente_id INT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Cliente_id) REFERENCES Cliente(id),

);

CREATE TABLE Servicio(
	id INT NOT NULL AUTO_INCREMENT,
	Servicio_id INT NOT NULL,
	Plato_id INT NOT NULL,
	Sede_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Servicio_id) REFERENCES Servicio(id),
	FOREIGN KEY (Plato_id) REFERENCES Plato(id),
	FOREIGN KEY (Sede_id) REFERENCES Sede(id)


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

CREATE TABLE Mesa(
	id INT NOT NULL AUTO_INCREMENT,
	Cliente_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Cliente_id) REFERENCES Cliente(id)

);

CREATE TABLE relMesaMesero(
	id INT NOT NULL AUTO_INCREMENT,
	Mesa_id INT NOT NULL,
	Mesero_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Mesa_id) REFERENCES Mesa(id),
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

CREATE TABLE Recibo(
	id INT NOT NULL AUTO_INCREMENT,
	Factura_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Factura_id) REFERENCES Factura(id)

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

	PRIMARY KEY (id),
	UNIQUE (id)
);


CREATE TABLE Certificacion(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	fecha Date,

	PRIMARY KEY (id),
	UNIQUE (id)
);


CREATE TABLE relProveedorCertificacion(
	id INT NOT NULL AUTO_INCREMENT,
	Proveedor_id INT NOT NULL,
	Certificacion_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE(id),
	FOREIGN KEY (Proveedor_id) REFERENCES Proveedor(id),
	FOREIGN KEY (Certificacion_id) REFERENCES Certificacion(id)
);
 
CREATE TABLE EgresoPago(
	id INT NOT NULL AUTO_INCREMENT,
	valor INT,
	fecha DATE,
	Proveedor_id INT NOT NULL,


	PRIMARY KEY (id),
	UNIQUE(id),
	FOREIGN KEY (Proveedor_id) REFERENCES Proveedor(id)
);

CREATE TABLE PQRS(
	id INT NOT NULL AUTO_INCREMENT,
	Mesero_id INT NOT NUll,

	PRIMARY KEY (id),
	UNIQUE(id),
	FOREIGN KEY (Mesero_id) REFERENCES Mesero(id)
);

CREATE TABLE relPlatoPQRS(
	id INT NOT NULL AUTO_INCREMENT,
	Plato_id INT NOT NUll,
	PQRS_id INT NOT NUll,

	PRIMARY KEY(id),
	UNIQUE (id),
	FOREIGN KEY (Plato_id) REFERENCES Plato(id),
	FOREIGN KEY (PQRS_id) REFERENCES PQRS(id)
);
