<%-- 
    Document   : agregarDeposito
    Created on : 21/07/2023, 09:59:24 AM
    Author     : titos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Depósito</title>
    </head>
    <body>
        <h1>Agregar Depósito</h1>
        <form action="Controlador">
            <strong>montoDeposito:</strong>
            <input type="text" name="txtMontoDeposito"><br><br>
            <strong>fechaDeposito:</strong>
            <input type="text" name="txtFechaDeposito"><br><br>
	    <strong>horaDeposito:</strong>
	    <input type="text" name="txtHoraDeposito"><br><br>
	    <strong>idCuentaOrigen:</strong>
	    <input type="text" name="txtIdCuentaOrigen"><br><br>
	    <strong>idCuentaDeposito:</strong>
	    <input type="text" name="txtIdCuentaDeposito"><br><br>
            <input type="submit" name="accion" value="AgregarDeposito">
        </form>
    </body>
</html>
