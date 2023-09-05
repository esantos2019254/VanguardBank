package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css\" integrity=\"sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2\" crossorigin=\"anonymous\">\r\n");
      out.write("        <title>Proyecto VanguardBank</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <nav class=\"navbar navbar-expand-lg nvbar-light bg-info\">\r\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("                <ul class=\"navbar-nav\">\r\n");
      out.write("                    <li class=\"nav-item active\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"Controlador?accion=listar\" target=\"myFrame\">Clientes</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"Controlador?accion=listarDeposito\" target=\"myFrame\">Deposito</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"Controlador?accion=listarProveedor\" target=\"myFrame\">Proveedor</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"Controlador?accion=listarTipoEmpleado\" target=\"myFrame\">TipoEmpleado</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"Controlador?accion=listarTransaccion\" target=\"myFrame\">Transacciones</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"Controlador?accion=listarDepartamento\" target=\"myFrame\">Departamentos</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"Controlador?accion=listarEmpleado\" target=\"myFrame\">Empleado</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"Controlador?accion=listarTipoMoneda\" target=\"myFrame\">TipoMoneda</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"Controlador?accion=listarHistorial\" target=\"myFrame\">HistorialDeTransacciones</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"Controlador?accion=listarCuenta\" target=\"myFrame\">Cuenta</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"Controlador?accion=listarCredito\" target=\"myFrame\">Crédito</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"#\" target=\"myFrame\">Sucursal</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li class=\"nav-item\">\r\n");
      out.write("                        <a style=\"margin-left: 10px; border: none\"class=\"btn btn-outline-light\" href=\"#\" target=\"myFrame\">Servicio</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("        <div class=\"m-4\" style=\"height: 670px\">\r\n");
      out.write("            <iframe name=\"myFrame\" style=\"height: 100%; width: 100%; border:none\"></iframe>\r\n");
      out.write("        </div>\r\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\" integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js\" integrity=\"sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\" integrity=\"sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
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