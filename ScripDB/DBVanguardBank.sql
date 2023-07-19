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
-- ----------------------------------- Procedimientos almacenados Entidad Departamentos ----------------------------------------------------

-- Agregar Departamentos

Delimiter //
	Create procedure sp_AgregarDepartamento (in nombreDepartamento varchar(100), in codigoPostal varchar(50), in fechaApertura date)
		Begin
			Insert into Departamento (nombreDepartamento, codigoPostal, fechaApertura)
				values (nombreDepartamento, codigoPostal, fechaApertura);
        End//
Delimiter ;

call sp_AgregarDepartamento('Totonicapan', '08000', '2023-04-24');
call sp_AgregarDepartamento('Qutzaltenango', '09000', '2023-02-12');
call sp_AgregarDepartamento('San marcos', '12000', '2023-06-10');
call sp_AgregarDepartamento('Escuintla', '05000', '2023-02-12');
call sp_AgregarDepartamento('Chimaltenango', '04000', '2023-05-20');


-- Buscar Departamentos

Delimiter //
	Create procedure sp_BuscarDepartamentos(in idDepartamento int)
		Begin
			Select 
				D.idDepartamento,
				D.nombreDepartamento,
                D.codigoPostal,
                D.fechaApertura
                from Departamento D where D.idDepartamento = idDepartamento;
        End//
Delimiter ;

call sp_BuscarDepartamentos(1);

-- Eliminar Departamento

Delimiter //
	Create procedure sp_EliminarDepartamento(in codDepartamento int)
		Begin
			Delete from Departamento
				where idDepartamento = codDepartamento;
		End//
Delimiter ;

call sp_EliminarDepartamento (4);

-- Editar Departamento

Delimiter //
	Create procedure sp_EditarDepartamento(in idDepartamento int, in nombreDep varchar (100), in codPostal varchar(50), in dateApertura date)
		Begin 
			update Departamento D
				set  D.nombreDepartamento = nombreDep,
					 D.codigoPostal = codPostal,
                     D.fechaApertura = dateApertura
                where D.idDepartamento = idDepartamento;
        End//
Delimiter ;
call sp_EditarDepartamento (3, 'Huehuetenango', '13000', '2023-04-12');

-- Listar Departamento

Delimiter //
	Create procedure sp_ListarDepartamento()
	Begin
		Select 
			D.idDepartamento,
            D.nombreDepartamento,
            D.codigoPostal,
            D.fechaApertura
			From Departamento D;
	End//
Delimiter ;

Call sp_ListarDepartamento();

-- CRUD Proveedores --
-- Agregar Proveedor --
Delimiter $$
	Create procedure sp_AgregarProveedor (in nombreProveedor varchar(100), in direccionProveedor varchar(200), in correoProveedor varchar(100), in telefonoProveedor varchar(10))
		Begin
			Insert into Proveedor (nombreProveedor, direccionProveedor, correoProveedor, telefonoProveedor)
            values (nombreProveedor, direccionProveedor, correoProveedor, telefonoProveedor);
        End $$
Delimiter ;

Call sp_AgregarProveedor('Campero','Guatemala','campero@gmail.com', '6332-8483');
Call sp_AgregarProveedor('Pepsi','Guatemala','pepsi@gmail.com', '9984-1212' );
Call sp_AgregarProveedor('Burguer King','Guatemala','burguer@gmail.com', '3232-3232');

-- Listar Proveedor --
Delimiter $$
	Create procedure sp_ListarProveedor()
		Begin
			Select
			Proveedor.idProveedor,
            Proveedor.nombreProveedor,
            Proveedor.direccionProveedor,
            Proveedor.correoProveedor,
            Proveedor.telefonoProveedor
            from Proveedor;
        End $$
Delimiter ;

Call sp_ListarProveedor();

-- Editar Proveedor --
Delimiter $$
	Create procedure sp_EditarProveedor(in idProveedor int, in nombreProveedor varchar(100), in direccionProveedor varchar(200), in correoProveedor varchar(100), in telefonoProveedor varchar(10))
		Begin
			Update Proveedor P
				set P.nombreProveedor = nombreProveedor,
					P.direccionProveedor = direccionProveedor,
                    P.correoProveedor = correoProveedor,
                    P.telefonoProveedor = telefonoProveedor
                    where P.idProveedor = idProveedor;
        End $$
Delimiter ;

-- Call sp_EditarProveedor(1, 'La torre', 'Japon', 'torre@gmail.com', '1111-2222');

