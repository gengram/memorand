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
    <style>
        .titulo {
            display: flex;
            align-items: center; /* Alineación vertical */

        }

        .titulo i {
            font-size: 32px;
            margin-right: 1rem;
        }

        .titulo b {
            margin-right: 1rem;
        }

        .titulo a {
            margin-left: auto; /* Empuja el elemento a la derecha */
        }

        .titulo a i {
            font-size: 18px;
            color: #2A2927;
            height: 32px; /* Altura fija */
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
                    <div id="content">
                        <%= teamc.modelGetTeams(user_id)%>
                    </div>
                    

                </div>
            </div>
        </div

        <!-- AQUI VA LA TABLA DE EQUIPOS Y PROYECTOS -->


    </body>

</html>