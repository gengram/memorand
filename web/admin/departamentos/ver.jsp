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
    UsersController userc = new UsersController();

    String team_id = request.getParameter("team_id");
    String inst_id = (String) session.getAttribute("inst_id");
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
        .modal-custom {
            max-width: 510px;
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
                    <h2 class="mt-4 ms-3">Integrantes</h2>
                </div>
                <div class="col-5 mt-4 text-end">
                    <button type="submit" class="btn rounded-pill custom-admin me-3" data-bs-toggle="modal" data-bs-target="#modalAsignarIntegrante"><i class="bi bi-plus-lg me-2"></i><text class="me-2 ms-2">Asignar integrante</text></button>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope='col'><text class="text-start ms-5">Nombre</text></th>
                                <th scope='col' ></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%= userc.modelGetAllWkByTeamRed(team_id)%>
                        </tbody>
                    </table>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

        <!-- Modal Asignar proyecto-->
        <div class="modal fade" tabindex="-1" role="dialog" id="modalAsignarIntegrante">

            <div class="modal-dialog modal-dialog-centered text-center modal-custom" role="document">

                <div class="modal-content rounded-4 shadow">

                    <div class="modal-header p-5 pb-4 border-bottom-0">
                        <h2 class="mb-0 fs-2">Asignar integrante</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-5 pt-2">
                        <form action="" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
                            <div class="row">
                                <div class="col-12 text-start ms-5">
                                    <select class="form-select form-control-lg" style="border-color: #AFB2B3; display: none;" name="team_name" id="team_name" required>
                                        <option>Selecciona uno</option>
                                        <%= teamc.modelGetListTeamsByInst2(inst_id, team_name)%> 
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 text-start ms-5 mt-3 mb-2">
                                    <label for="" class="form-label">Integrante</label>
                                    <select class="form-select form-control-lg" style="border-color: #AFB2B3" name="wk_name" id="wk_name" required>
                                        <option selected>Selecciona uno</option>
                                        <%= userc.modelGetListWkByInst(inst_id)%>
                                    </select>
                                </div>
                            </div>
                            <div class="text-start mt-3 ms-5">
                                <button type="submit" class="fw-bold mb-2 btn btn-lg rounded-pill custom-admin"><text class="ms-3 me-3 mt-2 mb-2">Asignar</text></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div> 
        </div>

    </body>
</html>
