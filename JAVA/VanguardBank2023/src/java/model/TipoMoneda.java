package model;


public class TipoMoneda {
    private int idTipoMoneda ;
    private String simboloMoneda ;
    private String nombreMoneda;
    private Double conversionDolar;

    public TipoMoneda() {
    }

    public TipoMoneda(int idTipoMoneda, String simboloMoneda, String nombreMoneda, Double conversionDolar) {
        this.idTipoMoneda = idTipoMoneda;
        this.simboloMoneda = simboloMoneda;
        this.nombreMoneda = nombreMoneda;
        this.conversionDolar = conversionDolar;
    }

    public int getIdTipoMoneda() {
        return idTipoMoneda;
    }

    public void setIdTipoMoneda(int idTipoMoneda) {
        this.idTipoMoneda = idTipoMoneda;
    }

    public String getSimboloMoneda() {
        return simboloMoneda;
    }

    public void setSimboloMoneda(String simboloMoneda) {
        this.simboloMoneda = simboloMoneda;
    }

    public String getNombreMoneda() {
        return nombreMoneda;
    }

    public void setNombreMoneda(String nombreMoneda) {
        this.nombreMoneda = nombreMoneda;
    }

    public Double getConversionDolar() {
        return conversionDolar;
    }

    public void setConversionDolar(Double conversionDolar) {
        this.conversionDolar = conversionDolar;
    }

    public void setConversionDolar(String conversion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
