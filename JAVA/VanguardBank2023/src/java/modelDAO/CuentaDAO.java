/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDAO;

import configuration.Conexion;
import interfaces.CuentaCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Cuenta;

/**
 *
 * @author bryan
 */
public class CuentaDAO implements CuentaCRUD{
    Conexion conexion = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Cuenta cuenta = new Cuenta();
    
    @Override
    public List listarCuentas() {
        ArrayList <Cuenta> lista = new ArrayList<>();
        String sql= "Select idCuenta as Id_Cuenta, "
                +"numeroCuenta as Número_Cuenta,saldoCuenta as Saldo, " 
                +"tipoCuenta as TipoCuenta," 
                +"fechaApertura as Fecha_Apertura, " 
                +"DPI as DPI, " 
                +"idEmpleado as Id_Empleado, " 
                +"idTipoMoneda as Id_Tipo_Moneda, " 
                +"idSucursal as Id_Sucursal from Cuenta;";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cuenta nuevaCuenta = new Cuenta();
                nuevaCuenta.setIdCuenta(rs.getInt("Id_Cuenta"));
                nuevaCuenta.setNumeroCuenta(rs.getLong("Número_Cuenta"));
                nuevaCuenta.setSaldoCuenta(rs.getDouble("Saldo"));
                nuevaCuenta.setTipoCuenta(rs.getString("TipoCuenta"));
                nuevaCuenta.setFechaApertura(rs.getDate("Fecha_Apertura"));
                nuevaCuenta.setDPI(rs.getLong("DPI"));
                nuevaCuenta.setIdEmpleado(rs.getInt("Id_Empleado"));
                nuevaCuenta.setIdTipoMoneda(rs.getInt("Id_Tipo_Moneda"));
                nuevaCuenta.setIdSucursal(rs.getInt("Id_Sucursal"));
                lista.add(nuevaCuenta);
            }
        } catch (Exception error) {
            error.printStackTrace();
        }
        return lista;
    }

    @Override
    public boolean agregarCuenta(Cuenta nuevaCuenta) {
        String sql = "insert into Cuenta(numeroCuenta, saldoCuenta, tipoCuenta, fechaApertura, DPI, idEmpleado, idTipoMoneda, idSucursal) \n" +
                "values("+nuevaCuenta.getNumeroCuenta()+","+nuevaCuenta.getSaldoCuenta()
                +",'"+nuevaCuenta.getTipoCuenta()+"','"+nuevaCuenta.getFechaApertura()
                +"',"+nuevaCuenta.getDPI()+","+nuevaCuenta.getIdEmpleado()
                +","+nuevaCuenta.getIdTipoMoneda()+","+nuevaCuenta.getIdSucursal()+")";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception error) {
            error.printStackTrace();
        }
        return false;
    }

    @Override
    public Cuenta buscarCuenta(int numCuenta) {
        String sql = "Select idCuenta as Id_Cuenta,numeroCuenta as Número_Cuenta,"
                + "saldoCuenta as Saldo,tipoCuenta as TipoCuenta,fechaApertura as Fecha_Apertura,"
                + "DPI as DPI,idEmpleado as Id_Empleado,idTipoMoneda as Id_Tipo_Moneda,"
                + "idSucursal as Id_Sucursal from Cuenta where idCuenta =" + numCuenta;
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cuenta.setIdCuenta(rs.getInt("Id_Cuenta"));
                cuenta.setNumeroCuenta(rs.getLong("Número_Cuenta"));
                cuenta.setSaldoCuenta(rs.getDouble("Saldo"));
                cuenta.setTipoCuenta(rs.getString("TipoCuenta"));
                cuenta.setFechaApertura(rs.getDate("Fecha_Apertura"));
                cuenta.setDPI(rs.getLong("DPI"));
                cuenta.setIdEmpleado(rs.getInt("Id_Empleado"));
                cuenta.setIdTipoMoneda(rs.getInt("Id_Tipo_Moneda"));
                cuenta.setIdSucursal(rs.getInt("Id_Sucursal"));
            }
        }catch (Exception error) {
            error.printStackTrace();
        }
        return cuenta;
    }
    
    public Cuenta buscarCuentaDPI(long numCuenta) {
        String sql = "Select idCuenta as Id_Cuenta,numeroCuenta as Número_Cuenta,"
                + "saldoCuenta as Saldo,tipoCuenta as TipoCuenta,fechaApertura as Fecha_Apertura,"
                + "DPI as DPI,idEmpleado as Id_Empleado,idTipoMoneda as Id_Tipo_Moneda,"
                + "idSucursal as Id_Sucursal from Cuenta where numeroCuenta =" + numCuenta;
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cuenta.setIdCuenta(rs.getInt("Id_Cuenta"));
                cuenta.setNumeroCuenta(rs.getLong("Número_Cuenta"));
                cuenta.setSaldoCuenta(rs.getDouble("Saldo"));
                cuenta.setTipoCuenta(rs.getString("TipoCuenta"));
                cuenta.setFechaApertura(rs.getDate("Fecha_Apertura"));
                cuenta.setDPI(rs.getLong("DPI"));
                cuenta.setIdEmpleado(rs.getInt("Id_Empleado"));
                cuenta.setIdTipoMoneda(rs.getInt("Id_Tipo_Moneda"));
                cuenta.setIdSucursal(rs.getInt("Id_Sucursal"));
            }
        }catch (Exception error) {
            error.printStackTrace();
        }
        return cuenta;
    }

    @Override
    public boolean editarCuenta(Cuenta cuenta) {
        String sql = "Update Cuenta set saldoCuenta ='"+cuenta.getSaldoCuenta()
                + "',tipoCuenta = '"+cuenta.getTipoCuenta()
                + "',fechaApertura = '"+cuenta.getFechaApertura()
                + "',DPI = '"+cuenta.getDPI()
                + "',idEmpleado = '"+cuenta.getIdEmpleado()
                + "',idTipoMoneda = '"+cuenta.getIdTipoMoneda()
                + "',idSucursal ='"+cuenta.getIdSucursal()
                + "' where idCuenta ='" + cuenta.getIdCuenta()+"';";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception error) {
            error.printStackTrace();
        }
        return false;
    }
    
    @Override
    public void eliminarCuenta(long numCuenta) {
        String sql = "Delete from Cuenta where numeroCuenta = "+numCuenta;
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
