Drop database if exists DBVanguardBank;
Create database DBVanguardBank;
Use DBVanguardBank;

-- Entidad Clientes--
Create table Cliente(
	DPI bigint not null,
    nombreCliente varchar(100) not null,
    apellidoCliente varchar(100) not null,
    telefonoContacto varchar(10) not null,
    direccionCliente varchar(200) not null,
    generoCliente varchar(100) not null,
    primary key PK_DPI(DPI)
);

-- Entidad Departamentos --
Create table Departamento(
	idDepartamento int auto_increment not null,
    nombreDepartamento varchar(100) not null,
    codigoPostal varchar(50) not null,
    fechaApertura date not null,
    primary key PK_idDepartamento(idDepartamento)
);

-- Entidad Proveedores --
Create table Proveedor(
	idProveedor int auto_increment not null,
    nombreProveedor varchar(100) not null,
    direccionProveedor varchar(200) not null,
    correoProveedor varchar(100) not null,
    telefonoProveedor varchar(10) not null,
    primary key PK_idProveedor(idProveedor)
);

-- Entidad Tipo Moneda --
Create table tipoMoneda(
	idTipoMoneda int not null auto_increment,
    simboloMoneda varchar(10) not null,
    nombreMoneda varchar(50) not null,
    conversionDolar decimal(10,2),
    primary key PK_idMoneda (idTipoMoneda)
);

-- Entidad Tipo Empleado --
Create table  TipoEmpleado (
	idTipoEmpleado int not null auto_increment,
    nombreTipoPuesto varchar(150) not null,
    salarioTipoEmpleado varchar(150) not null,
    contratoTipoEmpleado varchar(150) not null,
    primary key PK_idTipoEmpleado (idTipoEmpleado)
);

-- Entidad Empleados --
Create table Empleado(
	idEmpleado int not null auto_increment,
    nombreEmpleado varchar(100) not null,
    apellidoEmpleado varchar(100) not null,
    fechaContratacion date not null,
    direccionEmpleado varchar(200) not null,
    numeroContactoEmpleado varchar(10) not null,
    idTipoEmpleado int not null,
    primary key PK_idEmpleado (idEmpleado),
    constraint FK_Empleado_TipoEmpleado foreign key (idTipoEmpleado)
		references TipoEmpleado(idTipoEmpleado)
);

-- Entidad Sucursales --
Create table Sucursal(
	idSucursal int not null auto_increment,
    nombreSucursal varchar(150) not null,
    direccionSucursal varchar(150) not null,
    correoSucursal varchar(100) not null,
    idDepartamento int not null,
    idProveedor int not null,
	primary key PK_idSucursal(idSucursal),
    constraint FK_Sucursal_Departamento foreign key (idDepartamento)
		references Departamento(idDepartamento),
	constraint FK_Sucursal_Proveedor foreign key(idProveedor)
		references Proveedor(idProveedor)
);

-- Entidad Cuentas --
Create table Cuenta(
	idCuenta int not null auto_increment,
    numeroCuenta bigint not null,
    saldoCuenta decimal (10,2) not null,
    tipoCuenta varchar(100) not null,
    fechaApertura date not null,
    DPI bigint not null,
    idEmpleado int not null,
    idTipoMoneda int not null,
    idSucursal int not null,
    primary key PK_idCuenta(idCuenta),
    constraint FK_Cuenta_Cliente foreign key (DPI)
		references Cliente(DPI),
	constraint FK_Cuenta_Empleado foreign key (idEmpleado)
		references Empleado(idEmpleado),
	constraint FK_Cuenta_TipoMoneda foreign key (idTipoMoneda)
		references TipoMoneda(idTipoMoneda),
	constraint FK_Cuenta_Sucursal foreign key (idSucursal)
		references Sucursal(idSucursal)
);

-- Entidad Créditos --
Create table Credito(
	idCredito int not null auto_increment,
    montoCredito decimal(10,2) not null,
    fechaHora datetime not null,
    interesCredito decimal(10,2) not null,
    idCuenta int not null,
    primary key PK_idCredito(idCredito),
    constraint FK_Credito_Cuenta foreign key (idCuenta)
		references Cuenta(idCuenta)
);

-- Entidad Servicios --
Create table Servicio(
	idServicio int not null auto_increment,
    tipoServicio varchar(100) not null,
    correlativo varchar(100) not null,
    montoServicio decimal(10,2) not null,
    idCuenta int not null,
    primary key PK_idServicio(idServicio),
    constraint FK_Servicio_Cuenta foreign key(idCuenta)
		references Cuenta(idCuenta)
);

-- Entidad Login --
Create table Login(
	idUser int not null auto_increment,
	nombreUsuario varchar(150) not null,
    passwordUsuario varchar(150) not null,
    horaSesion dateTime not null,
    idCuenta int not null,
    primary key PK_idUser(idUser),
    constraint FK_Login_Cuenta foreign key(idCuenta)
		references Cuenta(idCuenta)

);

