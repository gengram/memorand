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
    
    if (task_id == null || task_id.isEmpty())
    {
        response.sendRedirect("home.jsp");
    }
    else
    {
        TasksController taskc = new TasksController();
        Task task = taskc.modelGetTaskInfoById(task_id);
        
        String task_name = "null", task_info = "null", task_status = "null", task_prior = "null", task_diff = "null";
        String s_edate = "null", s_sdate = "null";
        
        if (task == null)
        {
            response.sendRedirect("home.jsp");
        }
        else
        {
            CollabsController collabc = new CollabsController();
            Collab collab = collabc.modelGetCollabInfoByTask(task_id);
            
            String collab_id = collab.getCollab_id();
            
            ProjectsController projc = new ProjectsController();
            Project proj = projc.modelGetProjectInfoByCollab(collab_id);
            
            String proj_name = proj.getProj_name();
        
            task_name = task.getTask_name();
            task_info = task.getTask_info();
            task_status = task.getTask_status();
            task_prior = task.getTask_prior();
            task_diff = task.getTask_diff();
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
            s_edate = sdf.format(task.getTask_edate());
            s_sdate = sdf.format(task.getTask_sdate());
            
            String s_status = "null";
            
            switch (task_status)
            {
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

        <title>Memorand | <%= task_name %></title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='collab.jsp?id=<%= collab_id %>'>&larr;</a> Tarea</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='perfil.jsp'>Mi perfil</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <h2><%= proj_name %> > <%= task_name %></h2>
        
        <hr>
        
        <h3>Informaci&oacute;n de la tarea</h3>
        <p><%= task_info %></p>
        <p><b>Fecha de creaci&oacute;n:</b> <%= s_sdate %> - <b>Fecha l&iacute;mite:</b> <%= s_edate %></p>
        <p><b>Estatus:</b> <%= task_status %> - <b>Prioridad:</b> <%= task_prior %> - <b>Dificultad:</b> <%= task_diff %></p>
        
        <br>
        
        <a href=''>Editar informaci&oacute;n</a>
        <a href=''>Marcar como <%= s_status %></a>
        
        <hr>
        
        <p><button id="get_ideas">Ideas</button> <button id="get_notes">Notas</button> <button id="get_canvas">Lienzos</button></p>
        
        <hr>
        
        <!-- PARTE PRINCIPAL - POR DEFECTO IDEAS, VER CONTROLLERS PARA MODIFICAR HTML -->
        <div id="content">
            <%= ideac.modelGetIdeasByTask(task_id) %>
            <hr>
            <%= notec.modelGetNotesByTask(task_id) %>
            <hr>
            <%= canvac.modelGetCanvasByTask(task_id) %>
        </div>
        
    </body>

</html>

<%
        }
    }
%>