<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.TeamsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // PROTECCIÓN
    String u = (String) session.getAttribute("user_type");
    
    if(session == null || u == null)
    {
        response.sendRedirect("../index.jsp?error=InvalidSession");
    }
    
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
        <title>Memorand | Mis equipos</title>

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
        /* Estilos para tamaños de pantalla pequeños */
        @media (max-width: 1500px) {
            .col-2 {
                flex: 0 0 auto;
                width: 0%;
            }
            .col-8 {
                flex: 0 0 auto;
                width: 100%;
            }
        }

        /* Estilos para tamaños de pantalla medianos y grandes */
        @media (max-width: 577px) {
            .col-2 {
                flex: 0 0 auto;
                width: 16.66666667%;
            }
            .col-8 {
                flex: 0 0 auto;
                width: 66.66666667%;
            }
        }
        
        @media (max-width: 2500px) {
            .colC-1 {
                flex: 0 0 auto;
                width: 0%;
            }
            .colC-3 {
                flex: 0 0 auto;
                width: 33.33333333%;
            }
            .colC-4 {
                flex: 0 0 auto;
                width: 33.33333333%;
            }
            .colC-10{
                flex: 0 0 auto;
                width: 100%;
            }
            .modal-xlM{
                max-width: 25%;
            }
        }
    </style>

    <!-- BODY -->
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>

        <div class="container-sm mt-5">
            <div class="row">
                <div class="col-2 d-none d-sm-block"></div>
                <div class="col-8">
                    <h1 class="">Mis equipos</h1>
                </div>
                <div class="col-2 d-none d-sm-block"></div>
            </div>
            <div class="row mt-5">
                <div class="col-2 d-none d-sm-block"></div>
                <div class="col-8">
                    <!-- AQUI VA LA TABLA DE EQUIPOS Y PROYECTOS -->
                    <div id="content">
                        <%= teamc.workGetTeamsByUser(user_id)%>
                    </div>
                </div>
                <div class="col-2 d-none d-sm-block"></div>
            </div>
        </div>
                    
        

        <script>
            function redirectToPage(page) {
                var selectElement = document.getElementById(page);
                var url = selectElement.value;
                if (url) {
                    window.location.href = url;
                }
            }
        </script>
    </body>
</html>