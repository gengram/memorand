<%-- Memorand by Gengram © 2023 --%>

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

    String user_id = request.getParameter("user_id");

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
                            <div class="row text-end mt-2">
                                <div class="col-4">
                                    <span>Filtrar por equipo:</span>
                                </div>
                                <div class="col-8 ">
                                    <select class="form-select form-control ms-5" aria-label="Default select example">
                                        <option selected>Selecciona uno</option>
                                        <option value="1">Equipo 1</option>
                                        <option value="2">Equipo 2</option>
                                        <option value="3">Equipo 3</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <button class="btn custom-admin rounded-pill mt-1"><i class="bi bi-plus-lg me-2"></i>Asignar proyecto</button>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

    </body>

</html>
