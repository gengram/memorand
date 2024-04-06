<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.TasksController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String collab_id = request.getParameter("id");
    
    TasksController taskc = new TasksController();
%>

<!DOCTYPE html>

<html>
    
    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | NOMBRE DEL PROYECTO</title>
        
    </head>
    
    <!-- BODY -->
    <body>
        
        <h1><a href='home.jsp'>&larr;</a> Collab</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='perfil.jsp'>Mi perfil</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <h2>NOMBRE DEL EQUIPO > NOMBRE DEL PROYECTO</h2>

        <p><button id="get_tasks">Tareas</button> <button id="get_posts">Publicaciones</button> <button id="get_people">Personal</button></p>
        
        <!-- AQUI VA LA TABLA DE EQUIPOS Y PROYECTOS -->
        <div id="content">
            <a href='tasknew.jsp'>Nueva tarea</a>
            <a href='tagnew.jsp'>Nueva etiqueta</a>
            
            <p>Vista <button id="task_panel">Panel</button> <button id="task_tabla">Tabla</button></p>
            
            <div id="content_tasks">
                
                <%-- ESCRIBE AQUI TU FUNCION DE PANEL --%>
                
                <%= taskc.modelGetTasksTable(collab_id, "task_edate") %>
                
                <!-- <table border="1">
                    <thead>
                        <tr>
                            <th>Etiqueta</th>
                            <th>Nombre</th>
                            <th>Fecha l&iacute;mite</th>
                            <th>Estatus</th>
                            <th>Prioridad</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Nombre etiqueta</td>
                            <td>Nombre tarea</td>
                            <td>Fecha tarea</td>
                            <td>Estatus tarea</td>
                            <td>Prioridad tarea</td>
                            <td><a href='tarea.jsp?id='>Ver</a></td>
                        </tr>
                    </tbody>
                </table>
                -->   
                
            </div>
        </div>
        
    </body>

</html>