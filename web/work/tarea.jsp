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
                    s_status = "completada";
                    break;
                case "Completada":
                    s_status = "incompleta";
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

    <!-- BODY -->
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>

        <div class="container">
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-10 d-flex justify-content-end ">
                    <p style="color: #25ce7b; font-size: 18px;"><a href='home.jsp'><i class="bi bi-chevron-left me-1"></i>Regresar al inicio</a></p>
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
                    <button class="btn navC rounded-1 btnnav active" id="get_tasks"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Ideas</p></button>
                </div>
                <div class="col-4 text-center border-bottom">
                    <button class="btn navC rounded-1 btnnav" id="get_posts"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Notas</p></button>
                </div>
                <div class="col-3 text-start border-bottom">
                    <button  class="btn navC rounded-1 btnnav" id="get_people"><p class="mb-2 ms-3 me-3" style="font-size: 18px">Lienzos</p></button>
                </div>
                <div class="col-1"></div>
            </div>
        </div>



        <h3>Informaci&oacute;n de la tarea</h3>
        <p><%= task_info%></p>
        <p><b>Fecha de creaci&oacute;n:</b> <%= s_sdate%> - <b>Fecha l&iacute;mite:</b> <%= s_edate%></p>
        <p><b>Estatus:</b> <%= task_status%> - <b>Prioridad:</b> <%= task_prior%> - <b>Dificultad:</b> <%= task_diff%></p>

        <br>

        <a href=''>Editar informaci&oacute;n</a>
        <a href=''>Marcar como <%= s_status%></a>

        <hr>

        <p><button id="get_ideas">Ideas</button> <button id="get_notes">Notas</button> <button id="get_canvas">Lienzos</button></p>

        <hr>

        <!-- PARTE PRINCIPAL - POR DEFECTO IDEAS, VER CONTROLLERS PARA MODIFICAR HTML -->
        <div id="content">
            <%= ideac.modelGetIdeasByTask(task_id)%>
            <hr>
            <%= notec.modelGetNotesByTask(task_id)%>
            <hr>
            <%= canvac.modelGetCanvasByTask(task_id)%>
        </div>

    </body>

</html>

<%
        }
    }
%>