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

@WebServlet("/bajaadmin")
public class BajaAdministrador extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id_usuario = request.getParameter("id_usuario");

        Connection conn = ConnectionUtil.getConnection(request);

        try {

            // DELETE PERTENECEN
            PreparedStatement psVerifica1 = conn.prepareStatement("SELECT EXISTS(SELECT * FROM pertenecen WHERE id_usuario = ?) AS output");
            psVerifica1.setString(1, id_usuario);
            ResultSet rsVerifica1 = psVerifica1.executeQuery();

            rsVerifica1.next();
            if (rsVerifica1.getInt("output") > 0) {
                PreparedStatement psPertenecen = conn.prepareStatement("DELETE FROM pertenecen WHERE id_usuario = ?");
                psPertenecen.setString(1, id_usuario);
                psPertenecen.executeUpdate();
            }

            // DELETE ADMINISTRADOR
            PreparedStatement psInst = conn.prepareStatement("DELETE FROM usuarios WHERE id_usuario = ?");
            psInst.setString(1, id_usuario);

            int rInst = psInst.executeUpdate();

            if (rInst > 0) {
                response.sendRedirect("listaadmin");
            } else {
                response.sendRedirect("listaadmin?error=1");
            }

        } catch (SQLException e) {
            response.sendRedirect("listaadmin?error=2");
        }

    }
}
