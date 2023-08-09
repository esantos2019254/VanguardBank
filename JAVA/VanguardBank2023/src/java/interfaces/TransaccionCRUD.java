package interfaces;

import java.util.List;
import model.Transaccion;

public interface TransaccionCRUD {
    public List listar();
    public Transaccion buscar(int id);
    public boolean agregar(Transaccion trn);
    public boolean editar(Transaccion trn);
}
