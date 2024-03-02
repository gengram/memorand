<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.ProjectsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    String team_id = request.getParameter("team_id");
    
    if (team_id == null)
    {
        response.sendRedirect("home.jsp");
    }
    
    ProjectsController projc = new ProjectsController();

%>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Inicio</title>
        
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    <%-- BODY --%>
    <body>
        <h3>Proyectos</h3>
        <table border="2" style="text-align: center">
            <thead>
                <tr>
                    <th>proj_name</th>
                    <th>proj_color</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%= projc.modelGetAllProjectsByTeamRed2(team_id) %>
            </tbody>
        </table>
    </body>
    
</html>
