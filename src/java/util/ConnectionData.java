package util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionData implements Serializable {

    public static String server = "127.0.0.1";
    public static String port = "3306";
    public static String db = "memorand";
    public static String user = "root";
    public static String password = "n0m3l0";
    public static String password1 = "1234";

    public ConnectionData() {}

    public boolean testDriver() {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
        
    }

    public Connection getConnection(boolean isServer) {
        
        String url = null;

        if (user == null || password == null || db == null || server == null) {
            return null;
        }

        if ("".equals(user) || "".equals(password) || "".equals(db) || "".equals(server)) {
            return null;
        }
        
        if (isServer) {
            url = String.format("jdbc:mysql://%s:%s/%s?user=%s&password=%s", server, port, db, user, password1);
        } else {
            url = String.format("jdbc:mysql://%s:%s/%s?user=%s&password=%s", server, port, db, user, password);
        }

        try {
            if (!testDriver()) {
                return null;
            }
            return DriverManager.getConnection(url);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
        
    }

    public void closeConnection(Connection connection) {

        try {
            if (connection == null) {
                return;
            }
            if (connection.isClosed()) {
                return;
            }
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }
}
