Drop database if exists DBVanguardBank;

Create database DBVanguardBank;

Use DBVanguardBank;

-- Entidad Clientes--
Create table Clientes(
	DPI BIGINT not null,
    nombresCliente varchar(100) not null,
    apellidosCliente varchar(100) not null,
    telefonoContacto varchar(10) not null,
    direccion varchar(200) not null,
    genero varchar(100) not null,
    primary key PK_DPI(DPI)
);

-- Entidad Departamentos --


-- Entidad Proveedores --
Create table Proveedores(
	idProveedor int auto_increment not null,
    nombreProveedor varchar(100) not null,
    direccion varchar(200) not null,
    correo varchar(100) not null,
    telefonoProveedor varchar(10) not null,
    primary key PK_idProveedor(idProveedor)
);

-- Entidad Tipo Moneda --


-- Entidad Tipo Empleado --
Create table  TipoEmpleado (
	idTipoEmpleado int not null auto_increment,
    nombresTipoPuesto varchar(150) not null,
    salarioTipoEmpleado varchar(150) not null,
    contratoTipoEmpleado varchar(150) not null,
 
    primary key PK_idTipoEmpleado (idTipoEmpleado)
);


-- Entidad Empleados --
Create table Empleados(
	idEmpleado int not null auto_increment,
    fechaContratacion DATE not null,
    nombre varchar(100) not null,
    direccion varchar(200) not null,
    numeroContacto varchar(10) not null,
    idTipoEmpleado int not null,
    primary key PK_idEmpleado (idEmpleado),
    constraint FK_idTipoEmpleado foreign key (idTipoEmpleado)
		references TipoEmpleado(idTipoEmpleado)
);

-- Entidad Sucursales --


-- Entidad Cuentas --
Create table Cuenta(
	idcuenta int not null auto_increment,
    numeroCuenta bigint not null auto_increment,
    saldo decimal (10,2) not null,
    tipoCuenta varchar(100) not null,
    fechaApertura date not null,
    idCliente int not null,
    idEmpleado int not null,
    idTipoMoneda int not null,
    idSucursal int not null,
    constraint FK_idCliente foreign key (idCliente)
		references Cliente(idCliente),
	constraint FK_idTipoEmpleado foreign key (idTipoEmpleado)
		references TipoEmpleado(idTipoEmpleado),
	constraint FK_idTipoMoneda foreign key (idTipoMoneda)
		references TipoMoneda(idTipoMoneda),
	constraint FK_idSucursal foreign key (idSucursal)
		references Sucursal(idSucursal)
);

-- Entidad Créditos --


-- Entidad Servicios --


-- Entidad Login --


-- Entidad Transacciones --


-- Entidad Historial Transacción --


-- Entidad Depositos --