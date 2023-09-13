
package modelDAO;

import configuration.Conexion;
import interfaces.DepositoCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Deposito;

public class DepositoDAO implements DepositoCRUD{
    
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Deposito  nDeposito = new Deposito ();
    
    @Override
    public List listar() {
       ArrayList <Deposito> listaDeposito = new ArrayList<>();
       String sql = "select * from Deposito";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Deposito nuevoDeposito = new Deposito ();
                nuevoDeposito.setIdDeposito(rs.getInt("idDeposito"));
		nuevoDeposito.setMontoDeposito(rs.getDouble("montoDeposito")); 
		nuevoDeposito.setFechaDeposito(rs.getString("fechaDeposito")); 
		nuevoDeposito.setHoraDeposito(rs.getString("horaDeposito")); 
		nuevoDeposito.setIdCuentaOrigen(rs.getInt("idCuentaOrigen")); 
		nuevoDeposito.setIdCuentaDeposito(rs.getInt("idCuentaDeposito"));
                listaDeposito.add(nuevoDeposito);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return listaDeposito;
    }

    @Override
    public Deposito buscar(int id) {
        String sql = "select * from Deposito where idDeposito = " + id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nDeposito.setIdDeposito(rs.getInt("idDeposito"));
		nDeposito.setMontoDeposito(rs.getDouble("montoDeposito")); 
		nDeposito.setFechaDeposito(rs.getString("fechaDeposito")); 	
		nDeposito.setHoraDeposito(rs.getString("horaDeposito"));
                nDeposito.setIdCuentaOrigen(rs.getInt("idCuentaOrigen"));
		nDeposito.setIdCuentaDeposito(rs.getInt("idCuentaDeposito"));  
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nDeposito;
    }

    @Override
    public boolean agregar(Deposito dep) {
        String sql = "Insert into Deposito(montoDeposito, fechaDeposito, horaDeposito, idCuentaOrigen, idCuentaDeposito) values('"+ dep.getMontoDeposito() + "','" + dep.getFechaDeposito() + "','" + dep.getHoraDeposito() + "','" + dep.getIdCuentaOrigen() + "','" + dep.getIdCuentaDeposito()+"')";
        //String a = "Insert into Deposito(montoDeposito, fechaDeposito, horaDeposito, idCuentaOrigen, idCuentaDeposito) values('"+dep.getMontoDeposito()+"','" + dep.getFechaDeposito() + "','" + dep.getHoraDeposito() + "','" + dep.getIdCuentaOrigen() + "','" + dep.getIdCuentaDeposito() + "')";
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
    public boolean editar(Deposito dep) {
        String sql = "Update Deposito set montoDeposito = '"+ dep.getMontoDeposito()
		+ "', fechaDeposito = '"+ dep.getFechaDeposito()
		+ "', horaDeposito = '"+ dep.getHoraDeposito()
		+ "', idCuentaOrigen = '"+ dep.getIdCuentaOrigen()
		+ "', idCuentaDeposito = '"+ dep.getIdCuentaDeposito()
                + "' where idDeposito = "+ dep.getIdDeposito();
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
    public void eliminar(int idDep) {
        String sql = "delete from Deposito where idDeposito =" + idDep;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
