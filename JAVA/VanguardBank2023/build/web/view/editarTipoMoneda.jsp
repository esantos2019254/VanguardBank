<%-- 

--%>

<%@page import="model.TipoMoneda"%>
<%@page import="modelDAO.TipoMonedaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Tipo Empleado</title>
    </head>
    <body>
         <div>
            <div>
                <%
                    TipoMonedaDAO nuevoTipoMonedaDAO = new TipoMonedaDAO();
                    int idTipoMoneda = Integer.parseInt((String)request.getAttribute("IdM"));
                    TipoMoneda nuevoTipoMoneda = (TipoMoneda)nuevoTipoMonedaDAO.buscar(idTipoMoneda);
                %>
                <h1>Editar Un Tipo Empleado</h1>
                <form action="Controlador">
                    <strong>simboloMoneda</strong><br>
                    <input type="text" name="txtSimboloMoneda" value="<%=nuevoTipoMoneda.getSimboloMoneda()%>"><br><br>
                    <strong>nombreMoneda</strong><br>
                    <input type="text" name="txtNombreMoneda" value="<%=nuevoTipoMoneda.getNombreMoneda()%>"><br><br>
                    <strong>conversionDolar</strong><br>
                    <input type="text" name="txtConversionDolar" value="<%=nuevoTipoMoneda.getConversionDolar()%>"><br><br>
                    <input type="hidden" name="txtIdTipoMoneda" value="<%=nuevoTipoMoneda.getIdTipoMoneda()%>"><br>
                    <input type="submit" name="accion" value="ActualizarTipoMoneda"><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
