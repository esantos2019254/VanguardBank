/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import model.Cuenta;
import model.Deposito;
import modelDAO.ClienteDAO;
import modelDAO.CuentaDAO;
import modelDAO.DepositoDAO;

/**
 *
 * @author okrun
 */
public class ControladorFunc extends HttpServlet {

    Cuenta myCuenta = new Cuenta();
    Cuenta destino = new Cuenta();
    CuentaDAO cdao = new CuentaDAO();
    Cliente cliente = new Cliente();
    ClienteDAO cdao1 = new ClienteDAO();
    Deposito deposito = new Deposito();
    DepositoDAO depositoDAO = new DepositoDAO();
    int id;

    List<Deposito> listaDeposito = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("indexCliente")) {
            request.getRequestDispatcher("indexCliente.jsp").forward(request, response);
        } else if (menu.equals("cuenta")) {
            switch (accion) {
                case "verMiCuenta":
                    id = Integer.parseInt(request.getParameter("idCuenta"));
                    myCuenta = cdao.buscarCuenta(id);
                    cliente = cdao1.buscar(myCuenta.getDPI());
                    request.setAttribute("cliente", cliente);
                    request.setAttribute("cuenta", myCuenta);
                    request.getRequestDispatcher("view/myCuenta.jsp").forward(request, response);
                    break;
                case "TRANSFERIR":
                    double montoDeposito = Double.parseDouble(request.getParameter("txtMontoDeposito"));
                    String fechaDeposito = request.getParameter("txtFechaDeposito");
                    String horaDeposito = request.getParameter("txtHoraDeposito");
                    int idCuentaOrigen = Integer.parseInt(request.getParameter("txtIdCuentaOrigen"));
                    int idCuentaDeposito = Integer.parseInt(request.getParameter("txtIdCuentaDeposito"));

                    System.out.println(idCuentaOrigen);
                    System.out.println(idCuentaDeposito);
                    System.out.println(myCuenta.getDPI());
                    System.out.println(destino.getDPI());
                    myCuenta.setSaldoCuenta(myCuenta.getSaldoCuenta() - montoDeposito);
                    cdao.editarCuenta(myCuenta);

                    destino = cdao.buscarCuenta(idCuentaDeposito);
                    destino.setSaldoCuenta(destino.getSaldoCuenta() + montoDeposito);
                    cdao.editarCuenta(destino);

                    deposito.setMontoDeposito(montoDeposito);
                    deposito.setFechaDeposito(fechaDeposito);
                    deposito.setHoraDeposito(horaDeposito);
                    deposito.setIdCuentaOrigen(idCuentaOrigen);
                    deposito.setIdCuentaDeposito(idCuentaDeposito);
                    depositoDAO.agregar(deposito);

                    myCuenta = cdao.buscarCuenta(idCuentaOrigen);
                    request.setAttribute("cliente", cliente);
                    request.setAttribute("cuenta", myCuenta);
                    break;
                case "verHistorial":
                    listaDeposito = depositoDAO.listarPorCuenta(myCuenta.getIdCuenta());
                    request.setAttribute("listaDepositos", listaDeposito);
                    request.getRequestDispatcher("view/miHistorial.jsp").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("view/myCuenta.jsp").forward(request, response);
        } else if (menu.equals("index")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (menu.equals("indexClienteC")) {
            id = Integer.parseInt(request.getParameter("idCuenta"));
            request.setAttribute("idMyCuenta", id);
            request.getRequestDispatcher("indexCliente.jsp").forward(request, response);
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
