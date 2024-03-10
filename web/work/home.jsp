<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.beans.Team"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.controller.TeamsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    ProjectsController projc = new ProjectsController();
    
    TeamsController teamc = new TeamsController();
    Team team = new Team();
    
    String user_id = (String) session.getAttribute("user_id");
    String user_name = (String) session.getAttribute("user_name");
    String user_type = (String) session.getAttribute("user_type");
    String user_pat = (String) session.getAttribute("user_pat");
    
    String team_id = request.getParameter("team_id");
    
    String sType = "null";
    
    if (user_type != null)
    {
        switch (user_type)
        {
            case "ch":
                sType = "Lider";
                break;
            case "wk":
                sType = "Integrante";
                break;
            default:
                response.sendRedirect("../index.jsp?error=100");
                session.invalidate();
                break;
        }
    }
    else
    {
        response.sendRedirect("../index.jsp?error=100");
        session.invalidate();
    }
%>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Inicio</title>
        
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    
    <%-- BODY --%>
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>
        
        <div class="container">
            
            <br>
            <h3>Inicio - <%=sType%></h3>

            <p><%=user_name%> <%=user_pat%></p>
            
            <div class="row">
                
                <div class="col">
                    <h3>Departamentos</h3>
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>team_name</th>
                                <th>team_color</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% // DESPLEGAR TABLA SEGÚN TIPO DE USUARIO - WK = INTEGRANTE - CH = LÍDER
                            if (user_type != null)
                            {
                        %>
                                <%= teamc.modelGetAllTeamsByUserRed2(user_id) %>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                        
                <div class="col">
                <%  // DESPLEGAR TABLA SEGÚN DEPARTAMENTO SELECCIONADO
                    if (team_id == null || team_id.isEmpty())
                    {
                %>
                    <h3>Proyectos</h3>
                    <p>Ningún proyecto seleccionado</p>
                <% 
                    }
                    else
                    {
                        team = teamc.modelGetTeamInfoById(team_id);
                %>
                    <h3>Proyectos de <%= team.getTeam_name() %></h3>
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>proj_name</th>
                                <th>proj_color</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                    <% // DESPLEGAR TABLA SEGÚN TIPO DE USUARIO - WK = INTEGRANTE - CH = LÍDER
                        if (user_type != null)
                        {
                    %>
                            <%= projc.modelGetAllProjectsByTeamRed2(team_id, user_id) %>
                    <%
                        }
                    %>
                        </tbody>
                    </table>
                <% 
                    }
                %>
                </div>
            </div>
                
            <br> 
            <a href="home.jsp">Deseleccionar proyecto</a>
            <br>

            <a href="../signout">Cerrar sesión</a>
            <br>
            
        </div>
        
    </body>
    
</html>
