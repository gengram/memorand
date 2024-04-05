<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.TeamsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String user_id = (String) session.getAttribute("user_id");
    
    TeamsController teamc = new TeamsController();
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Home</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1>Memorand</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='perfil.jsp'>Mi perfil</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <h2>Mis equipos</h2>

        <!-- AQUI VA LA TABLA DE EQUIPOS Y PROYECTOS -->
        <div id="content">
            <%= teamc.modelGetTeams(user_id) %>
        </div>
        
    </body>

</html>