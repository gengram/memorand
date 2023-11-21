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

@WebServlet("/editaadmin")
public class EditarAdministrador extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id_usuario = request.getParameter("id_usuario");
        String correo_usuario = request.getParameter("correo_usuario");
        String pass_usuario = request.getParameter("pass_usuario");
        String nom_usuario = request.getParameter("nom_usuario");
        String pat_usuario = request.getParameter("pat_usuario");
        String mat_usuario = request.getParameter("mat_usuario");

        String nom_inst = request.getParameter("nom_inst");

        Conexion dbu = new Conexion();
        Connection conn = dbu.getConnection();

        try {
            
            // UPDATE DE USUARIO
            PreparedStatement preparedStatement = conn.prepareStatement("UPDATE usuarios SET correo_usuario = ? , pass_usuario = ? , nom_usuario = ?, pat_usuario = ?, mat_usuario = ? WHERE id_usuario = ?");
            preparedStatement.setString(1, correo_usuario);
            preparedStatement.setString(2, pass_usuario);
            preparedStatement.setString(3, nom_usuario);
            preparedStatement.setString(4, pat_usuario);
            preparedStatement.setString(5, mat_usuario);
            preparedStatement.setString(6, id_usuario);

            int result = preparedStatement.executeUpdate();

            if (result == 1) {
                
                // OBTIENE ID_INST POR NOM_INST
                PreparedStatement psObtener = conn.prepareStatement("SELECT * FROM instituciones WHERE nom_inst = ?");
                psObtener.setString(1, nom_inst);

                ResultSet rsObtener = psObtener.executeQuery();

                if (rsObtener.next()) {
                    
                    //UPDATE 
                    String id_inst = rsObtener.getString("id_inst");

                    PreparedStatement psPertenecen = conn.prepareStatement("UPDATE pertenecen SET id_inst = ? WHERE id_usuario = ?");
                    psPertenecen.setString(1, id_inst);
                    psPertenecen.setString(2, id_usuario);

                    int rPertenecen = psPertenecen.executeUpdate();

                    if (rPertenecen == 1) {
                        response.sendRedirect("listaadmin");
                    } else {
                        
                        PreparedStatement psNuevo = conn.prepareStatement("INSERT INTO pertenecen (id_inst, id_usuario) VALUES (?,?)");
                        psNuevo.setString(1, id_inst);
                        psNuevo.setString(2, id_usuario);
                        
                        psNuevo.executeUpdate();
                        
                        response.sendRedirect("listaadmin");
                    }
                    
                } else {
                    response.sendRedirect("staff/index.jsp?error=1");
                }

            } else {
                response.sendRedirect("staff/index.jsp?error=2");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
