package Servlets;
import Conect.DBUtil;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id_usuario = request.getParameter("id_usuario");
        String correo_usuario = request.getParameter("correo_usuario");
        String pass_usuario = request.getParameter("pass_usuario");
        String tipo_usuario = request.getParameter("tipo_usuario"); 
        String nombre_usuario = request.getParameter("nombre_usuario");
        String paterno_usuario = request.getParameter("paterno_usuario");
        String materno_usuario = request.getParameter("materno_usuario");

        Connection conn = DBUtil.getConnection();

        try {
            
            PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO usuarios (id_usuario, correo_usuario, pass_usuario, tipo_usuario, nombre_usuario, paterno_usuario, materno_usuario) VALUES (?, ?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, id_usuario);
            preparedStatement.setString(2, correo_usuario);
            preparedStatement.setString(3, pass_usuario);
            preparedStatement.setString(4, tipo_usuario);
            preparedStatement.setString(5, nombre_usuario);
            preparedStatement.setString(6, paterno_usuario);
            preparedStatement.setString(7, materno_usuario);
            
            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                response.sendRedirect("index.jsp");
            } else {
                // Registro fallido, redirecciona a la página de registro con un mensaje de error.
                response.sendRedirect("index.jsp?error=1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
