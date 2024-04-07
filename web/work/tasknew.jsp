<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.TeamsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String collab_id = request.getParameter("id");
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Nueva tarea</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='collab.jsp?id=<%= collab_id %>'>&larr;</a> Nueva tarea</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='perfil.jsp'>Mi perfil</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <form action="../tasknew?id=<%= collab_id %>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <input type="text" name="task_name" id="task_name" placeholder="Nombre tarea" required>
            <br>
            <textarea name="task_info" id="task_info" cols="120" rows="10" placeholder="Describe tu tarea" style="resize: none" required></textarea>
            <br>
            <input type="datetime-local" name="task_edate" id="task_edate" required>
            <br>
            <select name="task_prior" id="task_prior" required>
                <option value="" disabled selected hidden>Prioridad</option>
                <option value="Baja">Baja</option>
                <option value="Media">Media</option>
                <option value="Alta">Alta</option>
            </select>
            <select name="task_diff" id="task_diff" required>
                <option value="" disabled selected hidden>Dificultad</option>
                <option value="Sencilla">Sencilla</option>
                <option value="Intermedia">Intermedia</option>
                <option value="Compleja">Compleja</option>
            </select>
            <br>
            <input type="submit" value="Nueva tarea">
        </form>
        
    </body>

</html>