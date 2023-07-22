<%-- 
    Document   : list
    Created on : 5/07/2023, 09:26:12 AM
    Author     : informatica
--%>

<%@page import="model.HistorialDeTransacciones"%>
<%@page import="modelDAO.HistorialDeTransaccionesDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Depósito</title>
    </head>
    <body>

        <div>
            <h1>Registro de Depósito</h1>
            <a href="Controlador?accion=add">Agregar una nueva Historial de Transaccion</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID DEPOSITO</th>
                        <th>MONTO DEPOSITO</th>
                        <th>FECHA DEPOSITO</th>

                    </tr>
                </thead>
                <%
                    HistorialDeTransaccionesDAO dao = new HistorialDeTransaccionesDAO();
                    List<HistorialDeTransacciones> listaDeposito = dao.listar();
                    Iterator<Deposito> iterator = listaDeposito.iterator();
                    Deposito dep = null;
                    while (iterator.hasNext()) {
                        dep = iterator.next();
                %>
                <tbody>
                    <tr>
                        <td><%= dep.getIdDeposito()%></td>
                        <td><%= dep.getMontoDeposito()%></td>
                        <td><%= dep.getFechaDeposito()%></td>
                        <td><%= dep.getHoraDeposito()%></td>
                        <td><%= dep.getIdCuentaOrigen()%></td>
                        <td><%= dep.getIdCuentaDeposit()%></td>

                        <td>
                            <a href="Controlador?accion=edit&idDeposito=<%= dep.getIdDeposito()%>">Edit</a>
                            <a href="">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>