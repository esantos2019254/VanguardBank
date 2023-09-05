package configuration;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    Connection conexion;

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVanguardBank?useSSL=false", "root", "admin");
            //conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBVanguardBank?useSSL=false", "quinto", "admin");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("La conexión no se pudo establecer" + e.getMessage());

        }
    }

    public Connection getConnection() {
        return conexion;
    }
}
