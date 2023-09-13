<%-- 
    Document   : listarDeposito
    Created on : 21/07/2023, 09:59:44 AM
    Author     : titos
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Deposito"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.DepositoDAO"%>
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
            <a href="Controlador?accion=addDeposito">Agregar nuevo Depósito</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID DEPOSITO</th>
                        <th>MONTO DEPOSITO</th>
                        <th>FECHA DEPOSITO</th>
                        <th>HORA DEPOSITO</th>
			<th>ID CUENTA ORIGEN</th>
			<th>ID CUENTA DEPOSITO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <%
                    DepositoDAO dao = new DepositoDAO();
                    List <Deposito> listaDeposito= dao.listar();
                    Iterator <Deposito> iterator = listaDeposito.iterator();
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
			<td><%= dep.getIdCuentaDeposito()%></td>
			
                        <td>
                            <a href="Controlador?accion=editDeposito&idDeposito=<%= dep.getIdDeposito()%>">Edit</a>
                            <a href="Controlador?accion=eliminarDeposito&idDeposito=<%= dep.getIdDeposito()%>">Eliminar</a><br>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
