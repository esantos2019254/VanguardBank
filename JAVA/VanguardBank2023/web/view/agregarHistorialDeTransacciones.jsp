<%-- 
    Document   : add
    Created on : 5/07/2023, 09:19:55 AM
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Historial De Transacciones</title>
    </head>
    <body>
        <h1>Agregar Historial de Transacciones</h1>
        <form action="Controlador">
            <strong>Id Historial de transaccion:</strong>
            <input type="text" name="txtIdHistorialDeTransacciones"><br><br>
            <strong>Id Cuenta:</strong>
            <input type="text" name="txtIdCuenta"><br><br>
            <strong>Id Transaccion:</strong>
            <input type="text" name="txtTransaccion"><br><br>
            <input type="submit" name="accion" value="Agregar">
        </form>
    </body>
</html>