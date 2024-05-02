<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.TeamUsersController"%>
<%@page import="com.memorand.beans.TeamUser"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.controller.TeamsController"%>
<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.beans.User"%>
<%@page import="com.memorand.controller.UsersController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    String staff_type = (String) session.getAttribute("user_type");

    if (staff_type == null || !staff_type.equals("admin")) {
        response.sendRedirect("../index.jsp?error=100");
        session.invalidate();
    }
    
    User user = new User();
    UsersController userc = new UsersController();

    Institution inst = new Institution();
    InstitutionsController instc = new InstitutionsController();

    ProjectsController projc = new ProjectsController();
    TeamsController teamc = new TeamsController();
    String user_id = request.getParameter("user_id");
    String team_id = request.getParameter("team_id");
    String proj_id = request.getParameter("proj_id");

    String user_email = null;
    String user_pass = null;
    String user_type = null;
    String user_name = null;
    String user_pat = null;
    String user_mat = null;
    String user_status = null;
    String user_profile = null;

    String inst_id = null;
    String inst_name = null;
    String inst_type = null;
    String inst_profile = null;

    if (user_id != null) {
        user = userc.modelGetUserInfoById(user_id);

        user_email = user.getUser_email();
        user_pass = user.getUser_pass();
        user_type = user.getUser_type();
        user_name = user.getUser_name();
        user_pat = user.getUser_pat();
        user_mat = user.getUser_mat();
        user_status = user.getUser_status();
        user_profile = user.getUser_profile();

        user_type = userc.modelConvUserType(user_type);
        user_status = userc.modelConvUserStatus(user_status);

        inst = instc.modelGetInstByUser(user_id);

        inst_id = inst.getInst_id();
        inst_name = inst.getInst_name();
        inst_type = inst.getInst_type();
        inst_profile = inst.getInst_profile();
        
    } else {
        response.sendRedirect("../administradores.jsp");
    }

%>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>

        <title>Memorand - <%= user_name%></title>

        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">

    </head>

    <style>
        .btn-red {
            border-color: red;
            color: red;
            background-color: transparent;
        }
        .btn-red:hover {
            border-color: red;
            color: #fff;
            background-color: red;
        }

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
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-9">
                    <h1> <%= user_name%> <%= user_pat%> <%= user_mat%></h1>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #25ce7b; font-size: 18px;"><a id="backLink" href='../home.jsp'><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-2" >
                    <img class="rounded-1" src="../../<%=user_profile%>" width="150" height="150" alt="inst_profile"/>
                </div>
                <div class="col-6">
                    <div class="mt-2">
                        <p><texto style="color: #AFB2B3">Email: </texto><texto style="color: #2A2927"><%=user_email%></texto></p>
                        <p><text  style="color: #AFB2B3">Tipo: </text><text style="color: #2A2927"><%=user_type%></text></p>
                        <p><text  style="color: #AFB2B3">Estatus: </text><text style="color: #2A2927"><%=user_status%></text></p>
                    </div>
                </div>
                <div class="col-2 text-end" >
                    <a href="?user_id=<%= user_id%>">
                        <button class="btn btn-gray rounded-pill mt-3"><text class="ms-3 me-3"><i class="bi bi-pencil-square me-2"></i>Editar</text></button>
                    </a>
                    <button class="btn btn-red rounded-pill mt-2"><i class="bi bi-power me-2"></i>Desactivar</button>
                </div>
                <div class="col-1"></div>
            </div>

            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row">
                        <div class="col-2"><h2>Proyectos</h2></div>
                        <div class="col-6 text-center">
                            <div class="row text-end mt-2 ms-4">
                                <div class="col-5">
                                    <span>Filtrar por equipo:</span>
                                </div>
                                <div class="col-7 ">
                                    <script>
                                        console.log("<%=user_id%>");
                                    </script>
                                    <select class="form-select form-control ms-5" aria-label="Default select example" style="border-color: #AFB2B3;">
                                        <option selected>Selecciona uno</option>
                                        <%=teamc.modelGetAllTeamsByUserRed3(user_id)%>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <button class="btn custom-admin rounded-pill mt-1" data-bs-toggle="modal" data-bs-target="#modalAsignarProj"><i class="bi bi-plus-lg me-2"></i>Asignar proyecto</button>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <table class="table mt-3" style="text-align: center;">
                        <thead>
                            <tr>
                                <th scope="col" class="text-start"><text class="ms-5">Nombre</text></th>
                                <th scope="col" ></th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Tablita proyectos de cada lider -->
                        </tbody>
                    </table>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

        <!-- Modal Asignar proyecto-->
        <div class="modal fade" tabindex="-1" role="dialog" id="modalAsignarProj">

            <div class="modal-dialog modal-dialog-centered text-center modal-custom" role="document">

                <div class="modal-content rounded-4 shadow">

                    <div class="modal-header p-5 pb-4 border-bottom-0">
                        <h2 class="mb-0 fs-2">Asignar proyecto</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-5 pt-2">
                        <form action="../collabnew" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
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
                                    <label for="" class="form-label">Proyecto</label>
                                    <select class="form-select form-control-lg" style="border-color: #AFB2B3" name="proj_name" id="proj_name" required>
                                        <option selected>Selecciona uno</option>
                                        <%= projc.modelGetListProjectsByInst(inst_id)%>
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
