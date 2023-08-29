package interfaces;

import java.util.List;
import model.Departamento;

public interface DepartamentoCRUD {

    public List listar();

    public Departamento buscar(int id);

    public boolean agregar(Departamento depa);

    public boolean editar(Departamento depa);
    
    public void eliminar(int id);
}
