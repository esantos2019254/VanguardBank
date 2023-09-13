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
        <title>Editar Historial de transacciones</title>
    </head>
    <body>
        <div>
            <div>
                <%
                    HistorialDeTransaccionesDAO nuevoHistorialDAO = new HistorialDeTransaccionesDAO();
                    int idHistorialTransaccion = Integer.parseInt((String)request.getAttribute("idHistorial"));
                    HistorialDeTransacciones nuevoHistorial = (HistorialDeTransacciones)nuevoHistorialDAO.buscar(idHistorialTransaccion);
                %>
                <h1>Editar un historial de transacciones</h1>
                <form action="Controlador">
                    <strong>ID Cuenta</strong><br>
                    <input type="text" name="txtIdCuenta" value="<%=nuevoHistorial.getIdCuenta()%>"><br><br>
                    <strong>ID Transacción</strong><br>
                    <input type="text" name="txtIdTransaccion" value="<%=nuevoHistorial.getIdTransaccion()%>"><br>
                    <input type="hidden" name="txtIdHistorialTransacion" value="<%=nuevoHistorial.getIdHistorialTransaccion()%>"><br>
                    <input type="submit" name="accion" value="ActualizarHistorial"><br><br>
                </form>
            </div>
        </div>
    </body>
</html>