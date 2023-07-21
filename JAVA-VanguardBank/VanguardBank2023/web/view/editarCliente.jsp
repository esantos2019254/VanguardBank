<%-- 
    Document   : editarCliente
    Created on : 20/07/2023, 02:23:34 PM
    Author     : titos
--%>

<%@page import="model.Cliente"%>
<%@page import="modelDAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Cliente</title>
    </head>
    <body>
        <div>
            <div>
                <%
                    ClienteDAO nuevoClienteDAO = new ClienteDAO();
                    Long dpi = Long.parseLong((String)request.getAttribute("Dpi"));
                    Cliente nuevoCliente = (Cliente)nuevoClienteDAO.buscar(dpi);
                %>
                <h1>Editar un cliente</h1>
                <form action="Controlador">
                    <strong>Nombre:</strong><br>
                    <input type="text" name="txtNombre" value="<%=nuevoCliente.getNombreCliente()%>"><br><br>
                    <strong>Apellido:</strong><br>
                    <input type="text" name="txtApellido" value="<%=nuevoCliente.getApellidoCliente()%>"><br><br>
                    <strong>Telefono:</strong><br>
                    <input type="text" name="txtTelefono" value="<%=nuevoCliente.getTelefonoContacto()%>"><br><br>
                    <strong>Direccion:</strong><br>
                    <input type="text" name="txtDireccion" value="<%=nuevoCliente.getDireccionCliente()%>"><br><br>
                    <strong>Genero:</strong><br>
                    <input type="text" name="txtGenero" value="<%=nuevoCliente.getGeneroCliente()%>"><br>
                    <input type="hidden" name="txtDPI" value="<%=nuevoCliente.getDPI()%>"><br>
                    <input type="submit" name="accion" value="Actualizar"><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
