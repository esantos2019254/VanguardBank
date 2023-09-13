/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import model.HistorialDeTransacciones;

/**
 *
 * @author Usuario
 */
public interface HistorialDeTransaccionesCRUD {

    public List listar();

    public HistorialDeTransacciones buscar(int Id);

    public boolean agregar(HistorialDeTransacciones histo);

    public boolean editar(HistorialDeTransacciones histo);

    public void eliminar(int HistorialDeTransacciones);

}
