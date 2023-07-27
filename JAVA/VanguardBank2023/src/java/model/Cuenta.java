package model;

import java.sql.Date;

public class Cuenta {
    private int idCuenta;
    private long numeroCuenta;
    private double saldoCuenta;
    private String tipoCuenta;
    private Date fechaApertura;
    private long DPI;
    private int idEmpleado;
    private int idTipoMoneda;
    private int idSucursal;

    public Cuenta() {
    }

    public Cuenta(int idCuenta, long numeroCuenta, double saldoCuenta, String tipoCuenta, Date fechaApertura, long DPI, int idEmpleado, int idTipoMoneda, int idSucursal) {
        this.idCuenta = idCuenta;
        this.numeroCuenta = numeroCuenta;
        this.saldoCuenta = saldoCuenta;
        this.tipoCuenta = tipoCuenta;
        this.fechaApertura = fechaApertura;
        this.DPI = DPI;
        this.idEmpleado = idEmpleado;
        this.idTipoMoneda = idTipoMoneda;
        this.idSucursal = idSucursal;
    }

    public int getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(int idCuenta) {
        this.idCuenta = idCuenta;
    }

    public long getNumeroCuenta() {
        return numeroCuenta;
    }

    public void setNumeroCuenta(long numeroCuenta) {
        this.numeroCuenta = numeroCuenta;
    }

    public double getSaldoCuenta() {
        return saldoCuenta;
    }

    public void setSaldoCuenta(double saldoCuenta) {
        this.saldoCuenta = saldoCuenta;
    }

    public String getTipoCuenta() {
        return tipoCuenta;
    }

    public void setTipoCuenta(String tipoCuenta) {
        this.tipoCuenta = tipoCuenta;
    }

    public Date getFechaApertura() {
        return fechaApertura;
    }

    public void setFechaApertura(Date fechaApertura) {
        this.fechaApertura = fechaApertura;
    }

    public long getDPI() {
        return DPI;
    }

    public void setDPI(long DPI) {
        this.DPI = DPI;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getIdTipoMoneda() {
        return idTipoMoneda;
    }

    public void setIdTipoMoneda(int idTipoMoneda) {
        this.idTipoMoneda = idTipoMoneda;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }
}
