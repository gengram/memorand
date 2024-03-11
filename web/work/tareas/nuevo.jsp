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
        
        <title><%= proj_name %> | Nueva tarea</title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Nueva tarea</h3>
        
        <form action="../../tasknew?collab_id=<%= collab_id %>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <input type="text" name="task_name" id="task_name" placeholder="Nombre tarea" required>
            <br>
            <textarea name="task_info" id="task_info" cols="120" rows="10" placeholder="Describe tu tarea" style="resize: none" required></textarea>
            <br>
            <input type="datetime-local" name="task_edate" id="task_edate" required>
            <br>
            <select name="task_prior" id="task_prior" required>
                <option value="" disabled selected hidden>Prioridad</option>
                <option value="baja">Baja</option>
                <option value="media">Media</option>
                <option value="alta">Alta</option>
            </select>
            <select name="task_diff" id="task_diff" required>
                <option value="" disabled selected hidden>Dificultad</option>
                <option value="baja">Sencilla</option>
                <option value="media">Intermedia</option>
                <option value="alta">Compleja</option>
            </select>
            <br>
            <input type="submit" value="Nueva tarea">
            
        </form>

        <a href="../proyecto.jsp?collab_id=<%= collab_id %>">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
    </body>
    
</html>
