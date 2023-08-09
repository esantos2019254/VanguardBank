package modelDAO;

import configuration.Conexion;
import interfaces.CreditoCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Credito;

public class CreditoDAO implements CreditoCRUD{
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Credito nCredito = new Credito();
    
    @Override
    public List listar(){
        ArrayList <Credito> listarCredito = new ArrayList<>();
        String sql = "Select * from Credito";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Credito nuevoCredito = new Credito();
                nuevoCredito.setIdCredito(rs.getInt("idCredito"));
                nuevoCredito.setMontoCredito(rs.getDouble("montoCredito"));
                nuevoCredito.setFechaHora(rs.getString("fechaHora"));
                nuevoCredito.setInteresCredito(rs.getDouble("interesCredito"));
                nuevoCredito.setIdCuenta(rs.getInt("idCuenta"));
                listarCredito.add(nuevoCredito);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listarCredito;
    }
    
    @Override
    public Credito buscar(int id){
        String sql = "select * from Credito where idCredito = "+id;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nCredito.setIdCredito(rs.getInt("idCredito"));
                nCredito.setMontoCredito(rs.getDouble("montoCredito"));
                nCredito.setFechaHora(rs.getString("fechaHora"));
                nCredito.setInteresCredito(rs.getDouble("interesCredito"));
                nCredito.setIdCuenta(rs.getInt("idCuenta"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nCredito;
    }
    
    @Override
    public boolean agregar(Credito cre){
        String sql = "Insert into Credito(montoCredito, fechaHora, interesCredito, idCuenta) values('"+cre.getMontoCredito() +"','"+cre.getFechaHora() +"','"+cre.getInteresCredito() +"','"+cre.getIdCuenta()+"')";
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
    public boolean editar(Credito cre){
        String sql = "Update Credito set montoCredito ='"+cre.getMontoCredito()
                +"', fechaHora ='"+cre.getFechaHora()
                +"', interesCredito ='"+cre.getInteresCredito()
                +"', idCuenta ='"+cre.getIdCuenta()
                +"'where idCredito = "+cre.getIdCredito();
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
