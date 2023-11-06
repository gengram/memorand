package Conect;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class Connect<T> implements Serializable 
{
    
    // PARÁMETROS CONEXIÓN
    public static String user = "root";
    public static String password = "n0m3l0";
    public static String db = "memorand";
    public static String port = "3306";
    
    // VERIFICA QUE EL DRIVER DE MYSQL FUNCIONE
    public boolean testDriver() 
    {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            return true;
        } 
        catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    // CONEXIÓN CON LA BASE DE DATOS
    public Connection getConnection(String user, String password, String db, String server) 
    {
        String url = null;
        
        if (user == null || password == null || db == null || server == null) {
            return null;
        }
        
        if ("".equals(user) || "".equals(password) || "".equals(db) || "".equals(server)) {
            return null;
        }
        
        url = String.format("jdbc:mysql://%s:%s/%s?user=%s&password=%s", server, port, db, user, password);
        
        try {
            if (!testDriver()) 
            {
                return null;
            }
            return DriverManager.getConnection(url);
        } 
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
        
    }
    
    // INICIA LA CONEXIÓN CON LOS DATOS PROPORCIONADOS
    public Connection getConnection() {
        return getConnection(user, password, db,"127.0.0.1");
    }
    
    // CIERRA LA CONEXIÓN
    public void closeConnection(Connection connection) 
    {
        try {
            if (connection == null) {
                return;
            }
            if (connection.isClosed()) {
                return;
            }
            connection.close();
        } 
        catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
}