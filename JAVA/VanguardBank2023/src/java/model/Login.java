package model;

import java.time.LocalDateTime;




public class Login {
    
    private int idUser;
    private String nombreUsuario;
    private String passwordUsuario;
    private String horaSesion;
    private int idCuenta;

    public Login() {
    }

    public Login(int idUser, String nombreUsuario, String passwordUsuario, String horaSesion, int idCuenta) {
        this.idUser = idUser;
        this.nombreUsuario = nombreUsuario;
        this.passwordUsuario = passwordUsuario;
        this.horaSesion = horaSesion;
        this.idCuenta = idCuenta;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPasswordUsuario() {
        return passwordUsuario;
    }

    public void setPasswordUsuario(String passwordUsuario) {
        this.passwordUsuario = passwordUsuario;
    }

    public String getHoraSesion() {
        return horaSesion;
    }

    public void setHoraSesion(String horaSesion) {
        this.horaSesion = horaSesion;
    }

    public int getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(int idCuenta) {
        this.idCuenta = idCuenta;
    }

}
