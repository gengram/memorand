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

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        <title>Memorand | Home</title>

    </head>
    <style>
        /* Estilos CSS */
        .titulo {
            display: inline-block; /* Hace que los elementos estén en línea */
            vertical-align: top; /* Alinea verticalmente */
            margin-right: 10px; /* Espacio entre los elementos */
            color: #25ce7b;
            text-align: left;
        }

        .subtitulo {
            display: inline-block; /* Hace que los elementos estén en línea */
            vertical-align: middle; /* Alinea verticalmente */
            margin-top: 2px; /* Margen superior */
            margin-bottom: 4px; /* Margen inferior */
            text-align: right;

        }
    </style>

    <!-- BODY -->
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>

        <div class="container">
            <div class="row mt-5">
                <div class="col-12">
                    <h1>Mis equipos</h1>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-12">

                    
                    <%= teamc.modelGetTeams(user_id)%>
                    <hr>
                    

                </div>
            </div>
        </div

        <!-- AQUI VA LA TABLA DE EQUIPOS Y PROYECTOS -->
        <div id="content">

        </div>

    </body>

</html>