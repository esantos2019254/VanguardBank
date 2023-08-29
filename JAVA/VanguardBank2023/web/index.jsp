<%-- 
    Document   : index
    Created on : 20/07/2023, 01:41:25 PM
    Author     : titos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Proyecto VanguardBank</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg nvbar-light bg-info">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="Controlador?accion=listar" target="myFrame">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="Controlador?accion=listarDeposito" target="myFrame">Deposito</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="Controlador?accion=listarProveedor" target="myFrame">Proveedor</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="Controlador?accion=listarTipoEmpleado" target="myFrame">TipoEmpleado</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="Controlador?accion=listarTransaccion" target="myFrame">Transacciones</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="Controlador?accion=listarDepartamento" target="myFrame">Departamentos</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="Controlador?accion=listarEmpleado" target="myFrame">Empleado</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="Controlador?accion=listarTipoMoneda" target="myFrame">TipoMoneda</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="Controlador?accion=listarHistorial" target="myFrame">HistorialDeTransacciones</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="Controlador?accion=listarCuenta" target="myFrame">Cuenta</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="Controlador?accion=listarCredito" target="myFrame">Crédito</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="#" target="myFrame">Sucursal</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none"class="btn btn-outline-light" href="#" target="myFrame">Servicio</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="m-4" style="height: 670px">
            <iframe name="myFrame" style="height: 100%; width: 100%; border:none"></iframe>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>