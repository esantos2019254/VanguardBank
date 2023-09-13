<%-- 
    Document   : listarCredito
    Created on : 8/08/2023, 08:13:41 PM
    Author     : José David Soto
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Credito"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.CreditoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="resources/style.css">

        <title>Listar Credito</title>
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
        <div class="container-md mt-4 mt-4">
            <h1 class="container text-center">Registro de Creditos</h1>
            <a class="btn btn-primary mb-4"href="Controlador?accion=addCredito">Agregar Nuevo Credito</a>
            <table class="table table-striped-columns table-bordered">
                <thead>
                    <tr>
                        <th>CODIGO DEL CRÉDITO</th>
                        <th>MONTO DEL CRÉDITO</th>
                        <th>FECHA Y HORA</th>
                        <th>INTERES CREDITARIO</th>
                        <th>CODIGO DE LA CUENTA</th>
                    </tr>
                </thead>
                <%
                    CreditoDAO dao = new CreditoDAO();
                    List<Credito> listaCredito = dao.listar();
                    Iterator<Credito> iterator = listaCredito.iterator();
                    Credito cre = null;
                    while (iterator.hasNext()) {
                        cre = iterator.next();%>
                <tbody>
                    <tr>
                        <td><%=cre.getIdCredito()%></td>
                        <td><%=cre.getMontoCredito()%></td>
                        <td><%=cre.getFechaHora()%></td>
                        <td><%=cre.getInteresCredito()%></td>
                        <td><%=cre.getIdCuenta()%></td>
                        <td>
                            <a class="btn btn-warning" href="Controlador?accion=editarCredito&idCredito=<%= cre.getIdCredito()%>">Edit</a>
                            <a class="btn btn-danger" href="Controlador?accion=eliminarCredito&idCredito=<%= cre.getIdCredito()%>">Eliminar</a>
                        </td>
                    </tr>
                </tbody>

                <%}%>


            </table>    
        </div>
                <footer class="container-fluid" style="background-color: #141c2b;">
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
