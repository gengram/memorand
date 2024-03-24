<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.TasksController"%>
<%@page import="com.memorand.controller.TagsController"%>
<%@page import="com.memorand.controller.PostsController"%>
<%@page import="com.memorand.beans.Project"%>
<%@page import="com.memorand.beans.Team"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.controller.TeamsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    TagsController tagc = new TagsController();
    
    TeamsController teamc = new TeamsController();
    Team team = new Team();
    
    String team_id = "null";
    String team_name = "null";
    
    ProjectsController projc = new ProjectsController();
    Project proj = new Project();
    
    String proj_name = "null";
    
    TasksController taskc = new TasksController();
    PostsController postc = new PostsController();
    
    String user_type = (String) session.getAttribute("user_type");
    
    String collab_id = request.getParameter("collab_id");
    String view = request.getParameter("view");

    if (user_type == null || user_type.isEmpty())
    {
        response.sendRedirect("../index.jsp?error=100");
        session.invalidate();
    }
    
    if (collab_id == null || collab_id.equals(""))
    {
        response.sendRedirect("home.jsp");
    }
    else
    {
        team = teamc.modelGetTeamInfoByCollab(collab_id);
        
        team_id = team.getTeam_id();
        team_name = team.getTeam_name();
        
        proj = projc.modelGetProjectInfoByCollab(collab_id);
        
        proj_name = proj.getProj_name();
    }
%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title><%= proj_name %></title>
        
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    
    <%-- BODY --%>
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>
        
        <div class="container">
            
            <div class="row">
                
                <div class="col">
                    <br>
                    <h3><%= team_name %> > <%= proj_name %></h3>
                </div>
                
            <%
                if (user_type.equals("ch")) 
                {
            %>
                <div class="col">
                    <br>
                    <a href="tareas/nuevo.jsp?collab_id=<%= collab_id %>">
                        <button>Nueva tarea</button>
                    </a>
                    <a href="etiquetas/nuevo.jsp?collab_id=<%= collab_id %>">
                        <button>Nueva etiqueta</button>
                    </a>
                </div>
            <%
                }
            %>
                
            </div>
            
            <br>
            <div class="row">
                
                <div class="col">
                    <h3>Tareas</h3>
                    <h5>Ordenar por:</h5>
                </div>
                
                <div class="col">
                <%
                    if (view != null)
                    {
                %>
                    
                    <a href="?collab_id=<%=collab_id%>">
                        <button>Reiniciar</button>
                    </a>
                <%
                    }
                %>
                    <a href="?collab_id=<%=collab_id%>&view=call">
                        <button>Calendario</button>
                    </a>
                    <a href="?collab_id=<%=collab_id%>&view=prio">
                        <button>Prioridad</button>
                    </a>
                    <a href="?collab_id=<%=collab_id%>&view=stat">
                        <button>Estatus</button>
                    </a>
                    <a href="?collab_id=<%=collab_id%>&view=date">
                        <button>Fecha</button>
                    </a>
                    <a href="?collab_id=<%=collab_id%>&view=tags">
                        <button>Etiquetas</button>
                    </a>
                <%
                    if ("tags".equals(view))
                    {
                %>
                    <form action="" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                        <select name="tag_name" id="tag_name">
                            <option value="" disabled selected hidden>Etiqueta</option>
                            <%= tagc.modelGetListTagsByCollab(collab_id) %>
                        </select>
                        <input type="submit" value="Ordenar">
                    </form>
                <%
                    }
                %>
                </div>
                    
            </div>
                        
            <br>
            <div class="row">
            
    <%
        if (collab_id != null)
        {
            if (taskc.modelIsAnyTaskByCollab(collab_id))
            {
    %>
                <%= taskc.modelGetAllTasksByCollab(collab_id,"task_edate") %>
    <%
            }
            else
            {
    %>
                <div class="col">
                    <p>No hay ninguna tarea para mostrar</p>
                </div>
    <%
            }
        }
    %>
                
            </div>
                        
            <br>
            <div class="row">
                
                <div class="col">
                    <h3>Publicaciones</h3>
                </div>
                <div class="col">
                    <a href="publicaciones/nuevo.jsp?collab_id=<%= collab_id %>">
                        <button>Nueva publicación</button>
                    </a>
                </div>
            </div>
            
            <br>
            <div class="row">
                
    <%
        if (collab_id != null)
        {
            if (postc.modelIsAnyPostByCollab(collab_id))
            {
    %>
                <%= postc.modelGetAllPostsByCollab(collab_id) %>
    <%
            }
            else
            {
    %>
                <div class="col">
                    <p>No hay ninguna publicación para mostrar</p>
                </div>
    <%
            }
        }
    %>
                
            </div>
                
            <br>
            <a href="home.jsp?team_id=<%= team_id %>">Regresar</a>
            <br>
            
            <a href="../signout">Cerrar sesión</a>
            <br>
            
        </div>
        
    </body>
    
</html>