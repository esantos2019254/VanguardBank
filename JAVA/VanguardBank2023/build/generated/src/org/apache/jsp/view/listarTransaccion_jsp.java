package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Iterator;
import model.Transaccion;
import java.util.List;
import modelDAO.TransaccionDAO;

public final class listarTransaccion_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Listar Transacciones</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div>\r\n");
      out.write("            <h1>Registro de Transacciones</h1>\r\n");
      out.write("            <a href=\"Controlador?accion=addTransaccion\">Agregar Nueva Transaccion</a>\r\n");
      out.write("            <table border=\"1\">\r\n");
      out.write("                <thead>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th>CODIGO DE TRANSACCION</th>\r\n");
      out.write("                        <th>TIPO DE TRANSACCION</th>\r\n");
      out.write("                        <th>MONTO DE LA TRANSACCION</th>\r\n");
      out.write("                        <th>FECHA Y HORA DE LA TRANSACCION</th>\r\n");
      out.write("                        <th>CODIGO DEL EMPLEADO</th>\r\n");
      out.write("                        <th>ID DE LA CUENTA</th>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </thead>\r\n");
      out.write("                ");

                    TransaccionDAO dao = new TransaccionDAO();
                    List<Transaccion> listaTransaccion = dao.listar();
                    Iterator<Transaccion> iterator = listaTransaccion.iterator();
                    Transaccion trn = null;
                    while (iterator.hasNext()) {
                        trn = iterator.next();
      out.write("\r\n");
      out.write("                <tbody>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>");
      out.print(trn.getIdTransaccion());
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(trn.getTipoTransaccion());
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(trn.getMontoTransaccion());
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(trn.getFechaHora());
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(trn.getIdEmpleado());
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print(trn.getIdCuenta());
      out.write("</td>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            <a href=\"Controlador?accion=editTransaccion&idTransaccion=");
      out.print( trn.getIdTransaccion());
      out.write("\">Edit</a>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </tbody>        \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                ");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            </table>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
