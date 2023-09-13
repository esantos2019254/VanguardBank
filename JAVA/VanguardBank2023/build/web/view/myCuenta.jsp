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
    <body >
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark mb-0" style="background-color: rgb(20, 25, 45) !important">
            <div class="container-sm ">
                <a class="navbar-brand" href="ControladorFunc?menu=indexClienteC&idCuenta=${cuenta.getIdCuenta()}">
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
                                        <a class="dropdown-item" style="margin-left: 10px; border: none" href="ControladorFunc?menu=cuenta&accion=verMiCuenta&idCuenta=${cuenta.getIdCuenta()}">Cuenta</a>
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
        <div class="container-sm">
            <h1 class="text-center mt-4">MI CUENTA</h1>

            <div class="mb-3">
                <label for="formFileLg" class="form-label">NOMBRE COMPLETO</label>
                <input class="form-control form-control-lg" id="formFileLg" type="text" value="${cliente.getNombreCliente()}">
            </div>
            <div class="mb-3">
                <label for="formFileLg" class="form-label">NUMERO DE CUENTA</label>
                <input class="form-control form-control-lg" id="formFileLg" type="text" value="${cuenta.getNumeroCuenta()}">
            </div>
            <div class="mb-3">
                <label for="formFileLg" class="form-label">SALDO DISPONIBLE</label>
                <input class="form-control form-control-lg" id="formFileLg" type="text" value="${cuenta.getSaldoCuenta()}">
            </div>

            <div class="d-flex">
                <div class="d-flex">
                    <a type="button" class="btn btn-outline-primary" href="ControladorFunc?menu=cuenta&accion=verHistorial">VER HISTORIAL</a>
                    <div class="card-body" style="margin-left: 4px">
                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#transferencia">
                            TRANFERENCIA
                        </button>
                    </div>
                </div>
                <div class="modal fade" id="transferencia" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-success container text-center">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">TRANFERENCIA</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="ControladorFunc?menu=cuenta" method="POST">
                                    <div class="mb-3">
                                        <label for="formFileLg" class="form-label">MONTO DEPOSITO</label>
                                        <input class="form-control form-control-lg" name="txtMontoDeposito" id="formFileLg" type="text">
                                    </div>
                                    <div class="mb-3">
                                        <label for="formFileLg" class="form-label">FECHA DEPOSITO</label>
                                        <input class="form-control form-control-lg" name="txtFechaDeposito" id="formFileLg" type="date">
                                    </div>
                                    <div class="mb-3">
                                        <label for="formFileLg" class="form-label">HORA DEPOSITO</label>
                                        <input class="form-control form-control-lg" name="txtHoraDeposito" id="formFileLg" type="time">
                                    </div>
                                    <div class="mb-3">
                                        <label for="formFileLg" class="form-label">NUMERO DE CUENTA ORIGEN</label>
                                        <input class="form-control form-control-lg" id="formFileLg" type="text" value="${cuenta.getNumeroCuenta()}" readonly="">
                                    </div>
                                    <div class="mb-3">
                                        <label for="formFileLg" class="form-label">NUMERO DEPOSITO DESTINO</label>
                                        <input class="form-control form-control-lg" name="txtIdCuentaDeposito" id="formFileLg" type="text">
                                    </div>
                                    <input type="hidden" name="txtIdCuentaOrigen" value="${cuenta.getIdCuenta()}">
                                    <input class="container text-center btn btn-dark" type="submit" name="accion" value="TRANSFERIR">
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CERRAR</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
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
    </body>
</html>
