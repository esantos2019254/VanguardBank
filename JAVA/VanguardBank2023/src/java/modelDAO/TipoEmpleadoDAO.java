package modelDAO;

import configuration.Conexion;
import interfaces.TipoEmpleadoCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.TipoEmpleado;


public class TipoEmpleadoDAO implements TipoEmpleadoCRUD {
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    TipoEmpleado nTipoEmpleado = new TipoEmpleado();
    
    @Override
    public List listar() {
       ArrayList<TipoEmpleado> listaTipoEmpleado = new ArrayList<>();
       String sql = "select * from tipoEmpleado";
       try{
           con = conect.getConnection();
           ps = con.prepareStatement(sql);
           rs = ps.executeQuery();
           while (rs.next()){
               TipoEmpleado nuevoTipoEmpleado = new TipoEmpleado();
               nuevoTipoEmpleado.setIdTipoEmpleado(rs.getInt("idTipoEmpleado"));
               nuevoTipoEmpleado.setNombreTipoPuesto(rs.getString("nombreTipoPuesto"));
               nuevoTipoEmpleado.setContratoTipoEmpleado(rs.getString("contratoTipoEmpleado"));
               nuevoTipoEmpleado.setSalarioTipoEmpleado(rs.getString("salarioTipoEmpleado"));
               listaTipoEmpleado.add(nuevoTipoEmpleado);
           }
       }catch(Exception e){
           e.printStackTrace();

       }
       return listaTipoEmpleado;
    }

    @Override
    public TipoEmpleado buscar(int id) {
        String sql = "select * from TipoEmpleado where idTipoEmpleado = "+ id;
        try{
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                nTipoEmpleado.setIdTipoEmpleado(rs.getInt("idTipoEmpleado"));
                nTipoEmpleado.setNombreTipoPuesto(rs.getString("nombreTipoPuesto"));
                nTipoEmpleado.setContratoTipoEmpleado(rs.getString("contratoTipoEmpleado"));
                nTipoEmpleado.setSalarioTipoEmpleado(rs.getString("salarioTipoEmpleado"));
            }
        }catch(Exception e){
            e.printStackTrace();
        
        }
        return nTipoEmpleado;
    }

    @Override
    public boolean agregar(TipoEmpleado TipEm) {
         String sql = "Insert into TipoEmpleado(nombreTipoPuesto, contratoTipoEmpleado, salarioTipoEmpleado) values('"
                            +TipEm.getNombreTipoPuesto()+"','"+TipEm.getContratoTipoEmpleado()+"','"+TipEm.getSalarioTipoEmpleado()+"')";
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
    public boolean editar(TipoEmpleado TipEm) {
       String sql = "Update TipoEmpleado set nombreTipoPuesto = '"+TipEm.getNombreTipoPuesto()+"', contratoTipoEmpleado = '"
               +TipEm.getContratoTipoEmpleado()+"', salarioTipoEmpleado = '"+TipEm.getSalarioTipoEmpleado()+"' where idTipoEmpleado = " + TipEm.getIdTipoEmpleado();
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
    public void eliminar(int idTip){
        String sql = "delete from TipoEmpleado where idTipoEmpleado =" +idTip;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
