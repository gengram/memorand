<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.TeamsController"%>
<%@page import="com.memorand.beans.Team"%>
<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.beans.User"%>
<%@page import="com.memorand.controller.UsersController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    //String staff_type = (String) session.getAttribute("user_type");

    //if (staff_type == null || !staff_type.equals("staff"))
    //{
    //    response.sendRedirect("../index.jsp?error=100");
    //    session.invalidate();
    //}
    Team team = new Team();
    TeamsController teamc = new TeamsController();

    String team_id = request.getParameter("team_id");
    String team_name = null;
    String team_color = null;

    if (team_id != null) {
        team = teamc.modelGetTeamInfoById(team_id);

        team_name = team.getTeam_name();
        team_color = team.getTeam_color();
    } else {
        response.sendRedirect("../departamentos.jsp");
    }

%>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>

        <title><%= team_name%></title>

        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">

    </head>

    <style>
        .btn-gray {
            border-color: #E3E4E5;
            color: #000;
            background-color: #E3E4E5;
        }
        .btn-gray:hover {
            border-color: #E3E4E5;
            color: #000;
            background-color: transparent;
        }
        .custom-admin{
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

    <body>

        <jsp:include page="../../XM-Resources/pages/elements/navbar_admin_sub.jspf"/>

        <div class="container">
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-1">
                    <i class="bi bi-square-fill ms-3" style="font-size: 45px; color: #<%= team_color%>"></i>
                </div>
                <div class="col-6 text-start mt-2">
                    <h2><%= team_name%></h2>
                </div>
                <div class="col-2 mt-3">
                    <a href="editar.jsp?user_id=">
                        <button class="btn btn-gray rounded-pill ms-4"><text class="ms-3 me-3"><i class="bi bi-pencil-square me-2"></i>Editar</text></button>
                    </a>
                </div>
                <div class="col-2 mt-4">
                    <p style="color: #25ce7b; font-size: 18px;"><a id="backLink" href='../home.jsp'><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-1"></div>
                <div class="col-5">
                    <h2 class="mt-4 ms-3">Equipos</h2>
                </div>
                <div class="col-5 mt-4 text-end">
                    <button type="submit" class="btn rounded-pill custom-admin me-3"><i class="bi bi-plus-lg me-2"></i><text class="me-2 ms-2">Asignar equipo</text></button>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

    </body>
</html>
