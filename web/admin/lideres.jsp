<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.controller.TeamsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String inst_id = (String) session.getAttribute("inst_id");

    String team_id = request.getParameter("team_id");
    String proj_id = request.getParameter("proj_id");

    TeamsController teamc = new TeamsController();
    ProjectsController projc = new ProjectsController();
    UsersController userc = new UsersController();
%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Gestionar lideres</title>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

    </head>
    <style>
        custom-admin{
            display: inline-block;
            padding: 4px 12px;
            border: 2px solid #25ce7b; /* Color del contorno */
            color: #fff; /* Color del texto */
            text-align: center;
            text-decoration: none;
            font-size: 17px;
            cursor: pointer;
            border-radius: 4px;
            background-color: #25ce7b; /* Fondo transparente */
        }
        .custom-admin:hover {
            background-color: #fff; /* Cambiar el color de fondo al pasar el ratón */
            border: 2px solid #25ce7b; /* Color del contorno */
            color: #25ce7b; /* Cambiar el color del texto al pasar el ratón */
        }
    </style>

    <%-- BODY --%>
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_admin.jspf"/>
        <div class="container">
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-9">
                    <h2>Agregar lider</h2>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #25ce7b; font-size: 18px;"><a id="backLink" href='home.jsp'><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row mt-4">
                        <div class="col">
                            <h3>Departamentos</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Nombre</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%= teamc.adminGetTeamsByInstitution(inst_id) %>
                                </tbody>
                            </table>
                        </div>
                        <div class="col">
                            <h3>Proyectos</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Nombre</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%= projc.adminGetProjectsByTeam(team_id) %>
                                </tbody>
                            </table>
                        </div>
                        <div class="col">
                            <h3>Lideres</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Nombre</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%= userc.adminGetUserChiefsByCollab(team_id, proj_id) %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row mt-3">
                <div class="col-1"></div>
                <div class="col-10">
                    <form action="../../cunew" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
                        <div class="row">
                            <div class="col">
                                <h3>Lideres</h3>
                                <select class="form-selectsm" name="team_id" id="team_id" required hidden>
                                    <option value="<%= team_id%>" selected><%= team_id%></option>
                                </select>
                                <select class="form-select-sm" name="proj_id" id="proj_id" required hidden>
                                    <option value="<%= proj_id%>" selected><%= proj_id%></option>
                                </select>
                                <select class="form-select-sm" name="ch_name" id="ch_name" required>
                                    <option value="" disabled selected hidden>Lideres</option>
                                    <%= userc.adminGetUserChiefsSelectByInst(inst_id, true) %>
                                </select>
                            </div>
                        </div>
                        <br>
                        <%
                            if (team_id != null && proj_id != null) {
                        %>
                        <button type="submit" class="btn custom-bsign rounded-pill" style="background-color: #25ce7b; color: #fff">Agregar lider</button>
                        <%
                            }
                        %>
                    </form>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

    </body>
</html>
