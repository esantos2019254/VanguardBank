<%-- 
    Document   : editarCredito
    Created on : 8/08/2023, 08:11:34 PM
    Author     : José David Soto
--%>

<%@page import="model.Credito"%>
<%@page import="modelDAO.CreditoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Credito</title>
    </head>
    <body>
        <div>
            <div>
                <%
                    CreditoDAO nuevoCreditoDAO = new CreditoDAO();
                    int idCredito = Integer.parseInt((String) request.getAttribute("idCr"));
                    Credito nuevoCredito = (Credito) nuevoCreditoDAO.buscar(idCredito);
                %>
                <h1>Editar Credito</h1>
                <form action="Controlador">
                    <strong>Monto del Credito</strong>
                    <input type="text" name="txtMontoCredito" value="<%=nuevoCredito.getMontoCredito()%>"><br><br>
                    <strong>Fecha y Hora</strong>
                    <input type="datetime-local" name="txtFechaHora" value="<%=nuevoCredito.getFechaHora()%>"><br><br>
                    <strong>Interes Creditario</strong>
                    <input type="text" name="txtInteresCredito" value="<%=nuevoCredito.getInteresCredito()%>"><br><br>
                    <strong>ID de la Cuenta </strong>
                    <input type="text" name="txtIdCuenta" value="<%=nuevoCredito.getIdCuenta()%>"><br><br>
                    <input type="hidden" name="txtIdCredito" value="<%=nuevoCredito.getIdCredito()%>"><br>
                    <input type="submit" name="accion" value="ActualizarCredito"><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
