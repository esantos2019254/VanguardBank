package interfaces;

import java.util.List;
import model.TipoEmpleado;

public interface TipoEmpleadoCRUD {
    public List listar();
    public TipoEmpleado buscar(int id);
    public boolean agregar(TipoEmpleado TipEm);
    public boolean editar(TipoEmpleado TipEm);
    public void eliminar(int idTip);
}
