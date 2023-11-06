package Servlets;

import Conect.DBUtil;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_usuario = request.getParameter("id_usuario");
        String pass_usuario = request.getParameter("pass_usuario");
        Connection conn = DBUtil.getConnection();

        try {
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM usuarios WHERE id_usuario = ? AND pass_usuario = ?");
            preparedStatement.setString(1, id_usuario);
            preparedStatement.setString(2, pass_usuario);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String tipo_usuario = resultSet.getString("tipo_usuario");
                if (tipo_usuario != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("id_usuario", id_usuario);
                    session.setAttribute("tipo_usuario", tipo_usuario);
                    switch (tipo_usuario) {
                        case "admin":
                            response.sendRedirect("inicio.jsp");
                            break;
                        case "profesor":
                            response.sendRedirect("inicio.jsp");
                            break;
                        case "staff":
                            response.sendRedirect("inicio.jsp");
                            break;
                        case "alumno":
                            response.sendRedirect("inicio.jsp");
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
            response.sendRedirect("index.html");
        }
    }
}
