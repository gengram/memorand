package servlet;

import bean.Grupos;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.ConnectionUtil;

@WebServlet("/listagrupo")
public class ListaGrupos extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String accion = request.getParameter("a");
        String id_inst = null;
        ArrayList<Grupos> grupos = new ArrayList<>();

        HttpSession session = request.getSession(false);

        if (session != null) {
            id_inst = (String) session.getAttribute("id_inst");
            if (id_inst == null) {
                response.sendRedirect("index.jsp?error=noinst");
            }
        } else {
            response.sendRedirect("index.jsp?error=1");
        }

        Connection conn = ConnectionUtil.getConnection(request);

        try {

            PreparedStatement psGrupos = conn.prepareStatement("SELECT grupos.id_grupo, nom_grupo FROM grupos INNER JOIN instgrupos ON instgrupos.id_grupo = grupos.id_grupo WHERE instgrupos.id_inst = ? ORDER BY nom_grupo");
            psGrupos.setString(1, id_inst);

            ResultSet rsGrupos = psGrupos.executeQuery();

            while (rsGrupos.next()) {

                Grupos grupo = new Grupos();
                grupo.setId_grupo(rsGrupos.getString("id_grupo"));
                grupo.setNom_grupo(rsGrupos.getString("nom_grupo"));
                grupos.add(grupo);
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        
        if(session != null) {
            request.setAttribute("grupos",grupos);
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/grupo.jsp?a="+accion);
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("index.jsp?error=1");
        }

    }
}
