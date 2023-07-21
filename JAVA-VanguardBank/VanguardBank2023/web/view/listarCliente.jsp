<%-- 
    Document   : listarCliente
    Created on : 20/07/2023, 02:23:24 PM
    Author     : titos
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Clientes</title>
    </head>
    <body>
        <div>
            <h1>Registro de clientes</h1>
            <a href="Controlador?accion=add">Agregar nuevo Cliente</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>DPI</th>
                        <th>NOMBRE CLIENTE</th>
                        <th>APELLIDO CLIENTE</th>
                        <th>TELEFONO CONTACTO</th>
                        <th>DIRECCION CLIENTE</th>
                        <th>GENERO CLIENTE</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <%
                    ClienteDAO dao = new ClienteDAO();
                    List<Cliente> listaCliente = dao.listar();
                    Iterator<Cliente> iterator = listaCliente.iterator();
                    Cliente cli = null;
                    while (iterator.hasNext()) {
                        cli = iterator.next();

                %>
                <tbody>
                    <tr>
                        <td><%=cli.getDPI()%></td>
                        <td><%=cli.getNombreCliente()%></td>
                        <td><%=cli.getApellidoCliente()%></td>
                        <td><%=cli.getTelefonoContacto()%></td>
                        <td><%=cli.getDireccionCliente()%></td>
                        <td><%=cli.getGeneroCliente()%></td>
                        <td>
                            <a href="Controlador?accion=editar&DPI=<%= cli.getDPI() %>">Edit</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
