<%-- 
    Document   : listarCuentas
    Created on : 26/07/2023, 04:59:25 PM
    Author     : bryan
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Cuenta"%>
<%@page import="modelDAO.CuentaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Litar Cuentas</title>
    </head>
    <body>
        <h1>Cuentas:</h1>
        <a href="Controlador?accion=addCuenta">Agregar Cuenta</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Id Cuenta</th>
                    <th>Número de Cuenta</th>
                    <th>Saldo de Cuenta</th>
                    <th>Tipo de Cuenta</th>
                    <th>Fecha de apertura</th>
                    <th>DPI</th>
                    <th>Id de Empleado</th>
                    <th>Id Tipo Moneda</th>
                    <th>Id Sucursal</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <%CuentaDAO cuentaDAO = new CuentaDAO();
                    Cuenta cuenta = null;
                    List<Cuenta> lista = cuentaDAO.listarCuentas();
                    Iterator<Cuenta> itera = lista.iterator();
                    while (itera.hasNext()) {
                        cuenta = itera.next();
                %>
            <tbody>
                <tr>
                    <td><%= cuenta.getIdCuenta()%></td>
                    <td><%= cuenta.getNumeroCuenta() %></td>
                    <td><%= cuenta.getSaldoCuenta() %></td>
                    <td><%= cuenta.getTipoCuenta() %></td>
                    <td><%= cuenta.getFechaApertura()%></td>
                    <td><%= cuenta.getDPI() %></td>
                    <td><%= cuenta.getIdEmpleado() %></td>
                    <td><%= cuenta.getIdTipoMoneda() %></td>
                    <td><%= cuenta.getIdSucursal()%></td>
                    <td>
                        <a href="Controlador?accion=editCuenta&numDeCuenta=<%= cuenta.getNumeroCuenta()%>">Edit</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
