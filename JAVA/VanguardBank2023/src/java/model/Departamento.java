package model;

import java.sql.Date;

public class Departamento {

        private int idDepartamento;
        private String nombreDepartamento;
        private String codigoPostal;
        private Date fechaApertura;

    public Departamento() {
    }

    public Departamento(int idDepartamento, String nombreDepartamento, String codigoPostal, Date fechaApertura) {
        this.idDepartamento = idDepartamento;
        this.nombreDepartamento = nombreDepartamento;
        this.codigoPostal = codigoPostal;
        this.fechaApertura = fechaApertura;
    }

    public int getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(int idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public String getNombreDepartamento() {
        return nombreDepartamento;
    }

    public void setNombreDepartamento(String nombreDepartamento) {
        this.nombreDepartamento = nombreDepartamento;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public Date getFechaApertura() {
        return fechaApertura;
    }

    public void setFechaApertura(Date fechaApertura) {
        this.fechaApertura = fechaApertura;
    }
        
        
}
