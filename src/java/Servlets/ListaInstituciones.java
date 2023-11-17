package Servlets;

import Connect.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listainstituciones")
public class ListaInstituciones extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        Conexion dbu = new Conexion();
        
        Connection conn = dbu.getConnection();
        PrintWriter out = response.getWriter();

        try {
            
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM instituciones");

            response.setContentType("text/html");
            out.println("<html><head><title>Listado instituciones</title></head><body>");
            out.println("<h1>Listado de Instituciones</h1>");
            out.println("<table border=\"1\">");

            out.println("<tr>");
            out.println("<th>Id inst.</th>");
            out.println("<th>Nombre</th>");
            out.println("<th>Lim. profes</th>");
            out.println("<th>Lim. alumnos</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");
            
            while (resultSet.next()) {
                
                out.println("<tr>");

                out.println("<td>" + resultSet.getString("id_institucion") + "</td>");
                out.println("<td>" + resultSet.getString("nombre_institucion") + "</td>");
                out.println("<td>" + resultSet.getString("limite_profes") + "</td>");
                out.println("<td>" + resultSet.getString("limite_alumnos") + "</td>");
                out.println("<td> <a href=\"#\">Editar</a> <a href=\"bajainstitucion?id_institucion=" + resultSet.getString("id_institucion") + "\">Borrar</a> </td>");
                
                out.println("</tr>");
                
            }
            out.println("</table>");
            
            out.println("<a href=\"staff/index.jsp\">Regresar</a>");
            out.println("</body>");
            out.println("</html>");
            
        } 
        
        catch (SQLException e) {
            e.printStackTrace();
        } 
        
        finally {
            
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            
        }
    }
    
}