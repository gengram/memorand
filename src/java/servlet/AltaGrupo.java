package servlet;

import bean.Grupos;
import random.RandomId;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.ConnectionUtil;

@WebServlet("/altagrupo")
public class AltaGrupo extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Grupos grupo = new Grupos();
        RandomId r = new RandomId();
        String id_inst = null;

        HttpSession session = request.getSession(false);

        if (session != null) {
            id_inst = (String) session.getAttribute("id_inst");
            if (id_inst == null) {
                response.sendRedirect("../index.jsp?error=noinst");
            }
        } else {
            response.sendRedirect("../index.jsp?error=1");
        }

        grupo.setId_grupo(r.generarId(16));
        grupo.setNom_grupo(request.getParameter("nom_grupo"));

        Connection conn = ConnectionUtil.getConnection(request);

        try {

            PreparedStatement psGrupo = conn.prepareStatement("INSERT INTO grupos (id_grupo, nom_grupo) VALUES (?, ?)");
            psGrupo.setString(1, grupo.getId_grupo());
            psGrupo.setString(2, grupo.getNom_grupo());

            int rGrupo = psGrupo.executeUpdate();

            if (rGrupo > 0) {

                PreparedStatement psInstGrupo = conn.prepareStatement("INSERT INTO instgrupos (id_inst, id_grupo) VALUES (?,?)");
                psInstGrupo.setString(1, id_inst);
                psInstGrupo.setString(2, grupo.getId_grupo());

                int rInstGrupo = psInstGrupo.executeUpdate();

                if (rInstGrupo > 0) {
                    response.sendRedirect("listagrupo?a=v");
                } else {
                    response.sendRedirect("admin/index.jsp?error=1");
                }

            } else {
                response.sendRedirect("admin/index.jsp?error=2");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("admin/index.jsp?error=3");
        } finally {
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
