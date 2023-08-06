<%-- 
    Document   : listarTipoMoneda
    Created on : 21/07/2023, 10:58:38 AM
    Author     : ESTEBAN-GOMEZ
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.TipoMoneda"%>
<%@page import="modelDAO.TipoMonedaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipos de Monedas</title>
    </head>
    <body>
        <div>
            <h1>Tipos de Monedas</h1>
            <a href="Controlador?accion=addTipoMoneda">Agregar Nuevo Tipo de Moneda</a><br><br>
            <table border="1">
                <thead>
                    <tr>
                        <th>Id Tipo Moneda</th>
                        <th>Simbolo de la Moneda</th>
                        <th>Moneda</th>
                        <th>Conversion a Dolar</th>
                    </tr>
                </thead>
                <%
                    TipoMonedaDAO tipoMonedaDAO = new TipoMonedaDAO();
                    List<TipoMoneda> listaTipoMoneda = tipoMonedaDAO.listar();
                    Iterator<TipoMoneda> iterator = listaTipoMoneda.iterator();
                    TipoMoneda tipo = null;
                     while (iterator.hasNext()) {
                        tipo = iterator.next();
                %>
                <tbody>
                    <tr>
                        <td><%= tipo.getIdTipoMoneda()%></td>
                        <td><%= tipo.getSimboloMoneda()%></td>
                        <td><%= tipo.getNombreMoneda()%></td>
                        <td><%= tipo.getConversionDolar()%></td>
                        <td>
                            <a href="Controlador?accion=editarTipoMoneda&idTipoMoneda=<%=tipo.getIdTipoMoneda()%>">Edit</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
