<%-- 
    Document   : listarDepartamento
    Created on : 21/07/2023, 06:14:48 PM
    Author     : mdsuy
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Departamento"%>
<%@page import="modelDAO.DepartamentoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Departamento</title>
    </head>
    <body>
        <div>
            <h1>Registro de Departamento</h1>
            <a href="Controlador?accion=addDepartamento">Agregar nuevo Departamento</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID DEPARTAMENTO</th>
                        <th>NOMBRE DEPARTAMENTO</th>
                        <th>CÓDIGO POSTAL</th>
                        <th>FECHA APERTURA</th>
                    </tr>
                </thead>
                <%
                    DepartamentoDAO dao = new DepartamentoDAO();
                    List<Departamento> listaDepartamento = dao.listar();
                    Iterator<Departamento> iterator = listaDepartamento.iterator();
                    Departamento depa = null;
                    while (iterator.hasNext()) {
                        depa = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%=depa.getIdDepartamento()%></td>
                        <td><%=depa.getNombreDepartamento()%></td>
                        <td><%=depa.getCodigoPostal()%></td>
                        <td><%=depa.getFechaApertura()%></td>
                        <td>
                            <a href="Controlador?accion=editDepartamento&idDepartamento=<%= depa.getIdDepartamento()%>">Edit</a>
                            <a href="Controlador?accion=eliminarDepartamento&idDepartamento=<%= depa.getIdDepartamento()%>">Delete</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
