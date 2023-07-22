<%-- 
    Document   : editarDepartamento
    Created on : 21/07/2023, 06:34:08 PM
    Author     : mdsuy
--%>

<%@page import="model.Departamento"%>
<%@page import="modelDAO.DepartamentoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Departamento</title>
    </head>
    <body>
        <div>
            <div>
                <%
                    DepartamentoDAO nuevoDepartamentoDAO = new DepartamentoDAO();
                    int idDepartamento = Integer.parseInt((String)request.getAttribute("idDepa"));
                    Departamento nuevoDepartamento = (Departamento)nuevoDepartamentoDAO.buscar(idDepartamento);
                %>
        <h1>Editar un Departamento</h1>
         <form action="Controlador">
                    <strong>Nombre Departamento:</strong><br>
                    <input type="text" name="txtNombreDepartamento" value="<%=nuevoDepartamento.getNombreDepartamento()%>"><br><br>
                    <strong>Código Postal:</strong><br>
                    <input type="text" name="txtCodigoPostal" value="<%=nuevoDepartamento.getCodigoPostal()%>"><br><br>
                    <strong>Fecha Apertura:</strong><br>
                    <input type="date" name="txtFechaApertura" value="<%=nuevoDepartamento.getFechaApertura()%>"><br><br>
                    <input type="hidden" name="txtIdDepartamento" value="<%=nuevoDepartamento.getIdDepartamento()%>"><br>
                    <input type="submit" name="accion" value="ActualizarDepartamento"><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
