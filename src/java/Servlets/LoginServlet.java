package Servlets;

import Connect.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String correo_usuario = request.getParameter("correo_usuario");
        String pass_usuario = request.getParameter("pass_usuario");
        
        Conexion dbu = new Conexion();
        Connection conn = dbu.getConnection();

        try {
            
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM usuarios WHERE correo_usuario = ? AND pass_usuario = ?");
            preparedStatement.setString(1,correo_usuario);
            preparedStatement.setString(2,pass_usuario);
            
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                
                String id_usuario = resultSet.getString("id_usuario");
                String tipo_usuario = resultSet.getString("tipo_usuario");
                String nombre_usuario = resultSet.getString("nombre_usuario");
                String paterno_usuario = resultSet.getString("paterno_usuario");
                String materno_usuario = resultSet.getString("materno_usuario");
                
                if (tipo_usuario != null) {
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("id_usuario",id_usuario);
                    session.setAttribute("correo_usuario",correo_usuario);
                    session.setAttribute("tipo_usuario",tipo_usuario);
                    session.setAttribute("nombre_usuario",nombre_usuario);
                    session.setAttribute("paterno_usuario",paterno_usuario);
                    session.setAttribute("materno_usuario",materno_usuario);
                    
                    switch (tipo_usuario) {
                        case "admin":
                            response.sendRedirect("/memorand/admin/");
                            break;
                        case "profesor":
                            response.sendRedirect("/memorand/profesor/");
                            break;
                        case "staff":
                            response.sendRedirect("/memorand/staff/");
                            break;
                        case "alumno":
                            response.sendRedirect("/memorand/alumno/");
                            break;
                        default:
                            break;
                    }
                    
                }
            } else {
                response.sendRedirect("index.jsp?error=1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=2");
        }
    }
}
