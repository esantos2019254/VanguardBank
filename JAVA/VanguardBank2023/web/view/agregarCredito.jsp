<%-- 
    Document   : agregarCredito
    Created on : 8/08/2023, 08:10:43 PM
    Author     : José David Soto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Credito</title>
    </head>
    <body>
        <h1>Agregar Credito</h1>
        <form action="Controlador">
            <strong>Monto del Credito:</strong><br>
            <input type="text" name="txtMontoCredito"><br><br>
            <strong>Fecha y Hora</strong><br>
            <input type="datetime-local" name="txtFechaHora"><br><br>
            <strong>Interes Creditario</strong><br>
            <input type="text" name="txtInteresCredito"><br><br>
            <strong>Id Cuenta</strong><br>
            <input type="text" name="txtIdCuenta"><br><br>
            <input type="submit" name="accion" value="AgregarCredito"><br><br>
        </form>
    </body>
</html>
