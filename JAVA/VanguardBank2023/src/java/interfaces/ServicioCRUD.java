package interfaces;

import java.util.List;
import model.Servicio;

/**
 *
 * @author okrun
 */
public interface ServicioCRUD {
    
    public List listar();
    public Servicio buscar(int id);
    public boolean agregar(Servicio ser);
    public boolean editar(Servicio ser);
    public boolean eliminar(int id);
}
