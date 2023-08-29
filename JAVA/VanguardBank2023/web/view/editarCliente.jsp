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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Editar Cliente</title>
    </head>
    <body style="display: flex; justify-content: center; align-items: center">
        <div class="card col-sm-6">
            <div class="card-body">
                <%
                    ClienteDAO nuevoClienteDAO = new ClienteDAO();
                    Long dpi = Long.parseLong((String) request.getAttribute("Dpi"));
                    Cliente nuevoCliente = (Cliente) nuevoClienteDAO.buscar(dpi);
                %>
                <form action="Controlador">
                    <div class="form-group" style="margin-bottom: -20px">
                        <strong>Nombre:</strong><br>
                        <input type="text" name="txtNombre" value="<%=nuevoCliente.getNombreCliente()%>" class="form-control"><br><br>
                    </div>
                    <div class="form-group" style="margin-bottom: -20px">
                        <strong>Apellido:</strong><br>
                        <input type="text" name="txtApellido" value="<%=nuevoCliente.getApellidoCliente()%>" class="form-control"><br><br>
                    </div>
                    <div class="form-group" style="margin-bottom: -20px">
                        <strong>Telefono:</strong><br>
                        <input type="text" name="txtTelefono" value="<%=nuevoCliente.getTelefonoContacto()%>" class="form-control"><br><br>
                    </div>
                    <div class="form-group" style="margin-bottom: -20px">
                        <strong>Direccion:</strong><br>
                        <input type="text" name="txtDireccion" value="<%=nuevoCliente.getDireccionCliente()%>" class="form-control"><br><br>
                    </div>
                    <div class="form-group" style="margin-bottom: -20px">
                        <strong>Genero:</strong><br>
                        <input type="text" name="txtGenero" value="<%=nuevoCliente.getGeneroCliente()%>" class="form-control"><br>
                    </div>
                    <input type="hidden" name="txtDPI" value="<%=nuevoCliente.getDPI()%>"><br>
                    <input type="submit" name="accion" value="Actualizar" class="btn btn-warning"><br><br>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>