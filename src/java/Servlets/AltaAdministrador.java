package Servlets;

import Random.*;
import Connect.Conexion;
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

@WebServlet("/altaadmin")
public class AltaAdministrador extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RandomId r = new RandomId();

        String id_usuario = r.generarId(16);
        String correo_usuario = request.getParameter("correo_usuario");
        String pass_usuario = request.getParameter("pass_usuario");
        String tipo_usuario = "admin";
        String nom_usuario = request.getParameter("nom_usuario");
        String pat_usuario = request.getParameter("pat_usuario");
        String mat_usuario = request.getParameter("mat_usuario");

        String nom_inst = request.getParameter("nom_inst");

        Conexion dbu = new Conexion();
        Connection conn = dbu.getConnection();

        try {

            PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO usuarios (id_usuario, correo_usuario, pass_usuario, tipo_usuario, nom_usuario, pat_usuario, mat_usuario) VALUES (?, ?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, id_usuario);
            preparedStatement.setString(2, correo_usuario);
            preparedStatement.setString(3, pass_usuario);
            preparedStatement.setString(4, tipo_usuario);
            preparedStatement.setString(5, nom_usuario);
            preparedStatement.setString(6, pat_usuario);
            preparedStatement.setString(7, mat_usuario);

            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                
                PreparedStatement psObtener = conn.prepareStatement("SELECT * FROM instituciones WHERE nom_inst = ?");
                psObtener.setString(1, nom_inst);
                
                ResultSet rsObtener = psObtener.executeQuery();
                
                if (rsObtener.next()) {
                    
                    String id_inst = rsObtener.getString("id_inst");
                    
                    PreparedStatement psPertenecen = conn.prepareStatement("INSERT INTO pertenecen (id_inst, id_usuario) VALUES (?, ?)");
                    psPertenecen.setString(1, id_inst);
                    psPertenecen.setString(2, id_usuario);

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
