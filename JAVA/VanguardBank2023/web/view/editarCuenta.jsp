<%-- 
    Document   : editarCuenta
    Created on : 26/07/2023, 07:57:10 PM
    Author     : bryan
--%>

<%@page import="model.Cuenta"%>
<%@page import="modelDAO.CuentaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Cuenta</title>
    </head>
    <body>
        <h1>Modifique sus datos:</h1>
        <%CuentaDAO cuentaDAO = new CuentaDAO();
          long numeroCuenta = Long.parseLong((String)request.getAttribute("numeroDeCuenta"));
          Cuenta cuentaBuscada = (Cuenta)cuentaDAO.buscarCuenta(numeroCuenta);
        %>
        <form action="Controlador">
            <label for="saldoCuenta">Saldo de Cuenta:</label>
            <input type="text" id="saldoCuenta" name="txtSaldoCuenta" value="<%= cuentaBuscada.getSaldoCuenta() %>"/><br>
            <label for="tipoCuenta">Tipo de Cuenta:</label>
            <input type="text" id="tipoCuenta" name="txtTipoCuenta" value="<%= cuentaBuscada.getTipoCuenta() %>"/><br>
            <label for="fechaApertura">Fecha de apertura:</label>
            <input type="date" id="fechaApertura" name="dFechaApertura" value="<%= cuentaBuscada.getFechaApertura() %>"/><br>
            <label for="DPI">DPI:</label>
            <input type="number" id="DPI" name="txtDPI" value="<%= cuentaBuscada.getDPI() %>"/><br>
            <label for="idEmpleado">Id de empleado:</label>
            <input type="number" id="idEmpleado" name="txtIdEmpleado" value="<%= cuentaBuscada.getIdEmpleado() %>"/><br>
            <label for="idTipMon">Id de Tipo de moneda:</label>
            <input type="number" id="idTipMon" name="txtIdTipMon" value="<%= cuentaBuscada.getIdTipoMoneda() %>"/><br>
            <label for="idSucursal">Id de sucursal:</label>
            <input type="number" id="idSucursal" name="txtIdSucursal" value="<%= cuentaBuscada.getIdSucursal() %>"><br>
            <input type="hidden" name="txtNumeroCuenta" value="<%= cuentaBuscada.getNumeroCuenta()%>"/>
            <input type="hidden" name="txtIdCuenta" value="<%= cuentaBuscada.getIdCuenta() %>">
            <button type="submit" name="accion" value="editarCuenta">Actualizar</button>
        </form>
    </body>
</html>
