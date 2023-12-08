package servlet.staff;

import util.RandomId;
import bean.Instituciones;
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

@WebServlet("/altainst")
public class AltaInstitucion extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Instituciones institucion = new Instituciones();
        RandomId r = new RandomId();

        institucion.setId_inst(r.generarId(16));
        institucion.setNom_inst(request.getParameter("nom_inst"));
        institucion.setTipo_inst(request.getParameter("tipo_inst"));
        institucion.setLim_lider(request.getParameter("lim_lider"));
        institucion.setLim_part(request.getParameter("lim_part"));
        institucion.setLim_grupo(request.getParameter("lim_grupo"));
        institucion.setLim_sector(request.getParameter("lim_sector"));

        Connection conn = ConnectionUtil.getConnection(request);

        try {

            PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO instituciones (id_inst, nom_inst, tipo_inst, lim_lider, lim_part, lim_grupo, lim_sector) VALUES (?, ?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, institucion.getId_inst());
            preparedStatement.setString(2, institucion.getNom_inst());
            preparedStatement.setString(3, institucion.getTipo_inst());
            preparedStatement.setString(4, institucion.getLim_lider());
            preparedStatement.setString(5, institucion.getLim_part());
            preparedStatement.setString(6, institucion.getLim_grupo());
            preparedStatement.setString(7, institucion.getLim_sector());

            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                response.sendRedirect("listainst");
            } else {
                response.sendRedirect("staff/index.jsp?error=1");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("staff/index.jsp?error=2");
        } finally {
            try {
                if (conn != null) {
                    conn.close(); // Cerrar la conexión
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Manejar cualquier excepción al cerrar la conexión
            }
        }
    }
    
}
