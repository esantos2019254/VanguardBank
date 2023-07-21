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
        <title>Agregar Cliente</title>
    </head>
    <body>
        <h1>Agregar Cliente</h1>
        <form action="Controlador">
            <strong>DPI:</strong><br>
            <input type="text" name="txtDPI"><br><br>
            <strong>Nombre:</strong><br>
            <input type="text" name="txtNombre"><br><br>
            <strong>Apellido:</strong><br>
            <input type="text" name="txtApellido"><br><br>
            <strong>Telefono:</strong><br>
            <input type="text" name="txtTelefono"><br><br>
            <strong>Direccion:</strong><br>
            <input type="text" name="txtDireccion"><br><br>
            <strong>Genero:</strong><br>
            <input type="text" name="txtGenero"><br><br>
            <input type="submit" name="accion" value="Agregar"><br><br>
        </form>
    </body>
</html>
