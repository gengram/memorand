<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.TeamsController"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.beans.Project"%>
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
    Project proj = new Project();
    ProjectsController projc = new ProjectsController();
    TeamsController teamc = new TeamsController();

    String inst_id = (String) session.getAttribute("inst_id");
    String team_id = request.getParameter("team_id");

    String proj_id = request.getParameter("id");
    String proj_name = null;
    String proj_color = null;

    if (proj_id != null) {
        proj = projc.modelGetProjectInfoById(proj_id);

        proj_name = proj.getProj_name();
        proj_color = proj.getProj_color();
    } else {
        response.sendRedirect("../proyectos.jsp");
    }

%>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | <%= proj_name%></title>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

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

        <jsp:include page="../XM-Resources/pages/elements/navbar_admin.jspf"/>

        <div class="container">
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-1">
                    <i class="bi bi-square-fill ms-3" style="font-size: 45px; color: #<%= proj_color%>"></i>
                </div>
                <div class="col-6 text-start mt-2">
                    <h2><%= proj_name%></h2>
                </div>
                <div class="col-2 mt-3">
                    <a href="editar.jsp?user_id=">
                        <button class="btn btn-gray rounded-pill ms-4"><text class="ms-3 me-3"><i class="bi bi-pencil-square me-2"></i>Editar</text></button>
                    </a>
                </div>
                <div class="col-2 mt-4">
                    <p style="color: #25ce7b; font-size: 18px;"><a id="backLink" href='home.jsp'><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-1"></div>
                <div class="col-5">
                    <h2 class="mt-4 ms-3">Equipos</h2>
                </div>
                <div class="col-5 mt-4 text-end">
                    <button type="submit" class="btn rounded-pill custom-admin me-3" data-bs-toggle="modal" data-bs-target="#modalAsignarEquipo"><i class="bi bi-plus-lg me-2"></i><text class="me-2 ms-2">Asignar equipo</text></button>
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
                            <%= teamc.modelGetAllTeamsByProjRed(proj_id)%>
                        </tbody>
                    </table>
                </div>
                <div class="col-1"></div>
            </div>  
        </div>

        <!-- Modal Asignar proyecto-->
        <div class="modal fade" tabindex="-1" role="dialog" id="modalAsignarEquipo">

            <div class="modal-dialog modal-dialog-centered text-center modal-custom" role="document">

                <div class="modal-content rounded-4 shadow">

                    <div class="modal-header p-5 pb-4 border-bottom-0">
                        <h2 class="mb-0 fs-2">Asignar equipo</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-5 pt-2">
                        <form action="../../collabnew" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
                            <div class="row">
                                <div class="col-12 text-start ms-5">
                                    <label for="exampleInputEmail1" class="form-label">Equipo</label>
                                    <select class="form-select form-control-lg" style="border-color: #AFB2B3" name="team_name" id="team_name" required>
                                        <option selected>Selecciona uno</option>
                                        <%= teamc.modelGetListTeamsByInst(inst_id)%>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 text-start ms-5 mt-3 mb-2">
                                    <script>console.log("<%=proj_name%>");</script>
                                    <select class="form-select form-control-lg" style="border-color: #AFB2B3; display: none " name="proj_name" id="proj_name" required>
                                        <option selected>Selecciona uno</option>
                                        <%= projc.modelGetListProjectsByInst2(inst_id, proj_id)%> <!-- Utilizamos el resultado del método con el ID del proyecto seleccionado -->
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
