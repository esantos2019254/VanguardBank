<%-- 
    Document   : addCliente
    Created on : 20/07/2023, 02:23:04 PM
    Author     : titos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Agregar Cliente</title>
    </head>
    <body style="display: flex; justify-content: center; align-items: center">
        <div class="card col-sm-6">
            <div class="card-body">
                <form action="Controlador">
                    <div class="form-group" style="margin-bottom: -20px">
                        <strong>DPI:</strong><br>
                        <input type="text" name="txtDPI" class="form-control"><br><br>
                    </div>
                    <div class="form-group" style="margin-bottom: -20px">
                        <strong>Nombre:</strong><br>
                        <input type="text" name="txtNombre"class="form-control"><br><br>
                    </div>
                    <div class="form-group" style="margin-bottom: -20px">
                        <strong>Apellido:</strong><br>
                        <input type="text" name="txtApellido"class="form-control"><br><br>
                    </div>
                    <div class="form-group" style="margin-bottom: -20px">
                        <strong>Telefono:</strong><br>
                        <input type="text" name="txtTelefono"class="form-control"><br><br>
                    </div>
                    <div class="form-group" style="margin-bottom: -20px">
                        <strong>Direccion:</strong><br>
                        <input type="text" name="txtDireccion"class="form-control"><br><br>
                    </div>
                    <div class="form-group" style="margin-bottom: -20px">
                        <strong>Genero:</strong><br>
                        <input type="text" name="txtGenero"class="form-control"><br><br>
                    </div>
                    <input type="submit" name="accion" value="Agregar" class="btn btn-warning"><br><br>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>