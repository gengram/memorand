<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.beans.Team"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.controller.TeamsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    String team_id = request.getParameter("team_id");
    String user_id = (String) session.getAttribute("user_id");

    String user_type = (String) session.getAttribute("user_type");
    String inst_type = (String) session.getAttribute("inst_type");
    
    String collab_id = request.getParameter("collab_id");
    
    if (collab_id == null || collab_id.equals(""))
    {
        response.sendRedirect("home.jsp");
    }

    if (user_type != null)
    {
        switch (user_type)
        {
            case "ch":
                user_type = "Lider";
                break;
            case "wk":
                user_type = "Integrante";
                break;
        }
    } 
    
    ProjectsController projc = new ProjectsController();
    
    TeamsController teamc = new TeamsController();
    Team team = new Team();
    
%>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title> NOMBRE DEL PROYECTO </title>
        
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
                    <h3>Nombre del equipo > Nombre del proyecto</h3>
                </div>
                
                <div class="col">
                    <br>
                    <a href="">
                        <button>Nueva tarea</button>
                    </a>
                    <a href="">
                        <button>Nueva etiqueta</button>
                    </a>
                </div>
                
            </div>
            
            <br>
            <div class="row">
                
                <div class="col">
                    <h3>Tareas</h3>
                    <h5>Ordenar por:</h5>
                </div>
                <div class="col">
                    <br>
                    <a href="?collab_id=<%=collab_id%>&view=call">
                        <button>Calendario</button>
                    </a>
                    <a href="?collab_id=<%=collab_id%>&view=prty">
                        <button>Prioridad</button>
                    </a>
                    <a href="?collab_id=<%=collab_id%>&view=stat">
                        <button>Estatus</button>
                    </a>
                    <a href="?collab_id=<%=collab_id%>&view=date">
                        <button>Fecha</button>
                    </a>
                </div>

            </div>
                        
            <br>
            <div class="row">
                
                <div class="col">
                    <p>No hay ninguna tarea para mostrar</p>
                </div>
                
            </div>
                        
            <br>
            <div class="row">
                
                <div class="col">
                    <h3>Publicaciones</h3>
                </div>
                <div class="col">
                    <a href="">
                        <button>Nueva publicación</button>
                    </a>
                </div>
            </div>
            
            <br>
            <div class="row">
                
                <div class="col">
                    <p>No hay ninguna publicación para mostrar</p>
                </div>
                
            </div>
                
            <br>
            <a href="home.jsp">Regresar</a>
            <br>
            
            <a href="../signout">Cerrar sesión</a>
            <br>
            
        </div>
        
    </body>
    
</html>