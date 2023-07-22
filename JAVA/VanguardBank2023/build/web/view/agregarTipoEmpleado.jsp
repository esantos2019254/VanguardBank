<%-- 
    Document   : agregarTipoEmpleado
    Created on : 21/07/2023, 10:15:57 AM
    Author     : Junior Sanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Tipo Empleado</title>
    </head>
    <body>
        <h1>Agregar Tipo Empleado</h1>
        <form action="Controlador">
            <strong>Puesto</strong><br>
            <input type="text" name="txtPuesto"><br><br>
            <strong>Salario</strong><br>
            <input type="text" name="txtSalario"><br><br>
            <strong>Contrato</strong><br>
            <input type="text" name="txtContrato"><br><br>
            <input type="submit" name="accion" value="AgregarTipoEmpleado"><br><br>
        </form>
    </body>
</html>
