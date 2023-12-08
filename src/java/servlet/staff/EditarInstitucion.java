package servlet.staff;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ConnectionUtil;

@WebServlet("/editainst")
public class EditarInstitucion extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id_inst = request.getParameter("id_inst");
        String nom_inst = request.getParameter("nom_inst");
        String tipo_inst = request.getParameter("tipo_inst");
        String lim_lider = request.getParameter("lim_lider");
        String lim_part = request.getParameter("lim_part"); 
        String lim_grupo = request.getParameter("lim_grupo"); 
        String lim_sector = request.getParameter("lim_sector"); 
        
        Connection conn = ConnectionUtil.getConnection(request);

        try {
            
            PreparedStatement preparedStatement = conn.prepareStatement("UPDATE instituciones SET nom_inst = ? , tipo_inst = ? , lim_lider = ? , lim_part = ? , lim_grupo = ? , lim_sector = ? WHERE id_inst = ?");
            preparedStatement.setString(1,nom_inst);
            preparedStatement.setString(2,tipo_inst);
            preparedStatement.setString(3,lim_lider);
            preparedStatement.setString(4,lim_part);
            preparedStatement.setString(5,lim_grupo);
            preparedStatement.setString(6,lim_sector);
            preparedStatement.setString(7,id_inst);
            
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
