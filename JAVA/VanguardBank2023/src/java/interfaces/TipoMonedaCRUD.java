
package interfaces;

import java.util.List;
import model.TipoMoneda;

public interface TipoMonedaCRUD {
    public List listar();
    public TipoMoneda buscar(int id);
    public boolean agregar(TipoMoneda tipo);
    public boolean editar(TipoMoneda tipo);
    
}
