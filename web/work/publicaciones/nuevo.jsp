<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.beans.Project"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    ProjectsController projc = new ProjectsController();
    Project proj = new Project();
    
    String collab_id = request.getParameter("collab_id");
    
    String proj_name = "null";
    
    if (collab_id != null)
    {
        proj = projc.modelGetProjectInfoByCollab(collab_id);
        
        proj_name = proj.getProj_name();
    }
    else
    {
        response.sendRedirect("../home.jsp");
    }
%>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title><%= proj_name %> | Nueva publicación</title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Nueva publicación</h3>
        
        <form action="../../postnew?collab_id=<%= collab_id %>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <textarea name="task_info" id="task_info" cols="120" rows="10" placeholder="Publica un anuncio, pregunta o duda." maxlength="1024" style="resize: none" required></textarea>
            <br>
            <input type="submit" value="Nueva publicación">
        </form>

        <a href="../proyecto.jsp?collab_id=<%= collab_id %>">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
    </body>
    
</html>
