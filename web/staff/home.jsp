<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.InstitutionsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    InstitutionsController instc = new InstitutionsController();
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand Staff | Home</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1>Panel de control</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='ventas.jsp'>Ventas</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <h2>Instituciones</h2>
        <a href='instnew.jsp'>Nueva instituci&oacute;n</a>
        <p>Estatus: <button id="active_inst">Activas</button> <button id="inactive_inst">Inactivas</button></p>
        
        <!-- AQUI VA LA TABLA DE INSTITUCIONES, VER COM.MEMORAND.SERVLETS.OBTENER / InstitutionGet-->
        <div id="content">
            <%= instc.modelGetAllInstByStatus("si") %>
        </div>
        
        <script src="scripts/home.js"></script>
        
    </body>

</html>