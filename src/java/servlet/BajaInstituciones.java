package servlet;

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

@WebServlet("/bajainst")
public class BajaInstituciones extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id_inst = request.getParameter("id_inst");

        Connection conn = ConnectionUtil.getConnection(request);

        try {

            // DELETE PERTENECEN
            PreparedStatement psVerifica1 = conn.prepareStatement("SELECT EXISTS(SELECT * FROM pertenecen WHERE id_inst = ?) AS output");
            psVerifica1.setString(1, id_inst);
            ResultSet rsVerifica1 = psVerifica1.executeQuery();

            rsVerifica1.next();
            if (rsVerifica1.getInt("output") > 0) {
                PreparedStatement psPertenecen = conn.prepareStatement("DELETE FROM pertenecen WHERE id_inst = ?");
                psPertenecen.setString(1, id_inst);
                psPertenecen.executeUpdate();
            }

            // DELETE INSTGRUPOS
            PreparedStatement psVerifica2 = conn.prepareStatement("SELECT EXISTS(SELECT * FROM instgrupos WHERE id_inst = ?) AS output");
            psVerifica2.setString(1, id_inst);
            ResultSet rsVerifica2 = psVerifica2.executeQuery();

            rsVerifica2.next();
            if (rsVerifica2.getInt("output") > 0) {
                PreparedStatement psPertenecen = conn.prepareStatement("DELETE FROM instgrupos WHERE id_inst = ?");
                psPertenecen.setString(1, id_inst);
                psPertenecen.executeUpdate();
            }
            
            // DELETE INSTSECTOR
            PreparedStatement psVerifica3 = conn.prepareStatement("SELECT EXISTS(SELECT * FROM instsector WHERE id_inst = ?) AS output");
            psVerifica3.setString(1, id_inst);
            ResultSet rsVerifica3 = psVerifica3.executeQuery();

            rsVerifica3.next();
            if (rsVerifica3.getInt("output") > 0) {
                PreparedStatement psPertenecen = conn.prepareStatement("DELETE FROM instsector WHERE id_inst = ?");
                psPertenecen.setString(1, id_inst);
                psPertenecen.executeUpdate();
            }

            // DELETE INSTITUCION
            PreparedStatement psInst = conn.prepareStatement("DELETE FROM instituciones WHERE id_inst = ?");
            psInst.setString(1, id_inst);

            int rInst = psInst.executeUpdate();

            if (rInst > 0) {
                response.sendRedirect("listainst");
            } else {
                response.sendRedirect("listainst?error=1");
            }

        } catch (SQLException e) {
            response.sendRedirect("listainst?error=2");
        }

    }
}
