<%-- 
    Document   : editarEmpleado
    Created on : 21/07/2023, 07:13:41 PM
    Author     : bryan
--%>

<%@page import="model.Empleado"%>
<%@page import="modelDAO.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Empleado</title>
    </head>
    <body>
        <%EmpleadoDAO empleadoDAO = new EmpleadoDAO();
          int idEmpleado = Integer.parseInt((String)request.getAttribute("idDeEmpleado"));
          Empleado empleadoBuscado = (Empleado) empleadoDAO.buscarEmpleado(idEmpleado);
        %>
        <h1>Hello World!</h1>
        <form action="Controlador">
            <label for="nombres">Nombres:</label>
            <input type="text" id="nombres" name="txtNombres" value="<%= empleadoBuscado.getNombreEmpleado()%>"><br>
            <label for="apellidos">Apellidos:</label>
            <input type="text" id="apellidos" name="txtApellidos" value="<%= empleadoBuscado.getApellidoEmpleado()%>"/><br>
            <label for="fechaDeContratacion">Fecha de contratación:</label>
            <input type="date" id="fechaDeContratacion" name="dFechaContratacion" value="<%= empleadoBuscado.getFechaContratacion()%>"><br>
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="txtDireccion" value="<%= empleadoBuscado.getDireccionEmpleado()%>"><br>
            <label for="numeroContacto">Número de teléfono:</label>
            <input type="text" id="numeroContacto" name="txtNumeroContacto" value="<%= empleadoBuscado.getNumeroContactoEmpleado()%>"><br>
            <label for="idTipoEmpleado">Id tipo de Empleado:</label>
            <input type="text" id="idTipoEmpleado" name="txtIdTipoEmpleado" value="<%= empleadoBuscado.getIdTipoEmpleado()%>"><br>
            <input type="hidden" name="txtIdEmpleado" value="<%= empleadoBuscado.getIdEmpleado()%>">
            <button type="submit" name="accion" value="ModificarEmpleado">Actualizar</button>
        </form>
    </body>
</html>
