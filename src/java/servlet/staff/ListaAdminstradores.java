package servlet.staff;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.ConnectionUtil;

@WebServlet("/listaadmin")
public class ListaAdminstradores extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //PROTECCION
        HttpSession session = request.getSession(false);

        if (session != null) {
            String tipo_usuario = (String) session.getAttribute("tipo_usuario");

            if (tipo_usuario == null || !tipo_usuario.equals("staff")) {
                response.sendRedirect("index.jsp");
            }
        }

        //CONEXION DB
        Connection conn = ConnectionUtil.getConnection(request);

        //SERVLET
        PrintWriter out = response.getWriter();

        try {

            Statement sUsuarios = conn.createStatement();
            ResultSet rsUsuarios = sUsuarios.executeQuery("SELECT * FROM usuarios WHERE tipo_usuario = 'admin' ORDER BY nom_usuario");

            // INICIO JSP
            response.setContentType("text/html");
            out.println("<html>");

            // HEAD
            out.println("<head>");
            RequestDispatcher importa = request.getRequestDispatcher("recursos/paginas/import.jsp");
            importa.include(request, response);
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"recursos/estilos/bootstrap.css\">");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"recursos/estilos/styless.css\">");
            out.println("<link rel=\"shortcut icon\" href=\"recursos/imagenes/logotypes/me-logoP.png\">");
            out.println("<title>Listado administradores</title>");
            out.println("</head>");
            // FIN HEAD

            //BODY
            out.println("<body>");
            
            RequestDispatcher navbar = request.getRequestDispatcher("recursos/paginas/forservlets/navbar_SV.jsp");
            navbar.include(request, response);

            RequestDispatcher sidelbar = request.getRequestDispatcher("recursos/paginas/forservlets/sidelbar_SV.jsp");
            sidelbar.include(request, response);
            
            out.println("<div class='container text-center'>");
                out.println("<div class='row'>");
                    out.println("<div class='col-1'></div>");
                    out.println("<div class='col-10 mt-3'>");
                        out.println("<div class='row row-cols-2'>");
                            out.println("<div class=\"col6\"> ");
                                out.println("<h1>Listado de Administradores</h1>");
                            out.println("</div>");
                            out.println("<div class=\"col6\">");
                                out.println("<br>");
                                out.println("<a class=\"btn custom-bsign mt-5\" href=\"staff/admin.jsp?a=nuevo2\">Nuevo administrador</a>");
                                out.println("<a class=\"btn custom-bsign mt-5\" href=\"staff/index.jsp\">Regresar</a>");
                            out.println("</div>");
                                out.println("<br>");
                                out.println("<br>");
                        out.println("</div>");

            // TABLA
            out.println("<table class=\"table mt-5\" ");
            out.println("<thead class=\"table-light\">");
            out.println("<th>Correo</th>");
            out.println("<th>Contraseña</th>");
            out.println("<th>Nombre</th>");
            out.println("<th>Paterno</th>");
            out.println("<th>Materno</th>");
            out.println("<th>Estado</th>");
            out.println("<th>Institucion</th>");
            out.println("<th>Acciones</th>");
            out.println("</thead>");

            while (rsUsuarios.next()) {
                out.println("<tbody>");
                out.println("<td>" + rsUsuarios.getString("correo_usuario") + "</td>");
                out.println("<td>" + rsUsuarios.getString("pass_usuario") + "</td>");
                out.println("<td>" + rsUsuarios.getString("nom_usuario") + "</td>");
                out.println("<td>" + rsUsuarios.getString("pat_usuario") + "</td>");
                out.println("<td>" + rsUsuarios.getString("mat_usuario") + "</td>");
                
                // CAMBIA TEXTO ESTADO
                if (rsUsuarios.getString("est_usuario").contains("si"))
                    out.println("<td>Activo</td>");
                else
                    out.println("<td>Inactivo</td>");
                
                // SELECCIONA LA INSTITUCION A LA QUE CADA USUARIO PERTENECE
                PreparedStatement psInstitucion = conn.prepareStatement("SELECT nom_inst FROM instituciones INNER JOIN pertenecen ON instituciones.id_inst = pertenecen.id_inst WHERE pertenecen.id_usuario = ?");
                psInstitucion.setString(1,rsUsuarios.getString("id_usuario"));
                
                ResultSet rsInstitucion = psInstitucion.executeQuery();
                
                if (rsInstitucion.next()) {
                    out.println("<td>" + rsInstitucion.getString("nom_inst") + "</td>");
                } else {
                    out.println("<td>NINGUNA</td>");
                }
                
                out.println("<td> <a href=\"nuevoadmin?a=editar&i="+rsUsuarios.getString("id_usuario")
                        +"&c="+rsUsuarios.getString("correo_usuario")
                        +"&n="+rsUsuarios.getString("nom_usuario")
                        +"&p="+rsUsuarios.getString("pat_usuario")
                        +"&m="+rsUsuarios.getString("mat_usuario")
                        +"&e="+rsUsuarios.getString("est_usuario")
                        +" \">Editar</a>"
                        +"<a href=\"bajaadmin?id_usuario="+rsUsuarios.getString("id_usuario")
                        +" \">Borrar</a> </td>");
                out.println("</tbody>");
            }

            out.println("</table>");
            // FIN TABLA

            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");

            RequestDispatcher footer = request.getRequestDispatcher("recursos/paginas/forservlets/footer_SV.jsp");
            footer.include(request, response);
            out.println("</body>");
            // FIN BODY

            out.println("</html>");
            // FIN JSP

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

    }
}
