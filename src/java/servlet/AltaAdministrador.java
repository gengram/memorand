package servlet;

import random.RandomId;
import bean.Pertenecen;
import bean.Usuarios;
import util.ConnectionData;
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

@WebServlet("/altaadmin")
public class AltaAdministrador extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Usuarios admin = new Usuarios();
        RandomId r = new RandomId();
        
        admin.setId_usuario(r.generarId(16));
        admin.setCorreo_usuario(request.getParameter("correo_usuario"));
        admin.setPass_usuario(request.getParameter("pass_usuario"));
        admin.setTipo_usuario("admin");
        admin.setNom_usuario(request.getParameter("nom_usuario"));
        admin.setPat_usuario(request.getParameter("pat_usuario"));
        admin.setMat_usuario(request.getParameter("mat_usuario"));

        String nom_inst = request.getParameter("nom_inst");

        
        Connection conn = ConnectionUtil.getConnection(request);

        try {

            PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO usuarios (id_usuario, correo_usuario, pass_usuario, tipo_usuario, nom_usuario, pat_usuario, mat_usuario) VALUES (?, ?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, admin.getId_usuario());
            preparedStatement.setString(2, admin.getCorreo_usuario());
            preparedStatement.setString(3, admin.getPass_usuario());
            preparedStatement.setString(4, admin.getTipo_usuario());
            preparedStatement.setString(5, admin.getNom_usuario());
            preparedStatement.setString(6, admin.getPat_usuario());
            preparedStatement.setString(7, admin.getMat_usuario());

            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                
                PreparedStatement psObtener = conn.prepareStatement("SELECT * FROM instituciones WHERE nom_inst = ?");
                psObtener.setString(1, nom_inst);
                
                ResultSet rsObtener = psObtener.executeQuery();
                
                if (rsObtener.next()) {
                    
                    String id_inst = rsObtener.getString("id_inst");
                    
                    PreparedStatement psPertenecen = conn.prepareStatement("INSERT INTO pertenecen (id_inst, id_usuario) VALUES (?, ?)");
                    psPertenecen.setString(1, id_inst);
                    psPertenecen.setString(2, admin.getId_usuario());

                    int rPertenecen = psPertenecen.executeUpdate();

                    if (rPertenecen > 0) {
                        response.sendRedirect("listaadmin");
                    } else {
                        response.sendRedirect("staff/index.jsp?error=1");
                    }
                } else {
                    response.sendRedirect("staff/index.jsp?error=2");
                }

            } else {
                response.sendRedirect("staff/index.jsp?error=3");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
