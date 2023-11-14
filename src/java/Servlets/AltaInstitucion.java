package Servlets;

import Random.*;
import Connect.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/createinstitucion")
public class AltaInstitucion extends HttpServlet {
    
    RandomId r = new RandomId();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id_institucion = r.generarId(16);
        String nombre_institucion = request.getParameter("nombre_institucion");
        String limite_profes = request.getParameter("limite_profes");
        String limite_alumnos = request.getParameter("limite_alumnos"); 
        
        Conexion dbu = new Conexion();
        
        Connection conn = dbu.getConnection();

        try {
            
            PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO instituciones (id_institucion, nombre_institucion, limite_profes, limite_alumnos) VALUES (?, ?, ?, ?)");
            preparedStatement.setString(1,id_institucion);
            preparedStatement.setString(2,nombre_institucion);
            preparedStatement.setString(3,limite_profes);
            preparedStatement.setString(4,limite_alumnos);
            
            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                response.sendRedirect("staff/index.jsp");
            } else {
                response.sendRedirect("staff/index.jsp?error=1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
