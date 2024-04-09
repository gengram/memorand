<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.TeamsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String team_id = request.getParameter("id");
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Nueva idea</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='tarea.jsp?id=<%= team_id %>'>&larr;</a> Nueva idea</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='perfil.jsp'>Mi perfil</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <form action="../ideanew?id=<%= team_id %>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <input type="color" name="idea_color" id="idea_color" required>
            <br>
            <input type="text" name="idea_text" id="idea_text" placeholder="Texto de la idea" required>
            <br>
            <input type="submit" value="Nueva idea">
        </form>
        
    </body>

</html>