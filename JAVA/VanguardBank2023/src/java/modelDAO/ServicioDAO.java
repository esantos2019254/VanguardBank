package modelDAO;

import configuration.Conexion;
import interfaces.ServicioCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Servicio;

/**
 *
 * @author okrun
 */
public class ServicioDAO implements ServicioCRUD{
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Servicio nServicio = new Servicio();

    @Override
    public List listar() {
        ArrayList <Servicio> listaServicio = new ArrayList<>();
        String sql = "select * from Servicio";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Servicio nuevoServicio = new Servicio(); 
                nuevoServicio.setIdServicio(rs.getInt("idServicio"));
                nuevoServicio.setTipoServicio(rs.getString("tipoServicio"));
                nuevoServicio.setCorrelativo(rs.getString("correlativo"));
                nuevoServicio.setMontoServicio(rs.getDouble("montoServicio"));
                nuevoServicio.setIdCuenta(rs.getInt("idCuenta"));
                listaServicio.add(nuevoServicio);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaServicio;
    }
    
    public Servicio listarPorId(int id) {
        Servicio nuevoServicio = new Servicio();
        String sql = "select * from Servicio where idServicio = " + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nuevoServicio.setIdServicio(rs.getInt("idServicio"));
                nuevoServicio.setTipoServicio(rs.getString("tipoServicio"));
                nuevoServicio.setCorrelativo(rs.getString("correlativo"));
                nuevoServicio.setWhatIs(rs.getString("whatIs"));
                nuevoServicio.setMontoServicio(rs.getDouble("montoServicio"));
                nuevoServicio.setIdCuenta(rs.getInt("idCuenta"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nuevoServicio;
    }
    
    /*
    @Override
    public Sucursal buscar(int id) {
       String sql = "call sp_buscarSucursal( " + id +")";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nSucursal.setIdSucursal(rs.getInt("idSucursal"));
		nSucursal.setNombreSucursal(rs.getString("nombreSucursal")); 
		nSucursal.setDireccionSucursal(rs.getString("direccionSucursal")); 	
		nSucursal.setCorreoSucursal(rs.getString("correoSucursal"));
                nSucursal.setIdDepartamento(rs.getInt("idDepartamento"));
		nSucursal.setIdProveedor(rs.getInt("idProveedor"));  
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nSucursal;
    }
    */

    @Override
    public Servicio buscar(int id) {
        String sql = "call sp_buscarServicio(" + id + ")";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                nServicio.setIdServicio(rs.getInt(1));
                nServicio.setTipoServicio(rs.getString(2));
                nServicio.setCorrelativo(rs.getString(3));
                nServicio.setMontoServicio(rs.getDouble(4));
                nServicio.setIdCuenta(rs.getInt(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nServicio;
    }

    @Override
    public boolean agregar(Servicio ser) {
        String sql = "call sp_agregarServicio('" + ser.getTipoServicio() + "','"
        + ser.getCorrelativo() + "' , "
        + ser.getMontoServicio() + ","
        + ser.getIdCuenta() + ")";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editar(Servicio ser) {
        String sql = "call sp_editarServicios(" + ser.getIdServicio() + ", '"+ ser.getTipoServicio() + "', '"+ ser.getCorrelativo() + "', "+ ser.getMontoServicio() + ")";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error editar servicio");
        }
                
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "Delete from Servicio where idServicio = " + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
