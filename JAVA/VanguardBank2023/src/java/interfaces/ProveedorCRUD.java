
package interfaces;

import java.util.List;
import model.Proveedor;


public interface ProveedorCRUD {
    
    public List listar();
    public Proveedor buscar(int id);
    public boolean agregar(Proveedor pro);
    public boolean editar(Proveedor pro);
}
