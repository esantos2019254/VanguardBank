<%-- 
    Document   : carritoServicio
    Created on : Sep 4, 2023, 2:20:49 AM
    Author     : okrun
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="resources/style.css">
        <title>CARRITO SERVICIO</title>
    </head>
    <body>
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark mb-0" style="background-color: rgb(20, 25, 45) !important">
            <div class="container-sm ">
                <a class="navbar-brand" href="Controlador?accion=index">
                    <img src="img/imghome.png" height="50px" width="60px">
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
                <a class="btn btn-danger col-sm-1" href="Controlador?accion=">LOG OUT</a>
            </div>
        </nav>

        <div class="container-fluid mt-4 ">
            <h2 class="container text-center"> CARRITO SERVICIOS</h2>
            <div>
                <table class="table col-sm-10">
                    <thead>
                        <tr>
                            <td scope="col">ID SERVICIO</td>
                            <td scope="col">TIPO SERVICIO</td>
                            <td scope="col">CORRELATIVO</td>
                            <td scope="col">PRECIO</td>
                            <td scope="col">ID CUENTA</td>
                            <td scope="col">DETALLES</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="servicio" items="${listaServicios}">
                        <tr>
                            <td>${servicio.getIdServicio()}</td>
                            <td>${servicio.getTipoServicio()}</td>
                            <td>${servicio.getCorrelativo()}</td>
                            <td>${servicio.getMontoServicio()}</td>
                            <td>${servicio.getIdCuenta()}</td>
                            <td>
                                <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="collapse" data-bs-target="#collapseDetalle" aria-expanded="false" aria-controls="collapseDetalle">MAS DETALLES</button>
                                <div class="collapse" id="collapseDetalle">
                                    <div class="card card-body">
                                        ${servicio.getWhatIs()}
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </c:forEach>>
                    </tbody>
                </table>
            </div>
        </div>
        <footer class="container-fluid sticky-bottom" style="background-color: #141c2b;">
            <img src="img/VBLogo2.png" width="10%" id="imgFooter">
            <div class="container-md text-center">
                
                <div class="container-sm text-center">
                    <div>
                        <a href="https://www.instagram.com" target="_blank">

                            <img src="img/Instagram.png">

                        </a>

                        <a href="https://facebook.com" target="_blank">

                            <img src="img/Facebook.png">

                        </a>

                        <a href="">

                            <img src="img/Twitter.png" target="_blank">

                        </a>
                    </div>
                </div>
                
            </div>
            <div class="container-fluid text-center py-4">  

                    <p style="color: white;">
                        Reservados todos los derechos. El nombre del producto, los logotipos VanguardBank: todas las demás marcas son marcas comerciales de sus propietarios. No se puede copiar nada en este sitio sin permiso por escrito.

                    </p>

                </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