-- Eliminar Proveedor --
Delimiter $$
	Create procedure sp_EliminarProveedor(in IdPro int)
		Begin
			Delete from Proveedor where IdPro = idProveedor;
        End $$
Delimiter ;

-- Call sp_EliminarProveedor(3);

-- Buscar Proveedor --
Delimiter $$
	Create procedure sp_BuscarProveedor(in idProveedor int)
		Begin
			Select
			Proveedor.idProveedor,
            Proveedor.nombreProveedor,
            Proveedor.direccionProveedor,
            Proveedor.correoProveedor,
            Proveedor.telefonoProveedor
            from Proveedor where Proveedor.idProveedor = idProveedor;
        End $$
Delimiter ;

Call sp_BuscarProveedor(1);

-- CRUD Tipo Moneda --

-- Agregar
Delimiter $$
	Create Procedure sp_AgregarTipoMoneda(in simboloMoneda varchar(10),in nombreMoneda varchar(50), in conversionDolar decimal(10,2))
		begin
			Insert into TipoMoneda(simboloMoneda, nombreMoneda, conversionDolar)
				values (simboloMoneda, nombreMoneda, conversionDolar);
        end $$
Delimiter ;

call sp_agregarTipoMoneda('€','Euro',1);
Call sp_agregarTipoMoneda('£','Libra Esterlina', 1);
Call sp_agregarTipoMoneda('¥','Yen Japonés',100);
Call sp_agregarTipoMoneda('CHF','Franco suizo',1);
Call sp_agregarTipoMoneda('$','Dólar Canadiense',0.79);
-- Listar
Delimiter $$
	Create procedure sp_ListarTipoMoneda()
		begin
			select idTipoMoneda, simboloMoneda, nombreMoneda, conversionDolar
				from TipoMoneda;
        end $$
Delimiter ;

-- Editar
Delimiter $$
	Create procedure sp_editarTipoMoneda(in idTipo int, in simbolo varchar(10),in nombre varchar(50), in conversion decimal(10,2))
		begin
			Update TipoMoneda
			set simboloMoneda = simbolo, nombreMoneda = nombre, conversionDolar = conversion
				where idTipoMoneda = idTipo;
        end $$
Delimiter ;

-- Buscar
Delimiter $$
	Create procedure sp_BuscarTipoMoneda(in idTipo int)
		begin
			select idTipoMoneda, simboloMoneda, nombreMoneda, conversionDolar
				from TipoMoneda where  idTipoMoneda = idTipo;
        end $$
Delimiter ;

call sp_BuscarTipoMoneda(1);

-- Eliminar

Delimiter $$
	Create procedure sp_EliminarTipoMoneda(in idTipo int)
		begin	
			Delete from TipoMoneda
				where idTipoMoneda = idTipo;
        end $$
Delimiter ;

-- CRUD Tipo Empleado --


-- CRUD Empleados --
#	Agregar Empleado	#
Delimiter $$
	Create procedure sp_AgregarEmpleado(in nombreEmpleado varchar(100),in apellidoEmpleado varchar(100),in fechaContratacion date,
    in direccionEmpleado varchar(200),in numeroContactoEmpleado varchar(10),in idTipoEmpleado int)
		Begin
			Insert into Empleado(nombreEmpleado, apellidoEmpleado, fechaContratacion, direccionEmpleado, numeroContactoEmpleado,
				idTipoEmpleado)
				values (nombreEmpleado, apellidoEmpleado, fechaContratacion, direccionEmpleado, numeroContactoEmpleado, idTipoEmpleado);
        End$$
Delimiter ;

#	Listar Empleados	#
Delimiter $$
	Create procedure sp_ListarEmpleados()
		Begin
			Select idEmpleado as Id_Empleado,
				nombreEmpleado as Nombre_Empleado,
				apellidoEmpleado as Apellido_Empleado,
                fechaContratacion as Fecha_Contratacion,
                direccionEmpleado as Dirección_Empleado,
                numeroContactoEmpleado as Numero_Contacto,
                idTipoEmpleado as Id_TipoEmpleado
                from Empleado;
        End$$
Delimiter ;

#	Buscar Empleado 	#
Delimiter $$
	Create procedure sp_BuscarEmpleado(in codEmpleado int)
		Begin
			Select idEmpleado as Id_Empleado,
				nombreEmpleado as Nombre_Empleado,
				apellidoEmpleado as Apellido_Empleado,
                fechaContratacion as Fecha_Contratacion,
                direccionEmpleado as Dirección_Empleado,
                numeroContactoEmpleado as Numero_Contacto,
                idTipoEmpleado as Id_TipoEmpleado
                from Empleado where idEmpleado = codEmpleado;
        End$$
