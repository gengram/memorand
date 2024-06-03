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
    String user_id = (String) session.getAttribute("user_id");

    // VARIABLES EQUIPO
    String team_id = "null", team_name = "null", team_color = "null";

    // VARIABLES PROYECTO
    String proj_id = "null", proj_name = "null", proj_color = "null";

    if (collab_id == null || collab_id.isEmpty()) {
        response.sendRedirect("home.jsp");
    } else {
        TeamsController teamc = new TeamsController();
        Team team = teamc.beanGetTeamByCollab(collab_id);

        ProjectsController projc = new ProjectsController();
        Project proj = projc.beanGetProjectByCollab(collab_id);

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
        .btnnav.active {
            border-bottom: 4px solid #<%=proj_color%>; /* Aplica el borde inferior cuando el botón está activo */
        }
        .btnnav{
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

        .btnReactions.activeP{
            display: inline-block;
            border: 2px solid #<%=proj_color%>; /* Color del contorno */
            color: #fff; /* Color del texto */
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            background-color: #<%=proj_color%>; /* Fondo transparente */
        }

        .btnReactions{
            display: inline-block;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            background-color: #E3E4E5; /* Fondo transparente */
        }

        .custom-p {
            margin-bottom: 0.1rem; /* Ajusta el margen inferior según sea necesario */
        }

        .modal-custom {
            max-width: 510px;
        }

        .btn-color {
            border-color: #E3E4E5;
            background-color: transparent;
            padding-bottom: 0.05rem;
            padding-top: 0.05rem;
            padding-left: 0.35rem;
            padding-right: 0.35rem;
        }
        .btn-color:hover{
            border-color: #E3E4E5;
            background-color: #E3E4E5;
        }
        .dropdown-toggle:after {
            display: none;
        }

        /* Estilos para tamaños de pantalla pequeños */
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
                max-width: 75%;
            }
        }

        /* Estilos para tamaños de pantalla medianos y grandes */
        @media (max-width: 577px) {
            .colC-1 {
                flex: 0 0 auto;
                width: 8.33333333%;
            }
            .colC-3 {
                flex: 0 0 auto;
                width: 25%;
            }
            .colC-4 {
                flex: 0 0 auto;
                width: 33.33333333%;
            }
            .colC-10{
                flex: 0 0 auto;
                width: 83.33333333%;
            }
            .modal-xlM{
                max-width: 70%;
            }
        }
    </style>
    <!-- BODY -->
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>

        <div class="container">
            <div class="row mt-4">
                <div class="col-lg-1 d-none d-lg-block"></div>
                <div class="col-lg-10 mt-2">
                    <div class="row">
                        <div class="col-5 mt-2">
                            <a href="home.jsp" id="backL">
                                <div class="card border border-1" style="max-height: 50px;">
                                    <div class="row g-0">
                                        <div class="col-md-2 rounded-start" style="background-color: #<%=team_color%>; max-height: 48px; max-width: 40px">
                                            <i class="bi bi-chevron-left ms-1" style="color: #2A2927; font-size: 30px"></i>
                                        </div>
                                        <div class="col-md-10 ">
                                            <div class="card-header" style="background-color: transparent;">
                                                <p class="titulo ms-4 mb-0" style="color: #2A2927; font-size: 20px;">
                                                    <%= team_name%>
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
                        <div class="col-5 mt-2">
                            <div class="card border border-1" style="max-height: 50px;">
                                <div class="row g-0">
                                    <div class="col-md-2 rounded-start" style="background-color: #<%=proj_color%>; max-height: 48px; max-width: 40px"></div>
                                    <div class="col-md-10 ">
                                        <div class="card-header" style="background-color: transparent;">
                                            <p class="titulo ali ms-4 mb-0" style="color: #2A2927; font-size: 20px;">
                                                <%= proj_name%>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div> 

                        </div>
                    </div>
                </div>
                <div class="col-lg-1 d-none d-lg-block"></div>
            </div>

            <div class="row mt-4">
                <div class="col-lg-1 d-none d-lg-block"></div>
                <div class="col-lg-10">
                    <hr class="mt-4">
                </div>
                <div class="col-lg-1 d-none d-lg-block"></div>
            </div>
            <div class="row mt-2">
                <div class="colC-1 d-none d-sm-block"></div>
                <div class="col-3 text-end">
                    <button class="btn navC rounded-1 btnnav active pred" id="get_tasks"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Tareas</p></button>
                </div>
                <div class="colC-4 text-center">
                    <button class="btn navC rounded-1 btnnav" id="get_posts"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Publicaciones</p></button>
                </div>
                <div class="col-3 text-start">
                    <button  class="btn navC rounded-1 btnnav" id="get_people"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Personal</p></button>
                </div>
                <div class="colC-1 d-none d-sm-block"></div>
            </div>
            <div class="row mt-0">
                <div class="col-lg-1 d-none d-lg-block"></div>
                <div class="col-lg-10">
                    <hr class="mt-4">
                </div>
                <div class="col-lg-1 d-none d-lg-block"></div>
            </div>

            <!-- Modal Nueva tarea -->                            
            <div class="modal fade" tabindex="-1" role="dialog" id="modalTaskNew">
                <div class="modal-dialog modal-dialog-centered modal-xlM" role="document">
                    <div class="modal-content rounded-4 shadow">
                        <div class="modal-header p-5 pb-4 border-bottom-0">
                            <h1 class="fw-bold mb-0 fs-2" style="color: #2A2927">Nueva tarea</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body p-5 pt-2">
                            <form action="../tasknew?id=<%= collab_id%>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                                <div class="row">
                                    <div class="col-6" >
                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label">Nombre</label>
                                            <input type="text" name="task_name" id="task_name" class="form-control-sm rounded-3" placeholder="Deberes" required>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label class="form-label ms-4">Prioridad</label>
                                            <select name="task_prior" id="task_prior" class="form-select ms-4" style="border-color: #E3E4E5;" required>
                                                <option value="" disabled selected hidden>Selecciona uno</option>
                                                <option value="Baja">Baja</option>
                                                <option value="Media">Media</option>
                                                <option value="Alta">Alta</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label class="form-label">Dificultad</label>
                                            <select  name="task_diff" id="task_diff" class="form-select me-4" style="border-color: #E3E4E5;" required>
                                                <option value="" disabled selected hidden>Selecciona uno</option>
                                                <option value="Sencilla">Sencilla</option>
                                                <option value="Intermedia">Intermedia</option>
                                                <option value="Compleja">Compleja</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-11">
                                        <label for="disabledSelect" class="form-label">Descripci&oacute;n</label>
                                        <textarea class="form-control" name="task_info" id="task_info" rows="7" placeholder="Describe tu tarea" style="resize: none; border-color: #E3E4E5;" required></textarea>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label for="disabledSelect" class="form-label">Fecha l&iacute;mite</label>
                                            <input class="form-control-sm" type="datetime-local" name="task_edate" id="task_edate" required>
                                        </div>
                                    </div>
                                    <div class="col-3"></div>
                                    <div class="col-6 mt-5 text-end">
                                        <div class="me-4">
                                            <button type="submit" class="btn btn-lg rounded-pill custom-bcollab mb-2 me-5"><p class="mt-1 mb-1 me-2 ms-2" style="font-size: 16px;"> <i class="bi bi-plus-lg me-2" style="font-size: 18px;"></i>Nueva tarea</p></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
            </div>

            <!-- PARTE PRINCIPAL - POR DEFECTO TAREAS, VER CONTROLLERS PARA MODIFICAR HTML -->
            <div id="content" >

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
                <%= postc1.workGetPostsByCollab(user_id, collab_id)%>

                <%
                        break;
                    case "people":
                        UsersController userc1 = new UsersController();
                %>
                <%= userc1.workGetUsersByCollab(collab_id)%>
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
        </div>
        <script src="scripts/collab.js"></script>
        <script src="scripts/interface.js"></script>
    </body>

</html>

<%
        }
    }
%>