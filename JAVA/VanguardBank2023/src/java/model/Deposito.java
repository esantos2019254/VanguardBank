
package model;

public class Deposito {

    private int idDeposito;
    private double montoDeposito;
    private String fechaDeposito;
    private String horaDeposito;
    private int idCuentaOrigen;
    private int idCuentaDeposito;

    public Deposito(){
    
    }
    
    public Deposito(int idDeposito, double montoDeposito, String fechaDeposito, String horaDeposito, int idCuentaOrigen, int idCuentaDeposito) {
        this.idDeposito = idDeposito;
        this.montoDeposito = montoDeposito;
        this.fechaDeposito = fechaDeposito;
        this.horaDeposito = horaDeposito;
        this.idCuentaOrigen = idCuentaOrigen;
        this.idCuentaDeposito = idCuentaDeposito;
    }

    public int getIdDeposito() {
        return idDeposito;
    }

    public void setIdDeposito(int idDeposito) {
        this.idDeposito = idDeposito;
    }

    public double getMontoDeposito() {
        return montoDeposito;
    }

    public void setMontoDeposito(double montoDeposito) {
        this.montoDeposito = montoDeposito;
    }

    public String getFechaDeposito() {
        return fechaDeposito;
    }

    public void setFechaDeposito(String fechaDeposito) {
        this.fechaDeposito = fechaDeposito;
    }

    public String getHoraDeposito() {
        return horaDeposito;
    }

    public void setHoraDeposito(String horaDeposito) {
        this.horaDeposito = horaDeposito;
    }

    public int getIdCuentaOrigen() {
        return idCuentaOrigen;
    }

    public void setIdCuentaOrigen(int idCuentaOrigen) {
        this.idCuentaOrigen = idCuentaOrigen;
    }

    public int getIdCuentaDeposito() {
        return idCuentaDeposito;
    }

    public void setIdCuentaDeposito(int idCuentaDeposito) {
        this.idCuentaDeposito = idCuentaDeposito;
    }
    
}
