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


-- Entidad Sucursales --


-- Entidad Cuentas --


-- Entidad Créditos --


-- Entidad Servicios --


-- Entidad Login --


-- Entidad Transacciones --


-- Entidad Historial Transacción --


-- Entidad Depositos --