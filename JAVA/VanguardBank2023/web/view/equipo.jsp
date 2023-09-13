<%-- 
    Document   : equipo
    Created on : Sep 10, 2023, 9:36:15 PM
    Author     : okrun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="resources/style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark mb-0" style="background-color: rgb(20, 25, 45) !important">
            <div class="container-sm ">
                <a class="navbar-brand" href="Controlador?accion=index">
                    HOME
                </a>
                <div class="container-md">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                        <ul class="navbar-nav ">
                            <li class="nav-item dropdown">
                                <button class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    ENTIDADES
                                </button>
                                <ul class="dropdown-menu dropdown-menu-primary">
                                    <li>
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listar">Clientes</a>
                                    </li>
                                    <li >
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarDeposito" >Deposito</a>
                                    </li>
                                    <li >
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarProveedor">Proveedor</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarTipoEmpleado" >TipoEmpleado</a>
                                    </li>
                                    <li >
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarTransaccion">Transacciones</a>
                                    </li>
                                    <li >
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarDepartamento" >Departamentos</a>
                                    </li>
                                    <li >
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarEmpleado">Empleado</a>
                                    </li>
                                    <li >
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarTipoMoneda" >TipoMoneda</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarHistorial" >HistorialDeTransacciones</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarCuenta" >Cuenta</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarCredito" >Crédito</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarSucursal" >Sucursal</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=listarServicio">Servicio</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="Controlador?accion=carritoServicio" >Carrito Servicio</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <a class="nav-item btn btn-outline-primary" href="Controlador?accion=equipo">EQUIPO</a>
                <a class="col-sm-1 6offset-md-1 nav-item btn btn-outline-primary" href="Controlador?accion=">LOG OUT</a>

            </div>
        </nav>
        <section class="bg-hero-image py-4">
            <div class="container-fluid bg-color">
                <div class="container-sm d-flex">
                    <div class="card" style="width: 18rem; background-color: transparent">
                        <img class="offset-md-1" src="img/Kenneth.jpg" height="300px" width="200px">
                        <div class="card-body" style="background-color: transparent">
                            <h5 class="card-title">Diego Sebastián Siney García</h5>
                            <p class="card-text">Soy un programador que está en 5to grado de diversificado tengo conocimientos de Java, JavaScript, he manejado el sistema gestor de base de datos MySQL</p>
                        </div style="background-color: transparent">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><span>CARNET:</span>2021664</li>
                            <li class="list-group-item">INB5M</li>
                            <li class="list-group-item">EL MAS DURO</li>
                        </ul>
                    </div>
                    <div class="card offset-md-1" style="width: 18rem; background-color: transparent">
                        <img class="offset-md-1" src="img/Kenneth.jpg" height="300px" width="200px">
                        <div class="card-body" style="background-color: transparent">
                            <h5 class="card-title">Diego Sebastián Siney García</h5>
                            <p class="card-text">Soy un programador que está en 5to grado de diversificado tengo conocimientos de Java, JavaScript, he manejado el sistema gestor de base de datos MySQL</p>
                        </div style="background-color: transparent">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><span>CARNET:</span>2021664</li>
                            <li class="list-group-item">INB5M</li>
                            <li class="list-group-item">EL MAS DURO</li>
                        </ul>
                    </div>

                    <div class="card offset-md-1" style="width: 18rem; background-color: transparent">
                        <img class="offset-md-1" src="img/Kenneth.jpg" height="300px" width="200px">
                        <div class="card-body" style="background-color: transparent">
                            <h5 class="card-title">Diego Sebastián Siney García</h5>
                            <p class="card-text">Soy un programador que está en 5to grado de diversificado tengo conocimientos de Java, JavaScript, he manejado el sistema gestor de base de datos MySQL</p>
                        </div style="background-color: transparent">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><span>CARNET:</span>2021664</li>
                            <li class="list-group-item">INB5M</li>
                            <li class="list-group-item">EL MAS DURO</li>
                        </ul>
                    </div>
                    <div class="card offset-md-1" style="width: 18rem; background-color: transparent">
                        <img class="offset-md-1" src="img/Kenneth.jpg" height="300px" width="200px">
                        <div class="card-body" style="background-color: transparent">
                            <h5 class="card-title">Diego Sebastián Siney García</h5>
                            <p class="card-text">Soy un programador que está en 5to grado de diversificado tengo conocimientos de Java, JavaScript, he manejado el sistema gestor de base de datos MySQL</p>
                        </div style="background-color: transparent">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><span>CARNET:</span>2021664</li>
                            <li class="list-group-item">INB5M</li>
                            <li class="list-group-item">EL MAS DURO</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <section class="bg-hero-image py-4">
            <div class="container-fluid bg-color">
                <div class="container-sm d-flex">
                    <div class="card" style="width: 18rem; background-color: transparent">
                        <img class="offset-md-1" src="img/Kenneth.jpg" height="300px" width="200px">
                        <div class="card-body" style="background-color: transparent">
                            <h5 class="card-title">Diego Sebastián Siney García</h5>
                            <p class="card-text">Soy un programador que está en 5to grado de diversificado tengo conocimientos de Java, JavaScript, he manejado el sistema gestor de base de datos MySQL</p>
                        </div style="background-color: transparent">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><span>CARNET:</span>2021664</li>
                            <li class="list-group-item">INB5M</li>
                            <li class="list-group-item">EL MAS DURO</li>
                        </ul>
                    </div>
                    <div class="card offset-md-1" style="width: 18rem; background-color: transparent">
                        <img class="offset-md-1" src="img/Kenneth.jpg" height="300px" width="200px">
                        <div class="card-body" style="background-color: transparent">
                            <h5 class="card-title">Diego Sebastián Siney García</h5>
                            <p class="card-text">Soy un programador que está en 5to grado de diversificado tengo conocimientos de Java, JavaScript, he manejado el sistema gestor de base de datos MySQL</p>
                        </div style="background-color: transparent">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><span>CARNET:</span>2021664</li>
                            <li class="list-group-item">INB5M</li>
                            <li class="list-group-item">EL MAS DURO</li>
                        </ul>
                    </div>

                    <div class="card offset-md-1" style="width: 18rem; background-color: transparent">
                        <img class="offset-md-1" src="img/Kenneth.jpg" height="300px" width="200px">
                        <div class="card-body" style="background-color: transparent">
                            <h5 class="card-title">Diego Sebastián Siney García</h5>
                            <p class="card-text">Soy un programador que está en 5to grado de diversificado tengo conocimientos de Java, JavaScript, he manejado el sistema gestor de base de datos MySQL</p>
                        </div style="background-color: transparent">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><span>CARNET:</span>2021664</li>
                            <li class="list-group-item">INB5M</li>
                            <li class="list-group-item">EL MAS DURO</li>
                        </ul>
                    </div>
                    <div class="card offset-md-1" style="width: 18rem; background-color: transparent">
                        <img class="offset-md-1" src="img/Kenneth.jpg" height="300px" width="200px">
                        <div class="card-body" style="background-color: transparent">
                            <h5 class="card-title">Diego Sebastián Siney García</h5>
                            <p class="card-text">Soy un programador que está en 5to grado de diversificado tengo conocimientos de Java, JavaScript, he manejado el sistema gestor de base de datos MySQL</p>
                        </div style="background-color: transparent">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><span>CARNET:</span>2021664</li>
                            <li class="list-group-item">INB5M</li>
                            <li class="list-group-item">EL MAS DURO</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    </body>
</html>
