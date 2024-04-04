<!-- Memorand by Gengram © 2023 -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Home</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1>Panel de control</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='perfil.jsp'>Mi perfil</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <h2>Mis equipos</h2>

        <p>Vista: <button id="">Panel</button> <button id="">Lista</button></p>
        
        <!-- AQUI VA LA TABLA DE EQUIPOS Y PROYECTOS, VER COM.MEMORAND.SERVLETS.OBTENER / TeamsGet-->
        <div id="content">
        </div>
        
    </body>

</html>