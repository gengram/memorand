<!-- Memorand by Gengram © 2023 -->

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
    
    String inst_id = request.getParameter("id");

    // VARIABLES DE LA INSTITUCIÓN
    String inst_name = "null", inst_type = "null", inst_profile = "null", inst_status = "null";
    String lim_ch = "null", lim_wk = "null", lim_gp = "null", lim_ks = "null";
    String count_ch = "null", count_wk = "null", count_gp = "null", count_ks = "null";

    String action_status = "null";

    if (inst_id != null) {
        InstitutionsController instc = new InstitutionsController();

        Institution inst = instc.modelGetInst(inst_id);

        if (inst != null) {
            inst_name = inst.getInst_name();
            inst_type = inst.getInst_type();
            inst_profile = inst.getInst_profile();
            inst_status = inst.getInst_status();
            lim_ch = inst.getLim_ch();
            lim_wk = inst.getLim_wk();
            lim_gp = inst.getLim_gp();
            lim_ks = inst.getLim_ks();

            InstitutionsController instcounter = new InstitutionsController();

            count_ch = instcounter.modelGetResourceCount(inst_id, "ch");
            count_wk = instcounter.modelGetResourceCount(inst_id, "wk");
            count_gp = instcounter.modelGetResourceCount(inst_id, "teams");
            count_ks = instcounter.modelGetResourceCount(inst_id, "projects");

            ServicesUtil s = new ServicesUtil();

            action_status = s.transformActionStatus(inst_status);
        } else {
            response.sendRedirect("home.jsp");
        }

    } else {
        response.sendRedirect("home.jsp");
    }

    // ADMINISTRADORES
    UsersController usersc = new UsersController();
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee-staff.svg">

        <title>Memorand Staff | <%= inst_name%></title>

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

        .inter {
            margin-bottom: 5px; /* Ajusta el valor según tus necesidades */
        }

        .btn-h{
            padding: 0rem 20px;
            border-color: #7473C0;
            background-color: transparent;
            color: #7473C0;
        }
        .btn-h:focus {
            border-color: #BDECD5;
            background-color: #BDECD5;
            color: #000;
        }
        .btn-h:active {
            color: #000;
            border-color: #E3E4E5;
            background-color: #E3E4E5;
        }
        .btn-h:hover {
            color: #7473C0;
            background-color: #D0D0E9;
            border-color: #7473C0;
        }
        .btn-check + .btn:hover {
            color: #7473C0;
            background-color: #D0D0E9;
            border-color: #7473C0;
        }
        .btn-check:focus-visible + .btn {
            border-color: #BDECD5;
            background-color: #BDECD5;
            color: #000;
        }
        .btn-check:checked + .btn, :not(.btn-check) + .btn:active, .btn:first-child:active, .btn.active, .btn.show {
            border-color: #D0D0E9;
            background-color: #D0D0E9;
            color: #000;
        }
        .form-check-input:checked {
            background-color: #D0D0E9;
            border-color: #E3E4E5;
        }

        .custom-admin{
            display: inline-block;
            padding: 4px 12px;
            border: 2px solid #7473C0; /* Color del contorno */
            color: #fff; /* Color del texto */
            text-align: center;
            text-decoration: none;
            font-size: 17px;
            cursor: pointer;
            border-radius: 4px;
            background-color: #7473C0; /* Fondo transparente */
        }
        .custom-admin:hover {
            background-color: #fff; /* Cambiar el color de fondo al pasar el ratón */
            border: 2px solid #7473C0; /* Color del contorno */
            color: #7473C0; /* Cambiar el color del texto al pasar el ratón */
        }
    </style>

    <!-- BODY -->
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_staff.jspf"/>

        <div class="container">
            <!-- Flexbox container for aligning the toasts -->
            <div aria-live="polite" aria-atomic="true" class="position-relative">
                <div class="toast-container top-0 end-0">
                    <!-- Then put toasts within -->
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
                    <h1> <%= inst_name%></h1>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #7473C0; font-size: 18px;"><a id="backLink" href='home.jsp' style="color: #7473C0;"><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-2" >
                    <img class="rounded-1" width="150" height="150"src="../<%= inst_profile%>" alt="Foto de <%= inst_name%>"/>
                </div>
                <div class="col-6">
                    <div class="mt-2">

                        <p class="inter"><texto style="color: #AFB2B3">Tipo: </texto><texto style="color: #2A2927"><%= inst_type%></texto></p>
                        <p class="inter"><texto style="color: #AFB2B3">Lideres: </texto><texto style="color: #2A2927"><%= count_ch%>/<%= lim_ch%></texto></p>
                        <p class="inter"><texto style="color: #AFB2B3">Integrantes: </texto><texto style="color: #2A2927"><%= count_wk%>/<%= lim_wk%></texto></p>
                        <p class="inter"><texto style="color: #AFB2B3">Grupos: </texto><texto style="color: #2A2927"><%= count_gp%>/<%= lim_gp%></texto></p>
                        <p class="inter"><texto style="color: #AFB2B3">Proyectos: </texto><texto style="color: #2A2927"><%= count_ks%>/<%= lim_ks%></texto></p>

                    </div>
                </div>
                <div class="col-2 text-end">
                    <a href='instedit.jsp?id=<%= inst_id%>'>
                        <button class="btn btn-gray rounded-pill mt-3 ms-2"><text class="ms-1 me-3"><i class="bi bi-pencil-square me-2"></i>Editar</text></button>
                    </a>
                    <a href='../inststat?id=<%= inst_id%>&status=<%= inst_status%>'>
                        <button class="btn btn-red rounded-pill mt-2"><i class="bi bi-power me-2"></i><%= action_status%></button>
                    </a>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row">
                        <div class="col-4"><h2>Administradores</h2></div>
                        <div class="col-3"></div>
                        <div class="col-3 text-end">
                            <a href='adminnew.jsp?id=<%= inst_id%>'><button type="submit" class="btn rounded-pill custom-admin"><i class="bi bi-plus-lg me-2"></i>Agregar admin.</button></a>
                        </div>
                        <div class="col-2 text-end mt-1">
                            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                <input type="radio" class="btn-check" name="options" id="check" autocomplete="off" checked>
                                <label class="btn btn-h" for="check" id="active_admin"><i class="bi bi-check-lg"></i></label>

                                <input type="radio" class="btn-check" name="options" id="x" autocomplete="off">
                                <label class="btn btn-h" for="x" id="inactive_admin"><i class="bi bi-x"></i></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <!-- Tablita proyectos de cada lider -->
                    <div id="content">
                        <%= usersc.modelGetAdmins(inst_id, "si")%>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

        <script src="scripts/institucion.js"></script>

    </body>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var count_ch_int = parseInt('<%= count_ch%>');
            var count_wk_int = parseInt('<%= count_wk%>');
            var count_gp_int = parseInt('<%= count_gp%>');
            var count_ks_int = parseInt('<%= count_ks%>');
            var lim_ch_int = parseInt('<%= lim_ch%>');
            var lim_wk_int = parseInt('<%= lim_wk%>');
            var lim_gp_int = parseInt('<%= lim_gp%>');
            var lim_ks_int = parseInt('<%= lim_ks%>');

            var maxCount = Math.max(count_ch_int, count_wk_int, count_gp_int, count_ks_int);

            if (maxCount >= ((lim_ch_int / 3) * 2) || maxCount >= ((lim_wk_int / 3) * 2) || maxCount >= ((lim_gp_int / 3) * 2) || maxCount >= ((lim_ks_int / 3) * 2)) {
                showToast(); // Activar el Toast
            }
        });

        function showToast() {
            // Activa el Toast utilizando Bootstrap JavaScript
            var toastElList = [].slice.call(document.querySelectorAll('.toast'));
            var toastList = toastElList.map(function (toastEl) {
                return new bootstrap.Toast(toastEl);
            });
            toastList.forEach(toast => toast.show());
        }
    </script>

</html>