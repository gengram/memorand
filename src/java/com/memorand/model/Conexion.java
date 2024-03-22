package com.memorand.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    private String username = "root";
    private String password = "n0m3l0";
    private String hostname = "localhost";
    private String port = "3306";
    private String db = "memorand";
    
    private String classname = "com.mysql.cj.jdbc.Driver";
    
    private String url = "jdbc:mysql://" + hostname + ":" + port + "/" + db + "?characterEncoding=UTF-8";
    
    private Connection connection;
    
    public Conexion() {
        
        try
        {
            Class.forName(classname);
            connection = DriverManager.getConnection(url,username,password);
        }
        catch (ClassNotFoundException | SQLException e)
        {
            System.err.println(e.getMessage());
        }
    
    }
    
    public Connection getConnection() {
    
        return connection;
    
    }
    
}