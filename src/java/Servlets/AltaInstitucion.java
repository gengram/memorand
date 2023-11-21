package Servlets;

import Random.*;
import Beans.Instituciones;
import Connect.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/altainst")
public class AltaInstitucion extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Instituciones institucion = new Instituciones();
        RandomId r = new RandomId();
        
        institucion.setId_inst(r.generarId(16));
        institucion.setNom_inst(request.getParameter("nom_inst"));
        institucion.setLim_profes(request.getParameter("lim_profes"));
        institucion.setLim_alumnos(request.getParameter("lim_alumnos"));

        Conexion dbu = new Conexion();
        Connection conn = dbu.getConnection();

        try {

            PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO instituciones (id_inst, nom_inst, lim_profes, lim_alumnos) VALUES (?, ?, ?, ?)");
            preparedStatement.setString(1, institucion.getId_inst());
            preparedStatement.setString(2, institucion.getNom_inst());
            preparedStatement.setString(3, institucion.getLim_profes());
            preparedStatement.setString(4, institucion.getLim_alumnos());

            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                response.sendRedirect("listainst");
            } else {
                response.sendRedirect("staff/index.jsp?error=1");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
