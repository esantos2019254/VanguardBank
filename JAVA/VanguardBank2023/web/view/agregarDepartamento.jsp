<%-- 
    Document   : agregarDepartamento
    Created on : 21/07/2023, 06:00:20 PM
    Author     : mdsuy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Departamento</title>
    </head>
    <body>
        <h1>Agregar Departamento</h1>
        <form action="Controlador">
            <strong>Nombre Departamento:</strong><br>
            <input type="text" name="txtNombreDepartamento"><br><br>
            <strong>Código Postal:</strong><br>
            <input type="text" name="txtCodigoPostal"><br><br>
            <strong>Fecha Apertura:</strong><br>
            <input type="date" name="txtFechaApertura"><br><br>
            <input type="submit" name="accion" value="AgregarDepartamento"><br><br>
        </form>
    </body>
</html>
