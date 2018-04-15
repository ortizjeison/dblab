USE database;

#Usuarios
DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario (

	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	password VARCHAR(50),
	ultimoAcceso Date,

	PRIMARY KEY (id),
	UNIQUE (id)

);

DROP TABLE IF EXISTS Auditoria;
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

DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado (

	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	cedula VARCHAR(50),
	Usuario_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)


);

DROP TABLE IF EXISTS Mesero;
CREATE TABLE Mesero (

	id INT NOT NULL AUTO_INCREMENT,
	Empleado_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Empleado_id) REFERENCES Empleado(id)

);

DROP TABLE IF EXISTS Chef;
CREATE TABLE Chef (

	id INT NOT NULL AUTO_INCREMENT,
	Empleado_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Empleado_id) REFERENCES Empleado(id)

);

DROP TABLE IF EXISTS Administrativo;
CREATE TABLE Administrativo (

	id INT NOT NULL AUTO_INCREMENT,
	Empleado_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Empleado_id) REFERENCES Empleado(id)

);

DROP TABLE IF EXISTS Jefe;
CREATE TABLE Jefe (

	id INT NOT NULL AUTO_INCREMENT,
	Empleado_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Empleado_id) REFERENCES Empleado(id)

);


#Negrito
DROP TABLE IF EXISTS Categoria;
CREATE TABLE Categoria (

	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	descripcion VARCHAR(50),

	PRIMARY KEY (id),
	UNIQUE (id)

);

DROP TABLE IF EXISTS Comensal;
CREATE TABLE Comensal(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	cedula VARCHAR(50),

	PRIMARY KEY(id),
	UNIQUE (id)
);

DROP TABLE IF EXISTS Receta;
CREATE TABLE Receta(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),

	PRIMARY KEY(id),
	UNIQUE (id)
);

DROP TABLE IF EXISTS Plato;
CREATE TABLE Plato (

	id INT NOT NULL AUTO_INCREMENT,
	Comensal_id INT NOT NULL,
	Categoria_id INT NOT NULL,
	Receta_id INT NOT NULL,
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
	FOREIGN KEY (Categoria_id) REFERENCES Categoria(id),
	FOREIGN KEY (Receta_id) REFERENCES Receta(id)

);

DROP TABLE IF EXISTS Ingrediente;
CREATE TABLE Ingrediente (
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	cantidad INT,
	unidadDeMedida VARCHAR(50),
	cantidadEnAlmacen INT,

	PRIMARY KEY(id),
	UNIQUE (id)
);


DROP TABLE IF EXISTS relRecetaIngrediente;
CREATE TABLE relRecetaIngrediente(
	id INT NOT NULL AUTO_INCREMENT,
	Ingrediente_id INT NOT NUll,
	Receta_id INT NOT NUll,

	PRIMARY KEY(id),
	UNIQUE (id),
	FOREIGN KEY (Ingrediente_id) REFERENCES Ingrediente(id),
	FOREIGN KEY (Receta_id) REFERENCES Receta(id)
);

DROP TABLE IF EXISTS PlanAlimenticio;
CREATE TABLE PlanAlimenticio (
	id INT NOT NULL AUTO_INCREMENT,
	fechaInicio Date,
	fechaFin Date,
	valorNeto INT,
	valorDescuento INT,


	PRIMARY KEY (id),
	UNIQUE (id)
);


DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente(	
	id INT NOT NULL AUTO_INCREMENT,

	PRIMARY KEY (id),
	UNIQUE (id)

);

DROP TABLE IF EXISTS Sede;
CREATE TABLE Sede (
	id INT NOT NULL AUTO_INCREMENT,
	Cliente_id INT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Cliente_id) REFERENCES Cliente(id)

);

DROP TABLE IF EXISTS EmpleadoEmpresa;
CREATE TABLE EmpleadoEmpresa (
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	cedula VARCHAR(50),
	Sede_id INT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Sede_id) REFERENCES Sede(id)

);

DROP TABLE IF EXISTS Servicio;
CREATE TABLE Servicio(
	id INT NOT NULL AUTO_INCREMENT,
	fecha Date,
	Servicio_id INT NOT NULL,
	Plato_id INT NOT NULL,
	Sede_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Servicio_id) REFERENCES Servicio(id),
	FOREIGN KEY (Plato_id) REFERENCES Plato(id),
	FOREIGN KEY (Sede_id) REFERENCES Sede(id)


);

DROP TABLE IF EXISTS Persona;
CREATE TABLE Persona(
	id INT NOT NULL AUTO_INCREMENT,
	ceula VARCHAR(50),
	nombre VARCHAR(50),
	Cliente_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE(id),
	FOREIGN KEY (Cliente_id) REFERENCES Cliente(id)
);

DROP TABLE IF EXISTS ClieteMesa;
CREATE TABLE ClienteMesa(
	id INT NOT NULL AUTO_INCREMENT,
	Cliente_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE(id),
	FOREIGN KEY (Cliente_id) REFERENCES Cliente(id)
);

DROP TABLE IF EXISTS Empresa;
CREATE TABLE Empresa(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	numeroEmpleados INT,
	Cliente_id INT NOT NULL,
	PlanAlimenticio_id INT,

	PRIMARY KEY (id),
	FOREIGN KEY (Cliente_id) REFERENCES Cliente(id),
	FOREIGN KEY (PlanAlimenticio_id) REFERENCES PlanAlimenticio(id)
);