Delimiter ;

#	Editar Empleado 	#
Delimiter $$
	Create procedure sp_EditarEmpleado(in codigoEmp int,in nuevoNombreEmp varchar(100),in nuevoApellidoEmp varchar(100),in nuevaFechaCon date,
		in nuevaDireccionEmp varchar(200),in nuevoNumeroEmp varchar(10),in nuevoIdTipoEmp int)
		Begin
			Update Empleado set nombreEmpleado = nuevoNombreEmp,
				apellidoEmpleado = nuevoApellidoEmp,
                fechaContratacion = nuevaFechaCon,
                direccionEmpleado = nuevaDireccionEmp,
                numeroContactoEmpleado = nuevoNumeroEmp,
                idTipoEmpleado = nuevoIdTipoEmp
                where idEmpleado = codigoEmp;
        End$$
Delimiter ;

#	Eliminar Empleado 	#
Delimiter $$
	Create procedure sp_EliminarEmpleado (in codigoEmpleado int)
		Begin
			Delete from Empleado where idEmpleado = codigoEmpleado;
        End$$
Delimiter ;

-- CRUD Sucursales --


-- CRUD Cuentas --
#	Agregar Cuenta 	#
Delimiter $$
	Create procedure sp_AgregarCuenta(in numeroCuenta bigint,in saldoCuenta decimal(10,2),in tipoCuenta varchar(100),
		in fechaApertura date,in DPI bigint,in idEmpleado int,in idTipoMoneda int,in idSucursarl int)
		Begin
			insert into Cuenta(numeroCuenta, saldoCuenta, tipoCuenta, fechaApertura, DPI, idEmpleado,
				idTipoMoneda, idSucursal) 
                values(numeroCuenta, saldoCuenta, tipoCuenta, fechaApertura, DPI, idEmpleado,
                idTipoMoneda, idSucursal);
        End$$
Delimiter ;

#	Listar Cuentas 	#
Delimiter $$
	Create procedure sp_ListarCuentas()
		Begin
			Select idCuenta as Id_Cuenta,
				numeroCuenta as Número_Cuenta,
                saldoCuenta as Saldo,
                tipoCuenta as TipoCuenta,
                fechaApertura as Fecha_Apertura,
                DPI as DPI,
                idEmpleado as Id_Empleado,
                idTipoMoneda as Id_Tipo_Moneda,
                idSucursal as Id_Sucursal
                from Cuenta;
        End$$
Delimiter ;

#	Buscar Cuenta 	#
Delimiter $$
	Create procedure sp_BuscarCuenta(in numCuenta bigint)
		Begin
			Select idCuenta as Id_Cuenta,
				numeroCuenta as Número_Cuenta,
                saldoCuenta as Saldo,
                tipoCuenta as TipoCuenta,
                fechaApertura as Fecha_Apertura,
                DPI as DPI,
                idEmpleado as Id_Empleado,
                idTipoMoneda as Id_Tipo_Moneda,
                idSucursal as Id_Sucursal
                from Cuenta where numeroCuenta = numCuenta;
		End$$
Delimiter ;

#	Editar Cuenta 	#
Delimiter $$
	Create procedure sp_EditarCuenta(in numCuenta bigint,in saldoCue decimal(10,2),in tipoCue varchar(100),
		in fechaAperturaCue date,in DPICue bigint,in idEmpleadoCue int,in idTipoMonedaCue int,in idSucursarlCue int)
		Begin
			Update Cuenta set idCuenta = Id_Cuenta,
                saldoCuenta = saldoCue,
                tipoCuenta = tipoCue,
                fechaApertura = fechaAperturaCue,
                DPI = DPICue,
                idEmpleado = idEmpleadoCue,
                idTipoMoneda = idTipoMonedaCue,
                idSucursal = idSucursarlCue
                where numeroCuenta = numCuenta;
		End$$
Delimiter ;

#	Eliminar Cuenta 	#
Delimiter $$
	Create procedure sp_EliminarCuenta(in numCuenta bigint)
		Begin
			Delete from Cuenta where numeroCuenta = numCuenta;
		End$$
Delimiter ;

-- CRUD Créditos --


-- CRUD Servicios --


-- CRUD Login --


-- CRUD Transacciones --
	

-- CRUD Historial Transacción --


-- CRUD Depositos --

