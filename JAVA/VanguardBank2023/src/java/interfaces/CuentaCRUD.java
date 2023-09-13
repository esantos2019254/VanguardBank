/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import model.Cuenta;

public interface CuentaCRUD {
    public List listarCuentas();
    public boolean agregarCuenta(Cuenta nuevaCuenta);
    public Cuenta buscarCuenta(long numCuenta);
    public boolean editarCuenta(Cuenta cuenta);
    public void eliminarCuenta(long numCuenta);
}
