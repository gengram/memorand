<%@page import="com.memorand.beans.Project"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.beans.Team"%>
<%@page import="com.memorand.controller.TeamsController"%>
<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.TasksController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String collab_id = request.getParameter("id");
    
    // VARIABLES EQUIPO
    String team_id = "null", team_name = "null", team_color = "null";
    
    // VARIABLES PROYECTO
    String proj_id = "null", proj_name = "null", proj_color = "null";
    
    if (collab_id == null)
    {
        response.sendRedirect("home.jsp");
    }
    else
    {
        TeamsController teamc = new TeamsController();
        Team team = teamc.modelGetTeamInfoByCollab(collab_id);
        
        team_id = team.getTeam_id();
        team_name = team.getTeam_name();
        team_color = team.getTeam_color();
        
        ProjectsController projc = new ProjectsController();
        Project proj = projc.modelGetProjectInfoByCollab(collab_id);
        
        proj_id = proj.getProj_id();
        proj_name = proj.getProj_name();
        proj_color = proj.getProj_color();
        
        if (team == null || proj == null)
        {
            response.sendRedirect("home.jsp");
        } 
        
        TasksController taskc = new TasksController();
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

            <p><button id="get_tasks">Tareas</button> <button id="get_posts">Publicaciones</button> <button id="get_people">Personal</button></p>

            <!-- PARTE DE TAREAS -->
            <div id="content">
                <a href='tasknew.jsp?id=<%= collab_id %>'>Nueva tarea</a>
                <a href='tagnew.jsp?id=<%= collab_id %>'>Nueva etiqueta</a>

                <p>Vista <button id="task_panel">Panel</button> <button id="task_tabla">Tabla</button></p>

                <div id="content_tasks">

                    <!-- ESCRIBE AQUI TU FUNCION DE PANEL -->

                    <%= taskc.modelGetTasksTable(collab_id, "task_edate") %>


                </div>
            </div>

            <hr>   

            <!-- PARTE DE PUBLICACIONES -->
            <div id="content">
                <form action="../../postnew?collab_id=<%= collab_id %>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                    <textarea name="task_info" id="task_info" cols="120" rows="10" placeholder="Publica un anuncio, pregunta o duda." maxlength="1024" style="resize: none" required></textarea>
                    <br>
                    <input type="submit" value="Nueva publicaci&oacute;n">
                </form>


                <div id="content_tasks">

                    <!-- FUNCION DE PUBLICACIONES -->

                </div>
            </div>

            <hr>        

            <!-- PARTE DE PERSONAL -->
            <div id="content">

                <div id="content_tasks">

                    <!-- FUNCION DE PERSONAS -->

                </div>

            </div>

        </body>

    </html>

<%
    }
%>