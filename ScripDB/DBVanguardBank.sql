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


-- Entidad Tipo Moneda --


-- Entidad Tipo Empleado --


-- Entidad Empleados --


-- Entidad Sucursales --


-- Entidad Cuentas --


-- Entidad Créditos --


-- Entidad Servicios --


-- Entidad Login --


-- Entidad Transacciones --


-- Entidad Historial Transacción --


-- Entidad Depositos --