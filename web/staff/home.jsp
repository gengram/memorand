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

    <!-- BODY -->
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_staff.jspf"/>

        <div class="container">
            
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
            
            <div class="row mt-5">
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
                                <label class="btn custom-bstaff" for="check" id="active_inst"><i class="bi bi-check-lg"></i></label>

                                <input type="radio" class="btn-check" name="options" id="x" autocomplete="off">
                                <label class="btn custom-bstaff" for="x" id="inactive_inst"><i class="bi bi-x"></i></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <br>
            
            <div class="row">
                <div class="col-12" id="content">
                    <!-- AQUI VA LA TABLA DE INSTITUCIONES, VER COM.MEMORAND.SERVLETS.OBTENER / InstitutionGet-->
                    <%= instc.modelGetAllInstByStatus("si")%>
                </div>
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