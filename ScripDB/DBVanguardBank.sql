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
		references TipoEmpleado(idTipoEmpleado) on delete cascade
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
		references Departamento(idDepartamento) on delete cascade,
	constraint FK_Sucursal_Proveedor foreign key(idProveedor)
		references Proveedor(idProveedor) on delete cascade
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
		references Cliente(DPI) on delete cascade,
	constraint FK_Cuenta_Empleado foreign key (idEmpleado)
		references Empleado(idEmpleado) on delete cascade,
	constraint FK_Cuenta_TipoMoneda foreign key (idTipoMoneda)
		references TipoMoneda(idTipoMoneda) on delete cascade,
	constraint FK_Cuenta_Sucursal foreign key (idSucursal)
		references Sucursal(idSucursal) on delete cascade
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
    whatIs varchar(500),
    idCuenta int not null,
    primary key PK_idServicio(idServicio),
    constraint FK_Servicio_Cuenta foreign key(idCuenta)
		references Cuenta(idCuenta) on delete cascade
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
		references Cuenta(idCuenta) on delete cascade

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
		references Empleado (idEmpleado) on delete cascade,
	constraint FK_Transacciones_Cuenta foreign key (idCuenta)
		references Cuenta (idCuenta) on delete cascade
);	

-- Entidad Historial Transacción --
Create table HistorialDeTransacciones(
	idHistorialTransaccion int not null auto_increment,
    idCuenta int not null,
    idTransaccion int not null,
    primary key PK_HistorialDeTransacciones (idHistorialTransaccion),
	constraint FK_HistorialDeTransacciones_Cuenta foreign key (idCuenta)
			references Cuenta (idCuenta) on delete cascade,
	constraint FK_HistorialDeTransacciones_Transacciones foreign key (idTransaccion)
		references Transaccion(idTransaccion) on delete cascade
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
        references Cuenta (idCuenta) on delete cascade,
    constraint FK_Deposito_Cuenta foreign key (idCuentaDeposito)
        references Cuenta (idCuenta) on delete cascade
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

call sp_AgregarCliente(1879451248101,'Elmer Rodrigo','Santos García','4874-5487','Km.123 Carretera Al Atlantico, Teculután','Masculino');
call sp_AgregarCliente(6548721036548,'Luis Fernando','Pérez López','9471-2148','16 calle y 6a. Avenida, zona 9 Guatemala','Masculino');
call sp_AgregarCliente(2548100254810,'Irma Beatriz','Jiménez Gonzáles','4720-3200','5a. calle 5-57, Barrio El centro, El Progreso','Femenino');
call sp_AgregarCliente(2001548231201,'Carlos Alberto','Peréz Gonzáles','9912-0141','9a. Avenida y 5a. Calle, Barrio La cruz, Guastatoya','Masculino');
call sp_AgregarCliente(9513578241010,'Raúl Fernando','López Rodriguez','9321-2147','Km. 282 de la Carretera al Atlántico, Izabal','Masculino');
call sp_AgregarCliente(1549531201541,'Ricardo Daniel','Gómez Soto','9486-6498','10 calle 9-68 zona 1 Guatemala','Masculino');
call sp_AgregarCliente(2548913201547,'Andrés Felipe','Castro Romero','5132-3215','13 Calle y 16 Av. Zona 3 Zacapa','Masculino');
call sp_AgregarCliente(3021549874102,'Laura Ximena','Gutiérrez Morales','3154-0255','8a Avenida, zona 1 Chiquimula','Femenino');
call sp_AgregarCliente(0012554133210,'Oscar Alberto','Acevedo García','1325-3215','10 a Avenida 3-60 zona 2, Chiquimula','Masculino');
call sp_AgregarCliente(1235487921012,'Luis Rodrigo','Duarte Montes','3215-3248','8a Poniente 1, Antigua Guatemala','Masculino');
call sp_AgregarCliente(9548716224601,'Mariana Andrea','Chávez Bautista','3325-2002','3a Calle Oriente 28 A, Antigua Guatemala','Femenino');
call sp_AgregarCliente(9988445131652,'Sergio Miguel','González Álvarez','9884-6315','6ta Calle B 8-051 Zona 3, Escuintla','Masculino');
call sp_AgregarCliente(0316597513120,'Valeria Isabel','Morales Dávila','3293-6584','1a Ave. 4-12, zona 4 Escuintla','Femenino');
call sp_AgregarCliente(0324981320214,'Jesús Manuel','López Mendoza','6654-0544','4ta calle 7-78 zona 2, Salamá','Masculino');
call sp_AgregarCliente(3158794231210,'Angel Eduardo','Rodriguez Sosa','6654-3321','1ra calle 5-47 zona 6 Salamá Baja Verapaz','Masculino');
call sp_AgregarCliente(3215498203564,'Luis Gerardo','Cruz Muñoz','3324-6345','3a calle 8-11 zona 2, Cobán, Alta Verapaz','Masculino');
call sp_AgregarCliente(9871612054893,'Rafael Manuel','Méndez Morales','3542-5485','11a Avenida 3-24 zona 2 Cobán, Alta Verapaz','Masculino');
call sp_AgregarCliente(3202165498321,'Zoila Aide','Torres Sánchez','3212-3002','Km 87.5 Carretera a Taxisco, Santa Rosa','Femenino');
call sp_AgregarCliente(0321597812202,'Kevin Alejandro','Mendoza Pérez','3125-3154','1ra Calle, 1ra Avenida "A", Cuilapa, Santa Rosa','Masculino');
call sp_AgregarCliente(3210546892132,'Ana Sofía','Gutiérrez Juárez','6448-3154','4a Calla 0-41, zona 5 Barrio Chipilapa, Jalapa','Femenino');

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

#call sp_ListarClientes();

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

call sp_AgregarDepartamento('Totonicapán', '08000', '2023-04-24');
call sp_AgregarDepartamento('Qutzaltenango', '09000', '2023-02-12');
call sp_AgregarDepartamento('San Marcos', '12000', '2023-06-10');
call sp_AgregarDepartamento('Escuintla', '05000', '2023-02-12');
call sp_AgregarDepartamento('Chimaltenango', '04000', '2023-05-20');
call sp_AgregarDepartamento('Alta Verapaz', '16000', '2023-02-21');
call sp_AgregarDepartamento('Baja Verapaz', '15000', '2023-06-30');
call sp_AgregarDepartamento('Chiquimula', '	20000', '2023-10-2');
call sp_AgregarDepartamento('El Progreso', '02000', '2023-01-20');
call sp_AgregarDepartamento('Guatemala', '01000', '2023-07-12');
call sp_AgregarDepartamento('Huehuetenango', '13000', '2023-08-15');
call sp_AgregarDepartamento('Izabal', '18000', '2023-04-22');
call sp_AgregarDepartamento('Jalapa', '21000', '2023-11-20');
call sp_AgregarDepartamento('Jutiapa', '22000', '2023-05-20');
call sp_AgregarDepartamento('Petén', '17000', '2023-11-12');
call sp_AgregarDepartamento('Quiché', '14000', '2023-12-04');
call sp_AgregarDepartamento('Retalhuleu', '11000', '2023-11-18');
call sp_AgregarDepartamento('Sacatepéquez', '03000', '2023-03-01');
call sp_AgregarDepartamento('Santa Rosa', '06000', '2023-02-06');
call sp_AgregarDepartamento('Sololá', '07000', '2023-05-20');
call sp_AgregarDepartamento('Suchitepéquez', '10000', '2023-12-06');
call sp_AgregarDepartamento('Zacapa', '19000', '2023-05-14');

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

#call sp_BuscarDepartamentos(1);

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
-- call sp_EditarDepartamento (3, 'Huehuetenango', '13000', '2023-04-12');

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

#Call sp_ListarDepartamento();

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
Call sp_AgregarProveedor('Coca Cola','Guatemala','cocacola@gmail.com', '5343-2223');
Call sp_AgregarProveedor('Honda','Guatemala','honda@gmail.com', '9732-8372');
Call sp_AgregarProveedor('Maggie','Guatemala','maggie@gmail.com', '7887-7711');
Call sp_AgregarProveedor('Puma','Guatemala','puma@gmail.com', '9818-5262');
Call sp_AgregarProveedor('SAMSUNG','Guatemala','samsung@gmail.com', '9282-0921');
Call sp_AgregarProveedor('Shell','Guatemala','shell@gmail.com', '6783-8721');
Call sp_AgregarProveedor('Nike','Guatemala','nike@gmail.com', '7823-1823');
Call sp_AgregarProveedor('Red Bull','Guatemala','redbull@gmail.com', '2830-9202');
Call sp_AgregarProveedor('Ford','Guatemala','ford@gmail.com', '5211-0021');
Call sp_AgregarProveedor('Adidas','Guatemala','adidas@gmail.com', '6621-7721');
Call sp_AgregarProveedor('Nivea','Guatemala','nivea@gmail.com', '6231-3332');
Call sp_AgregarProveedor('new balance','Guatemala','newbalance@gmail.com', '0281-3632');
Call sp_AgregarProveedor('CHANEL','Guatemala','chanel@gmail.com', '7821-0082');
Call sp_AgregarProveedor('SONY','Guatemala','sony@gmail.com', '6721-1672');
Call sp_AgregarProveedor('NOKIA','Guatemala','nokia@gmail.com', '1621-9929');
Call sp_AgregarProveedor('ZARA','Guatemala','zara@gmail.com', '5521-0010');
Call sp_AgregarProveedor('BMW','Guatemala','bmw@gmail.com', '1101-7717');

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

#Call sp_ListarProveedor();

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

#Call sp_BuscarProveedor(1);

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
Call sp_agregarTipoMoneda('¥', 'Yen Japonés', 0.0092);
Call sp_agregarTipoMoneda('₪', 'Nuevo Shekel Israelí', 0.31);
Call sp_agregarTipoMoneda('₹', 'Rupia India', 0.013);
Call sp_agregarTipoMoneda('R$', 'Real Brasileño', 0.18);
Call sp_agregarTipoMoneda('₽', 'Rublo Ruso', 0.014);
Call sp_agregarTipoMoneda('₣', 'Franco Suizo', 1.1);
Call sp_agregarTipoMoneda('₡', 'Colón Costarricense', 0.0016);
Call sp_agregarTipoMoneda('₦', 'Naira Nigeriano', 0.0024);
Call sp_agregarTipoMoneda('₤', 'Lira Turca', 0.11);
Call sp_agregarTipoMoneda('₮', 'Tugrik Mongol', 0.00036);
Call sp_agregarTipoMoneda('₩', 'Won Surcoreano', 0.00085);
Call sp_agregarTipoMoneda('R', 'Rand Sudafricano', 0.067);
Call sp_agregarTipoMoneda('฿', 'Baht Tailandés', 0.03);
Call sp_agregarTipoMoneda('₫', 'Dong Vietnamita', 0.000043);
Call sp_agregarTipoMoneda('₱', 'Peso Filipino', 0.020);
Call sp_agregarTipoMoneda('₴', 'Grivna Ucraniana', 0.037);
Call sp_agregarTipoMoneda('₣', 'Franco Francés', 1.18);

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

#call sp_BuscarTipoMoneda(1);

-- Eliminar

Delimiter $$
	Create procedure sp_EliminarTipoMoneda(in idTipo int)
		begin	
			Delete from TipoMoneda
				where idTipoMoneda = idTipo;
        end $$
Delimiter ;

-- CRUD Tipo Empleado --

-- AGREGAR 
Delimiter $$
	Create procedure sp_AgregarTipoEmpleado(in nombreTipoPuesto varchar(150), in salarioTipoEmpleado varchar(150), in contratoTipoEmpleado varchar(150))
		begin 
			Insert into TipoEmpleado(nombreTipoPuesto, salarioTipoEmpleado, contratoTipoEmpleado)
				values(nombreTipoPuesto, salarioTipoEmpleado, contratoTipoEmpleado); 
        end$$
Delimiter ;

call sp_AgregarTipoEmpleado('Gerente', '7,000', 'Tiempo Completo');
call sp_AgregarTipoEmpleado('Jefe', '3,000', 'medio Tiempo');
call sp_AgregarTipoEmpleado('Sub gerente', '7,000', 'Tiempo Cpmpleto');
call sp_AgregarTipoEmpleado('Supervisor', '2,500', 'Medio Tiempo');
call sp_AgregarTipoEmpleado('Limpieza', '3,500', 'Medio Tiempo');
call sp_AgregarTipoEmpleado('Gerente', '7,000', 'Tiempo Completo');
call sp_AgregarTipoEmpleado('Jefe', '3,000', 'medio Tiempo');
call sp_AgregarTipoEmpleado('Sub gerente', '7,000', 'Tiempo Cpmpleto');
call sp_AgregarTipoEmpleado('Supervisor', '2,500', 'Medio Tiempo');
call sp_AgregarTipoEmpleado('Limpieza', '3,500', 'Medio Tiempo');

-- ELIMINAR
Delimiter $$
	Create procedure sp_EliminarTipoEmpleado(in idTipoEmpleado int) 
		begin 
			delete from TipoEmpleado 
				where codigoTipoEmpleado = codTipoEmpleado; 
        end $$
Delimiter ;

-- LISTAR
Delimiter $$
	Create procedure sp_ListarTipoEmpleados()
	begin 
		Select 
			TE.idTipoEmpleado, 
            TE.contratoTipoEmpleado
            from TipoEmpleado TE; 
    end $$
Delimiter ;

-- EDITAR
Delimiter $$
	Create procedure sp_EditarTipoEmpleado(in codTipoEmpleado int)
	begin 
		Select 
			salarioTipoEmpleado,
            contratoTipoEmpleado
            from TipoEmpleado  where codigoTipoEmpleado = codTipoEmpleado; 
    end $$
Delimiter ;


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

Call sp_AgregarEmpleado('Luisa Silvia','Hidalgo de Barrera','2017-06-15','7ma calle 69-31 zona 1 de Mixco, Guatemala','9845-8796', 1);
Call sp_AgregarEmpleado('Pedro Castro','Menéndez Contreras','2011-11-03','5ta calle 25-12 Colonia Quinta Samayoa zona 7 Ciudad de Guatemala, Guatemala','2138-4758', 2);
Call sp_AgregarEmpleado('Humberto Daniel','Domingues Arriola','2016-10-21','9na calle 15-2 zona 1 Guatemala, Guatemala','1973-8264', 3);
Call sp_AgregarEmpleado('Hugo Monserrat','Perez Granizo','2018-06-15','10ma avenida, 5ta calle 5-65 zona 4 Guatemala','6519-3784', 4);
Call sp_AgregarEmpleado('Frankli Isaac','Flores Corado','2018-06-15','2da avenida, 11va calle 36-19 zona 8 Antigua Guatemala','3461-8212', 5);
Call sp_AgregarEmpleado('Daniel Rocio','Flores López','2001-06-21','4ta calle 3-8 zona 8','6512-8212', 6);
Call sp_AgregarEmpleado('Omar Rander','Emmiten Osorio','200-01-29','9na avenida 9calle zona 12','6512-3215', 7);
Call sp_AgregarEmpleado('Rosa Ximena','García Mayen','2009-10-12','12va calle 3-98 zona 9','3254-9745', 8);
Call sp_AgregarEmpleado('Randy Render','Lore Lovoto','2011-07-17','9na avenida 6-51 zona 14','7413-8212', 9);
Call sp_AgregarEmpleado('Daniel Soza','Rodríguez de Córdova','1991-04-17','6ta calle 3-8 zona 15','6591-3912', 10);
Call sp_AgregarEmpleado('Lennin Benjamín','Ixche Soc','2006-06-12','4ta avenida 3-17 zona 17','9185-1752', 10);
Call sp_AgregarEmpleado('Franco Romeo','Donis Rogel','2007-04-04','10ma avenida 63-54 zona 1','3791-1793', 9);
Call sp_AgregarEmpleado('Rebeca Daylin','Sanchez Torres','1997-08-21','3ra avenida 17-23 zona 4','6548-9846', 8);
Call sp_AgregarEmpleado('Alondra Rocio','Suñiga Florian','1991-05-21','8va calle 32-19 zona 10','3215-7895', 7);
Call sp_AgregarEmpleado('Angeles Fernana','Herrarte Loza','2002-09-16','4ta avenida 16-27 zona 8','9517-3597', 6);
Call sp_AgregarEmpleado('Emily Aloja','Rivera Andrade','2005-04-17','7ma avenida 25-95 zona 7','3518-6428', 5);
Call sp_AgregarEmpleado('Carlos Emmanuel','Gómez Yol','1994-10-13','15ta calle 5-25 zona 6','7541-6259', 4);
Call sp_AgregarEmpleado('Henry Javier','Biancas Zuc','1989-11-06','19na avenida 3ta calle 21-13 zona 13','9562-4857', 3);
Call sp_AgregarEmpleado('Edgar Adolfo','Escobedo López','1998-12-24','2da avenida 5-65 zona 14','3245-7865', 2);
Call sp_AgregarEmpleado('Douglas Eduardo','de la Cruz Yat','2005-04-08','8va avenida 32-96 zona 16','1741-1843', 1);

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
-- **********************************************************PROCEDIMIENTOS DAVID SANDOVAL******************************************************

-- **************************************** PROCEDIMIENTOS ALMACENADOS SUCURSALES ****************************************
-- *********************************** PROCEDURE AGREGAR SUCURSAL *************************************************

Delimiter //
	Create procedure sp_agregarSucursal(in nombreSucursal varchar(150), in direccionSucursal varchar(150), in correoSucursal varchar(150), in idDepartamento int, in idProveedor int)
		Begin
			Insert into Sucursal(nombreSucursal, direccionSucursal, correoSucursal, idDepartamento, idProveedor)
				values(nombreSucursal, direccionSucursal, correoSucursal, idDepartamento, idProveedor);
        End //
Delimiter ;


call sp_agregarSucursal('Sucursal Central', 'zona 1', 'sucursalCental@gmail.com', 1, 1 );
call sp_agregarSucursal('Sucursal Financiera Internacional', 'zona 2', 'sucursalfinancierainter@gmail.com', 2, 2);
call sp_agregarSucursal('Sucursal del Norte', 'zona 3', 'sucursalnorte@gmail.com', 3, 3);
call sp_agregarSucursal('Sucursal del Este', 'zona 5', 'sucursaleste@gmail.com', 5, 2);
call sp_agregarSucursal('Sucursal del Oeste', 'zona 6', 'sucursaloeste@gmail.com', 6, 3);
call sp_agregarSucursal('Sucursal Plaza Mayor', 'zona 7', 'sucursalplazamayor@gmail.com', 7, 3);
call sp_agregarSucursal('Sucursal Avenida Principal', 'zona 8', 'sucursalavenidaprincipal@gmail.com', 8, 2);
call sp_agregarSucursal('Sucursal Vanguardia', 'zona 9', 'sucursalvanguardia@gmail.com', 9, 1);
call sp_agregarSucursal('Sucursal Innovación Financiera', 'zona 10', 'sucursalinnovacionfinanciera@gmail.com', 10, 3);


-- ************************************** PROCEDURE LISTAR SUCURSALES *********************************************************
Delimiter //
	Create procedure sp_listarSucursales()
		Begin
			Select 
				S.idSucursal, 
                S.nombreSucursal, 
                S.direccionSucursal, 
                S.correoSucursal, 
                S.idDepartamento, 
                S.idProveedor 
					from Sucursal S;
        End //
Delimiter ;

-- ************************************** PROCEDURE EDITAR SUCURSAL *******************************************************

Delimiter //
	Create procedure sp_editarSucursal(in idSucu int, in nSucursal varchar(150), in dSucursal varchar(150), in cSucursal varchar(150))
		Begin
			Update Sucursal S
				Set
					nombreSucursal = nSucursal, 
                    direccionSucursal = dSucursal, 
                    correoSucursal = cSucursal
						where S.idSucursal = idSucu;
        End //
Delimiter ;

-- **************************************** PROCEDURE BUSCAR SUCURSAL *******************************************************

Delimiter //
	Create procedure sp_buscarSucursal(in idSucu int)
		Begin
			Select 
				S.idSucursal, 
                S.nombreSucursal, 
                S.direccionSucursal, 
                S.correoSucursal, 
                S.idDepartamento, 
                S.idProveedor 
					from Sucursal S where S.idSucursal = idSucu;
        End //
Delimiter ;

-- ************************************** PROCEDURE ELIMIAR SUCURSAL *********************************************************
Delimiter //
	Create procedure sp_eliminarSucursal(in idSucursal int)
		Begin
			Delete from Sucursal where idSucursal = idSucu;
        End //
Delimiter ;

-- CRUD Cuentas --
#	Agregar Cuenta 	#
Delimiter $$
	Create procedure sp_AgregarCuenta(in numeroCuenta bigint,in saldoCuenta decimal(10,2),in tipoCuenta varchar(100),
		in fechaApertura date,in DPI bigint,in idEmpleado int,in idTipoMoneda int,in idSucursal int)
		Begin
			insert into Cuenta(numeroCuenta, saldoCuenta, tipoCuenta, fechaApertura, DPI, idEmpleado,
				idTipoMoneda, idSucursal) 
                values(numeroCuenta, saldoCuenta, tipoCuenta, fechaApertura, DPI, idEmpleado,
                idTipoMoneda, idSucursal);
        End$$
Delimiter ;

Call sp_AgregarCuenta(10001,1486.55,'Depósito','2011-01-18', 1879451248101, 1, 1, 9);
Call sp_AgregarCuenta(10002,565.10,'Ahorro','2010-05-25', 6548721036548, 2, 1, 8);
Call sp_AgregarCuenta(10003,2365.00,'Depósito','2009-08-07', 2548100254810, 3, 2, 7);
Call sp_AgregarCuenta(10004,2015,'Nómina','2005-07-14', 9513578241010, 4, 1, 6);
Call sp_AgregarCuenta(10005,64335,'Corriente','1995-04-01', 2001548231201, 5, 8, 5);
Call sp_AgregarCuenta(10006,5365.35,'Nómina','2000-03-06', 1549531201541, 6, 10, 4);
Call sp_AgregarCuenta(10007,98463,'Depósito','2001-02-04', 2548913201547, 7, 12, 3);
Call sp_AgregarCuenta(10008,53844.54,'Ahorro','2009-01-05', 3021549874102, 8, 7, 2);
Call sp_AgregarCuenta(10009,1635263,'Depósito','2008-12-10', 0012554133210, 9, 1, 1);
Call sp_AgregarCuenta(10010,54511,'Corriente','2010-11-09', 1235487921012, 10, 4, 1);
Call sp_AgregarCuenta(10011,515,'Nómina','1998-10-08', 9548716224601, 11, 14, 2);
Call sp_AgregarCuenta(10012,645,'Depósito','1989-08-12', 9988445131652, 12, 16, 3);
Call sp_AgregarCuenta(10013,565.10,'Depósito','1997-09-13', 0316597513120, 13, 20, 4);
Call sp_AgregarCuenta(10014,1544,'Ahorro','2004-06-14', 0324981320214, 14, 2, 5);
Call sp_AgregarCuenta(10015,8045.95,'Corriente','2007-07-15', 3158794231210, 15, 4, 6);
Call sp_AgregarCuenta(10016,15477.45,'Ahorro','2007-05-19', 3215498203564, 16, 7, 7);
Call sp_AgregarCuenta(10017,98.50,'Depósito','1999-04-21', 9871612054893, 17, 13, 8);
Call sp_AgregarCuenta(10018,63432,'Nómina','2001-03-22', 3202165498321, 18, 2, 9);
Call sp_AgregarCuenta(10019,3154.15,'Nómina','1988-02-25', 0321597812202, 19, 19, 9);
Call sp_AgregarCuenta(10020,1552.25,'Corriente','2011-01-18', 3210546892132, 20, 11, 8);

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
-- Agregar --
Delimiter $$
	Create procedure sp_AgregarCredito(in montoCredito decimal(10,2), in fechaHora datetime,
		in interesCredito decimal(10,2), in idCuenta int)
			Begin
				Insert into Credito (montoCredito, fechaHora, interesCredito, idCuenta)
					values(montoCredito, fechaHora, interesCredito, idCuenta);
			End $$
Delimiter ;
call sp_AgregarCredito(1250.00, '2023-06-06 14:20:00', 0.05, 1);
call sp_AgregarCredito(1325.50, '2023-07-07 07:07:00', 0.02, 2);
call sp_AgregarCredito(2165.50, '2023-09-07 09:15:30', 0.03, 7);
call sp_AgregarCredito(1545.45, '2023-09-07 14:20:45', 0.05, 19);
call sp_AgregarCredito(1562.14, '2023-09-07 18:35:10', 0.075, 14);
call sp_AgregarCredito(4127.54, '2023-09-07 21:45:55', 0.02, 20);
call sp_AgregarCredito(1658.15, '2023-09-07 07:50:25', 0.04, 10);
call sp_AgregarCredito(3265.84, '2023-09-07 12:05:40', 0.025, 9);
call sp_AgregarCredito(7012.86, '2023-09-07 23:30:15', 0.06, 15);
call sp_AgregarCredito(3165.68, '2023-09-07 16:42:20', 0.035, 3);
call sp_AgregarCredito(5498.48, '2023-09-07 03:53:35', 0.08, 8);
call sp_AgregarCredito(3201.21, '2023-09-07 08:27:10', 0.012, 6);
call sp_AgregarCredito(3030.10, '2023-09-07 10:10:45', 0.045, 12);
call sp_AgregarCredito(1547.45, '2023-09-07 19:20:30', 0.09, 16);
call sp_AgregarCredito(3265.17, '2023-09-07 13:33:55', 0.015, 5);
call sp_AgregarCredito(3798.59, '2023-09-07 22:55:40', 0.055, 11);
call sp_AgregarCredito(6257.15, '2023-09-07 06:08:25', 0.07, 17);
call sp_AgregarCredito(3024.15, '2023-09-07 17:12:10', 0.01, 13);
call sp_AgregarCredito(9368.84, '2023-09-07 04:28:45', 0.085, 4);
call sp_AgregarCredito(2568.04, '2023-09-07 11:40:20', 0.02, 18);
-- Listar --
Delimiter $$
	Create procedure sp_ListarCredito()
		Begin
			Select * from Credito;
        End $$
Delimiter ;
call sp_ListarCredito();


-- Buscar --
Delimiter $$
	Create procedure sp_BuscarCredito(in idCred int)
		Begin
			Select Cr.idCredito,
				Cr.monto,
                Cr.fechaHora,
                Cr.interes from Credito Cr 
					where idCredito = idCred;
        End $$
Delimiter ;

-- Editar --
Delimiter $$
	Create procedure sp_EditarCredito(in idCred int, in mt decimal(10,2), in fH datetime,
		in intr decimal(10,2))
		Begin
			Update Credito 
				set monto = mt,
                    fechaHora = fH,
                    interes = intr 
                    where idCredito = idCred;
        End $$
Delimiter ;

-- Eliminar --
Delimiter $$
	Create procedure sp_EliminarCredito(in idCred int)
		Begin
			Delete from Credito 
				where idCred=idCredito;
        End $$
Delimiter ;

-- CRUD Servicios --

-- **************************************** PROCEDIMIENTOS ALMACENADOS SERVICIOS ****************************************

-- *********************************** PROCEDURE AGREGAR SERVICIO *************************************************
Delimiter //
	Create procedure sp_agregarServicio(in tipoServicio varchar(100), in correlativo varchar(100), in montoServicio decimal(10,2), in whatIs varchar(500), in idCuenta int)
		Begin
			Insert into Servicio(tipoServicio, correlativo, montoServicio, idCuenta)
				values(tipoServicio, correlativo, montoServicio, idCuenta);
        End //
Delimiter ;


call sp_agregarServicio('Transferencias de dinero', 'Número de cuenta de destino', 1500.50, 'Nos especializamos en transferencias que son envíos de dinero realizados a la orden de un cliente desde su cuenta bancaria hacia otra cuenta designada.', 1);
call sp_agregarServicio('Banca móvil', 'Aplicación móvil', 255.50, 'Facilita tu vida realizando consultas, transferencias, pagos y gestiones en cualquier momento y lugar con nuestra plataforma, tecnológica segura y confiable las 24hrs', 2);
call sp_agregarServicio('Banca en línea', 'contraseña', 325.25, 'Es un servicio que otorgan los bancos a sus clientes para poder hacer procesos financieros en su teléfono celular o computadora, logrando que transacciones como transferencias o consultas sean mucho más versátiles.', 3);
call sp_agregarServicio('Tarjetas de débito', 'código de seguridad', 555.50, 'Una tarjeta de débito es una herramienta que te permite acceder a tu dinero en una cuenta bancaria y realizar compras o retiros de efectivo. A diferencia de una tarjeta de crédito, gastas tu propio dinero, y los fondos se deducen directamente de tu cuenta.', 4);
call sp_agregarServicio('Préstamos para automóviles', 'Tasas de interés', 600.50, 'Los préstamos para automóviles son acuerdos financieros en los que un prestamista proporciona fondos a un prestatario para la compra de un vehículo. Es importante investigar y comparar ofertas de préstamos de diferentes instituciones financieras para obtener las condiciones y tasas más favorables. También se recomienda revisar cuidadosamente los términos del préstamo antes de comprometerse. ', 5);
call sp_agregarServicio('Préstamos personales', 'Tasas de interés', 904.50, 'Los préstamos para automóviles son acuerdos financieros en los que un prestamista proporciona fondos a un prestatario para la compra de un vehículo. Es importante investigar y comparar ofertas de préstamos de diferentes instituciones financieras para obtener las condiciones y tasas más favorables. También se recomienda revisar cuidadosamente los términos del préstamo antes de comprometerse. ', 6);
call sp_agregarServicio('Préstamos hipotecarios', 'Tasas de interés', 651.45, 'Los préstamos para automóviles son acuerdos financieros en los que un prestamista proporciona fondos a un prestatario para la compra de un vehículo. Es importante investigar y comparar ofertas de préstamos de diferentes instituciones financieras para obtener las condiciones y tasas más favorables. También se recomienda revisar cuidadosamente los términos del préstamo antes de comprometerse.', 7);
call sp_agregarServicio('Tarjetas de crédito', 'Estados de cuenta mensuales', 850.50, 'Vanguardbank te brinda la oportunidad  de comprar en Guatemala o cualquier parte del mundo sin usar dinero en efectivo y con beneficios hacia  los clientes con nuestras tarjetas de crédito, solicita o pide información aquí', 8);
call sp_agregarServicio('Cuentas de ahorro', 'Libretas de ahorro', 2000.25, 'Una cuenta de ahorro es un tipo de cuenta bancaria diseñada específicamente para ayudarte a ahorrar dinero de manera segura y efectiva. Al abrir una cuenta de ahorro, puedes depositar dinero de forma regula, y el banco te paga intereses por mantener esos fondos en la cuenta.', 9);
call sp_agregarServicio('Cuentas corrientes', 'Estados de cuenta', 1000.65, 'Una cuenta de ahorro es un tipo de cuenta bancaria diseñada específicamente para ayudarte a ahorrar dinero de manera segura y efectiva. Al abrir una cuenta de ahorro, puedes depositar dinero de forma regula, y el banco te paga intereses por mantener esos fondos en la cuenta.', 10);


-- *********************************** PROCEDURE LISTAR SERVICIO *************************************************

Delimiter //
	Create procedure sp_listarServicios()
		Begin
			Select 
				S.idServicio, 
				S.tipoServicio, 
                S.correlativo, 
                S.montoServicio, 
                S.idCuenta from Servicio S;
			
        End //
Delimiter ;

-- *********************************** PROCEDURE EDITAR SERVICIO *************************************************

Delimiter //
	Create procedure sp_editarServicios(in idServi int, in tServicio varchar(100), in correla varchar(100), in mServicio decimal(10,2))
		Begin
			Update Servicio S
				Set
					S.tipoServico = tServicio,
                    S.correlativo = correla,
                    S.montoServicio = mServicio
						where S.idServicio = idServi;
        End //
Delimiter ;

-- *********************************** PROCEDURE BUSCAR SERVICIO *************************************************

Delimiter //
	Create procedure sp_buscarServicio(in idServi int)
		Begin
			Select 
				S.idServicio, 
				S.tipoServicio, 
                S.correlativo, 
                S.montoServicio, 
                S.idCuenta from Servicio S where S.idServicio = idServi;
        End //
Delimiter ;

-- *********************************** PROCEDURE ELIMINAR SERVICIO *************************************************

Delimiter //
	Create procedure sp_eliminarServio(in idServi int)
		Begin
			Delete from Servicio where idServicio = idServi;
        End //
Delimiter ;



-- CRUD Login --

Delimiter $$
	create procedure sp_AgregarLogin(in nombreUsuario varchar(150), in passwordUsuario varchar(150), in horaSesion datetime, in idCuenta int)
		begin
			Insert into Login(nombreUsuario, passwordUsuario, horaSesion, idCuenta)
				value (nombreUsuario, passwordUsuario, horaSesion, idCuenta);
        end $$
Delimiter ;

Delimiter $$
	create procedure sp_EliminarLogin(in idUser_ int)
		begin 
			Delete from Login where idUser = idUser_;
        end $$
Delimiter ;

Delimiter $$
	create procedure sp_ListarLogin()
		begin
			select 
				L.idUser,
                L.nombreUsuario,
                L.passwordUsuario,
                L.horaSesion,
                L.idCuenta from Login;
        end $$
Delimiter ;

Delimiter $$
	create procedure sp_BuscarLogin(in idUser_ int)
		begin
			select 
				L.idUser,
                L.nombreUsuario,
                L.passwordUsuario,
                L.horaSesion,
                L.idCuenta from Login where L.idUser = idUser_;
        end $$
Delimiter ;

Delimiter $$
	create procedure sp_EditarLogin(in idUser_ int,in nombreUsuario_ varchar(150), in passwordUsuario_ varchar(150), in horaSesion_ datetime, in idCuenta_ int)
		begin
			Update Login L set
                L.nombreUsuario = nombreUsuario_,
                L.passwordUsuario = passwordUsuario_,
                L.horaSesion = horaSesion_,
                L.idCuenta = idCuenta_  where L.idUser = idUser_;
        end $$
Delimiter ;

/*select * from Login where nombreUsuario = 'asanchez' and passwordUsuario = 12345;*/

call sp_AgregarLogin('asanchez','12345','2023-07-19 12:34:56','1');
call sp_AgregarLogin('esantos','12345','2023-07-19 12:34:56','2');
call sp_AgregarLogin('dsiney','12345','2023-07-19 12:34:56','3');
call sp_AgregarLogin('kvelasquez','12345','2023-07-19 12:34:56','4');
call sp_AgregarLogin('jsoto','12345','2023-07-19 12:34:56','5');


-- CRUD Transacciones --
-- Agregar --
Delimiter $$
	Create procedure sp_AgregarTransaccion(in tipoTransaccion varchar(50), 
		in montoTransaccion decimal(10,2), in fechaHora datetime, in idEmpleado int, 
			in idCuenta int)
				Begin 
					Insert into Transaccion(tipoTransaccion, montoTransaccion, fechaHora, idEmpleado, idCuenta)
						values(tipoTransaccion, montoTransaccion, fechaHora, idEmpleado, idCuenta);
				End $$
Delimiter ;
call sp_AgregarTransaccion('Depósito', 1200.00, '2022-03-15 08:22:45', 2, 1);
call sp_AgregarTransaccion('Depósito', 1230.11, '2022-06-07 14:37:20', 3, 10);
call sp_AgregarTransaccion('Transferencia bancaria', 3829.12, '2022-08-24 18:50:55', 13, 5);
call sp_AgregarTransaccion('Pago de facturas', 546.21, '2022-10-11 11:15:30', 10, 11);
call sp_AgregarTransaccion('Compra con tarjeta de débito', 4851.14, '2022-12-03 20:45:10', 4, 19);
call sp_AgregarTransaccion('Compra con tarjeta de crédito', 659.34, '2023-01-22 09:30:25', 8, 20);
call sp_AgregarTransaccion('Transferencia internacional', 1563.15, '2023-03-14 16:55:40', 15, 12);
call sp_AgregarTransaccion('Pagos programados', 1612.23, '2023-05-05 22:10:15', 1, 3);
call sp_AgregarTransaccion('Depósito directo', 484.15, '2023-06-27 04:28:50', 11, 18);
call sp_AgregarTransaccion('Compra en línea', 789.21, '2023-08-18 13:45:05', 16, 4);
call sp_AgregarTransaccion('Cambio de divisas', 1658.15, '2023-10-09 17:20:35', 18, 13);
call sp_AgregarTransaccion('Compra de cheques de cajero', 1693.25, '2023-12-01 07:53:15', 5, 6);
call sp_AgregarTransaccion('Cambio de divisas', 1848.02, '2023-01-20 23:42:30', 6, 16);
call sp_AgregarTransaccion('Compra', 1612.15, '2023-03-12 12:15:55', 14, 9);
call sp_AgregarTransaccion('Venta', 3025.15, '2023-05-03 19:30:40', 12, 2);
call sp_AgregarTransaccion('Comercial', 1815.20, '2023-06-24 02:14:25', 17, 8);
call sp_AgregarTransaccion('Inmobiliarios', 4625.48, '2023-08-15 10:08:10', 19, 17);
call sp_AgregarTransaccion('Pago de préstamo', 3021.15, '2023-10-06 08:40:45', 7, 14);
call sp_AgregarTransaccion('Gestión de inversiones', 4652.31, '2023-11-28 21:37:20', 20, 7);
call sp_AgregarTransaccion('Pago de facturas', 4825.78, '2023-01-19 06:12:50', 9, 15);
-- Listar --
Delimiter $$
	Create procedure sp_ListarTransaccion()
		Begin
			Select * from Transacciones;
        End $$
Delimiter ;

-- Buscar --
Delimiter $$
	Create procedure sp_BuscarTransaccion(in idTransaction int)
		Begin
			Select Tr.idTransaccion, 
				   Tr.tipoTransaccion, 
                   Tr.monto, 
                   Tr.fechaHora from Transacciones Tr
					where idTransaccion = idTransaction;	
        End $$
Delimiter ;

-- Editar --
Delimiter $$
	Create procedure sp_EditarTransaccion(in idTransaction int, in tpTransaccion varchar(50), 
		in mnt decimal(10,2), in fH datetime)
			Begin
				Update Transacciones 
					set tipoTransaccion = tpTransaccion, 
                        monto = mnt, 
                        fechaHora = fH
                        where idTransaccion = idTransaction;
            End $$
Delimiter ;

-- Eliminar --
Delimiter $$
	Create procedure sp_EliminarTransaccion(in idTransaction int)
		Begin
			Delete from Transacciones 
				where idTransaction = idTransaccion;
        End $$
Delimiter ;

-- CRUD Historial Transacción --
-- AGREGAR HISTORIAL DE TRANSACCIONES
Delimiter $$
	Create procedure sp_AgregarHistorialDeTransacciones(in _idCuenta int, in _idTransaccion int)
		begin
			Insert into HistorialDeTransacciones (idCuenta, idTransaccion)
				values (_idCuenta, _idTransaccion);
        end $$
Delimiter ;
call sp_AgregarHistorialDeTransacciones(1,1);
-- LISTAR HISTORIAL DE TRANSACCIONES
Delimiter $$
	Create procedure sp_ListarHistorialDeTransacciones()
		Begin 
        select * from HistorialDeTransacciones;
        end $$
    ;
Delimiter ;
#call sp_ListarHistorialDeTransacciones();

-- BUSCAR HISTORIAL DE TRANSACCIONES
Delimiter $$
	Create procedure sp_BuscarHistorialDeTransacciones(in _idHistorialTransacciones int)
    begin
		select * from HistorialDeTransacciones
			where idHistorialTransaccion = _idHistorialTransacciones;
    end $$
Delimiter ;
#call sp_BuscarHistorialDeTransacciones(1);

-- EDITAR HISTORIAL DE TRANSACCIONES
Delimiter $$
	Create procedure sp_EditarHistorialDeTransacciones(in _idHistorialTransaccion int, in _idCuenta int, in _idTransacciones int)
		begin
			Update HistorialDeTransacciones 
				set idCuenta = _idCuenta,
					idTransaccion = _idTransacciones
                    where idHistorialTransaccion = _idHistorialTransaccion;
		end $$
Delimiter ;

-- ELIMINAR HISTORIAL DE TRANSACCIONES
Delimiter $$
	Create procedure sp_EliminarHistorialDeTransacciones (in _idHistorialTransaccion int)
		begin
			delete from HistorialDeTransacciones 
				where idHistorialTransaccion = _idHistorialTransaccion;
        end $$
Delimiter ;
/*call sp_EliminarHistorialDetransacciones(1);*/
-- CRUD Depositos --

-- AGREGAR --- 

Delimiter $$ 
	Create procedure sp_AgregarDeposito(in montoDeposito decimal(10,2), in fechaDeposito date, in horaDeposito time, in idCuentaOrigen int, in idCuentaDeposito int) 
		Begin 
			Insert into Deposito(montoDeposito, fechaDeposito, horaDeposito, idCuentaOrigen, idCuentaDeposito) 
					values(montoDeposito, fechaDeposito, horaDeposito, idCuentaOrigen, idCuentaDeposito); 
		End $$ 
Delimiter ; 
call sp_AgregarDeposito(200.25, '2021-05-13', '14:35:25', 1, 1); 
call sp_AgregarDeposito(400.50, '2021-06-14', '15:32:20', 2, 2); 
call sp_AgregarDeposito(500.02, '2022-06-09', '14:20:32', 3, 3); 
call sp_AgregarDeposito(650.250, '2023-07-16', '17:25:58', 4, 4); 
call sp_AgregarDeposito(788.45, '2023-05-07', '13:52:32', 5, 5);
call sp_AgregarDeposito(100.50, '2023-09-07', '10:00:00', 6, 6);
call sp_AgregarDeposito(200.50, '2023-07-06', '12:30:00', 7, 7);
call sp_AgregarDeposito(130.20, '2022-06-07', '13:20:50', 8, 8);
call sp_AgregarDeposito(75.75, '2023-08-15', '15:45:30', 9, 9);
call sp_AgregarDeposito(50.00, '2023-05-20', '09:15:00', 10, 10);
call sp_AgregarDeposito(300.25, '2023-04-12', '11:00:00', 11, 11);
call sp_AgregarDeposito(90.80, '2023-03-28', '14:30:45', 12, 12);
call sp_AgregarDeposito(175.60, '2023-02-10', '08:45:15', 13, 13);
call sp_AgregarDeposito(250.00, '2023-01-05', '16:10:20', 14, 14);
call sp_AgregarDeposito(120.75, '2022-12-22', '10:55:30', 15, 15);
call sp_AgregarDeposito(80.40, '2022-11-17', '13:40:00', 16, 16);
call sp_AgregarDeposito(175.25, '2022-10-09', '11:25:45', 17, 17);
call sp_AgregarDeposito(220.90, '2022-09-28', '14:15:10', 18, 18);
call sp_AgregarDeposito(95.10, '2022-08-14', '09:30:25', 19, 19);
call sp_AgregarDeposito(160.30, '2022-07-03', '12:05:40', 20, 20);

-- LISTAR --

Delimiter $$ 
	Create procedure sp_ListarDepositos()
		Begin 
			Select idDeposito as id_Depósito, 
				montoDeposito as monto_Depósito, 
				fechaDeposito as fecha_Depósito, 
				horaDeposito as hora_Depósito, 
				idCuentaOrigen as id_Cuenta_Origen, 
				idCuentaDeposito as id_Cuenta_Deposito
				from Deposito; 
		End $$
Delimiter ; 

#call sp_ListarDepositos(); 

-- BUSCAR---

Delimiter $$ 
	Create procedure sp_BuscarDeposito(in idDep int)
		Begin 
			Select idDeposito as id_Depósito, 
			montoDeposito as montoDeposito, 
			fechaDeposito as fechaDeposito, 
			horaDeposito as horaDeposito, 
			idCuentaOrigen as idCuentaOrigen, 
			idCuentaDeposito as idCuentaDeposito
			from Deposito where idDeposito = idDep; 
		End $$ 
Delimiter ;

-- EDITAR--- 

Delimiter $$ 
	Create procedure sp_EditarDeposito(in idDep int, in montDep decimal(10,2), in fechDep date, in horDep time, idCuentOrig int, idCuentDep int)
		Begin 
			Update Deposito set montoDeposito = montDep, 
						fechaDeposito = fechDep, 
						horaDeposito = horDep, 
						idCuentaOrigen = idCuentOrig, 
						idCuentaDeposito = idCuentDep
						where 	idDeposito = idDep;
		End $$  
Delimiter ; 

-- ELIMINAR --

Delimiter $$
	Create procedure sp_EliminarDeposito(in idDep int)
		Begin 
			Delete from Deposito	
			where idDeposito = idDep; 
		End $$
Delimiter ; 
