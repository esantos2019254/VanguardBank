<%-- 
    Document   : listarEmpleado
    Created on : 21/07/2023, 07:13:58 PM
    Author     : bryan
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Empleado"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Empleados</title>
    </head>
    <body>
        <h1>Empleados</h1>
        <a href="Controlador?accion=addEmpleado">Agregar Empleado</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Id Empleado</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Fecha de contratación</th>
                    <th>Dirección</th>
                    <th>Número de teléfono</th>
                    <th>Id de Tipo Empleado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <%EmpleadoDAO empleadoDao = new EmpleadoDAO();
              List <Empleado> listaEmpleado = empleadoDao.listarEmpleados();
              Iterator <Empleado> itera = listaEmpleado.iterator();
              Empleado empleado = null;
              while (itera.hasNext()) {
                  empleado = itera.next();
            %>
            <tbody>
                <tr>
                    <td><%= empleado.getIdEmpleado()%></td>
                    <td><%= empleado.getNombreEmpleado()%></td>
                    <td><%= empleado.getApellidoEmpleado()%></td>
                    <td><%= empleado.getFechaContratacion()%></td>
                    <td><%= empleado.getDireccionEmpleado()%></td>
                    <td><%= empleado.getNumeroContactoEmpleado()%></td>
                    <td><%= empleado.getIdTipoEmpleado()%></td>
                    <td>
                        <a href="Controlador?accion=editEmpleado&idEmpleado=<%= empleado.getIdEmpleado()%>">Editar</a><br>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
            <footer>
                <a href="index.jsp">Ir a menu principal</a>
            </footer>
    </body>
    </body>
</html>
