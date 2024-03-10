<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.beans.Team"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.controller.TeamsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    TeamsController teamc = new TeamsController();
    Team team = new Team();
    
    String team_name = "null";
    String team_color = "FFFFFF";
    
    String user_type = (String) session.getAttribute("user_type");
    
    String team_id = request.getParameter("team_id");
    String view = request.getParameter("view");
    
    String stringView = "";
    
    
    if (user_type == null || user_type.isEmpty())
    {
        response.sendRedirect("home.jsp");
    }

    if (team_id == null || team_id.isEmpty())
    {
        response.sendRedirect("home.jsp");
    }
    else
    {
        if (view == null || view.isEmpty())
        {
            response.sendRedirect("departamento.jsp?team_id="+team_id+"&view=info");
        }
        else
        {
            switch (view)
            {
                case "info":
                    stringView = "Información";
                    break;
                case "estd":
                    stringView = "Estadísticas";
                    break;
                default:
                    response.sendRedirect("departamento.jsp?team_id="+team_id+"&view=info");
            }
            
            team = teamc.modelGetTeamInfoById(team_id);
            
            team_name = team.getTeam_name();
            team_color = team.getTeam_color();
        }
    }
%>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title><%= team_name %></title>
        
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
                    <h3><%= team_name %></h3>
                </div>
                <div class="col">
                    <br>
                    <h3>Herramientas</h3>
                </div>
            </div>
                
            <div class="row">
                <div class="col">
                    <h3><%=stringView%></h3>
                </div>
                <div class="col">
                    <a href="?team_id=<%=team_id%>&view=info">
                        <button>Información</button>
                    </a>
                    <a href="?team_id=<%=team_id%>&view=estd">
                        <button>Estadísticas</button>
                    </a>
                    <a href="#">
                        <button>Generar informe</button>
                    </a>
                </div>
            </div>
                        
        <%
            if (view != null)
            {
                switch (view)
                {
                    case "info":
        %>
                    INFORMACIÓN AQUÍ
        <%
                        break;
                    case "estd":
        %>
                    ESTADÍSTICAS AQUÍ
        <%
                        break;
                }
            }
        %>
                
            <br>
            <br>
            <a href="home.jsp?team_id=<%=team_id%>">Regresar</a>
            <br>
            
            <a href="../signout">Cerrar sesión</a>
            <br>
            
        </div>
        
    </body>
    
</html>