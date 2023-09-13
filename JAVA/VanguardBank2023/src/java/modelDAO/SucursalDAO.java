package modelDAO;

import configuration.Conexion;
import interfaces.SucursalCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Sucursal;

/**
 *
 * @author okrun
 */
public class SucursalDAO implements SucursalCRUD{
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Sucursal nSucursal = new Sucursal();

    @Override
    public List listar() {
        ArrayList<Sucursal> listaSucursal = new ArrayList<>();
        String sql = "call sp_listarSucursales()";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Sucursal nuevaSucursal = new Sucursal();
                nuevaSucursal.setIdSucursal(rs.getInt("idSucursal"));
		nuevaSucursal.setNombreSucursal(rs.getString("nombreSucursal")); 
		nuevaSucursal.setDireccionSucursal(rs.getString("direccionSucursal")); 
		nuevaSucursal.setCorreoSucursal(rs.getString("correoSucursal")); 
		nuevaSucursal.setIdDepartamento(rs.getInt("idDepartamento")); 
		nuevaSucursal.setIdProveedor(rs.getInt("idProveedor"));
                listaSucursal.add(nuevaSucursal);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return listaSucursal;
    }

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

    @Override
    public boolean agregar(Sucursal sucu) {
        String sql = "call sp_agregarSucursal('" + sucu.getNombreSucursal() + "' , '" 
                + sucu.getDireccionSucursal() + "' , '" 
                + sucu.getCorreoSucursal() + "' ," 
                + sucu.getIdDepartamento() + "," 
                + sucu.getIdProveedor() + ")";
        
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception error) {
            error.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editar(Sucursal sucu) {
        String sql = "call sp_editarSucursal(" + sucu.getIdSucursal() + ",'"
                + sucu.getNombreSucursal() + "','"
                + sucu.getDireccionSucursal() + "','"
                + sucu.getCorreoSucursal() + "')";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception error) {
            System.out.println("error editarsucu");
            error.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "Delete from Sucursal where idSucursal = " + id ;
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
