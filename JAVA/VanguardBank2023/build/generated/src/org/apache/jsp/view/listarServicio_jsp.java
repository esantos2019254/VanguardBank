package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Iterator;
import model.Servicio;
import java.util.List;
import modelDAO.ServicioDAO;

public final class listarServicio_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"resources/style.css\">\n");
      out.write("        <title>SERVICIOS</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar sticky-top navbar-expand-lg navbar-dark\" style=\"background-color: rgb(20, 25, 45) !important\">\n");
      out.write("            <div class=\"container-sm text-center\">\n");
      out.write("                <a class=\"navbar-brand\" href=\"Controlador?accion=index\">\n");
      out.write("                    <i class=\"bi bi-youtube\"></i>\n");
      out.write("                </a>\n");
      out.write("                <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNavDarkDropdown\" aria-controls=\"navbarNavDarkDropdown\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                    <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                </button>\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbarNavDarkDropdown\">\n");
      out.write("                    <ul class=\"navbar-nav \">\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <button class=\"btn btn-primary dropdown-toggle\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n");
      out.write("                                ENTIDADES\n");
      out.write("                            </button>\n");
      out.write("                            <ul class=\"dropdown-menu dropdown-menu-primary\">\n");
      out.write("                                <li>\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listar\">Clientes</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li >\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarDeposito\" >Deposito</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li >\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarProveedor\">Proveedor</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarTipoEmpleado\" >TipoEmpleado</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li >\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarTransaccion\">Transacciones</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li >\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarDepartamento\" >Departamentos</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li >\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarEmpleado\">Empleado</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li >\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarTipoMoneda\" >TipoMoneda</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarHistorial\" >HistorialDeTransacciones</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarCuenta\" >Cuenta</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarCredito\" >Crédito</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarSucursal\" >Sucursal</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=listarServicio\">Servicio</a>\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <a class=\"dropdown-item\" style=\"margin-left: 10px; border: none\" href=\"Controlador?accion=carritoServicio\" >Carrito Servicio</a>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                <img src=\"img/LogoVB.png\" width=\"50px\" height=\"50px\">\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"container-fluid mt-4\">\n");
      out.write("            <h1 class=\"container text-center\">REGISTRO DE SERVICIOS</h1>\n");
      out.write("            <a class=\"btn btn-primary mb-4\" href=\"Controlador?accion=agregarServicio\">AGREGAR SERVICIO</a>\n");
      out.write("            <table border=\"1\" class=\"table table-striped-columns table-bordered\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th scope=\"row\">ID SERVICIO</th>\n");
      out.write("                        <th scope=\"row\">TIPO SERVICIO</th>\n");
      out.write("                        <th scope=\"row\">CORRELATIVO</th>\n");
      out.write("                        <th scope=\"row\">MONTO</th>\n");
      out.write("                        <th scope=\"row\">ID CUENTA</th>\n");
      out.write("                        <th scope=\"row\">ACCIONES</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                ");

                    ServicioDAO dao = new ServicioDAO();
                    List<Servicio> listaServicio = dao.listar();
                    Iterator<Servicio> iterator = listaServicio.iterator();
                    Servicio ser = null;
                    while (iterator.hasNext()) {
                        ser = iterator.next();
                
      out.write("\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print(ser.getIdServicio());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(ser.getTipoServicio());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(ser.getCorrelativo());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(ser.getMontoServicio());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(ser.getIdCuenta());
      out.write("</td>\n");
      out.write("                        <td>\n");
      out.write("                            <a class=\"btn btn-warning\" href=\"Controlador?accion=editarServicio&noServicio=");
      out.print(ser.getIdServicio());
      out.write("\">Editar</a>\n");
      out.write("                            <a class=\"btn btn-danger\" href=\"Controlador?accion=eliminarServicio&idServicio=");
      out.print(ser.getIdServicio());
      out.write("\">Eliminar</a>\n");
      out.write("                            <a class=\"btn btn-outline-primary mt-4\" href=\"Controlador?accion=agregarCarrito&idServicio=");
      out.print(ser.getIdServicio());
      out.write("\">AGREGAR AL CARRITO</a>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\" integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js\" integrity=\"sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\" integrity=\"sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
