package interfaces;

import java.util.List;
import model.Credito;

public interface CreditoCRUD {
    
    public List listar();
    public Credito buscar(int id);
    public boolean agregar(Credito cre);
    public boolean editar(Credito cre);
}
