package servlet;

import util.ConnectionData;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.ConnectionUtil;

@WebServlet("/listainst")
public class ListaInstituciones extends HttpServlet {

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

            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM instituciones ORDER BY nom_inst");
            
            // INICIO JSP
            response.setContentType("text/html");
            out.println("<html>");
            
            // HEAD
            out.println("<head>");
            out.println("<title>Listado instituciones</title>");
            out.println("</head>");
            // FIN HEAD
            
            //BODY
            out.println("<body>");
            out.println("<h1>Listado de Instituciones</h1>");
            out.println("<a href=\"staff/inst.jsp?a=nuevo2\">Nueva institucion</a>");
            out.println("<br>");
            out.println("<br>");
            
            // TABLA
            out.println("<table border=\"2\">");
            out.println("<tr>");
            out.println("<th>Nombre</th>");
            out.println("<th>Tipo</th>");
            out.println("<th>Lim. lideres</th>");
            out.println("<th>Lim. participantes</th>");
            out.println("<th>Lim. grupos</th>");
            out.println("<th>Lim. sectores</th>");
            out.println("<th>Acciones</th>");
            out.println("</tr>");

            while (resultSet.next()) {
                out.println("<tr>");
                out.println("<td>" + resultSet.getString("nom_inst") + "</td>");
                out.println("<td>" + resultSet.getString("tipo_inst") + "</td>");
                out.println("<td>" + resultSet.getString("lim_lider") + "</td>");
                out.println("<td>" + resultSet.getString("lim_part") + "</td>");
                out.println("<td>" + resultSet.getString("lim_grupo") + "</td>");
                out.println("<td>" + resultSet.getString("lim_sector") + "</td>");
                out.println("<td> <a href=\"staff/inst.jsp?a=editar&i="+resultSet.getString("id_inst")
                        +"&n="+resultSet.getString("nom_inst")
                        +"&t="+resultSet.getString("tipo_inst")
                        +"&l="+resultSet.getString("lim_lider")
                        +"&p="+resultSet.getString("lim_part")
                        +"&g="+resultSet.getString("lim_grupo")
                        +"&s="+resultSet.getString("lim_sector")
                        +" \">Editar</a>"
                        + "<a href=\"bajainst?id_inst=" + resultSet.getString("id_inst")
                        + "\">Borrar</a> </td>");
                out.println("</tr>");
            }
            
            out.println("</table>");
            // FIN TABLA
            
            out.println("<br>");
            out.println("<a href=\"staff/index.jsp\">Regresar</a>");
            out.println("</body>");
            // FIN BODY
            
            out.println("</html>");
            // FIN JSP
            
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
    }
}
