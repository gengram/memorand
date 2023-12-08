package servlet.admin.grupos;

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
import util.ConnectionUtil;

@WebServlet("/bajagrupo")
public class BajaGrupo extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id_grupo = request.getParameter("id_grupo");
 
        Connection conn = ConnectionUtil.getConnection(request);

        try {
            
            // DELETE INSTGRUPOS
            PreparedStatement psVerifica1 = conn.prepareStatement("SELECT EXISTS(SELECT * FROM instgrupos WHERE id_grupo = ?) AS output");
            psVerifica1.setString(1, id_grupo);
            ResultSet rsInstGrupos = psVerifica1.executeQuery();
            
            rsInstGrupos.next();
            if (rsInstGrupos.getInt("output") > 0) {
                PreparedStatement psInstGrupos = conn.prepareStatement("DELETE FROM instgrupos WHERE id_grupo = ?");
                psInstGrupos.setString(1, id_grupo);
                psInstGrupos.executeUpdate();
            }
            
            // CHECA RELACIONES HIJAS
            PreparedStatement psVerifica2 = conn.prepareStatement("SELECT id_inscrib FROM inscriben WHERE id_grupo = ?");
            psVerifica2.setString(1, id_grupo);
            ResultSet rsInscriben = psVerifica2.executeQuery();
            
            while (rsInscriben.next()) {
                
                String id_inscrib = rsInscriben.getString("id_inscrib");
            
                PreparedStatement psVerifica3 = conn.prepareStatement("SELECT id_tienen FROM tienen WHERE id_inscrib = ?");
                psVerifica3.setString(1, id_inscrib);
                ResultSet rsTienen = psVerifica3.executeQuery();
                
                while (rsTienen.next()) {
                    
                    String id_tienen = rsTienen.getString("id_tienen");
                    
                    PreparedStatement psTarea = conn.prepareStatement("DELETE FROM grupotarea WHERE id_tienen = ?");
                    psTarea.setString(1, id_tienen);
                    psTarea.executeUpdate();
                    
                    PreparedStatement psApunte = conn.prepareStatement("DELETE FROM grupoapunte WHERE id_tienen = ?");
                    psTarea.setString(1, id_tienen);
                    psTarea.executeUpdate();
                
                }
                
                PreparedStatement psTienen = conn.prepareStatement("DELETE FROM tienen WHERE id_inscrib = ?");
                psTienen.setString(1, id_inscrib);
                psTienen.executeUpdate();
            
            }
            PreparedStatement psInscriben = conn.prepareStatement("DELETE FROM inscriben WHERE id_grupo = ?");
            psInscriben.setString(1, id_grupo);
            psInscriben.executeUpdate();

            // DELETE INSTITUCION
            PreparedStatement psInst = conn.prepareStatement("DELETE FROM grupos WHERE id_grupo = ?");
            psInst.setString(1, id_grupo);

            int rInst = psInst.executeUpdate();

            if (rInst > 0) {
                response.sendRedirect("listagrupo?a=v");
            } else {
                response.sendRedirect("admin/index.jsp?error=1");
            }

        } catch (SQLException e) {
            response.sendRedirect("admin/index.jsp?error=2");
        }

    }
}
