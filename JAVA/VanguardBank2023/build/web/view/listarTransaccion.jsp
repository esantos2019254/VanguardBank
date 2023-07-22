<%-- 
    Document   : listarTransaccion
    Created on : 21/07/2023, 02:24:44 PM
    Author     : José David Soto
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.Transaccion"%>
<%@page import="java.util.List"%>
<%@page import="modelDAO.TransaccionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Transacciones</title>
    </head>
    <body>
        <div>
            <h1>Registro de Transacciones</h1>
            <a href="Controlador?accion=addTransaccion">Agregar Nueva Transaccion</a>
            <table border="1">
                <thead>
                    <tr>
                        <th>CODIGO DE TRANSACCION</th>
                        <th>TIPO DE TRANSACCION</th>
                        <th>MONTO DE LA TRANSACCION</th>
                        <th>FECHA Y HORA DE LA TRANSACCION</th>
                        <th>CODIGO DEL EMPLEADO</th>
                        <th>ID DE LA CUENTA</th>
                    </tr>
                </thead>
                <% 
                    TransaccionDAO dao = new TransaccionDAO();
                    List<Transaccion> listaTransaccion = dao.listar();
                    Iterator<Transaccion> iterator = listaTransaccion.iterator();
                    Transaccion trn = null;
                    while (iterator.hasNext()) {
                            trn = iterator.next();%>
                    <tbody>
                        <tr>
                            <td><%=trn.getIdTransaccion()%></td>
                            <td><%=trn.getTipoTransaccion()%></td>
                            <td><%=trn.getMontoTransaccion()%></td>
                            <td><%=trn.getFechaHora()%></td>
                            <td><%=trn.getIdEmpleado()%></td>
                            <td><%=trn.getIdCuenta()%></td>
                            <td>
                                <a href="Controlador?accion=editTransaccion&idTransaccion=<%= trn.getIdTransaccion()%>">Edit</a>
                            </td>
                        </tr>
                    </tbody>        
                            
                            
                            
                        <%}%>
                
                
                
                %>
            </table>
        </div>
    </body>
</html>
