package model;

/**
 *
 * @author okrun
 */
public class Servicio {
    private int idServicio;
    private String tipoServicio;
    private String correlativo;
    private String whatIs;
    private double montoServicio;
    private int idCuenta;
    

    public Servicio() {
    }

    public Servicio(int idServicio, String tipoServicio, String correlativo, double montoServicio, int idCuenta, String whatIs) {
        this.idServicio = idServicio;
        this.tipoServicio = tipoServicio;
        this.correlativo = correlativo;
        this.montoServicio = montoServicio;
        this.idCuenta = idCuenta;
        this.whatIs = whatIs;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public String getTipoServicio() {
        return tipoServicio;
    }

    public void setTipoServicio(String tipoServicio) {
        this.tipoServicio = tipoServicio;
    }

    public String getCorrelativo() {
        return correlativo;
    }

    public void setCorrelativo(String correlativo) {
        this.correlativo = correlativo;
    }

    public double getMontoServicio() {
        return montoServicio;
    }

    public void setMontoServicio(double montoServicio) {
        this.montoServicio = montoServicio;
    }

    public int getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(int idCuenta) {
        this.idCuenta = idCuenta;
    }

    public String getWhatIs() {
        return whatIs;
    }

    public void setWhatIs(String whatIs) {
        this.whatIs = whatIs;
    }

    
    
    
}
