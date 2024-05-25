<%@page import="com.memorand.controller.AppRequestsController"%>
<!-- Memorand by Gengram © 2023 -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // PROTECCIÓN
    String u = (String) session.getAttribute("user_type");
    
    if(session == null || u == null || !u.equals("staff"))
    {
        response.sendRedirect("../index.jsp?error=InvalidSession");
    }
    
    AppRequestsController reqc = new AppRequestsController();
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-staff_1.svg">

        <title>Memorand Staff | Ventas</title>

    </head>
    
    <style>
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
    </style>

    <!-- BODY -->
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_staff.jspf"/>

        <div class="container">
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-9">
                    <h1>Panel de ventas</h1>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #7473C0; font-size: 18px;"><a id="backLink" href='home.jsp' style="color: #7473C0;"><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-5">
                    <h2>Solicitudes</h2>
                </div>
                <div class="col-5 text-end">
                    <div class="row mt-3">
                        <div class="col-12">
                            <text class="me-2">Estatus: </text>
                            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                <input type="radio" class="btn-check" name="options" id="check" autocomplete="off" checked>
                                <label class="btn btn-h" for="check" id="active_inst"><i class="bi bi-check-lg"></i></label>

                                <input type="radio" class="btn-check" name="options" id="x" autocomplete="off">
                                <label class="btn btn-h" for="x" id="inactive_inst"><i class="bi bi-x"></i></label>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">

                </div>
                <div class="col-1"></div>
            </div>
        </div>


        <p>Estatus: <button onclick="getReqByStatus('si')">Activas</button> <button onclick="getReqByStatus('si')">Inactivas</button></p>

        <%= reqc.modelGetRequests("no")%>

        <hr>

        <%= reqc.modelGetRequests("si")%>

    </body>

</html>