<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.controller.PostsController"%>
<%@page import="com.memorand.beans.Project"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.beans.Team"%>
<%@page import="com.memorand.controller.TeamsController"%>
<%@page import="com.memorand.controller.TasksController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String collab_id = request.getParameter("id");

    // VARIABLES EQUIPO
    String team_id = "null", team_name = "null", team_color = "null";

    // VARIABLES PROYECTO
    String proj_id = "null", proj_name = "null", proj_color = "null";

    if (collab_id == null || collab_id.isEmpty()) {
        response.sendRedirect("home.jsp");
    } else {
        TeamsController teamc = new TeamsController();
        Team team = teamc.modelGetTeamInfoByCollab(collab_id);

        ProjectsController projc = new ProjectsController();
        Project proj = projc.modelGetProjectInfoByCollab(collab_id);

        if (team == null || proj == null) {
            response.sendRedirect("home.jsp");
        } else {
            team_id = team.getTeam_id();
            team_name = team.getTeam_name();
            team_color = team.getTeam_color();

            proj_id = proj.getProj_id();
            proj_name = proj.getProj_name();
            proj_color = proj.getProj_color();

            TasksController taskc = new TasksController();
            PostsController postc = new PostsController();
            UsersController userc = new UsersController();
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

        <title>Memorand | <%= proj_name%></title>

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
        }
        .btn.active {
            border-bottom: 4px solid #<%=proj_color%>; /* Aplica el borde inferior cuando el botón está activo */
        }
        .btn {
            border: none; /* Quita todos los bordes de los botones inactivos */
        }

        .custom-bcollab{
            display: inline-block;
            padding: 1px 10px;
            border: 2px solid #<%=proj_color%>; /* Color del contorno */
            color: #fff; /* Color del texto */
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            background-color: #<%=proj_color%>; /* Fondo transparente */
        }

        .custom-bcollab:hover {
            background-color: #fff; /* Cambiar el color de fondo al pasar el ratón */
            border: 2px solid #<%=proj_color%>; /* Color del contorno */
            color: #<%=proj_color%>; /* Cambiar el color del texto al pasar el ratón */
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Seleccionar todos los botones
            const buttons = document.querySelectorAll('.navC');

            // Agregar event listeners a cada botón
            buttons.forEach(button => {
                button.addEventListener('click', function () {
                    // Remover clase 'active' de todos los botones
                    buttons.forEach(navC => {
                        navC.classList.remove('active');
                    });

                    // Agregar clase 'active' al botón actual
                    this.classList.add('active');
                });
            });
        });
    </script>
    <!-- BODY -->
    <body>
        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>

        <div class="container">
            <div class="row mt-4">
                <div class="col-12 d-flex justify-content-end ">
                    <p style="color: #25ce7b; font-size: 18px;"><a href='home.jsp'><i class="bi bi-chevron-left me-1"></i>Regresar al inicio</a></p>
                </div>
            </div>
            <div class="row">
                <div class="col-5 mt-2">
                    <div class="card border border-2" style="max-height: 50px;">
                        <div class="row g-0">
                            <div class="col-md-2" style="background-color: #<%=team_color%>; max-height: 46px; max-width: 40px"></div>
                            <div class="col-md-10 ">
                                <div class="card-header" style="background-color: transparent;">
                                    <p class="titulo" style="color: #2A2927; font-size: 20px;">
                                        <a href="?">
                                            <b style="color: #2A2927" class="ms-4 mb-0"><%= team_name%></b>
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-2 d-flex justify-content-center align-items-center text-center">
                    <i class="bi bi-chevron-right" style="font-size: 40px; color: #AFB2B3"></i>
                </div>
                <div class="col-5 mt-2">
                    <div class="card border border-2" style="max-height: 50px;">
                        <div class="row g-0">
                            <div class="col-md-2" style="background-color: #<%=proj_color%>; max-height: 46px; max-width: 40px"></div>
                            <div class="col-md-10 ">
                                <div class="card-header" style="background-color: transparent;">
                                    <p class="titulo" style="color: #2A2927; font-size: 20px;">
                                        <a href="?">
                                            <b style="color: #2A2927" class="ms-4 mb-0"><%= proj_name%></b>
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>                                        
                </div>
                <hr class="mt-4">
            </div>
            <div class="row">
                <div class="col-4 text-end">
                    <button class="btn navC rounded-1 active" id="get_tasks"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Tareas</p></button>
                </div>
                <div class="col-4 text-center">
                    <button class="btn navC rounded-1" id="get_posts"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Publicaciones</p></button>
                </div>
                <div class="col-4 text-start">
                    <button  class="btn navC rounded-1" id="get_people"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Personal</p></button>
                </div>
                <hr>
            </div>
            <div class="row">
                <div class="col-6" >
                    <div class="row">
                        <div class="col-4 text-start">
                            <label for="inputPassword6" class="col-form-label">Filtrar por etiqueta:</label>
                        </div>
                        <div class="col-8 mt-1">
                            <select class="form-select border-gray" aria-label="Default select">
                                <option selected style="font-size: 2rem">Selecciona uno</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-6" >
                    <div class="row ">
                        <div class="col-6 text-end">
                            <label for="inputPassword6" class="col-form-label" >Filtrar por etiqueta:</label>
                        </div>
                        <div class="col-6 mt-1 text-center">
                            <div class="btn-group" role="group" aria-label="Vertical radio toggle button group">
                                <input type="radio" class="btn-check" name="vbtn-radio" id="vbtn-radio1" autocomplete="off" checked>
                                <label class="btn btn-outline-gray border" for="vbtn-radio1" style="padding: 0.375rem 0.75rem; font-size: 1rem;">Fecha Lim.</label>

                                <input type="radio" class="btn-check" name="vbtn-radio" id="vbtn-radio2" autocomplete="off">
                                <label class="btn btn-outline-gray border" for="vbtn-radio2" style="padding: 0.375rem 0.75rem; font-size: 1rem;">Estatus</label>

                                <input type="radio" class="btn-check" name="vbtn-radio" id="vbtn-radio3" autocomplete="off">
                                <label class="btn btn-outline-gray border" for="vbtn-radio3" style="padding: 0.375rem 0.75rem; font-size: 1rem;">Prioridad</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6" >
                    <a href="?">
                        <button class="btn btn-lg rounded-pill custom-bcollab">
                            <p class="mb-1 mt-1 me-2 ms-2" style="font-size: 18px;"><i class="bi bi-plus-lg me-2" style="font-size: 20px;"></i>Nueva tarea</p> 
                        </button>
                    </a>
                    <a href="?">
                        <button class="btn btn-lg rounded-pill custom-bcollab ms-4">
                            <p class="mb-1 mt-1 me-2 ms-2" style="font-size: 18px;"><i class="bi bi-plus-lg me-2" style="font-size: 20px;"></i> Nueva etiqueta</p> 
                        </button>
                    </a>
                </div>
                <div class="col-6">

                </div>
            </div>
        </div>

        <!-- PARTE PRINCIPAL - POR DEFECTO TAREAS, VER CONTROLLERS PARA MODIFICAR HTML -->
        <div id="content">

            <%
                String view = request.getParameter("view");
                TasksController taskc1 = new TasksController();
                TasksController taskc2 = new TasksController();

                if (view != null) {
                    switch (view) {
                        case "tasks":
            %>
            <div id="tasks">
                <%= taskc1.modelGetTasksPanel(collab_id, "task_edate")%>
            </div>
            <%
                    break;
                case "posts":
                    PostsController postc1 = new PostsController();
            %>
            <%= postc1.modelGetPosts(collab_id)%>
            <%
                    break;
                case "people":
                    UsersController userc1 = new UsersController();
            %>
            <%= userc1.modelGetPeople(collab_id)%>
            <%
                        break;
                    default:
                        throw new AssertionError();
                }
            } else {
            %>
            <div id="tasks">
                <%= taskc1.modelGetTasksPanel(collab_id, "task_edate")%>
            </div>
            <%
                }
            %>

        </div>
        <script src="scripts/collab.js"></script>
    </body>

</html>

<%
        }
    }
%>