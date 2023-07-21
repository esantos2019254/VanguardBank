
package interfaces;

import java.util.List;
import model.Login;

public interface LoginCRUD {
    
    public List listar();
    public Login buscar(int id);
    public boolean agregar(Login log);
    public boolean editar(Login log);
            
}