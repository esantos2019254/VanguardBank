package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import model.Deposito;
import modelDAO.ClienteDAO;
import modelDAO.DepositoDAO;

public class Controlador extends HttpServlet {
   String listar = "view/listarCliente.jsp";
    String add = "view/agregarCliente.jsp";
    String edit = "view/editarCliente.jsp";
    Cliente nuevoCliente = new Cliente();
    ClienteDAO nuevoClienteDAO = new ClienteDAO();
    
    String listarDeposito = "view/listarDeposito.jsp";
    String addDeposito = "view/agregarDeposito.jsp";
    String editDeposito = "view/editarDeposito.jsp";
    Deposito nuevoDeposito = new Deposito();
    DepositoDAO nuevoDepositoDAO = new DepositoDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("index")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
            
        }else if(accion.equalsIgnoreCase("listarDeposito")){
            acceso = listarDeposito;
        }else if(accion.equalsIgnoreCase("addDeposito")){
            acceso = addDeposito;
        }else if(accion.equalsIgnoreCase("AgregarDeposito")){
            double montoDeposito = Double.parseDouble(request.getParameter("txtMontoDeposito"));
	    String fechaDeposito = request.getParameter("txtFechaDeposito"); 
	    String horaDeposito = request.getParameter("txtHoraDeposito"); 
	    int idCuentaOrigen = Integer.parseInt(request.getParameter("txtIdCuentaOrigen")); 
	    int idCuentaDeposito = Integer.parseInt(request.getParameter("txtIdCuentaDeposito"));
            nuevoDeposito.setMontoDeposito(montoDeposito);
            nuevoDeposito.setFechaDeposito(fechaDeposito);
	    nuevoDeposito.setHoraDeposito(horaDeposito); 
	    nuevoDeposito.setIdCuentaOrigen(idCuentaOrigen); 
	    nuevoDeposito.setIdCuentaDeposito(idCuentaDeposito); 
            nuevoDepositoDAO.agregar(nuevoDeposito);
            acceso = listarDeposito;
        }else if(accion.equalsIgnoreCase("editDeposito")){
            request.setAttribute("idDep", request.getParameter("idDeposito"));
            acceso = editDeposito;
        }else if(accion.equalsIgnoreCase("ActualizarDeposito")){
            nuevoDeposito.setIdDeposito(Integer.parseInt(request.getParameter("txtIdDeposito")));
	    nuevoDeposito.setMontoDeposito(Double.parseDouble(request.getParameter("txtMontoDeposito"))); 
            nuevoDeposito.setFechaDeposito(request.getParameter("txtFechaDeposito"));
	    nuevoDeposito.setHoraDeposito(request.getParameter("txtHoraDeposito"));
	    nuevoDeposito.setIdCuentaOrigen(Integer.parseInt(request.getParameter("txtIdCuentaOrigen")));
	    nuevoDeposito.setIdCuentaDeposito(Integer.parseInt(request.getParameter("txtIdCuentaDeposito")));
            nuevoDepositoDAO.editar(nuevoDeposito);
            acceso = listarDeposito;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }
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
