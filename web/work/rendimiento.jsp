<%@page import="com.memorand.beans.Project"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.beans.Team"%>
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
    
    String collab_id = request.getParameter("id");
    
    if (collab_id == null || collab_id.isEmpty())
    {
        response.sendRedirect("home.jsp");
    }
    else
    {
        TeamsController teamc = new TeamsController();
        Team team = teamc.beanGetTeamByCollab(collab_id);

        ProjectsController projc = new ProjectsController();
        Project proj = projc.beanGetProjectByCollab(collab_id);

        if (team == null || proj == null)
        {
            response.sendRedirect("home.jsp");
        }
        else
        {
            String team_id = team.getTeam_id();
            String team_name = team.getTeam_name();
            String team_color = team.getTeam_color();
            
            String proj_id = proj.getProj_id();
            String proj_name = proj.getProj_name();
            String proj_color = proj.getProj_color();
%>

<!DOCTYPE html>

<html>
    
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.5.0/echarts.min.js"></script>

        <title>Rendimiento de <%= team_name %></title>

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
    </style>
    
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>
        
        
        <div class="container">
            <div class="row mt-4">
                <div class="col-1"></div>
                                        
                <div class="col-4 mt-2">
                    <a href="home.jsp" id="backL">
                        <div class="card border border-1" style="max-height: 50px;">
                            <div class="row g-0">
                                <div class="col-md-2 rounded-start" style="background-color: #<%= team_color %>; max-height: 48px; max-width: 40px">
                                    <i class="bi bi-chevron-left ms-1" style="color: #2A2927; font-size: 30px"></i> 
                                </div>
                                <div class="col-md-10 ">
                                    <div class="card-header" style="background-color: transparent;">
                                        <p class="titulo ali ms-4 mb-0" style="color: #2A2927; font-size: 20px;">
                                            Rendimiento de <%= team_name %>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>                                        
                    </a>
                </div>
                <div class="col-2 d-flex justify-content-center align-items-center text-center">
                    <i class="bi bi-chevron-right" style="font-size: 40px; color: #AFB2B3"></i>
                </div>
                                        
                <div class="col-4 mt-2">
                    <div class="card border border-1" style="max-height: 50px;">
                        <div class="row g-0">
                            <div class="col-md-2 rounded-start" style="background-color: #<%= proj_color %>; max-height: 48px; max-width: 40px"></div>
                            <div class="col-md-10 ">
                                <div class="card-header" style="background-color: transparent;">
                                    <p class="titulo ms-4 mb-0" style="color: #2A2927; font-size: 20px;">
                                        <%= proj_name %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
                                    
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <hr class="mt-5">
                    <h4 class="mt-5">Estatus de tareas</h4>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row mt-3">
                <div class="col-1"></div>
                <div class="col-10">
                </div>
                <div class="col-1"></div>
            </div>
        </div>
    </body>
</html>
<%
        }
    }
%>