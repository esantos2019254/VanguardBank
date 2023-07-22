<%-- 
    Document   : agregarEmpleado
    Created on : 21/07/2023, 07:13:27 PM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Empleado</title>
    </head>
    <body>
        <h1>Llene los espacios con sus datos:</h1>
        <form action="Controlador">
            <label for="nombres">Nombres:</label>
            <input type="text" id="nombres" name="txtNombres"></text><br>
            <label for="apellidos">Apellidos:</label>
            <input type="text" id="apellidos" name="txtApellidos"/><br>
            <label for="fechaDeContratacion">Fecha de contratación:</label>
            <input type="date" id="fechaDeContratacion" name="dFechaContratacion"><br>
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="txtDireccion"><br>
            <label for="numeroContacto">Número de teléfono:</label>
            <input type="text" id="numeroContacto" name="txtNumeroContacto"><br>
            <label for="idTipoEmpleado">Id tipo de Empleado:</label>
            <input type="text" name="txtIdTipoEmpleado" id="idTipoEmpleado"><br>
            <button type="submit" name="accion" value="AgregarEmpleado">Agregar</button>
        </form>
    </body>
</html>
