package servlet;

import bean.Usuarios;

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
import util.ConnectionUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Usuarios usuario = new Usuarios();
        
        
        usuario.setCorreo_usuario(request.getParameter("correo_usuario"));
        usuario.setPass_usuario(request.getParameter("pass_usuario"));
        
        Connection conn = ConnectionUtil.getConnection(request);

        try {
            
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM usuarios WHERE correo_usuario = ? AND pass_usuario = ?");
            preparedStatement.setString(1,usuario.getCorreo_usuario());
            preparedStatement.setString(2,usuario.getPass_usuario());
            
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                
                usuario.setId_usuario(resultSet.getString("id_usuario"));
                usuario.setTipo_usuario(resultSet.getString("tipo_usuario"));
                usuario.setNom_usuario(resultSet.getString("nom_usuario"));
                usuario.setPat_usuario(resultSet.getString("pat_usuario"));
                usuario.setMat_usuario(resultSet.getString("mat_usuario"));
                
                if (usuario.getTipo_usuario() != null) {
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("id_usuario",usuario.getId_usuario());
                    session.setAttribute("correo_usuario",usuario.getCorreo_usuario());
                    session.setAttribute("tipo_usuario",usuario.getTipo_usuario());
                    session.setAttribute("nom_usuario",usuario.getNom_usuario());
                    session.setAttribute("pat_usuario",usuario.getPat_usuario());
                    session.setAttribute("mat_usuario",usuario.getMat_usuario());
                    
                    switch (usuario.getTipo_usuario()) {
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
        } catch (SQLException e) 
        {
            response.sendRedirect("index.jsp?error=2");
        }
    }
}
