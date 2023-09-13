<%-- 
    Document   : agregarCuenta
    Created on : 26/07/2023, 06:28:05 PM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Cuenta</title>
    </head>
    <body>
        <h1>Llene con sus datos:</h1>
        <form action="Controlador">
            <label for="numeroCuenta">Número de Cuenta:</label>
            <input type="text" id="numeroCuenta" name="txtNumeroCuenta"/><br>
            <label for="saldoCuenta">Saldo de Cuenta:</label>
            <input type="text" id="saldoCuenta" name="txtSaldoCuenta"/><br>
            <label for="tipoCuenta">Tipo de Cuenta:</label>
            <input type="text" id="tipoCuenta" name="txtTipoCuenta"/><br>
            <label for="fechaApertura">Fecha de apertura:</label>
            <input type="date" id="fechaApertura" name="dFechaApertura"/><br>
            <label for="DPI">DPI:</label>
            <input type="number" id="DPI" name="txtDPI"/><br>
            <label for="idEmpleado">Id de empleado:</label>
            <input type="number" id="idEmpleado" name="txtIdEmpleado"/><br>
            <label for="idTipMon">Id de Tipo de moneda:</label>
            <input type="number" id="idTipMon" name="txtIdTipMon"/><br>
            <label for="idSucursal">Id de sucursal:</label>
            <input type="number" id="idSucursal" name="txtIdSucursal"><br>
            <button type="submit" name="accion" value="agregarCuenta">Agregar</button>
        </form>
    </body>
</html>
