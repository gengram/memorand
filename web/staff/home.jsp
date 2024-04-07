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
                <div class="col-6">
                    <h1 style="font-size: 44px">Panel de control</h1>
                </div>
                <div class="col-6">
                    <div class="d-grid gap-2 text-center ms-5">
                        <a href='instnew.jsp' class="ms-5">
                            <button class="btn btn-sm rounded-pill custom-bstaff ms-5 mt-5">
                                <p class="mt-1 me-2 ms-2" style="font-size: 21px;"><i class="bi bi-plus-lg me-2" style="font-size: 26px;"></i> Nueva instituci&oacute;n</p> 
                            </button>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-4">
                    <h2>Instituciones</h2>
                </div>
                <div class="col-8">
                    <div class="row mt-3">
                        <div class="col-auto ms-5">
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

                        <div class="col-auto">
                            <p>Limite: </p>
                        </div>
                        <div class="col">
                            <div class="d-grid gap-2 text-center">
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <input type="radio" class="btn-check" name="o" id="debajo" autocomplete="off" checked>
                                    <label class="btn custom-bstaff" for="debajo" >Por debajo</label>

                                    <input type="radio" class="btn-check" name="o" id="cercano" autocomplete="off">
                                    <label class="btn custom-bstaff" for="cercano">Cercano</label>
                                </div> 
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-12" id="content">
                    <!-- AQUI VA LA TABLA DE INSTITUCIONES, VER COM.MEMORAND.SERVLETS.OBTENER / InstitutionGet-->
                    <%= instc.modelGetAllInstByStatus("si")%>

                </div>
            </div>
        </div>
        <script>
            // Obtener todas las filas dentro del tbody
            var rows = document.querySelectorAll('#table-body tr');

// Agregar un evento de clic a cada fila
            rows.forEach(function (row) {
                row.addEventListener('click', function () {
                    // Acción a realizar cuando se hace clic en una fila
                    alert('Fila clickeada: ' + row.textContent);
                });
            });

        </script>
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