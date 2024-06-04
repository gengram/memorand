<!-- Memorand by Gengram © 2023 -->

<%@page import="java.sql.Timestamp"%>
<%@page import="com.memorand.beans.AppRequest"%>
<%@page import="com.memorand.controller.AppRequestsController"%>

<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // PROTECCIÓN
    String u = (String) session.getAttribute("user_type");

    if (session == null || u == null || !u.equals("staff")) {
        response.sendRedirect("../index.jsp?error=InvalidSession");
    }

    String req_id = request.getParameter("id");

    String req_name = "", req_pat = "", req_mat = "", req_email = "", req_phone = "", req_job = "";
    String req_inst = "", req_num = "", req_status = "", req_msg = "";

    Timestamp req_date;

    if (req_id != null) {
        AppRequestsController reqc = new AppRequestsController();
        AppRequest req = reqc.modelGetRequest(req_id);

        if (req != null) {
            req_name = req.getReq_name();
            req_pat = req.getReq_pat();
            req_mat = req.getReq_mat();
            req_email = req.getReq_email();
            req_phone = req.getReq_phone();
            req_job = req.getReq_job();

            req_date = req.getReq_date();

            req_inst = req.getReq_inst();
            req_num = req.getReq_num();
            req_status = req.getReq_status();
            req_msg = req.getReq_msg();
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee-staff.svg">

        <title>Memorand Staff | Solicitud</title>

    </head>
    <style>
        .btn-red {
            border-color: red;
            color: #fff;
            background-color: red;
        }
        .btn-red:hover {
            border-color: red;
            color: red;
            background-color: transparent;
        }

        .btn-green {
            border-color: #25ce7b;
            color: #fff;
            background-color: #25ce7b;
        }
        .btn-green:hover {
            border-color: #25ce7b;
            color: #25ce7b;
            background-color: transparent;
        }
    </style>

    <!-- BODY -->
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_staff.jspf"/>

        <%
            String check = " ";
            if (reqc.convertStatus(req_status).get(0) == "Atendida") {
        %>
        <style>
            .color{
                color: #25ce7b;
            }
            .btnMarcar {
                display: none;
            }
        </style>
        <%
            check = "bi bi-check-lg";

        } else if (reqc.convertStatus(req_status).get(0) == "No atendida") {
        %>
        <style>
            .color{
                color: red;
            }
        </style>
        <%
                check = "bi bi-x-lg";
            }
        %>

        <div class="container">
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-9 mt-4">
                    <p><text style="font-size: 43px; color: #000">Solicitud</text><text class="ms-5" style="font-size: 25px">#<%= req_id%></text><text class="color ms-5" style="font-size: 25px"><i class="<%=check%> me-2"></i><%=reqc.convertStatus(req_status).get(0)%></text><p>
                </div>
                <div class="col-2 ">
                    <p style="color: #7473C0; font-size: 18px;"><a href='ventas.jsp' style="color: #7473C0;"><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row">
                        <div class="col-6">
                            <h5>Informaci&oacute;n del solicitante:</h5>
                            <div class="ms-3 mt-3">
                                <p class="mb-1">
                                    <text style="color: #AFB2B3;">Nombre:</text>
                                    <text style="color: #2A2927"><%= req_name%></text>
                                </p>
                                <p class="mb-1">
                                    <text style="color: #AFB2B3;">Apellido P:</text>
                                    <text style="color: #2A2927"><%= req_pat%></text>
                                </p>
                                <p class="mb-1">
                                    <text style="color: #AFB2B3;">Apellido M:</text>
                                    <text style="color: #2A2927"><%= req_mat%></text>
                                </p>
                                <p class="mb-1">
                                    <text style="color: #AFB2B3;">Email:</text>
                                    <text style="color: #2A2927"><%= req_email%></text>
                                </p>
                                <p class="mb-1">
                                    <text style="color: #AFB2B3;">Tel&eacute;fono:</text>
                                    <text style="color: #2A2927"><%= req_phone%></text>
                                </p>
                                <p class="mb-1">
                                    <text style="color: #AFB2B3;">Puesto:</text>
                                    <text style="color: #2A2927"><%= req_job%></text>
                                </p>
                            </div>
                        </div>
                        <div class="col-6">
                            <h5>Informaci&oacute;n del la solicitud:</h5>
                            <div class="ms-3 mt-3">
                                <p class="mb-1">
                                    <text style="color: #AFB2B3;">Empresa:</text>
                                    <text style="color: #2A2927"><%= req_inst%></text>
                                </p>
                                <p class="mb-1">
                                    <text style="color: #AFB2B3;">Usuarios:</text>
                                    <text style="color: #2A2927"><%= req_num%></text>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <h5>Informaci&oacute;n adicional</h5>
                        <div class="col-1">
                            <p class="ms-4 mt-0" style="color: #AFB2B3">Mensaje:</p>
                        </div>
                        <div class="col-11">
                            <p class="ms-3"><%= req_msg%></p>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-6">
                    <a href='../reqdel?id=<%= req_id%>'>
                        <button class="btn btn-red rounded-pill">Eliminar solicitud</button>
                    </a>
                </div>
                <div class="col-4 ms-5">
                    <a href='../reqstat?id=<%= req_id%>&status=<%= req_status%>'>
                        <button class="btn btn-green btnMarcar rounded-pill"><%= reqc.convertStatus(req_status).get(1)%></button>
                    </a>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

    </body>

</html>

<%
        } else {
            response.sendRedirect("ventas.jsp");
        }
    } else {
        response.sendRedirect("ventas.jsp");
    }
%>
