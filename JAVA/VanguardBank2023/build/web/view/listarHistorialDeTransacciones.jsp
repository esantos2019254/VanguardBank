<%-- 
    Document   : list
    Created on : 5/07/2023, 09:26:12 AM
    Author     : informatica clone
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
        <title>Listar Historial de Transacciones</title>
    </head>
    <body>
        <div>
            <h1>Registro de historial de transacciones</h1>
            <a href="Controlador?accion=addHistorial">Agregar nuevo Depósito</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID DE HISTORIAL DE TRANSACCIONES</th>
                        <th>ID DE CUENTA</th>
                        <th>ID DE TRANSACCION</th>
                    </tr>
                </thead>
                <%
                    HistorialDeTransaccionesDAO dao = new HistorialDeTransaccionesDAO();
                    List<HistorialDeTransacciones> listaHistorialDeTransacciones = dao.listar();
                    Iterator<HistorialDeTransacciones> iterator = listaHistorialDeTransacciones.iterator();
                    HistorialDeTransacciones dep = null;
                    while (iterator.hasNext()) {
                        dep = iterator.next();
                %>
                <tbody>
                    <tr>
                        <td><%=dep.getIdHistorialTransaccion()%></td>
                        <td><%=dep.getIdCuenta()%></td>
                        <td><%=dep.getIdTransaccion()%></td>
                        <td>
                            <a href="Controlador?accion=editarHistorial&idHistorialTransaccion=<%=dep.getIdHistorialTransaccion()%>">Edit</a>
                            <a href="Controlador?accion=eliminarHistorial&idHistorialTransaccion=<%=dep.getIdHistorialTransaccion()%>">Eliminar</a>

                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>