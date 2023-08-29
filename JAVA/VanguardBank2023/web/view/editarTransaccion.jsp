<%-- 
    Document   : editarTransaccion
    Created on : 21/07/2023, 02:24:29 PM
    Author     : José David Soto
--%>

<%@page import="model.Transaccion"%>
<%@page import="modelDAO.TransaccionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Transaccion</title>
    </head>
    <body>
        <div>
            <div>
                <%
                    TransaccionDAO nuevaTransaccionDAO = new TransaccionDAO();
                    int idTransaccion = Integer.parseInt((String) request.getAttribute("idTr"));
                    Transaccion nuevaTransaccion = (Transaccion) nuevaTransaccionDAO.buscar(idTransaccion);
                %>
                <h1>Editar una transaccion</h1>
                <form action="Controlador">
                    <strong>Tipo de Transaccion</strong>
                    <input type="text" name="txtTipoTransaccion" value="<%=nuevaTransaccion.getTipoTransaccion()%>"><br><br>
                    <strong>Monto de Transaccion</strong>
                    <input type="text" name="txtMontoTransaccion" value="<%=nuevaTransaccion.getMontoTransaccion()%>"><br><br>
                    <strong>Fecha y hora de la transaccion</strong>
                    <input type="datetime-local" name="txtFechaHora" value="<%=nuevaTransaccion.getFechaHora()%>"><br><br>
                    <strong>ID del Empleado</strong>
                    <input type="text" name="txtIdEmpleado" value="<%=nuevaTransaccion.getIdEmpleado()%>"><br><br>
                    <strong>ID de la Cuenta</strong>
                    <input type="text" name="txtIdCuenta" value="<%=nuevaTransaccion.getIdCuenta()%>"><br><br>
                    <input type="hidden" name="txtIdTransaccion" value="<%=nuevaTransaccion.getIdTransaccion()%>"><br>
                    <input type="submit" name="accion" value="ActualizarTransaccion"><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
