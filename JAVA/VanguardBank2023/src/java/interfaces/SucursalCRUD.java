package interfaces;

import java.util.List;
import model.Sucursal;

/**
 *
 * @author okrun
 */
public interface SucursalCRUD {
    public List listar();
    public Sucursal buscar(int id);
    public boolean agregar(Sucursal dep);
    public boolean editar(Sucursal dep);
    public boolean eliminar(int id);
}
