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

        <title>Memorand | Nueva etiqueta</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='collab.jsp?id=<%= collab_id %>'>&larr;</a> Nueva etiqueta</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='perfil.jsp'>Mi perfil</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <form action="../tagnew?id=<%= collab_id %>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <input type="text" name="tag_name" id="tag_name" placeholder="Nombre etiqueta" required>
            <br>
            <input type="color" name="tag_color" id="tag_color" required>
            <br>
            <input type="submit" value="Nueva etiqueta">
        </form>
        
    </body>

</html>