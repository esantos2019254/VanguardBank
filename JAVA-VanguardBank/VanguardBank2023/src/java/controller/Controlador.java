
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import modelDAO.ClienteDAO;

public class Controlador extends HttpServlet {
    
    String listar = "view/listarCliente.jsp";
    String add = "view/agregarCliente.jsp";
    String edit = "view/editarCliente.jsp";
    Cliente nuevoCliente = new Cliente();
    ClienteDAO nuevoClienteDAO = new ClienteDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String accion = request.getParameter("accion");
        if(accion.equalsIgnoreCase("listar")){
            acceso = listar;
        }else if(accion.equalsIgnoreCase("add")){
            acceso = add;
        }else if(accion.equalsIgnoreCase("Agregar")){
            Long dpi = Long.parseLong(request.getParameter("txtDPI"));
            String nombre = request.getParameter("txtNombre");
            String apellido = request.getParameter("txtApellido");
            String telefono = request.getParameter("txtTelefono");
            String direccion = request.getParameter("txtDireccion");
            String genero = request.getParameter("txtGenero");
            nuevoCliente.setDPI(dpi);
            nuevoCliente.setNombreCliente(nombre);
            nuevoCliente.setApellidoCliente(apellido);
            nuevoCliente.setTelefonoContacto(telefono);
            nuevoCliente.setDireccionCliente(direccion);
            nuevoCliente.setGeneroCliente(genero);
            nuevoClienteDAO.agregar(nuevoCliente);
            acceso = listar;
        }else if(accion.equalsIgnoreCase("editar")){
            request.setAttribute("Dpi", request.getParameter("DPI"));
            acceso = edit;
        }else if(accion.equalsIgnoreCase("Actualizar")){
            nuevoCliente.setNombreCliente(request.getParameter("txtNombre"));
            nuevoCliente.setApellidoCliente(request.getParameter("txtApellido"));
            nuevoCliente.setTelefonoContacto(request.getParameter("txtTelefono"));
            nuevoCliente.setDireccionCliente(request.getParameter("txtDireccion"));
            nuevoCliente.setGeneroCliente(request.getParameter("txtGenero"));
            nuevoCliente.setDPI(Long.parseLong(request.getParameter("txtDPI")));
            nuevoClienteDAO.editar(nuevoCliente);
            acceso = listar;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
