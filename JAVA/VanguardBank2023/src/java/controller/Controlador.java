package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import model.Credito;
import model.Cuenta;
import model.Departamento;
import model.Deposito;
import model.Empleado;
import model.HistorialDeTransacciones;
import model.Proveedor;
import model.TipoEmpleado;
import model.TipoMoneda;
import model.Transaccion;
import modelDAO.ClienteDAO;
import modelDAO.CreditoDAO;
import modelDAO.CuentaDAO;
import modelDAO.DepartamentoDAO;
import modelDAO.DepositoDAO;
import modelDAO.EmpleadoDAO;
import modelDAO.HistorialDeTransaccionesDAO;
import modelDAO.ProveedorDAO;
import modelDAO.TipoEmpleadoDAO;
import modelDAO.TipoMonedaDAO;
import modelDAO.TransaccionDAO;

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

    String listarProveedor = "view/listarProveedor.jsp";
    String addProveedor = "view/agregarProveedor.jsp";
    String editProveedor = "view/editarProveedor.jsp";
    Proveedor nuevoProveedor = new Proveedor();
    ProveedorDAO nuevoProveedorDAO = new ProveedorDAO();

    // TIPO EMPLEADO
    String listarTipoEmpleado = "view/listarTipoEmpleado.jsp";
    String agregarTipoEmpleado = "view/agregarTipoEmpleado.jsp";
    String editarTipoEmpleado = "view/editarTipoEmpleado.jsp";
    TipoEmpleado nuevoTipoEmpleado = new TipoEmpleado();
    TipoEmpleadoDAO nuevoTipoEmpleadoDAO = new TipoEmpleadoDAO();

    // Transaccion
    String listarTransaccion = "view/listarTransaccion.jsp";
    String addTransaccion = "view/agregarTransaccion.jsp";
    String editTransaccion = "view/editarTransaccion.jsp";
    Transaccion nuevaTransaccion = new Transaccion();
    TransaccionDAO nuevaTransaccionDAO = new TransaccionDAO();

    // Departamentos
    String listarDepartamento = "view/listarDepartamento.jsp";
    String addDepartamento = "view/agregarDepartamento.jsp";
    String editDepartamento = "view/editarDepartamento.jsp";
    Departamento nuevoDepartamento = new Departamento();
    DepartamentoDAO nuevoDepartamentoDAO = new DepartamentoDAO();

    //Empleado
    String listarEmpleado = "view/listarEmpleado.jsp";
    String agregarEmpleado = "view/agregarEmpleado.jsp";
    String editarEmpleado = "view/editarEmpleado.jsp";
    Empleado nuevoEmpleado = new Empleado();
    EmpleadoDAO nuevoEmpleadoDAO = new EmpleadoDAO();

    //TipoMonedaa
    String listarTipoMoneda = "view/listarTipoMoneda.jsp";
    String addTipoMoneda = "view/agregarTipoMoneda.jsp";
    String editTipoMoneda = "view/editarTipoMoneda.jsp";
    TipoMoneda nuevoTipoMoneda = new TipoMoneda();
    TipoMonedaDAO nuevoTipoMonedaDAO = new TipoMonedaDAO();

    //HistorialDeTransacciones
    String listHistorial = "view/listarHistorialDeTransacciones.jsp";
    String addHistorial = "view/agregarHistorialDeTransacciones.jsp";
    String editHistorial = "view/editarHistorialDeTransacciones.jsp";
    HistorialDeTransacciones nuevoHistorialDeTransacciones = new HistorialDeTransacciones();
    HistorialDeTransaccionesDAO nuevoHistorialDeTransaccionesDAO = new HistorialDeTransaccionesDAO();

    //Cuenta
    String listarCuenta = "view/listarCuentas.jsp";
    String agregarCuenta = "view/agregarCuenta.jsp";
    String editarCuenta = "view/editarCuenta.jsp";
    Cuenta nuevaCuenta = new Cuenta();
    CuentaDAO cuentaDAO = new CuentaDAO();
    
    //Credito
    String listarCredito = "view/listarCredito.jsp";
    String agregarCredito = "view/agregarCredito.jsp";
    String editarCredito = "view/editarCredito.jsp";
    Credito nuevoCredito = new Credito();
    CreditoDAO creditoDAO = new CreditoDAO();
    
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
        if (accion.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (accion.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (accion.equalsIgnoreCase("Agregar")) {
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
        } else if (accion.equalsIgnoreCase("editar")) {
            request.setAttribute("Dpi", request.getParameter("DPI"));
            acceso = edit;
        } else if (accion.equalsIgnoreCase("Actualizar")) {
            nuevoCliente.setNombreCliente(request.getParameter("txtNombre"));
            nuevoCliente.setApellidoCliente(request.getParameter("txtApellido"));
            nuevoCliente.setTelefonoContacto(request.getParameter("txtTelefono"));
            nuevoCliente.setDireccionCliente(request.getParameter("txtDireccion"));
            nuevoCliente.setGeneroCliente(request.getParameter("txtGenero"));
            nuevoCliente.setDPI(Long.parseLong(request.getParameter("txtDPI")));
            nuevoClienteDAO.editar(nuevoCliente);
            acceso = listar;
        } else if (accion.equalsIgnoreCase("eliminar")){
            Long DPI = Long.parseLong(request.getParameter("Eli"));
            nuevoClienteDAO.eliminar(DPI);
            acceso = listar;
        } else if (accion.equalsIgnoreCase("listarDeposito")) {
            acceso = listarDeposito;
        } else if (accion.equalsIgnoreCase("addDeposito")) {
            acceso = addDeposito;
        } else if (accion.equalsIgnoreCase("AgregarDeposito")) {
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
        } else if (accion.equalsIgnoreCase("editDeposito")) {
            request.setAttribute("idDep", request.getParameter("idDeposito"));
            acceso = editDeposito;
        } else if (accion.equalsIgnoreCase("ActualizarDeposito")) {
            nuevoDeposito.setIdDeposito(Integer.parseInt(request.getParameter("txtIdDeposito")));
            nuevoDeposito.setMontoDeposito(Double.parseDouble(request.getParameter("txtMontoDeposito")));
            nuevoDeposito.setFechaDeposito(request.getParameter("txtFechaDeposito"));
            nuevoDeposito.setHoraDeposito(request.getParameter("txtHoraDeposito"));
            nuevoDeposito.setIdCuentaOrigen(Integer.parseInt(request.getParameter("txtIdCuentaOrigen")));
            nuevoDeposito.setIdCuentaDeposito(Integer.parseInt(request.getParameter("txtIdCuentaDeposito")));
            nuevoDepositoDAO.editar(nuevoDeposito);
            acceso = listarDeposito;
        } else if (accion.equalsIgnoreCase("listarProveedor")) {
            acceso = listarProveedor;

        } else if (accion.equalsIgnoreCase("addProveedor")) {
            acceso = addProveedor;
        } else if (accion.equalsIgnoreCase("AgregarProveedor")) {
            String nombreProveedor = request.getParameter("txtNombre");
            String direccionProveedor = request.getParameter("txtDireccion");
            String correoProveedor = request.getParameter("txtCorreo");
            String telefonoProveedor = request.getParameter("txtTelefono");
            nuevoProveedor.setNombreProveedor(nombreProveedor);
            nuevoProveedor.setDireccionProveedor(direccionProveedor);
            nuevoProveedor.setCorreoProveedor(correoProveedor);
            nuevoProveedor.setTelefonoProveedor(telefonoProveedor);
            nuevoProveedorDAO.agregar(nuevoProveedor);
            acceso = listarProveedor;

        } else if (accion.equalsIgnoreCase("editarProveedor")) {
            request.setAttribute("idProv", request.getParameter("idProveedor"));
            acceso = editProveedor;
        } else if (accion.equalsIgnoreCase("ActualizarProveedor")) {
            nuevoProveedor.setIdProveedor(Integer.parseInt(request.getParameter("txtIdProveedor")));
            nuevoProveedor.setNombreProveedor(request.getParameter("txtNombre"));
            nuevoProveedor.setDireccionProveedor(request.getParameter("txtDireccion"));
            nuevoProveedor.setCorreoProveedor(request.getParameter("txtCorreo"));
            nuevoProveedor.setTelefonoProveedor(request.getParameter("txtTelefono"));
            nuevoProveedorDAO.editar(nuevoProveedor);
            acceso = listarProveedor;

        } else if (accion.equalsIgnoreCase("listarTipoEmpleado")) {
            acceso = listarTipoEmpleado;
        } else if (accion.equalsIgnoreCase("addTipoEmpleado")) {
            acceso = agregarTipoEmpleado;
        } else if (accion.equalsIgnoreCase("AgregarTipoEmpleado")) {
            String puesto = request.getParameter("txtPuesto");
            String salario = request.getParameter("txtSalario");
            String contrato = request.getParameter("txtContrato");
            nuevoTipoEmpleado.setNombreTipoPuesto(puesto);
            nuevoTipoEmpleado.setSalarioTipoEmpleado(salario);
            nuevoTipoEmpleado.setContratoTipoEmpleado(contrato);
            nuevoTipoEmpleadoDAO.agregar(nuevoTipoEmpleado);
            acceso = listarTipoEmpleado;
        } else if (accion.equalsIgnoreCase("editarTipoEmpleado")) {
            request.setAttribute("Id", request.getParameter("idTipoEmpleado"));
            acceso = editarTipoEmpleado;
        } else if (accion.equalsIgnoreCase("ActualizarTipoEmpleado")) {
            nuevoTipoEmpleado.setIdTipoEmpleado(Integer.parseInt(request.getParameter("txtID")));
            nuevoTipoEmpleado.setNombreTipoPuesto(request.getParameter("txtPuesto"));
            nuevoTipoEmpleado.setSalarioTipoEmpleado(request.getParameter("txtSalario"));
            nuevoTipoEmpleado.setContratoTipoEmpleado(request.getParameter("txtContrato"));
            nuevoTipoEmpleadoDAO.editar(nuevoTipoEmpleado);
            acceso = listarTipoEmpleado;

            //Transacciones
        } else if (accion.equalsIgnoreCase("listarTransaccion")) {
            acceso = listarTransaccion;
        } else if (accion.equalsIgnoreCase("addTransaccion")) {
            acceso = addTransaccion;
        } else if (accion.equalsIgnoreCase("AgregarTransaccion")) {
            String tipoTransaccion = request.getParameter("txtTipoTransaccion");
            double montoTransaccion = Double.parseDouble(request.getParameter("txtMontoTransaccion"));
            String fechaHora = request.getParameter("txtFechaHora");
            int idEmpleado = Integer.parseInt(request.getParameter("txtIdEmpleado"));
            int idCuenta = Integer.parseInt(request.getParameter("txtIdCuenta"));
            nuevaTransaccion.setTipoTransaccion(tipoTransaccion);
            nuevaTransaccion.setMontoTransaccion(montoTransaccion);
            nuevaTransaccion.setFechaHora(fechaHora);
            nuevaTransaccion.setIdEmpleado(idEmpleado);
            nuevaTransaccion.setIdCuenta(idCuenta);
            nuevaTransaccionDAO.agregar(nuevaTransaccion);
            acceso = listarTransaccion;
        } else if (accion.equalsIgnoreCase("editTransaccion")) {
            request.setAttribute("idTr", request.getParameter("idTransaccion"));
            acceso = editTransaccion;
        } else if (accion.equalsIgnoreCase("ActualizarTransaccion")) {
            nuevaTransaccion.setIdTransaccion(Integer.parseInt(request.getParameter("txtIdTransaccion")));
            nuevaTransaccion.setTipoTransaccion(request.getParameter("txtTipoTransaccion"));
            nuevaTransaccion.setMontoTransaccion(Double.parseDouble(request.getParameter("txtMontoTransaccion")));
            nuevaTransaccion.setFechaHora(request.getParameter("txtFechaHora"));
            nuevaTransaccion.setIdEmpleado(Integer.parseInt(request.getParameter("txtIdEmpleado")));
            nuevaTransaccion.setIdCuenta(Integer.parseInt(request.getParameter("txtIdCuenta")));
            nuevaTransaccionDAO.editar(nuevaTransaccion);
            acceso = listarTransaccion;
            
            
            
            //Credito
        } else if (accion.equalsIgnoreCase("listarCredito")) {
            acceso = listarCredito;
        } else if (accion.equalsIgnoreCase("addCredito")) {
            acceso = agregarCredito;
        }  else if (accion.equalsIgnoreCase("AgregarCredito")) {
            double montoCredito = Double.parseDouble(request.getParameter("txtMontoCredito"));
            String fechaHora = request.getParameter("txtFechaHora");
            double interesCredito = Double.parseDouble(request.getParameter("txtInteresCredito"));
            int idCuenta = Integer.parseInt(request.getParameter("txtIdCuenta"));
            nuevoCredito.setMontoCredito(montoCredito);
            nuevoCredito.setFechaHora(fechaHora);
            nuevoCredito.setInteresCredito(interesCredito);
            nuevoCredito.setIdCuenta(idCuenta);
            creditoDAO.agregar(nuevoCredito);
            acceso = listarCredito;
        }else if (accion.equalsIgnoreCase("editarCredito")) {
            request.setAttribute("idCr", request.getParameter("idCredito"));
            acceso = editarCredito;
        }else if (accion.equalsIgnoreCase("ActualizarCredito")) {
            nuevoCredito.setIdCredito(Integer.parseInt(request.getParameter("txtIdCredito")));
            nuevoCredito.setMontoCredito(Double.parseDouble(request.getParameter("txtMontoCredito")));
            nuevoCredito.setFechaHora(request.getParameter("txtFechaHora"));
            nuevoCredito.setInteresCredito(Double.parseDouble(request.getParameter("txtInteresCredito")));
            nuevoCredito.setIdCuenta(Integer.parseInt(request.getParameter("txtIdCuenta")));
            creditoDAO.editar(nuevoCredito);
            acceso = listarCredito;
            
        }
        else if (accion.equalsIgnoreCase("listarDepartamento")) {
            acceso = listarDepartamento;
        } else if (accion.equalsIgnoreCase("addDepartamento")) {
            acceso = addDepartamento;
        } else if (accion.equalsIgnoreCase("AgregarDepartamento")) {
            String nombreDepartamento = String.valueOf(request.getParameter("txtNombreDepartamento"));
            String codigoPostal = request.getParameter("txtCodigoPostal");
            Date fechaApertura = Date.valueOf(request.getParameter("txtFechaApertura"));
            nuevoDepartamento.setNombreDepartamento(nombreDepartamento);
            nuevoDepartamento.setCodigoPostal(codigoPostal);
            nuevoDepartamento.setFechaApertura(fechaApertura);
            nuevoDepartamentoDAO.agregar(nuevoDepartamento);
            acceso = listarDepartamento;
        } else if (accion.equalsIgnoreCase("editDepartamento")) {
            request.setAttribute("idDepa", request.getParameter("idDepartamento"));
            acceso = editDepartamento;
        } else if (accion.equalsIgnoreCase("ActualizarDepartamento")) {
            nuevoDepartamento.setIdDepartamento(Integer.parseInt(request.getParameter("txtIdDepartamento")));
            nuevoDepartamento.setNombreDepartamento(request.getParameter("txtNombreDepartamento"));
            nuevoDepartamento.setCodigoPostal(request.getParameter("txtCodigoPostal"));
            nuevoDepartamento.setFechaApertura(Date.valueOf(request.getParameter("txtFechaApertura")));
            nuevoDepartamentoDAO.editar(nuevoDepartamento);
            acceso = listarDepartamento;
        }
        if (accion.equalsIgnoreCase("ListarEmpleado")) {
            acceso = listarEmpleado;
        } else if (accion.equalsIgnoreCase("addEmpleado")) {
            acceso = agregarEmpleado;
        } else if (accion.equalsIgnoreCase("AgregarEmpleado")) {
            String nombres = request.getParameter("txtNombres");
            String apellidos = request.getParameter("txtApellidos");
            String fechaDeContratacion = request.getParameter("dFechaContratacion");
            Date fechaContratacion = Date.valueOf(fechaDeContratacion);
            String direccion = request.getParameter("txtDireccion");
            String numeroContacto = request.getParameter("txtNumeroContacto");
            int idTipoEmpleado = Integer.parseInt(request.getParameter("txtIdTipoEmpleado"));
            nuevoEmpleado.setNombreEmpleado(nombres);
            nuevoEmpleado.setApellidoEmpleado(apellidos);
            nuevoEmpleado.setFechaContratacion(fechaContratacion);
            nuevoEmpleado.setDireccionEmpleado(direccion);
            nuevoEmpleado.setNumeroContactoEmpleado(numeroContacto);
            nuevoEmpleado.setIdTipoEmpleado(idTipoEmpleado);
            nuevoEmpleadoDAO.agregarEmpleado(nuevoEmpleado);
            acceso = listarEmpleado;
        } else if (accion.equalsIgnoreCase("editEmpleado")) {
            request.setAttribute("idDeEmpleado", request.getParameter("idEmpleado"));
            acceso = editarEmpleado;
        } else if (accion.equalsIgnoreCase("ModificarEmpleado")) {
            int idEmpleado = Integer.parseInt(request.getParameter("txtIdEmpleado"));
            String nombres = request.getParameter("txtNombres");
            String apellidos = request.getParameter("txtApellidos");
            String fechaDeContratacion = request.getParameter("dFechaContratacion");
            Date fechaContratacion = Date.valueOf(fechaDeContratacion);
            String direccion = request.getParameter("txtDireccion");
            String numeroContacto = request.getParameter("txtNumeroContacto");
            int idTipoEmpleado = Integer.parseInt(request.getParameter("txtIdTipoEmpleado"));
            nuevoEmpleado.setIdEmpleado(idEmpleado);
            nuevoEmpleado.setNombreEmpleado(nombres);
            nuevoEmpleado.setApellidoEmpleado(apellidos);
            nuevoEmpleado.setFechaContratacion(fechaContratacion);
            nuevoEmpleado.setDireccionEmpleado(direccion);
            nuevoEmpleado.setNumeroContactoEmpleado(numeroContacto);
            nuevoEmpleado.setIdTipoEmpleado(idTipoEmpleado);
            nuevoEmpleadoDAO.editarEmpleado(nuevoEmpleado);
            acceso = listarEmpleado;   
        } else if(accion.equalsIgnoreCase("delEmpleado")){
            int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
            nuevoEmpleadoDAO.eliminarEmpleado(idEmpleado);
            acceso = listarEmpleado;
        } else if (accion.equalsIgnoreCase("listarTipoMoneda")) {
            acceso = listarTipoMoneda;
        } else if (accion.equalsIgnoreCase("addTipoMoneda")) {
            acceso = addTipoMoneda;
        } else if (accion.equalsIgnoreCase("AgregarTipoMoneda")) {
            String simboloMoneda = request.getParameter("txtSimboloMoneda");
            String nombreMoneda = request.getParameter("txtNombreMoneda");
            Double conversionDolar = Double.parseDouble(request.getParameter("txtConversionDolar"));
            nuevoTipoMoneda.setSimboloMoneda(simboloMoneda);
            nuevoTipoMoneda.setNombreMoneda(nombreMoneda);
            nuevoTipoMoneda.setConversionDolar(conversionDolar);
            nuevoTipoMonedaDAO.agregar(nuevoTipoMoneda);
            acceso = listarTipoMoneda;
        } else if(accion.equalsIgnoreCase("editarTipoMoneda")){    
            request.setAttribute("IdM", request.getParameter("idTipoMoneda"));
            acceso = editTipoMoneda;
        } else if(accion.equalsIgnoreCase("ActualizarTipoMoneda")){
            int idTipoMoneda = Integer.parseInt(request.getParameter("txtIdTipoMoneda"));
            String simboloMoneda = request.getParameter("txtSimboloMoneda");
            String nombreMoneda = request.getParameter("txtNombreMoneda");
            Double conversionDolar = Double.parseDouble(request.getParameter("txtConversionDolar"));
            nuevoTipoMoneda.setIdTipoMoneda(idTipoMoneda);
            nuevoTipoMoneda.setSimboloMoneda(simboloMoneda);
            nuevoTipoMoneda.setNombreMoneda(nombreMoneda);
            nuevoTipoMoneda.setConversionDolar(conversionDolar);
            nuevoTipoMonedaDAO.editar(nuevoTipoMoneda);
            acceso = listarTipoMoneda;
            
        } else if (accion.equalsIgnoreCase("listarHistorial")) {
            acceso = listHistorial;
        } else if (accion.equalsIgnoreCase("addHistorial")) {
            acceso = addHistorial;
        } else if (accion.equalsIgnoreCase("AgregarHistorial")) {
            int idCuenta = Integer.parseInt(request.getParameter("txtIdCuenta"));
            int idTransaccion = Integer.parseInt(request.getParameter("txtTransaccion"));
            nuevoHistorialDeTransacciones.setIdCuenta(idCuenta);
            nuevoHistorialDeTransacciones.setIdTransaccion(idTransaccion);
            nuevoHistorialDeTransaccionesDAO.agregar(nuevoHistorialDeTransacciones);
            acceso = listHistorial;
        } else if (accion.equalsIgnoreCase("editarHistorial")) {
            request.setAttribute("idHistorial", request.getParameter("idHistorialTransaccion"));
            acceso = editHistorial;
        } else if (accion.equalsIgnoreCase("ActualizarHistorial")) {
            int idHistorialTransaccion = Integer.parseInt(request.getParameter("txtIdHistorialTransacion"));
            int idCuenta = Integer.parseInt(request.getParameter("txtIdCuenta"));
            int idTransaccion = Integer.parseInt(request.getParameter("txtIdTransaccion"));
            nuevoHistorialDeTransacciones.setIdTransaccion(idHistorialTransaccion);
            nuevoHistorialDeTransacciones.setIdCuenta(idCuenta);
            nuevoHistorialDeTransacciones.setIdTransaccion(idTransaccion);
            nuevoHistorialDeTransaccionesDAO.editar(nuevoHistorialDeTransacciones);
            acceso = listHistorial;
        }else if(accion.equalsIgnoreCase("listarCuenta")){
            acceso = listarCuenta;
        }else if(accion.equalsIgnoreCase("addCuenta")){
            acceso = agregarCuenta;
        }else if(accion.equalsIgnoreCase("agregarCuenta")){
            long numeroCuenta = Long.parseLong(request.getParameter("txtNumeroCuenta"));
            double saldo = Double.parseDouble(request.getParameter("txtSaldoCuenta"));
            String tipoCuenta = request.getParameter("txtTipoCuenta");
            Date fechaApertura = Date.valueOf(request.getParameter("dFechaApertura"));
            long DPI = Long.parseLong(request.getParameter("txtDPI"));
            int idEmpleado = Integer.parseInt(request.getParameter("txtIdEmpleado"));
            int idTipoMoneda = Integer.parseInt(request.getParameter("txtIdTipMon"));
            int idSucursarl = Integer.parseInt(request.getParameter("txtIdSucursal"));
            nuevaCuenta.setNumeroCuenta(numeroCuenta);
            nuevaCuenta.setSaldoCuenta(saldo);
            nuevaCuenta.setTipoCuenta(tipoCuenta);
            nuevaCuenta.setFechaApertura(fechaApertura);
            nuevaCuenta.setDPI(DPI);
            nuevaCuenta.setIdEmpleado(idEmpleado);
            nuevaCuenta.setIdTipoMoneda(idTipoMoneda);
            nuevaCuenta.setIdSucursal(idSucursarl);
            cuentaDAO.agregarCuenta(nuevaCuenta);
            acceso = listarCuenta;
        }else if(accion.equalsIgnoreCase("editCuenta")){
            request.setAttribute("numeroDeCuenta", request.getParameter("numDeCuenta"));
            acceso = editarCuenta;
        }else if(accion.equalsIgnoreCase("editarCuenta")){
            long numeroCuenta = Long.parseLong(request.getParameter("txtNumeroCuenta"));
            double saldo = Double.parseDouble(request.getParameter("txtSaldoCuenta"));
            String tipoCuenta = request.getParameter("txtTipoCuenta");
            Date fechaApertura = Date.valueOf(request.getParameter("dFechaApertura"));
            long DPI = Long.parseLong(request.getParameter("txtDPI"));
            int idEmpleado = Integer.parseInt(request.getParameter("txtIdEmpleado"));
            int idTipoMoneda = Integer.parseInt(request.getParameter("txtIdTipMon"));
            int idSucursarl = Integer.parseInt(request.getParameter("txtIdSucursal"));
            nuevaCuenta.setNumeroCuenta(numeroCuenta);
            nuevaCuenta.setSaldoCuenta(saldo);
            nuevaCuenta.setTipoCuenta(tipoCuenta);
            nuevaCuenta.setFechaApertura(fechaApertura);
            nuevaCuenta.setDPI(DPI);
            nuevaCuenta.setIdEmpleado(idEmpleado);
            nuevaCuenta.setIdTipoMoneda(idTipoMoneda);
            nuevaCuenta.setIdSucursal(idSucursarl);
            cuentaDAO.editarCuenta(nuevaCuenta);
            acceso = listarCuenta;
        }else if(accion.equalsIgnoreCase("delCuenta")){
            int numeroCuenta = Integer.parseInt(request.getParameter("numDeCuenta"));
            cuentaDAO.eliminarCuenta(numeroCuenta);
            acceso = listarCuenta;
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
