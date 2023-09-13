
package interfaces;

import java.util.List;
import model.Deposito;

public interface DepositoCRUD {
    
    public List listar();
    public Deposito buscar(int id);
    public boolean agregar(Deposito dep);
    public boolean editar(Deposito dep);
    public void eliminar(int id);
}
