package servlet.staff;

import bean.Instituciones;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import util.ConnectionUtil;

@WebServlet("/nuevoadmin")
public class FormularioAdministrador extends HttpServlet { 
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String accion = request.getParameter("a");

        //CONEXION BD
        Connection conn = ConnectionUtil.getConnection(request);
        
        ArrayList<Instituciones> instituciones = new ArrayList<>();
        
        try {
            
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM instituciones ORDER BY nom_inst");
            
            while (resultSet.next()) {
                
                Instituciones institucion = new Instituciones();
                institucion.setId_inst(resultSet.getString("id_inst"));
                institucion.setNom_inst(resultSet.getString("nom_inst"));
                institucion.setLim_lider(resultSet.getString("lim_lider"));
                institucion.setLim_part(resultSet.getString("lim_part"));
                institucion.setLim_grupo(resultSet.getString("lim_grupo"));
                institucion.setLim_sector(resultSet.getString("lim_sector"));
                
                instituciones.add(institucion);
            }
            
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        request.setAttribute("inst",instituciones);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("staff/admin.jsp?a="+accion);
        dispatcher.forward(request, response);
        
    }
}
