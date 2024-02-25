<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.beans.Project"%>
<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.beans.User"%>
<%@page import="com.memorand.controller.UsersController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    //String staff_type = (String) session.getAttribute("user_type");
    
    //if (staff_type == null || !staff_type.equals("staff"))
    //{
    //    response.sendRedirect("../index.jsp?error=100");
    //    session.invalidate();
    //}
    
    Project proj = new Project();
    ProjectsController projc = new ProjectsController();
    
    String proj_id = request.getParameter("proj_id");
    String proj_name = null;
    String proj_color = null;
    
    if (proj_id != null) 
    {
        proj = projc.modelGetProjectInfoById(proj_id);
        
        proj_name = proj.getProj_name();
        proj_color = proj.getProj_color();
    }
    else 
    {
        response.sendRedirect("../proyectos.jsp");
    }
    
%>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title><%= proj_name %></title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    <body>
        <h1>Memorand</h1>
        <h3><%= proj_name %></h3>
        
        <a href="editar.jsp?user_id=">Editar</a>
        <br>
        <a href="../proyectos.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
        <br>
        <br>
        <h5>Color</h5>
        <svg width='200' height='100'>
            <rect width='200' height='100' style='fill:#<%= proj_color %>; stroke:black; stroke-width:2'/>\n" +
        </svg>
        
        <br>
        <br>
        <h5>Nombre</h5>
        <p><%= proj_name %></p>
        
        
        <h3>Acerca del proyecto</h3>
        <br>
        <h3>Departamentos con este proyecto</h3>
        <table border="2" style="text-align: center">
            <thead>
                <tr>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        
    </body>
    
</html>
