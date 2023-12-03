package servlet;

import bean.Instituciones;
import bean.Usuarios;

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
import javax.servlet.http.HttpSession;
import util.ConnectionUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // BEANS
        Usuarios usuario = new Usuarios();
        Instituciones instituciones = new Instituciones();

        // GUARDA DATOS DEL FORMULARIO
        usuario.setCorreo_usuario(request.getParameter("correo_usuario"));
        usuario.setPass_usuario(request.getParameter("pass_usuario"));
        // NUEVA CONEXION BD
        Connection c = ConnectionUtil.getConnection(request);

        try {

            // QUERY VERIFICA USUARIO
            PreparedStatement psUsuarios = c.prepareStatement("SELECT * FROM usuarios WHERE correo_usuario = ? AND pass_usuario = ? LIMIT 1");
            psUsuarios.setString(1, usuario.getCorreo_usuario());
            psUsuarios.setString(2, usuario.getPass_usuario());
            // RESULT SET
            ResultSet rsUsuarios = psUsuarios.executeQuery();

            if (rsUsuarios.next()) {

                // GUARDA DATOS DE LA BD
                usuario.setId_usuario(rsUsuarios.getString("id_usuario"));
                usuario.setTipo_usuario(rsUsuarios.getString("tipo_usuario"));
                usuario.setNom_usuario(rsUsuarios.getString("nom_usuario"));
                usuario.setPat_usuario(rsUsuarios.getString("pat_usuario"));
                usuario.setMat_usuario(rsUsuarios.getString("mat_usuario"));
                usuario.setEst_usuario(rsUsuarios.getString("est_usuario"));

                // VERIFICA TIPO DE USUARIO
                if (usuario.getTipo_usuario() != null && usuario.getEst_usuario().equals("si")) {

                    // ATRIBUTOS DE SESION
                    HttpSession session = request.getSession();
                    session.setAttribute("id_usuario", usuario.getId_usuario());
                    session.setAttribute("correo_usuario", usuario.getCorreo_usuario());
                    session.setAttribute("tipo_usuario", usuario.getTipo_usuario());
                    session.setAttribute("nom_usuario", usuario.getNom_usuario());
                    session.setAttribute("pat_usuario", usuario.getPat_usuario());
                    session.setAttribute("mat_usuario", usuario.getMat_usuario());

                    // CASO STAFF
                    if ("staff".equals(usuario.getTipo_usuario())) {
                        response.sendRedirect("/memorand/staff/");
                    } // CASO USUARIOS
                    else {

                        // QUERY OBTIENE INSTITUCION
                        PreparedStatement psInst = c.prepareStatement("SELECT instituciones.id_inst, tipo_inst, nom_inst, lim_lider, lim_part, lim_grupo, lim_sector FROM instituciones INNER JOIN pertenecen ON instituciones.id_inst = pertenecen.id_inst WHERE pertenecen.id_usuario = ? LIMIT 1");
                        psInst.setString(1, usuario.getId_usuario());
                        // RESULT SET
                        ResultSet rsInst = psInst.executeQuery();

                        if (rsInst.next()) {
                            instituciones.setId_inst(rsInst.getString(1));
                            instituciones.setTipo_inst(rsInst.getString(2));
                            instituciones.setNom_inst(rsInst.getString(3));
                            instituciones.setLim_lider(rsInst.getString(4));
                            instituciones.setLim_part(rsInst.getString(5));
                            instituciones.setLim_grupo(rsInst.getString(6));
                            instituciones.setLim_sector(rsInst.getString(7));
                        }

                        switch (usuario.getTipo_usuario()) {
                            case "admin":
                                session.setAttribute("id_inst",instituciones.getId_inst());
                                session.setAttribute("tipo_inst",instituciones.getTipo_inst());
                                session.setAttribute("nom_inst",instituciones.getNom_inst());
                                session.setAttribute("lim_lider",instituciones.getLim_lider());
                                session.setAttribute("lim_part",instituciones.getLim_part());
                                session.setAttribute("lim_grupo",instituciones.getLim_grupo());
                                session.setAttribute("lim_sector",instituciones.getLim_sector());
                                response.sendRedirect("/memorand/admin/");
                                break;
                            case "profesor":
                                session.setAttribute("id_inst",instituciones.getId_inst());
                                session.setAttribute("tipo_inst",instituciones.getTipo_inst());
                                session.setAttribute("nom_inst",instituciones.getNom_inst());
                                response.sendRedirect("/memorand/profesor/");
                                break;
                            case "alumno":
                                session.setAttribute("id_inst",instituciones.getId_inst());
                                session.setAttribute("tipo_inst",instituciones.getTipo_inst());
                                session.setAttribute("nom_inst",instituciones.getNom_inst());
                                response.sendRedirect("/memorand/alumno/");
                                break;
                            default:
                                break;
                        }

                    }

                } else {
                    response.sendRedirect("index.jsp?error=1");
                }

            } else {
                response.sendRedirect("index.jsp?error=2");
            }
        } catch (SQLException e) {
            response.sendRedirect("index.jsp?error=3");
        }
    }
}
