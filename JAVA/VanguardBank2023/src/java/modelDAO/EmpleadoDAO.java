/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDAO;

import configuration.Conexion;
import interfaces.EmpleadoCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Empleado;

/**
 *
 * @author bryan
 */
public class EmpleadoDAO implements EmpleadoCRUD {
    Conexion connect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Empleado empleado = new Empleado();
    
    @Override
    public List listarEmpleados() {
        ArrayList <Empleado> listaEmpleado = new ArrayList<>();
        String sql="Select * from Empleado";
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado nuevoEmpleado = new Empleado();
                nuevoEmpleado.setIdEmpleado(rs.getInt("idEmpleado"));
                nuevoEmpleado.setNombreEmpleado(rs.getString("nombreEmpleado"));
                nuevoEmpleado.setApellidoEmpleado(rs.getString("apellidoEmpleado"));
                nuevoEmpleado.setFechaContratacion(rs.getDate("fechaContratacion"));
                nuevoEmpleado.setDireccionEmpleado(rs.getString("direccionEmpleado"));
                nuevoEmpleado.setNumeroContactoEmpleado(rs.getString("numeroContactoEmpleado"));
                nuevoEmpleado.setIdTipoEmpleado(rs.getInt("idTipoEmpleado"));
                listaEmpleado.add(nuevoEmpleado);
            }
        } catch (Exception error) {
            error.printStackTrace();
        }
        return listaEmpleado;
    }

    @Override
    public Empleado buscarEmpleado(int idEmpleado) {
        String sql = "Select  * from Empleado where idEmpleado ="+idEmpleado;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                empleado.setIdEmpleado(rs.getInt("idEmpleado"));
                empleado.setNombreEmpleado(rs.getString("nombreEmpleado"));
                empleado.setApellidoEmpleado(rs.getString("apellidoEmpleado"));
                empleado.setFechaContratacion(rs.getDate("fechaContratacion"));
                empleado.setDireccionEmpleado(rs.getString("direccionEmpleado"));
                empleado.setNumeroContactoEmpleado(rs.getString("numeroContactoEmpleado"));
                empleado.setIdTipoEmpleado(rs.getInt("idTipoEmpleado"));
            }
        } catch (Exception error) {
            error.printStackTrace();
        }
        return empleado;
    }

    @Override
    public boolean agregarEmpleado(Empleado nuevoEmpleado) {
        String sql = "Insert into Empleado(nombreEmpleado,apellidoEmpleado,fechaContratacion"
                + ",direccionEmpleado,	numeroContactoEmpleado,idTipoEmpleado) values('"
                + nuevoEmpleado.getNombreEmpleado() +"','"+nuevoEmpleado.getApellidoEmpleado()
                + "','"+nuevoEmpleado.getFechaContratacion()+"','"+nuevoEmpleado.getDireccionEmpleado()
                + "','"+nuevoEmpleado.getNumeroContactoEmpleado()+"',"+nuevoEmpleado.getIdTipoEmpleado()+")";
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
    public boolean editarEmpleado(Empleado empleado) {
        String sql ="Update Empleado set nombreEmpleado ='"+empleado.getNombreEmpleado()+"', apellidoEmpleado='"+empleado.getApellidoEmpleado()
                +"',fechaContratacion='"+empleado.getFechaContratacion()+"',direccionEmpleado='"+empleado.getDireccionEmpleado()
                +"',numeroContactoEmpleado='"+empleado.getNumeroContactoEmpleado()+"',idTipoEmpleado='"+empleado.getIdTipoEmpleado()
                +"' where idEmpleado ="+empleado.getIdEmpleado()+";";
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
    public void eliminarEmpleado(int idEmpleado){
        String sql = "Delete from Empleado where idEmpleado ="+idEmpleado;
        try {
            con = connect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
