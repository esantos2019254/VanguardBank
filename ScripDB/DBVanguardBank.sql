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
Create table Departamentos(
	idDepartamento int auto_increment not null,
    nombreDepartamento varchar(100) not null,
    codigoPostal varchar(50) not null,
    fechaApertura date not null,
    primary key PK_idDepartamento(idDepartamento)
);

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
Create table tipoMoneda(
	idMoneda int not null auto_increment,
    simbolo varchar(10) not null,
    nombre varchar(50) not null,
    conversionDolar decimal(10,2),
    primary key PK_idMoneda (idMoneda)
);

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
Create table Credito(
	idCredito int not null auto_increment,
    monto decimal(10,2) not null,
    fechaHora datetime not null,
    interes decimal(10,2) not null,
    primary key PK_idCredito(idCredito),
    constraint FK_Credito_Cuenta foreign key (idCuenta)
		references Cuenta (idCuenta)
);

-- Entidad Servicios --


-- Entidad Login --


-- Entidad Transacciones --
create table Transacciones(
	idTransaccion int not null auto_increment,
    tipoTransaccion varchar(50) not null,
    monto decimal(10,2) not null,
    fechaHora datetime not null,
    primary key PK_idTransaccion(idTransaccion),
    constraint FK_Transacciones_Empleado foreign key (idEmpleado) 
		references Empleados (idEmpleado),
	constraint FK_Transacciones_Cuenta foreign key (idCuenta)
		references Cuenta (idCuenta)
);	

-- Entidad Historial Transacción --


-- Entidad Depositos --