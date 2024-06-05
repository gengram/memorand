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

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Gestionar proyectos</title>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

    </head>
    

    <%-- BODY --%>
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_admin.jspf"/>

        <!--<h3>Agregar proyectos a departamento</h3>
        
        <form action="../../collabnew" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h3>Departamentos</h3>
                        <select name="team_name" id="team_name" required>
                            <option value="" disabled selected hidden>Departamento</option>
        <%= teamc.adminGetTeamsSelectByInstitution(inst_id)%>
    </select>
</div>
<div class="col">
    <h3>Proyectos</h3>
    <select name="proj_name" id="proj_name" required>
        <option value="" disabled selected hidden>Proyecto</option>
        <%= projc.adminGetProjectsByInstitution(inst_id)%>
    </select>
</div>
</div>

<br>
<input type="submit" value="Agregar proyecto">
</div>
</form> -->

        <div class="container">
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-9">
                    <h2>Ver proyectos por equipo</h2>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #25ce7b; font-size: 18px;"><a id="backLink" href='home.jsp'><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row mt-5">
                        <div class="col">
                            <h3>Equipos</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Name</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%= teamc.adminGetTeamsByInstitution(inst_id)%>
                                </tbody>
                            </table>
                        </div>
                        <div class="col">
                            <h3>Proyectos</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">Name</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%= projc.adminGetProjectsByTeam(team_id)%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

    </body>

</html>
