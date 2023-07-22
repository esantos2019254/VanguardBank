
package model;


public class TipoEmpleado {
    private int idTipoEmpleado;
    private String nombreTipoPuesto;
    private String salarioTipoEmpleado;
    private String contratoTipoEmpleado;

    public TipoEmpleado() {
    }

    public TipoEmpleado(int idTipoEmpleado, String nombreTipoPuesto, String salarioTipoEmpleado, String contratoTipoEmpleado) {
        this.idTipoEmpleado = idTipoEmpleado;
        this.nombreTipoPuesto = nombreTipoPuesto;
        this.salarioTipoEmpleado = salarioTipoEmpleado;
        this.contratoTipoEmpleado = contratoTipoEmpleado;
    }

    public int getIdTipoEmpleado() {
        return idTipoEmpleado;
    }

    public void setIdTipoEmpleado(int idTipoEmpleado) {
        this.idTipoEmpleado = idTipoEmpleado;
    }

    public String getNombreTipoPuesto() {
        return nombreTipoPuesto;
    }

    public void setNombreTipoPuesto(String nombreTipoPuesto) {
        this.nombreTipoPuesto = nombreTipoPuesto;
    }

    public String getSalarioTipoEmpleado() {
        return salarioTipoEmpleado;
    }

    public void setSalarioTipoEmpleado(String salarioTipoEmpleado) {
        this.salarioTipoEmpleado = salarioTipoEmpleado;
    }

    public String getContratoTipoEmpleado() {
        return contratoTipoEmpleado;
    }

    public void setContratoTipoEmpleado(String contratoTipoEmpleado) {
        this.contratoTipoEmpleado = contratoTipoEmpleado;
    }
    
}
