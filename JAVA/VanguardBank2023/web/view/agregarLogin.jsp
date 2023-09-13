<%-- 
    Document   : agregarLogin
    Created on : 29/08/2023, 10:21:10 AM
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Agregar Login</title>
    </head>
    <body style="background-color: #183952">
        <div class="container mt-4 col-lg-4">
            <div class="card col-sm-10">
                <div class="card-body">
                    <form action="Validar" method="Post">
                        <div class="form-group text-center">
                            <h3>Crea tu cuenta de VanguardBank</h3>
                            <img src="img/LogoVB.png" alt="270" width="330"><br>
                            <label>Disfruta de nuestros servicios</label>
                        </div>
                        <div class="form-group">
                            <label>NOMBRE USUARIO</label>
                            <input type="text" name="txtUser" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>PASSWORD</label>
                            <input type="password" name="txtPass" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>ID CUENTA</label>
                            <input type="number" name="txtIdCuenta" class="form-control">
                            <button type="submit" name="accion" value="Agregar" class="btn btn-dark btn-block">Crear cuenta</button>
                        </div>
                        <div class="form-group">
                            <label></label>
                            <a href="Controlador?accion=addLogin">No tiene cuenta? Registrese aqui</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
