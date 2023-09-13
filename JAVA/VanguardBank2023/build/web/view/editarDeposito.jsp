<%-- 
    Document   : editarDeposito
    Created on : 21/07/2023, 10:00:05 AM
    Author     : titos
--%>

<%@page import="model.Deposito"%>
<%@page import="modelDAO.DepositoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Deposito</title>
    </head>
    <body>
        <div>
            <div>
                <%
                    DepositoDAO nuevoDepositoDAO = new DepositoDAO();
                    int idDeposito = Integer.parseInt((String)request.getAttribute("idDep"));
                    Deposito nuevoDeposito = (Deposito)nuevoDepositoDAO.buscar(idDeposito);
                %>
                <h1>Editar un deposito</h1>
                <form action="Controlador">
                    <strong>Monto Deposito</strong><br>
                    <input type="text" name="txtMontoDeposito" value="<%=nuevoDeposito.getMontoDeposito()%>"><br><br>
                    <strong>fechaDeposito</strong><br>
                    <input type="text" name="txtFechaDeposito" value="<%=nuevoDeposito.getFechaDeposito()%>"><br>
		    <strong>horaDeposito</strong><br>
		    <input type="text" name="txtHoraDeposito" value="<%=nuevoDeposito.getHoraDeposito()%>"><br>
                    <strong>Id Cuenta Origen</strong><br>
		    <input type="text" name="txtIdCuentaOrigen" value="<%=nuevoDeposito.getIdCuentaOrigen()%>"><br>
                    <strong>Id Cuenta Deposito</strong><br>
		    <input type="text" name="txtIdCuentaDeposito" value="<%=nuevoDeposito.getIdCuentaDeposito()%>"><br>
                    <input type="hidden" name="txtIdDeposito" value="<%=nuevoDeposito.getIdDeposito()%>"><br>
                    <input type="submit" name="accion" value="ActualizarDeposito"><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
