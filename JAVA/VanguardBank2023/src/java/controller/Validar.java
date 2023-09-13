/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Empleado;
import model.Login;
import modelDAO.LoginDAO;

/**
 *
 * @author Uriel Sanchez
 */
public class Validar extends HttpServlet {

    LoginDAO loginDAO = new LoginDAO();
    Login login = new Login();
    Empleado empleado = new Empleado();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Validar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Validar at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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

        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("Ingresar")) {
            String user = request.getParameter("txtUser");
            String pass = request.getParameter("txtPass");

            login = loginDAO.validar(user, pass);
            empleado = loginDAO.validarEmpleado(user, pass);
            System.out.println(empleado.getNombreEmpleado());
            if (login.getNombreUsuario() != null) {
                request.setAttribute("idMyCuenta", login.getIdCuenta());
                request.setAttribute("nombreUsuario", login);

                request.getRequestDispatcher("ControladorFunc?menu=indexCliente").forward(request, response);
            } else if (empleado.getNombreEmpleado() != null) {
                request.setAttribute("nombreUsuario", login);
                request.getRequestDispatcher("ControladorFunc?menu=index").forward(request, response);
            } else {
                request.getRequestDispatcher("indexLogin.jsp").forward(request, response);
            }
        } else if (accion.equals("Agregar")) {
            Login newlogin = new Login();
            String horaSesion = LocalDateTime.now().toString();
            newlogin.setNombreUsuario(request.getParameter("txtUser"));
            newlogin.setPasswordUsuario(request.getParameter("txtPass"));
            newlogin.setHoraSesion(horaSesion);
            newlogin.setIdCuenta(Integer.parseInt(request.getParameter("txtIdCuenta")));
            loginDAO.agregar(newlogin);
            request.getRequestDispatcher("indexLogin.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("indexLogin.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
