package servlet.alumno;

import bean.Usuarios;
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

@WebServlet("/alumno/chat/verchat")
public class ListaChat extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id_inst = null;
        ArrayList<Usuarios> usuarios = new ArrayList<>();

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

            PreparedStatement psGrupos = conn.prepareStatement("SELECT usuarios.id_usuario, nom_usuario, pat_usuario FROM usuarios INNER JOIN pertenecen ON pertenecen.id_usuario = usuarios.id_usuario WHERE pertenecen.id_inst = ? ORDER BY usuarios.nom_usuario");
            psGrupos.setString(1, id_inst);

            ResultSet rsGrupos = psGrupos.executeQuery();

            while (rsGrupos.next()) {

                Usuarios usuario = new Usuarios();
                usuario.setId_usuario(rsGrupos.getString("id_usuario"));
                usuario.setNom_usuario(rsGrupos.getString("nom_usuario"));
                usuario.setPat_usuario(rsGrupos.getString("pat_usuario"));
                usuarios.add(usuario);
                
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
            request.setAttribute("usuarios",usuarios);
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("index.jsp?error=1");
        }

    }
}
