package modelDAO;

import configuration.Conexion;
import interfaces.LoginCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Empleado;
import model.Login;

public class LoginDAO implements LoginCRUD {
    
    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Login nLogin = new Login();
    
    public Login validar(String nombreUsuario, String passwordUsuario) {
        
        Login login = new Login();
        String sql = "select * from Login where nombreUsuario = ? and passwordUsuario = ?";
        
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombreUsuario);
            ps.setString(2, passwordUsuario);
            rs = ps.executeQuery();
            while (rs.next()) {
                login.setIdUser(rs.getInt("idUser"));
                login.setNombreUsuario(rs.getString("nombreUsuario"));
                login.setPasswordUsuario(rs.getString("passwordUsuario"));
                login.setHoraSesion(rs.getString("horaSesion"));
                login.setIdCuenta(rs.getInt("idCuenta"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return login;
    }
    
    public Empleado validarEmpleado(String nombreUsuario, String passwordUsuario) {
        
        Empleado empleado = new Empleado();
        String sql = "select * from Empleado where userEmpleado = ? and passwordEmpleado = ?";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombreUsuario);
            ps.setString(2, passwordUsuario);
            rs = ps.executeQuery();
            while (rs.next()) {
                empleado.setIdEmpleado(rs.getInt(1));
                empleado.setNombreEmpleado(rs.getString(2));
                empleado.setApellidoEmpleado(rs.getString(3));
                empleado.setFechaContratacion(rs.getDate(4));
                empleado.setDireccionEmpleado(rs.getString(5));
                empleado.setNumeroContactoEmpleado(rs.getString(6));
                empleado.setUserEmpleado(rs.getString(7));
                empleado.setPasswordEmpleado(rs.getString(8));
                empleado.setIdTipoEmpleado(rs.getInt(9));
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return empleado;
    }
    
    @Override
    public List listar() {
        ArrayList<Login> listaLogin = new ArrayList<>();
        String sql = "select * from Login";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Login nuevoLogin = new Login();
                nuevoLogin.setIdUser(rs.getInt("idUser"));
                nuevoLogin.setNombreUsuario(rs.getString("nombreUsuario"));
                nuevoLogin.setPasswordUsuario(rs.getString("passwordUsuario"));
                nuevoLogin.setHoraSesion(rs.getString("horaSesion"));
                nuevoLogin.setIdCuenta(rs.getInt("idCuenta"));
                listaLogin.add(nuevoLogin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaLogin;
    }
    
    @Override
    public Login buscar(int id) {
        String sql = "Select * from Login where idUser=" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nLogin.setIdUser(rs.getInt("idUser"));
                nLogin.setNombreUsuario(rs.getString("nombreUsuario"));
                nLogin.setPasswordUsuario(rs.getString("passwordUsuario"));
                nLogin.setHoraSesion(rs.getString("horaSesion"));
                nLogin.setIdCuenta(rs.getInt("idCuenta"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nLogin;
    }
    
    @Override
    public boolean agregar(Login log) {
        String sql = "insert into Login(idUser, nombreUsuario, passwordUsuario, horaSesion, idCuenta) values('"
                + log.getIdUser() + "','" + log.getNombreUsuario() + "','" + log.getPasswordUsuario() + "','" + log.getHoraSesion()
                + "','" + log.getIdCuenta() + "')";
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
    public boolean editar(Login log) {
        String sql = "Update Cliente set nombreUsuario ='" + log.getNombreUsuario() + "', passwordUsuario = '" + log.getPasswordUsuario()
                + "', horaSesion = '" + log.getIdCuenta() + "' where DPI = " + log.getIdCuenta();
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
