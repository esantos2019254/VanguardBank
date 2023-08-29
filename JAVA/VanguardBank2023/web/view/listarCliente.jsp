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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Listar Clientes</title>
    </head>
    <body>
        <div class="col-sm-12">
            <a class="btn btn-info" style="padding: 10px; margin: 2px" href="Controlador?accion=add">Agregar nuevo Cliente</a>
            <table class="table table-hover" border="2">
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
                            <a href="Controlador?accion=editar&DPI=<%= cli.getDPI()%>">Edit</a>
                            <a href="Controlador?accion=eliminar&DPI=<%= cli.getDPI()%>">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
