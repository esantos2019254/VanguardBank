package modelDAO;

import configuration.Conexion;
import interfaces.ProveedorCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Proveedor;

public class ProveedorDAO implements ProveedorCRUD {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Proveedor nProveedor = new Proveedor();

    @Override
    public List listar() {
        ArrayList<Proveedor> listaProveedor = new ArrayList<>();
        String sql = "select * from Proveedor";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Proveedor nuevoProveedor = new Proveedor();
                nuevoProveedor.setIdProveedor(rs.getInt("idProveedor"));
                nuevoProveedor.setNombreProveedor(rs.getString("nombreProveedor"));
                nuevoProveedor.setDireccionProveedor(rs.getString("direccionProveedor"));
                nuevoProveedor.setCorreoProveedor(rs.getString("correoProveedor"));
                nuevoProveedor.setTelefonoProveedor(rs.getString("telefonoProveedor"));
                listaProveedor.add(nuevoProveedor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaProveedor;
    }

    @Override
    public Proveedor buscar(int id) {
        String sql = "Select * from Proveedor where idProveedor =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nProveedor.setIdProveedor(rs.getInt("idProveedor"));
                nProveedor.setNombreProveedor(rs.getString("nombreProveedor"));
                nProveedor.setDireccionProveedor(rs.getString("direccionProveedor"));
                nProveedor.setCorreoProveedor(rs.getString("correoProveedor"));
                nProveedor.setTelefonoProveedor(rs.getString("telefonoProveedor"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nProveedor;
    }

    @Override
    public boolean agregar(Proveedor pro) {
        String sql = "insert into Proveedor (nombreProveedor, direccionProveedor, correoProveedor, telefonoProveedor) values('"
                + pro.getNombreProveedor() + "','" + pro.getDireccionProveedor() + "','" + pro.getCorreoProveedor() + "','" + pro.getTelefonoProveedor() + "')";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editar(Proveedor pro) {
        String sql = "Update Proveedor set nombreProveedor = '"+pro.getNombreProveedor()+"', direccionProveedor = '"+pro.getDireccionProveedor()
                + "', correoProveedor = '" + pro.getCorreoProveedor() + "', telefonoProveedor = '" + pro.getTelefonoProveedor() + "'where idProveedor = " + pro.getIdProveedor();
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
