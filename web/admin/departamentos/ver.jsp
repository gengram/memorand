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

    <body>

        <jsp:include page="../../XM-Resources/pages/elements/navbar_admin_depto.jspf"/>

        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <h3 class="mt-3" style="color: #<%= team_color%>">
                        <i class="bi bi-circle-fill" ></i>
                        <%= team_name%>
                    </h3>

                    <!--<a href="editar.jsp?user_id="--> 
                        <button class="button custom-bsign rounded-3 mt-2"><h6 class="mt-1"><i class="bi bi-pen mt-4"></i> Editar</h6></button>
                    </a>

                    <h3 class="mt-3" style="color: #CEC7C7">Acerca del departamento</h3>
                    <h5 class="mt-3" >Nombre</h5>
                    <p><%= team_name%></p>
                    <!--<h3 style="color: #CEC7C7">Lideres</h3>
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <h3>Integrantes</h3>
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <h3>Proyectos</h3>
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>-->
                </div>
                <div class="col-1"></div>
            </div>
        </div>


    </body>

</html>
