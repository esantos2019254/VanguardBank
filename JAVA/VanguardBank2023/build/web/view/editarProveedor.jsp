<%-- 
    Document   : editarProveedor
    Created on : 21/07/2023, 12:33:36 PM
    Author     : diego
--%>

<%@page import="model.Proveedor"%>
<%@page import="modelDAO.ProveedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Proveedor</title>
    </head>
    <body>
        <div>
            <div>
                <%
                    ProveedorDAO nuevoProveedorDAO = new ProveedorDAO();
                    int idProveedor = Integer.parseInt((String) request.getAttribute("idProv"));
                    Proveedor nuevoProveedor = (Proveedor) nuevoProveedorDAO.buscar(idProveedor);
                %>
                <h1>Editar Proveedor</h1>
                <form action="Controlador">
                    <strong>Nombre:</strong><br>
                    <input type="text" name="txtNombre" value="<%=nuevoProveedor.getNombreProveedor()%>"><br><br>
                    <strong>Direccion:</strong><br>
                    <input type="text" name="txtDireccion" value="<%=nuevoProveedor.getDireccionProveedor()%>"><br><br>
                    <strong>Correo:</strong><br>
                    <input type="text" name="txtCorreo" value="<%=nuevoProveedor.getCorreoProveedor()%>"><br><br>
                    <strong>Telefono:</strong><br>
                    <input type="text" name="txtTelefono" value="<%=nuevoProveedor.getTelefonoProveedor()%>"><br><br>
                    <input type="hidden" name="txtIdProveedor" value="<%=nuevoProveedor.getIdProveedor()%>"><br>
                    <input type="submit" name="accion" value="ActualizarProveedor"><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
