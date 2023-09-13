<%-- 
    Document   : indexCliente
    Created on : Sep 11, 2023, 8:30:33 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark mb-0" style="background-color: rgb(20, 25, 45) !important">
            <div class="container-sm ">
                <a class="navbar-brand" href="ControladorFunc?menu=indexCliente">
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
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="ControladorFunc?menu=cuenta&accion=verMiCuenta&idCuenta=${idMyCuenta}">Cuenta</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="#" >Crédito</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="#">Servicio</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="#" >Carrito Servicio</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>

                <a class="btn btn-danger col-sm-1" href="Controlador?accion=">LOG OUT</a>
            </div>
        </nav>
        <div class="container-fluid d-flex">
            <div class="container-md text-center mt-4 ">
                <h2>HISTORIAL DE MIS DEPOSITOS</h2>
                <table class="table table-striped-columns table-bordered">
                    <thead>
                        <tr>
                            <td scope="col">NO. DEPOSITO</td>
                            <td scope="col">MONTO DEPOSITO</td>
                            <td scope="col">FECHA</td>
                            <td scope="col">HORA</td>
                            <td scope="col">ID CUENTA ORIGEN</td>
                            <td scope="col">ID CUENTA DESTINO</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="deposito" items="${listaDepositos}">
                            <tr>
                                <td>${deposito.getIdDeposito()}</td>
                                <td>${deposito.getMontoDeposito()}</td>
                                <td>${deposito.getFechaDeposito()}</td>
                                <td>${deposito.getHoraDeposito()}</td>
                                <td>${deposito.getIdCuentaOrigen()}</td>
                                <td>
                                    ${deposito.getIdCuentaDeposito()}
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
           
        </div>
        <br>
        <br>
        <br>
        <br>


        <<footer class="container-fluid mt-4" style="background-color: #141c2b;">
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
    </body>
</html>
