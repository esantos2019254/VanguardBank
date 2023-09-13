package modelDAO;

import configuration.Conexion;
import interfaces.LoginCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
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
