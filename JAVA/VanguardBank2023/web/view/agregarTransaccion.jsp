<%-- 
    Document   : agregarTransaccion
    Created on : 21/07/2023, 02:24:10 PM
    Author     : José David Soto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Transaccion</title>
    </head>
    <body>
        <h1>Agregar Transaccion</h1>
        <form action="Controlador">
            <strong>Tipo de transaccion:</strong><br>
            <input type="text" name="txtTipoTransaccion"><br><br>
            <strong>Monto</strong><br>
            <input type="text" name="txtMontoTransaccion"><br><br>
            <strong>Fecha y Hora de Transaccion</strong><br>
            <input type="datetime-local" name="txtFechaHora" style="font-family: Bodoni MT"><br><br>
            <strong>Codigo del Empleado</strong><br>
            <input type="text" name="txtIdEmpleado"><br><br>
            <strong>Codigo de la Cuenta</strong><br>
            <input type="text" name="txtIdCuenta"><br><br>
            <input type="submit" name="accion" value="Agregar"><br><br>
        </form>
    </body>
</html>
