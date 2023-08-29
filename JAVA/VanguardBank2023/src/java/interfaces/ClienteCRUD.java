
package interfaces;

import java.util.List;
import model.Cliente;

public interface ClienteCRUD {
    
    public List listar();
    public Cliente buscar(Long id);
    public boolean agregar(Cliente cli);
    public boolean editar(Cliente cli);
    public boolean eliminar(Long dpi);
    
}
