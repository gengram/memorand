package Servlets;

import Connect.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bajainstitucion")
public class BajaInstituciones extends HttpServlet {
    
    boolean flag;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id_institucion = request.getParameter("id_institucion");
        
        Conexion dbu = new Conexion();
        Connection conn = dbu.getConnection();

        try {
            
            PreparedStatement preparedStatement2 = conn.prepareStatement("DELETE FROM pertenece WHERE id_institucion = ?");
            preparedStatement2.setString(1,id_institucion);
            
            ResultSet resultSet2 = preparedStatement2.executeQuery();
            
            if (resultSet2.next()) {
                
                PreparedStatement preparedStatement = conn.prepareStatement("DELETE FROM instituciones WHERE id_institucion = ?");
                preparedStatement.setString(1,id_institucion);

                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) 
                    response.sendRedirect("listainstituciones");
                else
                    response.sendRedirect("listainstituciones?error=1");
            
            }
            else
                response.sendRedirect("listainstituciones?error=2");

        } 
        
        catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("listainstituciones?error=3");
        } 
        
    }
    
}