DROP TABLE IF EXISTS Mesa;
CREATE TABLE Mesa(
	id INT NOT NULL AUTO_INCREMENT,

	PRIMARY KEY (id),
	UNIQUE (id)

);

DROP TABLE IF EXISTS relMesaMesero;
CREATE TABLE relMesaMesero(
	id INT NOT NULL AUTO_INCREMENT,
	Mesa_id INT NOT NULL,
	Mesero_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Mesa_id) REFERENCES Mesa(id),
	FOREIGN KEY (Mesero_id) REFERENCES Mesero(id)

);

DROP TABLE IF EXISTS Pedido;
CREATE TABLE Pedido(
	id INT NOT NULL AUTO_INCREMENT,
	Mesa_id INT NOT NULL,
	Mesero_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Mesa_id) REFERENCES Mesa(id),
	FOREIGN KEY (Mesero_id) REFERENCES Mesero(id)

); 

DROP TABLE IF EXISTS Factura;
CREATE TABLE Factura(
	id INT NOT NULL AUTO_INCREMENT,
	Pedido_id INT NOT NULL,
	valorTotal INT,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Pedido_id) REFERENCES Pedido(id)

); 

DROP TABLE IF EXISTS Recibo;
CREATE TABLE Recibo(
	id INT NOT NULL AUTO_INCREMENT,
	Factura_id INT NOT NULL,
	valorAbonado INT,
	valorRestante INT,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Factura_id) REFERENCES Factura(id)

); 

DROP TABLE IF EXISTS Premio;
CREATE TABLE Premio(
	id INT NOT NULL AUTO_INCREMENT,
	ciudad VARCHAR(50),
	nivel INT,
	Plato_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Plato_id) REFERENCES Plato(id)

); 

DROP TABLE IF EXISTS Mensajero;
CREATE TABLE Mensajero(
	id INT NOT NULL AUTO_INCREMENT,
	Empleado_id INT NOT NULL,
	pase VARCHAR(50),
	tipo VARCHAR(50),	

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Empleado_id) REFERENCES Empleado(id)

);

DROP TABLE IF EXISTS MedioDeTransporte;
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

DROP TABLE IF EXISTS Domicilio;
CREATE TABLE Domicilio(
	id INT NOT NULL AUTO_INCREMENT,
	info VARCHAR(50),
	Comensal_id INT,
	Mensajero_id INT NOT NULL,
	Cliente_id INT,

	PRIMARY KEY (id),
	UNIQUE (id),
	FOREIGN KEY (Comensal_id) REFERENCES Comensal(id),
	FOREIGN KEY (Mensajero_id) REFERENCES Mensajero(id),
	FOREIGN KEY (Cliente_id) REFERENCES Cliente(id)

);

DROP TABLE IF EXISTS Proveedor;
CREATE TABLE Proveedor(
	id INT NOT NULL AUTO_INCREMENT,
	icontec boolean,
	manipulacion boolean,

	PRIMARY KEY (id),
	UNIQUE (id)
);

DROP TABLE IF EXISTS relIngredienteProveedor;
CREATE TABLE relIngredienteProveedor(
	id INT NOT NULL AUTO_INCREMENT,
	Ingrediente_id INT NOT NUll,
	Proveedor_id INT NOT NUll,

	PRIMARY KEY(id),
	UNIQUE (id),
	FOREIGN KEY (Ingrediente_id) REFERENCES Ingrediente(id),
	FOREIGN KEY (Proveedor_id) REFERENCES Proveedor(id)
);

DROP TABLE IF EXISTS Certificacion;
CREATE TABLE Certificacion(
	id INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	fecha Date,

	PRIMARY KEY (id),
	UNIQUE (id)
);

DROP TABLE IF EXISTS relProveedorCertificacion;
CREATE TABLE relProveedorCertificacion(
	id INT NOT NULL AUTO_INCREMENT,
	Proveedor_id INT NOT NULL,
	Certificacion_id INT NOT NULL,

	PRIMARY KEY (id),
	UNIQUE(id),
	FOREIGN KEY (Proveedor_id) REFERENCES Proveedor(id),
	FOREIGN KEY (Certificacion_id) REFERENCES Certificacion(id)
);
 
DROP TABLE IF EXISTS EgresoPago;
CREATE TABLE EgresoPago(
	id INT NOT NULL AUTO_INCREMENT,
	valor INT,
	fecha DATE,
	formaPago VARCHAR(50),
	Proveedor_id INT NOT NULL,


	PRIMARY KEY (id),
	UNIQUE(id),
	FOREIGN KEY (Proveedor_id) REFERENCES Proveedor(id)
);

DROP TABLE IF EXISTS PQRS;
CREATE TABLE PQRS(
	id INT NOT NULL AUTO_INCREMENT,
	Mesero_id INT,
	observacion TEXT,
	PRIMARY KEY (id),
	UNIQUE(id),
	FOREIGN KEY (Mesero_id) REFERENCES Mesero(id)
);

DROP TABLE IF EXISTS relPlatoPQRS;
CREATE TABLE relPlatoPQRS(
	id INT NOT NULL AUTO_INCREMENT,
	Plato_id INT NOT NUll,
	PQRS_id INT NOT NUll,

	PRIMARY KEY(id),
	UNIQUE (id),
	FOREIGN KEY (Plato_id) REFERENCES Plato(id),
	FOREIGN KEY (PQRS_id) REFERENCES PQRS(id)
);
