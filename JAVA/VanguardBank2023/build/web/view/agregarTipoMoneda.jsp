<%-- 
    Document   : agregarTipoMoneda
    Created on : 21/07/2023, 08:18:02 AM
    Author     : ESTEBAN-GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Tipo Moneda</title>
    </head>
    <body>
        <h1>Agregar Tipo Moneda</h1>
        <form action="Controlador">
            <strong>simboloMoneda</Strong><br>
            <input type="text" name="txtSimboloMoneda"><br><br>
            <strong>nombreMoneda</strong><br>
            <input type="text" name="txtNombreMoneda"><br><br>
            <strong>conversionDolar</strong><br>
            <input type="text" name="txtConversionDolar"><br><br>
            <input type="submit" name="accion" value="AgregarTipoMoneda">
        </form>
    </body>
</html>
