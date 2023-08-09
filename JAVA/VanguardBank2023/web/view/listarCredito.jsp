<%-- 
    Document   : listarCredito
    Created on : 8/08/2023, 08:13:41 PM
    Author     : José David Soto
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Credito"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.CreditoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Credito</title>
    </head>
    <body>
        <div>
            <h1>Registro de Creditos</h1>
            <a href="Controlador?accion=addCredito">Agregar Nuevo Credito</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>CODIGO DEL CRÉDITO</th>
                        <th>MONTO DEL CRÉDITO</th>
                        <th>FECHA Y HORA</th>
                        <th>INTERES CREDITARIO</th>
                        <th>CODIGO DE LA CUENTA</th>
                    </tr>
                </thead>
                <%
                    CreditoDAO dao = new CreditoDAO();
                    List<Credito> listaCredito = dao.listar();
                    Iterator<Credito> iterator = listaCredito.iterator();
                    Credito cre = null;
                    while (iterator.hasNext()) {
                        cre = iterator.next();%>
                <tbody>
                    <tr>
                        <td><%=cre.getIdCredito()%></td>
                        <td><%=cre.getMontoCredito()%></td>
                        <td><%=cre.getFechaHora()%></td>
                        <td><%=cre.getInteresCredito()%></td>
                        <td><%=cre.getIdCuenta()%></td>
                        <td>
                            <a href="Controlador?accion=editarCredito&idCredito=<%= cre.getIdCredito()%>">Edit</a>
                        </td>
                    </tr>
                </tbody>

                <%}%>


            </table>    
        </div>
    </body>
</html>
