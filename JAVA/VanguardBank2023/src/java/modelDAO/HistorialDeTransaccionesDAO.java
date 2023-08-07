package modelDAO;

import configuration.Conexion;
import interfaces.HistorialDeTransaccionesCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.HistorialDeTransacciones;

/**
 *
 * @author Usuario
 */
public class HistorialDeTransaccionesDAO implements HistorialDeTransaccionesCRUD {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    HistorialDeTransacciones nHistorialDeTransacciones = new HistorialDeTransacciones();

    @Override
    public List listar() {
        ArrayList<HistorialDeTransacciones> listarHistorialDeTransacciones = new ArrayList<>();
        String sql = "select * from HistorialDeTransacciones";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                HistorialDeTransacciones nuevoHistorial = new HistorialDeTransacciones();
                nuevoHistorial.setIdHistorialTransaccion(rs.getInt("idHistorialTransaccion"));
                nuevoHistorial.setIdCuenta(rs.getInt("idCuenta"));
                nuevoHistorial.setIdTransaccion(rs.getInt("idTransaccion"));
                listarHistorialDeTransacciones.add(nuevoHistorial);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listarHistorialDeTransacciones;
    }

    @Override
    public HistorialDeTransacciones buscar(int id) {

        String sql = "select * from HistorialDeTransacciones where idHistorialTransaccion =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                nHistorialDeTransacciones.setIdHistorialTransaccion(rs.getInt("idHistorialTransaccion"));
                nHistorialDeTransacciones.setIdCuenta(rs.getInt("idCuenta"));
                nHistorialDeTransacciones.setIdTransaccion(rs.getInt("idTransaccion"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nHistorialDeTransacciones;
    }

    @Override
    public boolean agregar(HistorialDeTransacciones histo) {
        String sql = "insert into HistorialDeTransacciones (idCuenta, idTransaccion) values('"
                + histo.getIdCuenta() + "','" + histo.getIdTransaccion() + "')";

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
    public boolean editar(HistorialDeTransacciones histo) {
        String sql = "Update HistorialDeTransacciones set idCuenta = '"+histo.getIdCuenta()+"', idTransaccion = '"
                    +histo.getIdTransaccion()+"' where idHistorialTransaccion = "+histo.getIdHistorialTransaccion();
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
