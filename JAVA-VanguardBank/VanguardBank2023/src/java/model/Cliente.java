
package model;

public class Cliente {
    
    private Long DPI;
    private String nombreCliente;
    private String apellidoCliente;
    private String telefonoContacto;
    private String direccionCliente;
    private String generoCliente;
    
    public Cliente(){
        
    }

    public Cliente(Long DPI, String nombreCliente, String apellidoCliente, String telefonoContacto, String direccionCliente, String generoCliente) {
        this.DPI = DPI;
        this.nombreCliente = nombreCliente;
        this.apellidoCliente = apellidoCliente;
        this.telefonoContacto = telefonoContacto;
        this.direccionCliente = direccionCliente;
        this.generoCliente = generoCliente;
    }

    public Long getDPI() {
        return DPI;
    }

    public void setDPI(Long DPI) {
        this.DPI = DPI;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getApellidoCliente() {
        return apellidoCliente;
    }

    public void setApellidoCliente(String apellidoCliente) {
        this.apellidoCliente = apellidoCliente;
    }

    public String getTelefonoContacto() {
        return telefonoContacto;
    }

    public void setTelefonoContacto(String telefonoContacto) {
        this.telefonoContacto = telefonoContacto;
    }

    public String getDireccionCliente() {
        return direccionCliente;
    }

    public void setDireccionCliente(String direccionCliente) {
        this.direccionCliente = direccionCliente;
    }

    public String getGeneroCliente() {
        return generoCliente;
    }

    public void setGeneroCliente(String generoCliente) {
        this.generoCliente = generoCliente;
    }
    
}
