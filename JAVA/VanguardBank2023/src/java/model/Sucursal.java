package model;

/**
 *
 * @author okrun
 */
public class Sucursal {
    private int idSucursal;
    private String nombreSucursal;
    private String direccionSucursal;
    private String correoSucursal;
    private int idDepartamento;
    private int idProveedor;

    public Sucursal() {
    }

    public Sucursal(int idSucursal, String nombreSucursal, String direccionSucursal, String correoSucursal, int idDepartamento, int idProveedor) {
        this.idSucursal = idSucursal;
        this.nombreSucursal = nombreSucursal;
        this.direccionSucursal = direccionSucursal;
        this.correoSucursal = correoSucursal;
        this.idDepartamento = idDepartamento;
        this.idProveedor = idProveedor;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

    public String getNombreSucursal() {
        return nombreSucursal;
    }

    public void setNombreSucursal(String nombreSucursal) {
        this.nombreSucursal = nombreSucursal;
    }

    public String getDireccionSucursal() {
        return direccionSucursal;
    }

    public void setDireccionSucursal(String direccionSucursal) {
        this.direccionSucursal = direccionSucursal;
    }

    public String getCorreoSucursal() {
        return correoSucursal;
    }

    public void setCorreoSucursal(String correoSucursal) {
        this.correoSucursal = correoSucursal;
    }

    public int getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(int idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }
    
    
}
