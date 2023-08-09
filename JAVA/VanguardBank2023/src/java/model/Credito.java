package model;

public class Credito {
    private int idCredito;
    private double montoCredito;
    private String fechaHora;
    private double interesCredito;
    private int idCuenta;

    public Credito() {
    }

    public Credito(int idCredito, double montoCredito, String fechaHora, double interesCredito, int idCuenta) {
        this.idCredito = idCredito;
        this.montoCredito = montoCredito;
        this.fechaHora = fechaHora;
        this.interesCredito = interesCredito;
        this.idCuenta = idCuenta;
    }

    public int getIdCredito() {
        return idCredito;
    }

    public void setIdCredito(int idCredito) {
        this.idCredito = idCredito;
    }

    public double getMontoCredito() {
        return montoCredito;
    }

    public void setMontoCredito(double montoCredito) {
        this.montoCredito = montoCredito;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public double getInteresCredito() {
        return interesCredito;
    }

    public void setInteresCredito(double interesCredito) {
        this.interesCredito = interesCredito;
    }

    public int getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(int idCuenta) {
        this.idCuenta = idCuenta;
    }
    
    
}
