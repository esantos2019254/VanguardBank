/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author bryan
 */
public class Empleado {
    private int idEmpleado;
    private String nombreEmpleado;
    private String apellidoEmpleado;
    private Date fechaContratacion;
    private String direccionEmpleado;
    private String numeroContactoEmpleado;
    private String userEmpleado;
    private String passwordEmpleado;
    private int idTipoEmpleado;

    public Empleado() {
    }

    public Empleado(int idEmpleado, String nombreEmpleado, String apellidoEmpleado, Date fechaContratacion, String direccionEmpleado, String numeroContactoEmpleado, String userEmpleado, String passwordEmpleado, int idTipoEmpleado) {
        this.idEmpleado = idEmpleado;
        this.nombreEmpleado = nombreEmpleado;
        this.apellidoEmpleado = apellidoEmpleado;
        this.fechaContratacion = fechaContratacion;
        this.direccionEmpleado = direccionEmpleado;
        this.numeroContactoEmpleado = numeroContactoEmpleado;
        this.userEmpleado = userEmpleado;
        this.passwordEmpleado = passwordEmpleado;
        this.idTipoEmpleado = idTipoEmpleado;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getNombreEmpleado() {
        return nombreEmpleado;
    }

    public void setNombreEmpleado(String nombreEmpleado) {
        this.nombreEmpleado = nombreEmpleado;
    }

    public String getApellidoEmpleado() {
        return apellidoEmpleado;
    }

    public void setApellidoEmpleado(String apellidoEmpleado) {
        this.apellidoEmpleado = apellidoEmpleado;
    }

    public Date getFechaContratacion() {
        return fechaContratacion;
    }

    public void setFechaContratacion(Date fechaContratacion) {
        this.fechaContratacion = fechaContratacion;
    }

    public String getDireccionEmpleado() {
        return direccionEmpleado;
    }

    public void setDireccionEmpleado(String direccionEmpleado) {
        this.direccionEmpleado = direccionEmpleado;
    }

    public String getNumeroContactoEmpleado() {
        return numeroContactoEmpleado;
    }

    public void setNumeroContactoEmpleado(String numeroContactoEmpleado) {
        this.numeroContactoEmpleado = numeroContactoEmpleado;
    }

    public String getUserEmpleado() {
        return userEmpleado;
    }

    public void setUserEmpleado(String userEmpleado) {
        this.userEmpleado = userEmpleado;
    }

    public String getPasswordEmpleado() {
        return passwordEmpleado;
    }

    public void setPasswordEmpleado(String passwordEmpleado) {
        this.passwordEmpleado = passwordEmpleado;
    }

    public int getIdTipoEmpleado() {
        return idTipoEmpleado;
    }

    public void setIdTipoEmpleado(int idTipoEmpleado) {
        this.idTipoEmpleado = idTipoEmpleado;
    }

    
    
    @Override
    public String toString() {
        return "Empleado{" + "idEmpleado=" + idEmpleado + ", nombreEmpleado=" + nombreEmpleado + ", apellidoEmpleado=" + apellidoEmpleado + ", fechaContratacion=" + fechaContratacion + ", direccionEmpleado=" + direccionEmpleado + ", numeroContactoEmpleado=" + numeroContactoEmpleado + ", idTipoEmpleado=" + idTipoEmpleado + '}';
    }
}
