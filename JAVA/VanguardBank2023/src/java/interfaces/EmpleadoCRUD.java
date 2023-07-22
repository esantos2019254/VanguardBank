/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import model.Empleado;

/**
 *
 * @author bryan
 */
public interface EmpleadoCRUD {
    public List listarEmpleados();
    public Empleado buscarEmpleado(int idEmpleado);
    public boolean agregarEmpleado(Empleado nuevoEmpleado);
    public boolean editarEmpleado(Empleado empleado);
}
