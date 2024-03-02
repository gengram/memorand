<%-- 
    Document   : pizarron
    Created on : 19 feb. 2024, 23:12:04
    Author     : zunig
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Inicio</title>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

        <style>
            #canvas {
                border: 1px solid black;
                cursor: crosshair;
            }
        </style>
        
        <script src="../XM-Resources/scripts/board.js"></script>
    </head>

    <%-- BODY --%>
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>

        <div class="container text-center" >
            <div class="row" >
                <div class="col-1">
                    <br><br><br>
                </div>
                <div class="col-10">
                    <div class="row row-cols-2">
                        <div class="col-6">
                            <h1 class="text-start mt-2" style="color: #62646A; font-size: 300%;">
                                Pizarr&oacute;n</h1>
                        </div>
                        <div class="col-6">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-1 mt-3">

                            <button class="custom-blog" id="clearBtn"><i class="bi bi-trash"></i></button>
                            <input type="color" class="form-control-sm form-control-color border-2 ms-2 mt-3" id="colorPicker" style=" border-color: #25ce7b" value="#25ce7b">
                            <!-- <button class="custom-blog  mt-3" onclick="?"><i class="bi bi-type-italic"></i></button>
                            <button class="custom-blog  mt-3" onclick="?"><i class="bi bi-type-underline"></i></button>
                            <button  class="custom-blog  mt-3" onclick="?"><i class="bi bi-list-ul"></i></button> -->

                        </div>
                        <div class="col-11">
                            <div class="row g-0 border rounded overflow-hidden flex-md-row shadow h-md-250 position-relative">
                                <div class="col  mb-2 p-4 d-flex flex-column position-static text-start">
                                    <div class="mb-3">
                                        <canvas class="border-primary border-2" id="canvas" width="820" height="400"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="card ">
                                <div class="card-body ">
                                    <div class="row">
                                        <div class="col-6 text-start">
                                            <!--<div class="btn-group" role="group" aria-label="Basic example">
                                                <input class="custom-file-input" type="file" id="imagenInput" accept="image/*" onchange="updateFileName()">
                                                <label for="imagenInput" class="custom-file-input-label" id="customFileLabel">Elegir archivo</label>
                                                <button class="btn custom-blog  ms-2" onclick="extraerTextoDeImagen()">
                                                    <span class="spinner-grow spinner-grow-sm" id="loader" style="display:none;"></span>
                                                    Extraer Texto</button>
                                            </div>-->
                                        </div>
                                        <div class="col-6 text-end">
                                            <button class="btn custom-bsign" id="downloadPngBtn">
                                                Descargar <i class="bi bi-download custom-icon3"></i>
                                            </button>
                                            <button class="btn custom-bsign" disabled="true"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" fill="currentColor" class="bi bi-floppy-fill" viewBox="0 0 16 16">
                                                <path d="M0 1.5A1.5 1.5 0 0 1 1.5 0H3v5.5A1.5 1.5 0 0 0 4.5 7h7A1.5 1.5 0 0 0 13 5.5V0h.086a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5H14v-5.5A1.5 1.5 0 0 0 12.5 9h-9A1.5 1.5 0 0 0 2 10.5V16h-.5A1.5 1.5 0 0 1 0 14.5v-13Z"/>
                                                <path d="M3 16h10v-5.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5V16Zm9-16H4v5.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5V0ZM9 1h2v4H9V1Z"/>
                                                </svg>  Guardar
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1">

                </div>
            </div>
        </div>

    </body>

</html>
