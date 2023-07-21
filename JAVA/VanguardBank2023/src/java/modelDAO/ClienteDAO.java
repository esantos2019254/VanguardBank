
package modelDAO;

import configuration.Conexion;
import interfaces.ClienteCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Cliente;

public class ClienteDAO implements ClienteCRUD{
    
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Cliente nCliente = new Cliente();

    @Override
    public List listar() {
        ArrayList<Cliente> listaCliente = new ArrayList<>();
        String sql = "select * from Cliente";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Cliente nuevoCliente = new Cliente();
                nuevoCliente.setDPI(rs.getLong("DPI"));
                nuevoCliente.setNombreCliente(rs.getString("nombreCliente"));
                nuevoCliente.setApellidoCliente(rs.getString("apellidoCliente"));
                nuevoCliente.setTelefonoContacto(rs.getString("telefonoContacto"));
                nuevoCliente.setDireccionCliente(rs.getString("direccionCliente"));
                nuevoCliente.setGeneroCliente(rs.getString("generoCliente"));
                listaCliente.add(nuevoCliente);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaCliente;
    }

    @Override
    public Cliente buscar(Long id) {
        String sql = "Select * from Cliente where DPI =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                nCliente.setDPI(rs.getLong("DPI"));
                nCliente.setNombreCliente(rs.getString("nombreCliente"));
                nCliente.setApellidoCliente(rs.getString("apellidoCliente"));
                nCliente.setTelefonoContacto(rs.getString("telefonoContacto"));
                nCliente.setDireccionCliente(rs.getString("direccionCliente"));
                nCliente.setGeneroCliente(rs.getString("generoCliente"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nCliente;
    }

    @Override
    public boolean agregar(Cliente cli) {
        String sql = "insert into Cliente(DPI, nombreCliente, apellidoCliente, telefonoContacto, direccionCliente, generoCliente) values('"
                                        +cli.getDPI()+"','"+cli.getNombreCliente()+"','"+cli.getApellidoCliente()+"','"+cli.getTelefonoContacto()
                                        +"','"+cli.getDireccionCliente()+"','"+cli.getGeneroCliente()+"')";
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
    public boolean editar(Cliente cli) {
// Update Cliente set nombreCliente = 'AAA', apellidoCliente = 'bbb', telefonoContacto = '158478', direccionCliente = 'dfdf', generoCliente = 'ff' where DPI = 1879451248101;
        String sql = "Update Cliente set nombreCliente = '"+cli.getNombreCliente()+"', apellidoCliente = '"+cli.getApellidoCliente()
                            +"', telefonoContacto = '"+cli.getTelefonoContacto()+"', direccionCliente = '"+cli.getDireccionCliente()
                            +"', generoCliente = '"+cli.getGeneroCliente()+"' where DPI = " + cli.getDPI();
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
