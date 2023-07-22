package model;

/**
 *
 * @author Luis Rodrigo
 */
public class HistorialDeTransacciones {

    private int idHistorialTransaccion;
    private int idCuenta;
    private int idTransaccion;

    public HistorialDeTransacciones() {
    }

    public HistorialDeTransacciones(int idHistorialTransaccion, int idCuenta, int idTransaccion) {
        this.idHistorialTransaccion = idHistorialTransaccion;
        this.idCuenta = idCuenta;
        this.idTransaccion = idTransaccion;
    }

    public int getIdHistorialTransaccion() {
        return idHistorialTransaccion;
    }

    public void setIdHistorialTransaccion(int idHistorialTransaccion) {
        this.idHistorialTransaccion = idHistorialTransaccion;
    }

    public int getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(int idCuenta) {
        this.idCuenta = idCuenta;
    }

    public int getIdTransaccion() {
        return idTransaccion;
    }

    public void setIdTransaccion(int idTransaccion) {
        this.idTransaccion = idTransaccion;
    }

}
