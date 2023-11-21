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

@WebServlet("/editainst")
public class EditarInstitucion extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id_inst = request.getParameter("id_inst");
        String nom_inst = request.getParameter("nom_inst");
        String lim_profes = request.getParameter("lim_profes");
        String lim_alumnos = request.getParameter("lim_alumnos"); 
        
        Conexion dbu = new Conexion();
        Connection conn = dbu.getConnection();

        try {
            
            PreparedStatement preparedStatement = conn.prepareStatement("UPDATE instituciones SET nom_inst = ? , lim_profes = ? , lim_alumnos = ? WHERE id_inst = ?");
            preparedStatement.setString(1,nom_inst);
            preparedStatement.setString(2,lim_profes);
            preparedStatement.setString(3,lim_alumnos);
            preparedStatement.setString(4,id_inst);
            
            int result = preparedStatement.executeUpdate();

            if (result == 1) {
                response.sendRedirect("listainst");
            } else {
                response.sendRedirect("staff/index.jsp?error=1");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
}