-- Entidad Transacciones --
create table Transaccion(
	idTransaccion int not null auto_increment,
    tipoTransaccion varchar(50) not null,
    montoTransaccion decimal(10,2) not null,
    fechaHora datetime not null,
    idEmpleado int not null,
    idCuenta int not null,
    primary key PK_idTransaccion(idTransaccion),
    constraint FK_Transacciones_Empleado foreign key (idEmpleado) 
		references Empleado (idEmpleado),
	constraint FK_Transacciones_Cuenta foreign key (idCuenta)
		references Cuenta (idCuenta)
);	

-- Entidad Historial Transacción --
Create table HistorialDeTransacciones(
	idHistorialTransaccion int not null auto_increment,
    idCuenta int not null,
    idTransaccion int not null,
    primary key PK_HistorialDeTransacciones (idHistorialTransaccion),
	constraint FK_HistorialDeTransacciones_Cuenta foreign key (idCuenta)
			references Cuenta (idCuenta),
	constraint FK_HistorialDeTransacciones_Transacciones foreign key (idTransaccion)
		references Transaccion(idTransaccion)
);

-- Entidad Depositos --
Create table Deposito(
    idDeposito int auto_increment not null, 
    montoDeposito decimal(10, 2) not null, 
    fechaDeposito date not null, 
    horaDeposito time not null, 
    idCuentaOrigen int not null,
    idCuentaDeposito int not null,
    primary key PK_idDeposito(idDeposito), 
    constraint FK_Deposito_Cuenta_Origen foreign key (idCuentaOrigen)
        references Cuenta (idCuenta),
    constraint FK_Deposito_Cuenta foreign key (idCuentaDeposito)
        references Cuenta (idCuenta)
);

-- ------ PROCEDIMIENTO ALMACENADOS ------ --

-- CRUD Clientes--

Delimiter $$
	Create procedure sp_AgregarCliente(in DPI bigint, in nombreCliente varchar(100), in apellidoCliente varchar(100), in telefonoContacto varchar(10),
										in direccionCliente varchar(200), in generoCliente varchar(100))
		Begin
			Insert into Cliente(DPI, nombreCliente, apellidoCliente, telefonoContacto, direccionCliente, generoCliente)
				values(DPI, nombreCliente, apellidoCliente, telefonoContacto, direccionCliente, generoCliente);
        End $$
Delimiter ;

call sp_AgregarCliente(1879451248101,'Elmer Rodrigo','Santos García','4874-5487','Ciudad de Guatemala','Masculino');

Delimiter $$
	Create procedure sp_ListarClientes()
		Begin
			Select 
				C.DPI,
				C.nombreCliente,
                C.apellidoCliente,
                C.telefonoContacto,
                C.direccionCliente,
                C.generoCliente
                from Cliente C;
        End $$
Delimiter ;

call sp_ListarClientes();

Delimiter $$
	Create procedure sp_EditarCliente(in DPI bigint, in nombreCliente varchar(100), in apellidoCliente varchar(100), in telefonoContacto varchar(10),
										in direccionCliente varchar(200), in generoCliente varchar(100))
		Begin
			Update Cliente C
				set C.nombreCliente = nombreCliente,
                    C.apellidoCliente = apellidoCliente,
                    C.telefonoContacto = telefonoContacto,
                    C.direccionCliente = direccionCliente,
                    C.generoCliente = generoCliente
                    where C.DPI = DPI;
        End $$
Delimiter ;

-- call sp_EditarCliente(1879451248101,'Elmer Rodrigo','Santos García','4874-5487','Ciudad de Guatemala','Masculino');

Delimiter $$
	Create procedure sp_BuscarCliente(in DPI bigint)
		Begin
			Select 
				C.DPI,
				C.nombreCliente,
                C.apellidoCliente,
                C.telefonoContacto,
                C.direccionCliente,
                C.generoCliente
                from Cliente C where C.DPI = DPI;
        End $$
Delimiter ;

-- call sp_BuscarCliente(1879451248101);

Delimiter $$
	Create procedure sp_EliminarCliente(in DPICliente bigint)
		Begin
			Delete from Cliente where DPI = DPICliente;
        End $$
Delimiter ;

-- call sp_EliminarCliente(1879451248101);

-- CRUD Departamentos --


-- CRUD Proveedores --


-- CRUD Tipo Moneda --


-- CRUD Tipo Empleado --


-- CRUD Empleados --


-- CRUD Sucursales --


-- CRUD Cuentas --


-- CRUD Créditos --


-- CRUD Servicios --


-- CRUD Login --


-- CRUD Transacciones --
	

-- CRUD Historial Transacción --


-- CRUD Depositos --

