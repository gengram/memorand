<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.beans.User"%>
<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.service.ServicesUtil"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.controller.InstitutionsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // PROTECCIÓN
    String u = (String) session.getAttribute("user_type");
    
    if(session == null || u == null || !u.equals("staff"))
    {
        response.sendRedirect("../index.jsp?error=InvalidSession");
    }
    
    String admin_id = request.getParameter("id");
    String inst_id = "null";

    InstitutionsController instc = new InstitutionsController();
    
    // VARIABLES DEL ADMINISTRADOR
    String admin_email = "null", admin_name = "null", admin_pat = "null", admin_mat = "null";
    String admin_type = "null", admin_status = "null", admin_profile = "null";

    String action_status = "null";
    String admin_statusC = "null";

    if (admin_id != null) {
        UsersController userc = new UsersController();

        User admin = userc.modelGetUserInfoById(admin_id);

        if (admin != null) {
            admin_type = admin.getUser_type();

            if (admin_type != null && "admin".equals(admin_type)) {
                admin_email = admin.getUser_email();
                admin_name = admin.getUser_name();
                admin_pat = admin.getUser_pat();
                admin_mat = admin.getUser_mat();
                admin_status = admin.getUser_status();
                admin_profile = admin.getUser_profile();

                ServicesUtil s = new ServicesUtil();

                action_status = s.transformActionStatus(admin_status);
                admin_statusC = s.transformServiceStatus(admin_status);

                InstitutionsController ic = new InstitutionsController();

                Institution inst = ic.modelGetInstByUser(admin_id);

                inst_id = inst.getInst_id();
            } else {
                response.sendRedirect("home.jsp");
            }
        } else {
            response.sendRedirect("home.jsp");
        }
    } else {
        response.sendRedirect("home.jsp");
    }


%>

<!DOCTYPE html>

<html>

    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee-staff.svg">

        <title>Memorand Staff | <%= admin_name%> <%= admin_pat%></title>

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
        
        .btn-red2 {
            border-color: red;
            color: #fff;
            background-color: red;
        }
        .btn-red2:hover {
            border-color: red;
            color: red;
            background-color: transparent;
        }
    </style>
    
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_staff.jspf"/>

        <div class="container">
            <div aria-live="polite" aria-atomic="true" class="position-relative">
                <div class="toast-container top-0 end-0">
                    <div class="toast align-items-center text-bg-light border-0" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="d-flex">
                            <div class="toast-body">
                                <i class="bi bi-exclamation-square me-2 mt-5" style="color: #7473C0; font-size: 20px"></i> <b style="color: #7473C0">Cerca del limite.</b>
                            </div>
                            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-9">
                    <h1><%=admin_name%> <%=admin_pat%> <%=admin_mat%></h1>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #7473C0; font-size: 18px;"><a id="backLink" href='institucion.jsp?id=<%= inst_id%>' style="color: #7473C0;"><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-2">
                    <img width="150" height="150" class="rounded-1" src="../<%= admin_profile%>" alt="Foto de <%= admin_name%> <%= admin_pat%>"/>
                </div>
                <div class="col-4">
                    <div class="mt-5">
                        <p class="inter"><texto style="color: #AFB2B3">Correo: </texto><texto style="color: #2A2927"><%=admin_email%></texto></p>
                        <p class="inter"><texto style="color: #AFB2B3">Estatus: </texto><texto style="color: #2A2927"><%=admin_statusC%></texto></p>
                    </div>
                </div>
                <div class="col-4 text-end">
                    <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                        <a href='adminedit.jsp?id=<%= admin_id%>'>
                            <button class="btn btn-gray rounded-pill mt-3 ms-2"><text class="ms-2 me-3"><i class="bi bi-pencil-square me-2"></i>Editar</text></button>
                        </a>
                        <a href='../userstat?id=<%= admin_id%>&status=<%= admin_status%>'>
                            <button class="btn btn-red rounded-pill mt-2 mb-3"><i class="bi bi-power me-2"></i><%= action_status%></button>
                        </a>
                    </div>
                    <p style="color: #AFB2B3">ID: <%= admin_id%></p>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row">
                        <div class="col-7"><h2>Instituci&oacute;n a la que pertenece</h2></div>
                        <div class="col-5 text-center"></div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-10">
                    <div id="content">
                        <%= instc.sGetInstitutionInfo(inst_id)%>
                    </div>
                    <a href='admindel.jsp?id=<%= admin_id%>'><button class="mt-4 btn btn-red2 rounded-pill">Eliminar administrador</button></a>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

        <script src="scripts/institucion.js"></script>

    </body>

</html>