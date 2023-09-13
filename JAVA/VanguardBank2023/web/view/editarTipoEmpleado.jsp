<%-- 
    Document   : editarTipoEmpleado
    Created on : 21/07/2023, 10:22:24 AM
    Author     : Junior Sanchez
--%>

<%@page import="model.TipoEmpleado"%>
<%@page import="modelDAO.TipoEmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Tipo Empleado</title>
    </head>
    <body>
         <div>
            <div>
                <%
                    TipoEmpleadoDAO nuevoTipoEmpleadoDAO = new TipoEmpleadoDAO();
                    int idTipoEmpleado = Integer.parseInt((String)request.getAttribute("Id"));
                    TipoEmpleado nuevoTipoEmpleado = (TipoEmpleado)nuevoTipoEmpleadoDAO.buscar(idTipoEmpleado);
                %>
                <h1>Editar Un Tipo Empleado</h1>
                <form action="Controlador">
                    <strong>Puesto</strong><br>
                    <input type="text" name="txtPuesto" value="<%=nuevoTipoEmpleado.getNombreTipoPuesto()%>"><br><br>
                    <strong>Salario</strong><br>
                    <input type="text" name="txtSalario" value="<%=nuevoTipoEmpleado.getSalarioTipoEmpleado()%>"><br><br>
                    <strong>Contrato</strong><br>
                    <input type="text" name="txtContrato" value="<%=nuevoTipoEmpleado.getContratoTipoEmpleado()%>"><br><br>
                    <input type="hidden" name="txtID" value="<%=nuevoTipoEmpleado.getIdTipoEmpleado()%>"><br>
                    <input type="submit" name="accion" value="ActualizarTipoEmpleado"><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
