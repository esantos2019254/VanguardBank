package modelDAO;

import configuration.Conexion;
import interfaces.TransaccionCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Transaccion;

public class TransaccionDAO implements TransaccionCRUD{
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Transaccion nTransaccion = new Transaccion();
    
    @Override
    public List listar(){
        ArrayList <Transaccion> listaTransaccion = new ArrayList<>();
        String sql = "select * from Transaccion";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Transaccion nuevaTransaccion = new Transaccion();
                nuevaTransaccion.setIdTransaccion(rs.getInt("idTransaccion"));
                nuevaTransaccion.setTipoTransaccion(rs.getString("tipoTransaccion"));
                nuevaTransaccion.setMontoTransaccion(rs.getDouble("montoTransaccion"));
                nuevaTransaccion.setFechaHora(rs.getString("fechaHora"));
                nuevaTransaccion.setIdEmpleado(rs.getInt("idEmpleado"));
                nuevaTransaccion.setIdCuenta(rs.getInt("idCuenta"));
                listaTransaccion.add(nuevaTransaccion);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaTransaccion;
    }
    
    @Override
    public Transaccion buscar(int id){
        String sql = "select * from Transaccion where idTransaccion = "+id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nTransaccion.setIdTransaccion(rs.getInt("idTransaccion"));
                nTransaccion.setTipoTransaccion(rs.getString("tipoTransaccion"));
                nTransaccion.setMontoTransaccion(rs.getDouble("montoTransaccion"));
                nTransaccion.setFechaHora(rs.getString("fechaHora"));
                nTransaccion.setIdEmpleado(rs.getInt("idEmpleado"));
                nTransaccion.setIdCuenta(rs.getInt("idCuenta"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nTransaccion;
    }
    
    @Override
    public boolean agregar(Transaccion trn){
        String sql = "Insert into Transaccion(tipoTransaccion, montoTransaccion, fechaHora, idEmpleado, idCuenta) values('"+trn.getTipoTransaccion() +"','"+trn.getMontoTransaccion() +"','"+trn.getFechaHora() +"','"+trn.getIdEmpleado() +"','"+trn.getIdCuenta()+"')";
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
    public boolean editar(Transaccion trn){
        String sql = "Update Transaccion set tipoTransaccion ='"+trn.getTipoTransaccion()
                +"', montoTransaccion = '"+trn.getMontoTransaccion()
                +"', fechaHora = '"+trn.getFechaHora()
                +"', idEmpleado = '"+trn.getIdEmpleado()
                +"', idCuenta = '"+trn.getIdCuenta()
                +"' where idTransaccion = "+trn.getIdTransaccion();
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
