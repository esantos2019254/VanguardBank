<%-- 
    Document   : listarProveedor
    Created on : 21/07/2023, 12:37:17 PM
    Author     : diego
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Proveedor"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.ProveedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Proveedor</title>
    </head>
    <body>
        <div>
            <h1>Registro de proveedor</h1>
            <a href="Controlador?accion=addProveedor">Agregar nuevo Proveedor</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>IDPROVEEDOR</th>
                        <th>NOMBRE PROVEEDOR</th>
                        <th>DIRECCION PROVEEDOR</th>
                        <th>CORREO PROVEEDOR</th>
                        <th>TELEFONO PROVEEDOR</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <%
                    ProveedorDAO dao = new ProveedorDAO();
                    List<Proveedor> listaProveedor = dao.listar();
                    Iterator<Proveedor> iterator = listaProveedor.iterator();
                    Proveedor pro = null;
                    while (iterator.hasNext()) {
                        pro = iterator.next();
                %>

                <tbody>
                    <tr>
                        <td><%=pro.getIdProveedor()%></td>
                        <td><%=pro.getNombreProveedor()%></td>
                        <td><%=pro.getDireccionProveedor()%></td>
                        <td><%=pro.getCorreoProveedor()%></td>
                        <td><%=pro.getTelefonoProveedor()%></td>
                        <td>
                            <a href="Controlador?accion=editarProveedor&idProveedor=<%= pro.getIdProveedor() %>">Edit</a>
                            <a href="Controlador?accion=eliminarProveedor&IDPRO=<%= pro.getIdProveedor() %>">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
