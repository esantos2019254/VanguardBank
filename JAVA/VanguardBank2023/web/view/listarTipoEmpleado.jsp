<%-- 
    Document   : listarTipoEmpleado
    Created on : 21/07/2023, 10:23:00 AM
    Author     : Junior Sanchez
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.TipoEmpleado"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.TipoEmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Tipo Empleado</title>
    </head>
    <body>
        <div>
            <h1>Registro de Tipo Empleados</h1>
            <a href="Controlador?accion=addTipoEmpleado">Agregar nuevo tipo empleado</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID TIPO EMPLEADO</th>
                        <th>NOMBRE TIPO Puesto</th>
                        <th>SALARIO</th>
                        <th>CONTRATO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <%
                    TipoEmpleadoDAO dao = new TipoEmpleadoDAO();
                    List<TipoEmpleado> listaTipoEmnpleado = dao.listar();
                    Iterator<TipoEmpleado> iterator = listaTipoEmnpleado.iterator();
                    TipoEmpleado TipEm = null;
                    while (iterator.hasNext()) {
                        TipEm = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%=TipEm.getIdTipoEmpleado()%></td>
                        <td><%=TipEm.getNombreTipoPuesto()%></td>
                        <td><%=TipEm.getSalarioTipoEmpleado()%></td>
                        <td><%=TipEm.getContratoTipoEmpleado()%></td>
                        <td>
                            <a href="Controlador?accion=editarTipoEmpleado&idTipoEmpleado=<%= TipEm.getIdTipoEmpleado()%>">Edit</a>
                            <a href="Controlador?accion=eliminarTipoEmpleado&IDTIPO=<%= TipEm.getIdTipoEmpleado()%>">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>

