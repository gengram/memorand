<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.controller.TeamsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String inst_id = (String) session.getAttribute("inst_id");
    
    String team_id = request.getParameter("team_id");
    
    TeamsController teamc = new TeamsController();
    ProjectsController projc = new ProjectsController();
%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Gestionar proyectos</title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Gestionar proyectos por departamento</h3>
        
        <br>
        <h3>Agregar proyectos a departamento</h3>
        
        <form action="../../collabnew" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h3>Departamentos</h3>
                        <select name="team_name" id="team_name" required>
                            <option value="" disabled selected hidden>Departamento</option>
                            <%= teamc.modelGetListTeamsByInst(inst_id) %>
                        </select>
                    </div>
                    <div class="col">
                        <h3>Proyectos</h3>
                        <select name="proj_name" id="proj_name" required>
                            <option value="" disabled selected hidden>Proyecto</option>
                            <%= projc.modelGetListProjectsByInst(inst_id) %>
                        </select>
                    </div>
                </div>
                
                <br>
                <input type="submit" value="Agregar proyecto">
            </div>
        </form>

                        
        <br>
        <h3>Ver proyectos por departamento</h3>
        
        <div class="container">
            <div class="row">
                <div class="col">
                    <h3>Departamentos</h3>
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>team_name</th>
                                <th>team_color</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%= teamc.modelGetAllTeamsByInstRed(inst_id) %>
                        </tbody>
                    </table>
                </div>
                <div class="col">
                    <h3>Proyectos</h3>
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>proj_name</th>
                                <th>proj_color</th>
                                <th>collab_status</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%= projc.modelGetAllProjectsByTeamRed(team_id) %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <a href="../home.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
    </body>
    
</html>
