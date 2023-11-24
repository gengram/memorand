package util;

import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;

public class ConnectionUtil {

    public static boolean isServer(HttpServletRequest request) {
        return request.getRequestURL().toString().contains("gerdoc");
    }

    public static Connection getConnection(HttpServletRequest request) {
        return new ConnectionData().getConnection(isServer(request));
    }

}
