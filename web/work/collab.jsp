<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.controller.PostsController"%>
<%@page import="com.memorand.beans.Project"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.beans.Team"%>
<%@page import="com.memorand.controller.TeamsController"%>
<%@page import="com.memorand.controller.TasksController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String collab_id = request.getParameter("id");
    
    // VARIABLES EQUIPO
    String team_id = "null", team_name = "null", team_color = "null";
    
    // VARIABLES PROYECTO
    String proj_id = "null", proj_name = "null", proj_color = "null";
    
    if (collab_id == null || collab_id.isEmpty())
    {
        response.sendRedirect("home.jsp");
    }
    else
    {
        TeamsController teamc = new TeamsController();
        Team team = teamc.modelGetTeamInfoByCollab(collab_id);
        
        ProjectsController projc = new ProjectsController();
        Project proj = projc.modelGetProjectInfoByCollab(collab_id);
        
        if (team == null || proj == null)
        {
            response.sendRedirect("home.jsp");
        }
        else
        {
            team_id = team.getTeam_id();
            team_name = team.getTeam_name();
            team_color = team.getTeam_color();
            
            proj_id = proj.getProj_id();
            proj_name = proj.getProj_name();
            proj_color = proj.getProj_color();
            
            TasksController taskc = new TasksController();
            PostsController postc = new PostsController();
            UsersController userc = new UsersController();
%>

        <!DOCTYPE html>

        <html>

            <!-- HEAD -->
            <head>

                <jsp:include page="../XM-Resources/pages/imports.jspf"/>

                <title>Memorand | <%= proj_name %></title>

            </head>

            <!-- BODY -->
            <body>

                <h1><a href='home.jsp'>&larr;</a> Collab</h1>
                <!-- PONER ESTOS EN LA NAVBAR-->
                <a href='perfil.jsp'>Mi perfil</a>
                <a href='configuracion.jsp'>Configuracion</a>
                <a href='../signout'>Cerrar sesi&oacute;n</a>

                <hr>

                <h2><%= team_name %> > <%= proj_name %></h2>

                <hr>
                
                <p><button id="get_tasks">Tareas</button> <button id="get_posts">Publicaciones</button> <button id="get_people">Personal</button></p>
                
                <hr>
                
                <!-- PARTE PRINCIPAL - POR DEFECTO TAREAS, VER CONTROLLERS PARA MODIFICAR HTML -->
                <div id="content">
                    
<%
            String view = request.getParameter("view");
            TasksController taskc1 = new TasksController();
            TasksController taskc2= new TasksController();
            
            if (view != null)
            {
                switch (view)
                {
                    case "tasks":
%>
                        <%= taskc1.modelGetTasksTable(collab_id, "task_edate") %>
<%
                        break;
                    case "posts":
                        PostsController postc1 = new PostsController();
%>
                        <%= postc1.modelGetPosts(collab_id) %>
<%
                        break;
                    case "people":
                        UsersController userc1 = new UsersController();
%>
                        <%= userc1.modelGetPeople(collab_id) %>
<%
                        break;
                    default:
                        throw new AssertionError();
                }
            }
            else 
            {
%>
                <%= taskc1.modelGetTasksPanel(collab_id, "task_edate") %>
<%
            }
%>

                    
                </div>

                <script src="scripts/collab.js"></script>

            </body>

        </html>

<%
        }
    }
%>