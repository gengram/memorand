<%@page import="com.memorand.controller.CanvasController"%>
<%@page import="com.memorand.controller.NotesController"%>
<%@page import="com.memorand.controller.IdeasController"%>
<%@page import="com.memorand.beans.Project"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.beans.Collab"%>
<%@page import="com.memorand.controller.CollabsController"%>
<!-- Memorand by Gengram © 2023 -->

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.memorand.beans.Task"%>
<%@page import="com.memorand.controller.TasksController"%>
<%@page import="com.memorand.controller.TeamsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String task_id = request.getParameter("id");
    String team_id = request.getParameter("id");

    if (task_id == null || task_id.isEmpty()) {
        response.sendRedirect("home.jsp");
    } else {
        TasksController taskc = new TasksController();
        Task task = taskc.modelGetTaskInfoById(task_id);

        String task_name = "null", task_info = "null", task_status = "null", task_prior = "null", task_diff = "null", task_color = "";
        String s_edate = "null", s_sdate = "null";

        if (task == null) {
            response.sendRedirect("home.jsp");
        } else {
            CollabsController collabc = new CollabsController();
            Collab collab = collabc.modelGetCollabInfoByTask(task_id);

            String collab_id = collab.getCollab_id();

            ProjectsController projc = new ProjectsController();
            Project proj = projc.modelGetProjectInfoByCollab(collab_id);

            String proj_name = proj.getProj_name();
            String proj_color = proj.getProj_color();

            task_name = task.getTask_name();
            task_info = task.getTask_info();
            task_status = task.getTask_status();
            task_prior = task.getTask_prior();
            task_diff = task.getTask_diff();

            if (task_status.equals("Incompleta")) {
                task_color = "F3894D";
            } else if (task_status.equals("Completa")) {
                task_color = "25CE7B";
            } else if (task_status.equals("Atrasada")) {
                task_color = "F24848";
            }

            SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
            s_edate = sdf.format(task.getTask_edate());
            s_sdate = sdf.format(task.getTask_sdate());

            String s_status = "null";

            switch (task_status) {
                case "Incompleta":
                case "Atrasada":
                    s_status = "Completada";
                    break;
                case "Completada":
                    s_status = "Incompleta";
                    break;
                default:
                    break;
            }

            IdeasController ideac = new IdeasController();
            NotesController notec = new NotesController();
            CanvasController canvac = new CanvasController();
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

        <title>Memorand | <%= task_name%></title>

    </head>
    <style>
        .btnnav.active {
            border-bottom: 4px solid #<%=proj_color%>; /* Aplica el borde inferior cuando el botón está activo */
        }
        .btnnav{
            border: none; /* Quita todos los bordes de los botones inactivos */
        }

        .custom-btarea{
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
        .custom-btarea:hover {
            background-color: #fff; /* Cambiar el color de fondo al pasar el ratón */
            border: 2px solid #<%=proj_color%>; /* Color del contorno */
            color: #<%=proj_color%>; /* Cambiar el color del texto al pasar el ratón */
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
    </style>
    <!-- BODY -->
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>

        <div class="container">
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-10 d-flex justify-content-end ">
                    <p style="color: #25ce7b; font-size: 18px;"><a id="backLink" href='collab.jsp?id=<%= collab_id%>'><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-4 mt-2">
                    <div class="card border border-2" style="max-height: 50px;">
                        <div class="row g-0">
                            <div class="col-md-2 rounded-start" style="background-color: #<%=proj_color%>; max-height: 47px; max-width: 40px"></div>
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
                <div class="col-2 d-flex justify-content-center align-items-center text-center">
                    <i class="bi bi-chevron-right" style="font-size: 40px; color: #AFB2B3"></i>
                </div>
                <div class="col-4 mt-2">
                    <div class="card border border-2" style="max-height: 50px;">
                        <div class="row g-0">
                            <div class="col-md-2 rounded-start" style="background-color: #<%=task_color%>; max-height: 47px; max-width: 40px"></div>
                            <div class="col-md-10 ">
                                <div class="card-header" style="background-color: transparent;">
                                    <p class="titulo ali" style="color: #2A2927; font-size: 20px;">
                                        <a href="?">
                                            <b style="color: #2A2927" class="ms-4 mb-0"><%=task_name%></b>
                                        </a>
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
                    <hr class="mt-4">
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-3 text-end border-bottom">
                    <button class="btn navC rounded-1 btnnav active" id="get_ideas"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Ideas</p></button>
                </div>
                <div class="col-4 text-center border-bottom">
                    <button class="btn navC rounded-1 btnnav" id="get_notes"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Notas</p></button>
                </div>
                <div class="col-3 text-start border-bottom">
                    <button  class="btn navC rounded-1 btnnav" id="get_canvas"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Lienzos</p></button>
                </div>
                <div class="col-1"></div>
            </div>


            <div class="row mt-3">
                <div class="col-1"></div>
                <div class="col-6">
                    <h3>Informaci&oacute;n de la tarea</h3>
                    <p style=" color: #2A2927"><%=task_info%></p><text id="leerMasBtn" style="display: none; color: #AFB2B3" onclick="mostrarMas()">Leer más</text>
                    <p id="leerMenosBtn" style="display: none; color: #AFB2B3" onclick="mostrarMenos()">Leer menos</p>

                    <p class="mt-1"><b class="me-2">Fecha de creaci&oacute;n:</b><text class="me-5"><%= s_sdate%></text><b class="me-2 ms-1">Fecha l&iacute;mite:</b><%= s_edate%></p>
                    <div class="row" >
                        <div class="col-12">
                            <p >
                                <b class="me-2">Estatus:</b><text class="me-5" style="color: #<%=task_color%>;"><%= task_status%></text>
                                <b class="me-2">Prioridad:</b><text class="me-5"><%= task_prior%></text>
                                <b class="me-2">Dificultad:</b><text class="me-5"><%= task_diff%></text>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="row mt-3">
                        <div class="col-6">
                            <button class="btn btn-light rounded-pill ms-5" style="background-color: #F0F2FF; white-space: nowrap;"><i class="bi bi-pencil-square me-1" style="color: #<%=task_color%>;"></i></i>Editar tarea</button>
                        </div>
                        <div class="col-6">
                            <button class="btn btn-light rounded-pill" style="background-color: #F0F2FF"><i class="bi bi-check2-square me-1" style="color: #25ce7b;"></i><%= s_status%></button>
                        </div>
                    </div>
                    <h4 class="ms-5 mt-2">Nueva idea</h4>
                    <div class="mt-3 ms-5">
                        <div class="card border" style="width: 18rem; background-color: #F8F9FA; border-color: #AFB2B3;">
                            <div class="card-body text-center">
                                <p class="mt-4 mb-4" data-bs-toggle="modal" data-bs-target="#modalIdeaNew"><i class="bi bi-plus-lg" style="color: #2A2927; font-size: 60px"></i></p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-3">
                    <div class="card mb-3 border" style="max-width: 18rem; background-color: #B9D7A2;">
                        <div class="card-body">
                            <div class="row mt-0">
                                <div class="col-10">
                                    <button class="btn btn-light text-start mb-3" style="padding-bottom: 0rem; padding-top: 0rem;">
                                        <text style="font-size: 12px">Nombre del usuario</text>
                                        <p style="font-size: 11px; color: #CEC7C7; padding-bottom: 0rem; padding-top: 0rem;">hace 8 min</p>
                                    </button>
                                </div>
                                <div class="col-2 text-end">
                                    <i class="bi bi-three-dots-vertical"  style="color: #2A2927;"></i>
                                </div>
                            </div>
                            <b class="card-text" style="color: #2A2927;">Some quick example text to build on the card title and make up the bulk of the card's content.</b>
                        </div>
                    </div>

                </div>
                <div class="col-3">
                    <div class="card mb-3 border" style="max-width: 18rem; background-color: #B9D7A2;">
                        <div class="card-body">
                            <div class="row mt-0">
                                <div class="col-10">
                                    <button class="btn btn-light text-start mb-3" style="padding-bottom: 0rem; padding-top: 0rem;">
                                        <text style="font-size: 12px">Nombre del usuario</text>
                                        <p style="font-size: 11px; color: #CEC7C7; padding-bottom: 0rem; padding-top: 0rem;">hace 8 min</p>
                                    </button>
                                </div>
                                <div class="col-2 text-end">
                                    <i class="bi bi-three-dots-vertical"  style="color: #2A2927;"></i>
                                </div>
                            </div>
                            <b class="card-text" style="color: #2A2927;">Some quick example text to build on the card title and make up the bulk of the card's content.</b>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                        <div class="card mb-3 border" style="max-width: 18rem; background-color: #B9D7A2;">
                        <div class="card-body">
                            <div class="row mt-0">
                                <div class="col-10">
                                    <button class="btn btn-light text-start mb-3" style="padding-bottom: 0rem; padding-top: 0rem;">
                                        <text style="font-size: 12px">Nombre del usuario</text>
                                        <p style="font-size: 11px; color: #CEC7C7; padding-bottom: 0rem; padding-top: 0rem;">hace 8 min</p>
                                    </button>
                                </div>
                                <div class="col-2 text-end">
                                    <i class="bi bi-three-dots-vertical"  style="color: #2A2927;"></i>
                                </div>
                            </div>
                            <b class="card-text" style="color: #2A2927;">Some quick example text to build on the card title and make up the bulk of the card's content.</b>
                        </div>
                    </div>
            
                </div>
                <div class="col-2"></div>
            </div>
        </div>

        <!-- Modal Nueva Etiqueta -->                            
        <div class="modal fade" tabindex="-1" role="dialog" id="modalIdeaNew">
            <div class="modal-dialog modal-dialog-centered modal-custom" role="document">
                <div class="modal-content rounded-4 shadow">
                    <div class="modal-header p-5 pb-4 border-bottom-0">
                        <h1 class="fw-bold mb-0 fs-2" style="color: #2A2927">Nueva idea</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-5 pt-2">
                        <form action="../ideanew?id=<%= team_id%>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                            <div class="row mb-0">
                                <div class="col-12">
                                    <div class="mb-0">
                                        <label for="tag_color" class="form-label">Color de etiqueta:</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-12">
                                    <button class="btn btn-color me-2" type="button" onclick="selectColor('#B9D7A2')"><i style="color: #B9D7A2; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color me-2" type="button" onclick="selectColor('#96D5D9')"><i style="color: #96D5D9; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color me-2" type="button" onclick="selectColor('#A9AFE4')"><i style="color: #A9AFE4; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color me-2" type="button" onclick="selectColor('#E2C1E4')"><i style="color: #E2C1E4; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color me-2" type="button" onclick="selectColor('#F1B390')"><i style="color: #F1B390; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color me-2" type="button" onclick="selectColor('#F8DE9B')"><i style="color: #F8DE9B; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color" type="button" onclick="selectColor('#EFA1A1')"><i style="color: #EFA1A1; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <input type="hidden" name="idea_color" id="idea_color" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12" >
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Idea</label>
                                        <input type="text" name="idea_text" id="idea_text" placeholder="Texto de la idea" class="form-control-sm rounded-3" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12">
                                    <div class="mb-0">
                                        <button type="submit" class="btn btn-lg rounded-pill custom-btarea mb-0 me-5"><p class="mt-1 mb-1 me-2 ms-2" style="font-size: 16px;"> <i class="bi bi-plus-lg me-2" style="font-size: 18px;"></i>Agregar idea</p></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <script>
                            function selectColor(color) {
                                document.getElementById("selected_color").value = color;
                            }
                        </script>

                    </div>
                </div>
            </div> 
        </div>



        <br>

        <a href=''>Editar informaci&oacute;n</a>
        <a href=''>Marcar como <%= s_status%></a>

        <!-- PARTE PRINCIPAL - POR DEFECTO IDEAS, VER CONTROLLERS PARA MODIFICAR HTML -->
        <div id="content">
            <!-- Contenido -->
            <div id="ideas_content" class="content row">
                <%= ideac.modelGetIdeasByTask(task_id)%>
            </div>
            <div id="notes_content" class="content hidden">
                <%= notec.modelGetNotesByTask(task_id)%>
            </div>
            <div id="canvas_content" class="content hidden">
                <%= canvac.modelGetCanvasByTask(task_id)%>
            </div>
        </div>


    </body>
    <script src="scripts/interfaceTarea.js"></script>
</html>

<%
        }
    }
%>