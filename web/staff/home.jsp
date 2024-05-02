<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.InstitutionsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    InstitutionsController instc = new InstitutionsController();
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-staff_1.svg">
        <title>Memorand Staff | Home</title>

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
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row mt-5">
                        <div class="col-6 d-flex align-items-center">
                            <h2>Panel de control</h2>
                        </div>
                        <div class="col-6 d-flex justify-content-end align-items-center">
                            <a href='instnew.jsp'>
                                <button class="btn btn-sm rounded-pill custom-bstaff d-flex justify-content-center">
                                    <p class="mt-1 me-2 ms-2 mb-2"><i class="bi bi-plus-lg me-2"></i> Nueva instituci&oacute;n</p> 
                                </button>
                            </a>
                        </div>
                    </div>

                    <hr>

                    <div class="row mt-4">
                        <div class="col-10">
                            <h3>Instituciones</h3>
                        </div>
                        <div class="col-2">
                            <div class="row mt-3">
                                <div class="col-auto">
                                    <p>Estatus: </p>
                                </div>
                                <div class="col">

                                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                        <input type="radio" class="btn-check" name="options" id="check" autocomplete="off" checked>
                                        <label class="btn btn-h" for="check" id="active_inst"><i class="bi bi-check-lg"></i></label>

                                        <input type="radio" class="btn-check" name="options" id="x" autocomplete="off">
                                        <label class="btn btn-h" for="x" id="inactive_inst"><i class="bi bi-x"></i></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-12" id="content">
                            <!-- AQUI VA LA TABLA DE INSTITUCIONES, VER COM.MEMORAND.SERVLETS.OBTENER / InstitutionGet-->
                            <%= instc.modelGetInsts("si")%>
                        </div>
                    </div> 
                </div>
                <div class="col-1"></div>
            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.getElementById('active_inst').addEventListener('click', function () {
                    document.getElementById('check').checked = true;
                });

                document.getElementById('inactive_inst').addEventListener('click', function () {
                    document.getElementById('x').checked = true;
                });
            });
        </script>

        <script src="scripts/home.js"></script>
    </body>
</html>