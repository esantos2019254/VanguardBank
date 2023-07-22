<%-- 
    Document   : agregarProveedor
    Created on : 21/07/2023, 12:28:43 PM
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Proveedor</title>
    </head>
    <body>
        <h1>Agregar Proveedor</h1>
        <form action="Controlador">
            <strong>Nombre:</strong><br>
            <input type="text" name="txtNombre"><br><br>
            <strong>Direccion:</strong><br>
            <input type="text" name="txtDireccion"><br><br>
            <strong>Correo:</strong><br>
            <input type="text" name="txtCorreo"><br><br>
            <strong>Telefono:</strong><br>
            <input type="text" name="txtTelefono"><br><br>
            <input type="submit" name="accion" value="AgregarProveedor"><br><br>
        </form>
    </body>
</html>
