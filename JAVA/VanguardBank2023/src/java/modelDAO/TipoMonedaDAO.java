package modelDAO;

import configuration.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.TipoMoneda;

public class TipoMonedaDAO {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    TipoMoneda nTipoMoneda = new TipoMoneda();

    public List listar() {
        ArrayList<TipoMoneda> listaTipoMoneda = new ArrayList<>();
        String sql = "select * from TipoMoneda";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                TipoMoneda nuevoTipoMoneda = new TipoMoneda();
                nuevoTipoMoneda.setIdTipoMoneda(rs.getInt("idTipoMoneda"));
                nuevoTipoMoneda.setSimboloMoneda(rs.getString("simboloMoneda"));
                nuevoTipoMoneda.setNombreMoneda(rs.getString("nombreMoneda"));
                nuevoTipoMoneda.setConversionDolar(rs.getDouble("conversionDolar"));
                listaTipoMoneda.add(nuevoTipoMoneda);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaTipoMoneda;
    }

    public TipoMoneda buscar(int id) {
        String sql = "select * from TipoMoneda where idTipoMoneda = " + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nTipoMoneda.setIdTipoMoneda(rs.getInt("idTipoMoneda"));
                nTipoMoneda.setSimboloMoneda(rs.getString("simboloMoneda"));
                nTipoMoneda.setNombreMoneda(rs.getString("nombreMoneda"));
                nTipoMoneda.setConversionDolar(rs.getDouble("conversionDolar"));
            }
        } catch (Exception e) {
            e.printStackTrace();   
        }
        return nTipoMoneda;
    }

    public boolean agregar(TipoMoneda tipo) {
        String sql = "Insert into TipoMoneda (simboloMoneda, nombreMoneda, conversionDolar) values('"
                + tipo.getSimboloMoneda() + "','" + tipo.getNombreMoneda() + "','" + tipo.getConversionDolar() + "')";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean editar(TipoMoneda tipo) {
        String sql = "Update TipoMoneda set simboloMoneda ='"+ tipo.getSimboloMoneda() + "', nombreMoneda = '"
                + tipo.getNombreMoneda() + "', conversionDolar = '"+ tipo.getConversionDolar()
                +"' where idTipoMoneda = " + tipo.getIdTipoMoneda();
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
