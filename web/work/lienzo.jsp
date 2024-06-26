<%@page import="java.util.Base64"%>
<%@page import="com.memorand.beans.Canva"%>
<%@page import="com.memorand.controller.CanvasController"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.memorand.beans.Task"%>
<%@page import="com.memorand.controller.TasksController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    // PROTECCIÓN
    String u = (String) session.getAttribute("user_type");
    
    if(session == null || u == null)
    {
        response.sendRedirect("../index.jsp?error=InvalidSession");
    }
    
    String verified = request.getParameter("v");
    String canva_id = request.getParameter("id");
    
    String user_id = (String) session.getAttribute("user_id");
    String user_email = (String) session.getAttribute("user_email");
    String user_name = (String) session.getAttribute("user_name");
    String user_pat = (String) session.getAttribute("user_pat");
    String user_mat = (String) session.getAttribute("user_mat");
    String user_profile = (String) session.getAttribute("user_profile");

    if (canva_id != null)
    {
        if (verified == null || verified.isEmpty())
        {
            response.sendRedirect("chat.jsp?id=" + canva_id);
        } 
        
        String task_id = "";
        String canva_name = "", canva_draw = "", canva_status = "";
        Timestamp canva_cdate, canva_mdate;

        CanvasController canvac = new CanvasController();
        Canva canva = canvac.beanGetCanva(canva_id);

        if (canva != null) {
            TasksController taskc = new TasksController();
            Task task = taskc.beanGetTaskByTool("canvas", "canva_id", canva_id);

            task_id = task.getTask_id();

            canva_name = canva.getCanva_name();
            canva_draw = canva.getCanva_draw();
            canva_status = canva.getCanva_status();

            canva_cdate = canva.getCanva_cdate();
            canva_mdate = canva.getCanva_mdate();
%>
<html>
    <head>
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

        <title>Memorand | <%= canva_name %></title>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/5.2.4/fabric.min.js"></script> <!-- Correct version of Fabric.js -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <style>

            body, html {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
            }

            #canvas-container {
                width: 100%;
                height: 100%;
                position: relative;
            }

            canvas {
                display: block;
                border: 2px solid #E3E4E5;
                cursor: move;
                width: 100%;
                height: 100%;
                box-sizing: border-box;
            }

            .modal-body {
                overflow: hidden;
            }

            .modal-lg {
                max-width: 80%;
            }

            cropper-container {
                width: 100%;
                height: 80vh;
            }
            .contenedor {
                position: relative;
                width: 400px;
                height: 300px;
            }

            .capa1 {
                top: 18px;
                z-index: 2;
                align-content: center;
                position: absolute;
            }
            .capa2 {
                top: 18px;
                z-index: 6;
                position: absolute;
                text-align: center;
            }
            .capa3 {
                top: 170px;
                left: 1.3%;
                z-index: 4;
                align-content: center;
                position: absolute;
            }
            .capa4 {
                top: 80px;
                left: 1.3%;
                align-content: center;
                z-index: 5;
                position: absolute;
            }
            .capa5 {
                top: 18px;
                z-index: 6;
                position: absolute;
            }
            .capa6 {
                top: 90.5%;
                z-index: 6;
                position: absolute;
            }

            .icon-tools {
                font-size: 24px;
            }
            .icon-card {
                font-size: 20px;
            }
            .btn-h{
                border-color: #25ce7b;
                background-color: transparent;
                color: #25ce7b;
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
                color: #25ce7b;
                background-color: #BDECD5;
                border-color: #25ce7b;
            }
            .btn-check + .btn:hover {
                color: #25ce7b;
                background-color: #BDECD5;
                border-color: #25ce7b;
            }
            .btn-check:focus-visible + .btn {
                border-color: #BDECD5;
                background-color: #BDECD5;
                color: #000;
            }
            .btn-check:checked + .btn, :not(.btn-check) + .btn:active, .btn:first-child:active, .btn.active, .btn.show {
                border-color: #BDECD5;
                background-color: #BDECD5;
                color: #000;
            }
            .form-check-input:checked {
                background-color: #25ce7b;
                border-color: #E3E4E5;
            }

            /* Ocultar el grupo de botones en pantallas pequeñas */
            @media (max-width: 768px) {
                .invis {
                    display: none;
                }
            }
        </style>
        <style>
            a.nav-link {
                color: gray;
                font-size: 18px;
                padding: 0;
            }

            .avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                border: 2px solid #25ce7b;
                padding: 2px;
                flex: none;
            }

            input:focus {
                outline: 0px !important;
                box-shadow: none !important;
            }

            .card-text {
                border: 2px solid #ddd;
                border-radius: 8px;
            }
        </style>
    </head>
    
    <body>

        <jsp:include page="pages/modals_lienzo.jspf"/>

        <div id="canvas-container">
            <canvas id="canvas"></canvas>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <div class="btn-group dropend capa2 start-0 ms-4">
                        <button type="button" class="btn btn-light rounded-2 des" style="border-color: #E3E4E5" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-list" style="font-size: 25px"></i>
                        </button>
                        <ul class="dropdown-menu shadow ms-2 mt-0">
                            <li><a id="download-image" class="dropdown-item"><i class="bi bi-image me-2" style="color: #25ce7b; font-size: 20px;"></i>Exportar como imagen</a></li>
                            <li><a id="download-svg" class="dropdown-item"><i class="bi bi-download me-2" style="color: #25ce7b; font-size: 20px;"></i>Exportar como SVG</a></li>
                            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modalDeleteAll"><i class="bi bi-trash3 icon-tools me-2" style="color: red; font-size: 20px;"></i>Limpiar lienzo</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-4" style="background-color: #25ce7b">
                    <div class="capa5">
                        <a href="tarea.jsp?id=<%= task_id%>">
                            <div class="btn-group me-5 mb-2" id="clearStorageButton" role="group" aria-label="Default button group">
                                <button type="button" class="btn" style="background-color: #AFB2B3;"><i class="bi bi-chevron-left ms-1" style="color: #fff; font-size: 20px"></i></button>
                                <button type="button" class="btn border-2" style="border-color: #AFB2B3" disabled><b class="ms-1 me-4" style="color: #000"><%=canva_name%></b></button>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-5">
                    <div class="btn-group invis capa1 shadow-lg" role="group" aria-label="Basic radio toggle button group">
                        <button id="openModalButton" type="button" class="btn btn-h des"><i class="bi bi-boxes icon-tools"></i></button>

                        <button id="figuras" type="button" class="btn btn-h des">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <g clip-path="url(#clip0_1651_4085)"><path fill-rule="evenodd" clip-rule="evenodd" d="M12 -0.0397949L18.2098 10.9999H5.79015L12 -0.0397949ZM9.20985 8.99993H14.7902L12 4.03966L9.20985 8.99993Z" fill="#25ce7b"/><path fill-rule="evenodd" clip-rule="evenodd" d="M1 17.9999C1 15.2385 3.23858 12.9999 6 12.9999C8.76142 12.9999 11 15.2385 11 17.9999C11 20.7614 8.76142 22.9999 6 22.9999C3.23858 22.9999 1 20.7614 1 17.9999ZM6 14.9999C4.34315 14.9999 3 16.3431 3 17.9999C3 19.6568 4.34315 20.9999 6 20.9999C7.65685 20.9999 9 19.6568 9 17.9999C9 16.3431 7.65685 14.9999 6 14.9999Z" fill="#25ce7b"/><path fill-rule="evenodd" clip-rule="evenodd" d="M13 12.9999H23V22.9999H13V12.9999ZM15 14.9999V20.9999H21V14.9999H15Z" fill="#25ce7b"/></g><defs><clipPath id="clip0_1651_4085"><rect width="24" height="24" fill="white"/></clipPath></defs>
                            </svg>
                        </button>

                        <button id="arrows" type="button" class="btn btn-h des"><svg width="24" height="24" style="enable-background:new 0 0 24 24;" version="1.1" viewBox="0 0 24 24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                            <style type="text/css">.st0{
                                    fill:#25ce7b;
                                }</style>
                            <path class="st0" d="M17,5.1l-5-5l-5,5l1.4,1.4L11,3.9V24h2V4l2.6,2.6L17,5.1z M0,15l1.4,1.4L4,13.9V22H0v2h6V13.8l2.7,2.7l1.4-1.4  l-5-5L0,15z M20,13.8l2.7,2.7l1.4-1.4l-5-5l-5,5l1.4,1.4l2.6-2.6V24h6v-2h-4V13.8z"/>
                            </svg>
                        </button>

                        <button id="add-text" type="button" class="btn btn-h des"><i class="bi bi-textarea-t icon-tools"></i></button>
                        <!-- 

                        <button id="add-image" type="button" class="btn btn-h des"><i class="bi bi-images icon-tools"></i></button>
                        -->

                        <input type="radio" class="btn-check" name="options" id="free-drawing" autocomplete="off">
                        <label class="btn btn-h" for="free-drawing">
                            <i class="bi bi-brush-fill icon-tools"></i>
                        </label>

                        <button onclick="Copy()" type="button" class="btn btn-h">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-copy" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M4 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 5a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-1h1v1a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h1v1z"/>
                            </svg>
                        </button>

                        <button onclick="Paste()" type="button" class="btn btn-h"><i class="bi bi-clipboard" style="font-size: 20px"></i></button>

                        <button id="delete-selected" type="button" class="btn btn-h des"><i class="bi bi-eraser-fill icon-tools"></i></button>

                        <input type="radio" class="btn-check" name="options" id="toggle-dragging-btn" autocomplete="off">
                        <label class="btn btn-h des" for="toggle-dragging-btn">
                            <svg  width="24" height="24"  viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                            <rect fill="none" height="256" width="256"/>
                            <path d="M128,92a20,20,0,0,0-40,0v24" fill="none" stroke="#25ce7b" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/>
                            <path d="M168,108V92a20,20,0,0,0-40,0v32" fill="none" stroke="#25ce7b" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/>
                            <path d="M88,148V116H68a20.1,20.1,0,0,0-20,20v16a80,80,0,0,0,160,0V108a20,20,0,0,0-40,0v16" fill="none" stroke="#25ce7b" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/>
                            </svg>
                        </label>
                    </div>
                </div>
                <div class="col-1">
                    <div class="card invis shadow capa4" >
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <input class="ms-3 me-3 form-control form-control-color" type="color" id="color" name="color" value="#000000">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-container capa3">
                        <div class="card shadow" id="card1" style="display: none;">
                            <div class="card-body ms-3 me-3 mb-2">
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <label for="grosor">Grosor del lápiz:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-6 text-center">
                                        <input type="range" id="grosor" min="1" max="60" value="10">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card shadow mt-2" id="card3" style="display: none;">
                            <div class="card-body ms-3 me-3 mb-2">
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <label for="grosor">Grosor de la l&iacute;nea:</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-6 text-center">
                                        <input type="range" id="line-width" min="1" max="15" value="3">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card shadow mt-2" id="card4" style="display: none;">
                            <div class="card-body ms-3 me-3 mt-2 mb-2">
                                <div class="row mt-2">
                                    <div class="btn-group" role="group" aria-label="Basic outlined example">
                                        <button id="line" type="button" class="btn btn-h des"><i class="bi bi-slash-lg icon-tools"></i></button>
                                    </div>  
                                </div>  
                                <div class="row mt-2">
                                    <div class="btn-group" role="group" aria-label="Basic outlined example">
                                        <button id="arrow-up" type="button" class="btn btn-h ms-2"><i class="bi bi-arrow-up icon-card"></i></button>
                                        <button id="arrow2" type="button" class="btn btn-h me-3"><svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">
                                            <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                               fill="#25ce7b" stroke="none">
                                            <path d="M4620 4808 c-45 -30 -66 -72 -54 -107 5 -14 39 -50 75 -81 36 -30 67
                                                  -59 68 -65 1 -5 -29 -13 -66 -18 -1120 -128 -2082 -510 -2822 -1120 -514 -423
                                                  -962 -967 -1324 -1607 -246 -437 -409 -878 -477 -1290 -26 -161 -26 -166 10
                                                  -202 28 -27 36 -30 77 -25 33 3 54 13 75 34 26 26 31 43 49 154 52 325 159
                                                  639 341 1004 395 788 974 1486 1603 1930 574 406 1248 689 1970 829 137 26
                                                  464 76 502 76 19 0 14 -8 -34 -54 -51 -50 -55 -57 -49 -88 13 -64 86 -110 149
                                                  -94 23 5 262 204 361 299 85 81 64 125 -128 272 -76 59 -156 120 -176 137 -52
                                                  41 -105 47 -150 16z"/>
                                            </g>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="btn-group" role="group" aria-label="Basic outlined example">
                                        <button id="arrow3" type="button" class="btn btn-h ms-2"><svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">
                                            <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                               fill="#25ce7b" stroke="none">
                                            <path d="M201 4964 c-12 -15 -21 -32 -21 -38 0 -7 214 -534 476 -1172 262
                                                  -637 479 -1169 481 -1181 3 -14 -166 -439 -472 -1185 -263 -640 -480 -1172
                                                  -482 -1183 -6 -30 33 -75 65 -75 32 0 4623 2346 4664 2383 16 14 28 35 28 47
                                                  0 12 -12 33 -28 47 -41 37 -4632 2383 -4664 2383 -17 0 -34 -10 -47 -26z"/>
                                            </g>
                                            </svg>
                                        </button>
                                        <button id="arrow4" type="button" class="btn btn-h me-3"><svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">
                                            <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                               fill="#25ce7b" stroke="none">
                                            <path d="M1400 5098 c-44 -17 -77 -44 -171 -137 -144 -143 -163 -177 -164
                                                  -286 0 -58 5 -91 19 -120 13 -27 333 -355 995 -1018 l976 -977 -977 -978
                                                  c-760 -760 -982 -987 -997 -1022 -14 -30 -21 -67 -21 -110 0 -103 29 -153 168
                                                  -291 98 -97 127 -119 175 -137 73 -28 131 -28 204 -1 56 20 108 71 1230 1193
                                                  1297 1296 1223 1214 1223 1346 0 132 74 50 -1223 1346 -1123 1123 -1174 1173
                                                  -1230 1193 -72 26 -136 26 -207 -1z"/>
                                            </g>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card shadow mt-2" id="card2" style="display: none;">
                            <div class="card-body ms-3 me-3 mt-2 mb-2">
                                <div class="row">
                                    <div class="col-6 text-end">
                                        <div class="form-check ">
                                            <input class="form-check-input" type="checkbox" id="shape-fill" checked>
                                            <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g><path d="M0 0h24v24H0z" fill="none"/><path d="M19.228 18.732l1.768-1.768 1.767 1.768a2.5 2.5 0 1 1-3.535 0zM8.878 1.08l11.314 11.313a1 1 0 0 1 0 1.415l-8.485 8.485a1 1 0 0 1-1.414 0l-8.485-8.485a1 1 0 0 1 0-1.415l7.778-7.778-2.122-2.121L8.88 1.08zM11 6.03L3.929 13.1H18.07L11 6.03z"/></g>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="col-6 text-start">
                                        <input class="form-control form-control-color" type="color" id="colorBorder" name="colorBorder" value="#FFFFFF">
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="btn-group" role="group" aria-label="Basic outlined example">
                                        <button id="square" type="button" class="btn btn-h ms-2"><i class="bi bi-square icon-card"></i></button>
                                        <button id="diamond" type="button" class="btn btn-h me-3"><i class="bi bi-diamond icon-card"></i></button>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="btn-group" role="group" aria-label="Basic outlined example">
                                        <button id="circle" type="button" class="btn btn-h ms-2"><i class="bi bi-circle icon-card"></i></button>
                                        <button id="rectangle" type="button" class="btn btn-h me-3">
                                            <svg height="24" version="1.1" viewBox="0 0 20 20" width="24" xmlns="http://www.w3.org/2000/svg">
                                            <g id="layer1"><path d="M 1 3 L 1 17 L 19 17 L 19 3 L 1 3 z M 2 4 L 18 4 L 18 16 L 2 16 L 2 4 z " style="fill:#25ce7b; fill-opacity:1; stroke:none; stroke-width:0px;"/></g>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="btn-group" role="group" aria-label="Basic outlined example">
                                        <button id="hexa" type="button" class="btn btn-h ms-2">
                                            <svg height="24" width="24" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                                            <rect fill="none" height="400" width="400"/>
                                            <path d="M220,175.3V80.7a8.1,8.1,0,0,0-4.1-7l-84-47.5a7.8,7.8,0,0,0-7.8,0l-84,47.5a8.1,8.1,0,0,0-4.1,7v94.6a8.1,8.1,0,0,0,4.1,7l84,47.5a7.8,7.8,0,0,0,7.8,0l84-47.5A8.1,8.1,0,0,0,220,175.3Z" fill="none" stroke="#25ce7b" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/>
                                            </svg>
                                        </button>
                                        <button id="rect-pill" type="button" class="btn btn-h me-3"><svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="35" height="15" viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet"><g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" fill="#25ce7b" stroke="none">
                                            <path d="M1530 3989 c-315 -41 -591 -174 -820 -395 -209 -203 -341 -433 -408
                                                  -717 -24 -101 -26 -131 -27 -312 0 -159 4 -217 19 -285 62 -284 183 -515 376
                                                  -714 214 -221 470 -361 777 -423 81 -17 166 -18 1118 -18 l1030 0 102 23 c301
                                                  66 543 201 753 418 193 199 314 430 376 714 15 67 19 127 19 280 0 153 -4 213
                                                  -19 280 -62 284 -183 515 -376 714 -208 215 -449 350 -748 418 -96 22 -105 22
                                                  -1102 24 -553 1 -1034 -2 -1070 -7z"/>
                                            </g>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-12 capa6 text-end">
                    <button type="button" class="btn btn-h des me-5" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i class="bi bi-chat-square-dots" style="font-size: 22px"></i></button>
                </div>
            </div>
        </div>

        <p id="msg_sender"><%= user_name%></p>
        <jsp:include page="pages/chatt.jspf"/>
        <style>
            /* Solo para asegurar que el modal no se muestre en pantallas pequeñas */
            @media (max-width: 576px) {
                #myModal {
                    display: none;
                }
            }
        </style>
        <!-- Incluye jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Incluye Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                            // Función para mostrar el modal al cargar la página, solo si no es una pantalla pequeña y si es la primera vez
                            $(document).ready(function () {
                                if ($(window).width() > 576 && !localStorage.getItem('modalShown')) {
                                    $('#myModal').modal('show');
                                    localStorage.setItem('modalShown', 'true');
                                }
                            });

                            // Función para mostrar el modal al hacer clic en el botón, solo si no es una pantalla pequeña
                            $('#openModalButton').click(function () {
                                if ($(window).width() > 576) {
                                    $('#myModal').modal('show');
                                }
                            });

                            // Recalcular el tamaño de la ventana cuando se redimensiona para ocultar el modal si cambia a tamaño pequeño
                            $(window).resize(function () {
                                if ($(window).width() <= 576) {
                                    $('#myModal').modal('hide');
                                }
                            });
                            // Función para eliminar el almacenamiento interno al hacer clic en el botón
                            $('#clearStorageButton').click(function () {
                                localStorage.removeItem('modalShown');
                            });
        </script>

        <script>
            document.querySelectorAll('.btn-check').forEach(radio => {
                radio.addEventListener('click', function (event) {
                    if (this.previousValue) {
                        this.checked = false;
                        this.previousValue = false;
                    } else {
                        this.previousValue = this.checked;
                    }
                });
            });
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Event listener para el botón "arrows"
                document.getElementById('arrows').addEventListener('click', function () {
                    document.getElementById('card4').style.display = 'block'; // Mostrar la tarjeta 3
                    document.getElementById('card1').style.display = 'none'; // Ocultar la tarjeta 1
                    document.getElementById('card2').style.display = 'none'; // Ocultar la tarjeta 2
                    document.getElementById('card3').style.display = 'none'; // Ocultar la tarjeta 3
                });

                // Event listener para el botón "line"
                document.getElementById('line').addEventListener('click', function () {
                    document.getElementById('card3').style.display = 'block'; // Mostrar la tarjeta 3
                    document.getElementById('card1').style.display = 'none'; // Ocultar la tarjeta 1
                    document.getElementById('card2').style.display = 'none'; // Ocultar la tarjeta 2
                    document.getElementById('card4').style.display = 'none'; // Ocultar la tarjeta 4
                });

                // Event listener para el botón "figuras"
                document.getElementById('figuras').addEventListener('click', function () {
                    document.getElementById('card2').style.display = 'block'; // Mostrar la tarjeta 2
                    document.getElementById('card1').style.display = 'none'; // Ocultar la tarjeta 1
                    document.getElementById('card3').style.display = 'none'; // Ocultar la tarjeta 3
                    document.getElementById('card4').style.display = 'none'; // Ocultar la tarjeta 4
                });

                // Event listener para el botón "free-drawing"
                document.getElementById('free-drawing').addEventListener('click', function () {
                    document.getElementById('card1').style.display = 'block'; // Mostrar la tarjeta 1
                    document.getElementById('card2').style.display = 'none'; // Ocultar la tarjeta 2
                    document.getElementById('card3').style.display = 'none'; // Ocultar la tarjeta 3
                    document.getElementById('card4').style.display = 'none'; // Ocultar la tarjeta 4
                });

                // Event listener para los otros botones
                var otrosBotones = ['add-text', 'delete-all', 'delete-selected'];
                otrosBotones.forEach(function (id) {
                    document.getElementById(id).addEventListener('click', function () {
                        var cardContainer = document.querySelector('.card-container');
                        var cards = cardContainer.querySelectorAll('.card');
                        cards.forEach(function (card) {
                            card.style.display = 'none'; // Ocultar todas las tarjetas dentro del contenedor
                        });
                    });
                });
            });

            function openFileInput() {
                const input = document.getElementById('upload-svg');
                input.click();

                // Desvincular el botón personalizado temporalmente
                document.getElementById('customFileLabel').removeAttribute('onclick');

                // Volver a vincular el botón después de un breve retraso
                setTimeout(() => {
                    document.getElementById('customFileLabel').setAttribute('onclick', 'openFileInput()');
                }, 100);
            }

            function updateFileName() {
                const input = document.getElementById('upload-svg');
                const fileNameDisplay = document.getElementById('customFileLabel');
                const fileName = input.value.split('\\').pop(); // Obtener el nombre del archivo seleccionado

                fileNameDisplay.textContent = fileName ? fileName : 'Ningún archivo ha sido elegido';

                // Restablecer el valor del input de archivo
            }

        </script>

        <script>
            var canvas = new fabric.Canvas('canvas', {
                width: 3000,
                height: 2500,
                backgroundColor: '#fff',
                preserveObjectStacking: true,

            });

            // Establecer el zoom inicial
            var initialZoom = 0.6; // Define el zoom inicial que desees
            canvas.setZoom(initialZoom);

            var drawingMode = false;
            var panningEnabled = false;

            // Variable para almacenar los objetos del lienzo
            var canvasObjects = [];
            // Booleano para controlar si se deben almacenar los objetos en formato SVG
            var saveSVG = true;

            // Array list para almacenar los objetos en formato SVG
            var svgObjects = [];
            var objectIdCounter = 0;
            var pencilPathsSVG = [];

            // Función para agregar un objeto al lienzo y almacenarlo en canvasObjects
            function addObjectToCanvas(object) {
                // Asignar un identificador único al objeto
                object.id = 'object-' + (++objectIdCounter);

                // Agrega el objeto al lienzo
                canvas.add(object);
                // Almacena el objeto y sus propiedades en canvasObjects
                canvasObjects.push({
                    id: object.id, // Unique ID for each object
                    type: object.type, // Tipo de objeto (por ejemplo, 'circle', 'rect', etc.)
                    properties: object.toObject(['left', 'top', 'width', 'height', 'fill', 'stroke', 'strokeWidth']) // Propiedades del objeto
                });

                // Si saveSVG es true, convierte el objeto a SVG y lo almacena en svgObjects
                if (saveSVG) {
                    console.log('saveSVG es true. Convirtiendo objeto a SVG');
                    var clonedObject = fabric.util.object.clone(object);
                    var svgObject = clonedObject.toSVG();
                    svgObjects.push({id: object.id, svg: svgObject});
                } else {
                    console.log('saveSVG es false. No se convierte el objeto a SVG');
                }
            }

            // Escucha el evento 'path:created' para capturar los trazos del lápiz creados
            canvas.on('path:created', function (event) {
                var path = event.path;
                console.log('Nuevo trazo de lápiz creado:', path);
                var pencilPathSVG = path.toSVG();
                svgObjects.push({id: path.id, svg: pencilPathSVG});
                console.log("svgObjects path: " + svgObjects);
            });

            // Escuchar los eventos de modificación de los objetos
            canvas.on('object:modified', function (event) {
                var object = event.target;
                console.log('Objeto modificado:', object);
                updateSVGObject(object);
            });

            // Función para actualizar el objeto SVG correspondiente en svgObjects
            function updateSVGObject(object) {
                var updatedSVG = object.toSVG();
                var objectId = object.id;

                // Encontrar el objeto en svgObjects y actualizar su representación SVG
                for (var i = 0; i < svgObjects.length; i++) {
                    if (svgObjects[i].id === objectId) {
                        svgObjects[i].svg = updatedSVG;

                        // Si el objeto es una imagen, también actualiza sus propiedades en canvasObjects
                        if (object.type === 'image') {
                            var objectIndex = canvasObjects.findIndex(function (obj) {
                                return obj.id === objectId;
                            });
                            if (objectIndex !== -1) {
                                canvasObjects[objectIndex].properties = object.toObject(['left', 'top', 'scaleX', 'scaleY', 'angle']);
                                console.log('Propiedades de la imagen actualizadas:', canvasObjects[objectIndex]);
                            }
                        }

                        break;
                    }
                }
            }

            document.getElementById('color').addEventListener('change', function () {
                var selectedObjects = canvas.getActiveObjects();
                if (selectedObjects.length > 0) {
                    selectedObjects.forEach(function (object) {
                        // Verificar si el objeto es un grupo con un solo elemento de tipo path
                        if (object.type === 'group' && object.size() === 1 && object.item(0) instanceof fabric.Path) {
                            var path = object.item(0);
                            path.set('fill', this.value); // Cambiar el color de relleno
                            path.set('stroke', this.value); // Cambiar el color del contorno
                        }
                        // Verificar si el objeto es un texto
                        else if (object instanceof fabric.Textbox) {
                            object.set('fill', this.value); // Cambiar el color del texto
                        }
                        // Verificar si el objeto es un círculo, un cuadrado o un rectángulo
                        else if (object instanceof fabric.Circle || object instanceof fabric.Rect || object instanceof fabric.Polygon) {
                            object.set('fill', this.value); // Cambiar el relleno
                            object.set('stroke', this.value); // Cambiar el contorno
                        }
                        // Verificar si el objeto es otro tipo de objeto
                        else {
                            object.set('fill', this.value); // Cambiar el color de relleno
                            if (object.stroke) {
                                object.set('stroke', this.value); // Cambiar el color del contorno si existe
                            }
                        }

                        // Actualizar el objeto en svgObjects y canvasObjects
                        updateSVGObject(object);
                    }, this);
                    canvas.renderAll();
                }
            });

            // Función para guardar el estado del lienzo en DB
            function saveCanvasState() {
                saveSVG = true;

                let urlParams = new URLSearchParams(window.location.search);
                let note_id = urlParams.get('id');

                var svgActual = generateSVGFromObjects(svgObjects);
                console.log("Actual: " + svgActual);
                var svgFinal = svgActual;

                let data = {
                    "canva_id": note_id,
                    "canva_draw": svgFinal
                };

                let xhr = new XMLHttpRequest();
                let url = "/memorand/canvadraw";

                xhr.open("POST", url, true);
                xhr.setRequestHeader("Content-Type", "application/json");

                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                    }
                };

                xhr.send(JSON.stringify(data));

            }

            // Escuchar el evento 'object:selected' para guardar el estado del lienzo
            canvas.on('object:selected', function (event) {

            });

            // Función para generar svgFinal a partir de svgObjects
            function generateSVGFromObjects(objects) {
                var svgFinal = [];
                svgFinal.push('<svg>');
                objects.forEach(function (svgObject) {
                    svgFinal.push(svgObject.svg); // Suponiendo que cada objeto en svgObjects tiene un método toSVG()
                });
                svgFinal.push('</svg>');
                return svgFinal.join("");
                console.log("Fin svg: " + svgFinal);
            }

            var canva_draw = atob('<%= new String(Base64.getEncoder().encode(canva_draw.getBytes()))%>');
            console.log(canva_draw);

            // Verificar si canva_draw no es null y no está vacío
            if (canva_draw !== null && canva_draw !== '') {
                // Dividir la cadena canva_draw en múltiples SVG
                var svgArray = canva_draw.split('<svg');
                svgArray.shift(); // Eliminar el primer elemento vacío

                // Cargar cada SVG en el lienzo
                svgArray.forEach(function (svgString) {
                    // Agregar el prefijo <svg para reconstruir el SVG completo
                    svgString = '<svg' + svgString;

                    fabric.loadSVGFromString(svgString, function (objects, options) {
                        // Agregar los objetos SVG al lienzo
                        objects.forEach(function (obj) {
                            obj.id = 'object-' + (++objectIdCounter);// Asignar un nuevo ID al objeto para evitar duplicados
                            canvas.add(obj);
                            // Agregar el objeto a svgObjects sin clonarlo
                            var svgObject = obj.toSVG();
                            svgObjects.push({id: obj.id, svg: svgObject});
                        });

                        // Renderizar el lienzo después de agregar los objetos SVG
                        canvas.renderAll();
                    });

                });
            }
            //console.log("canva: " + canva_draw);

            function toggleDrawingMode() {
                drawingMode = !drawingMode;
                canvas.isDrawingMode = drawingMode;
            }

            function togglePanning() {
                panningEnabled = !panningEnabled;
                canvas.selection = panningEnabled;
                canvas.defaultCursor = panningEnabled ? 'default' : 'move';
            }

            // Función para activar o desactivar el modo de dibujo libre
            document.getElementById('free-drawing').addEventListener('click', function () {
                canvas.isDrawingMode = !canvas.isDrawingMode;
            });



            // Evento para el botón de eliminar seleccionados
            document.getElementById('delete-selected').addEventListener('click', function () {
                var activeObjects = canvas.getActiveObjects();
                if (activeObjects.length > 0) {
                    activeObjects.forEach(function (object) {
                        // Eliminar el objeto del lienzo
                        canvas.remove(object);

                        // Eliminar el objeto de svgObjects si es un objeto SVG
                        var index = svgObjects.findIndex(function (svgObject) {
                            return svgObject.id === object.id;
                        });
                        if (index !== -1) {
                            svgObjects.splice(index, 1);
                        }

                        // Volver a generar svgFinal si es necesario
                        svgFinal = generateSVGFromObjects(svgObjects);
                    });
                    canvas.discardActiveObject();
                    canvas.renderAll();
                }
                saveCanvasState();
            });

            document.getElementById('delete-all').addEventListener('click', function () {
                // Eliminar todos los objetos del lienzo y también del arreglo canvasObjects
                canvas.clear();

                // Limpiar svgFinal y svgObjects
                svgFinal = [];
                svgObjects = [];
                canvas.renderAll();
                saveCanvasState();
            });


            document.addEventListener('keydown', function (e) {
                var activeObject = canvas.getActiveObject();
                if (activeObject && activeObject.type === 'textbox' && activeObject.isEditing) {
                    // Si el objeto activo es un textbox y está en modo de edición, no realizar ninguna acción
                    return;
                }

                if (e.keyCode === 46 || e.keyCode === 8) { // Código de tecla para borrar
                    var activeObjects = canvas.getActiveObjects();
                    if (activeObjects.length > 0) {
                        activeObjects.forEach(function (object) {
                            // Eliminar el objeto del lienzo
                            canvas.remove(object);

                            // Eliminar el objeto de svgObjects si es un objeto SVG
                            var index = svgObjects.findIndex(function (svgObject) {
                                return svgObject.id === object.id;
                            });
                            if (index !== -1) {
                                svgObjects.splice(index, 1);
                            }

                            // Volver a generar svgFinal si es necesario
                            svgFinal = generateSVGFromObjects(svgObjects);
                        });
                    }
                    saveCanvasState();
                }

            });

            // Función para descargar la imagen del lienzo
            document.getElementById('download-image').addEventListener('click', function () {
                var link = document.createElement('a');
                link.href = canvas.toDataURL({
                    format: 'png',
                    quality: 1
                });
                link.download = 'lienzo.png';
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);

            });

            document.getElementById('download-svg').addEventListener('click', function () {
                // Itera sobre todos los objetos en el lienzo
                //toggleGrid();
                const svgContent = canvas.toSVG();

                // Crea un objeto Blob con el contenido SVG
                const blob = new Blob([svgContent], {type: 'image/svg+xml'});

                // Crea un objeto URL para el Blob
                const url = window.URL.createObjectURL(blob);

                // Crea un enlace para descargar el archivo
                const a = document.createElement('a');
                a.href = url;
                a.download = 'canvas.svg'; // Nombre del archivo
                document.body.appendChild(a);

                // Simula el clic en el enlace para iniciar la descarga
                a.click();

                // Elimina el enlace del DOM
                document.body.removeChild(a);

                //toggleGrid();
            });

            document.getElementById('download-image').addEventListener('click', function () {
                downloadImage();
            });

            canvas.freeDrawingBrush.color = '#000000';
            canvas.freeDrawingBrush.width = 4;

            // Función para cambiar el color del lápiz
            document.getElementById('color').addEventListener('change', function () {
                canvas.freeDrawingBrush.color = this.value;
            });

            // Función para cambiar el grosor del lápiz
            document.getElementById('grosor').addEventListener('change', function () {
                canvas.freeDrawingBrush.width = parseInt(this.value, 10) || 1;
            });

            function disableDrawingMode() {
                drawingMode = false;
                canvas.isDrawingMode = drawingMode;

                // Obtener todos los objetos del lienzo
                var objects = canvas.getObjects();

                // Filtrar los trazos del lápiz que están en modo de edición
                var pencilPaths = objects.filter(function (object) {
                    return object instanceof fabric.Path && object.isEditing && object.paintFirstVertex;
                });

                // Recorrer los trazos del lápiz y agregar sus datos SVG al array pencilPathsSVG
                pencilPaths.forEach(function (path) {
                    var pencilPathSVG = path.toSVG();
                    pencilPathsSVG.push(pencilPathSVG);
                });

            }

            document.querySelectorAll('.des').forEach((button) => {
                button.addEventListener('click', () => {
                    disableDrawingMode();
                });
            });

            let isDraggingMode = false;

            document.getElementById('toggle-dragging-btn').addEventListener('click', function () {
                disableDrawingMode();
                isDraggingMode = !isDraggingMode;
                this.innerHTML = isDraggingMode ?
                        '<svg width="24" height="24" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg"><path fill="none" d="M0 0h256v256H0z"></path><path d="M88 116H68a20.1 20.1 0 0 0-20 20v16a80 80 0 0 0 160 0v-44a20 20 0 0 0-40 0V92a20 20 0 0 0-40 0 20 20 0 0 0-40 0Z" opacity=".2" fill="#25ce7b" class="fill-000000"></path><path d="M128 92a20 20 0 0 0-40 0v24M168 108V92a20 20 0 0 0-40 0v32" fill="none" stroke="#25ce7b" stroke-linecap="round" stroke-linejoin="round" stroke-width="16" class="stroke-000000"></path><path d="M88 148v-32H68a20.1 20.1 0 0 0-20 20v16a80 80 0 0 0 160 0v-44a20 20 0 0 0-40 0v16" fill="none" stroke="#25ce7b" stroke-linecap="round" stroke-linejoin="round" stroke-width="16" class="stroke-000000"></path></svg>'
                        :
                        '<svg width="24" height="24" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg"><rect fill="none" height="256" width="256"/><path d="M128,92a20,20,0,0,0-40,0v24" fill="none" stroke="#25ce7b" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/><path d="M168,108V92a20,20,0,0,0-40,0v32" fill="none" stroke="#25ce7b" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/><path d="M88,148V116H68a20.1,20.1,0,0,0-20,20v16a80,80,0,0,0,160,0V108a20,20,0,0,0-40,0v16" fill="none" stroke="#25ce7b" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/></svg>';
            });

            canvas.on('mouse:down', function (opt) {
                var evt = opt.e;
                if (isDraggingMode) {
                    this.isDragging = true;
                    this.selection = false;
                    this.lastPosX = evt.clientX;
                    this.lastPosY = evt.clientY;
                }
            });

            canvas.on('mouse:move', function (opt) {
                if (this.isDragging) {
                    var e = opt.e;
                    var vpt = this.viewportTransform;
                    vpt[4] += e.clientX - this.lastPosX;
                    vpt[5] += e.clientY - this.lastPosY;
                    this.requestRenderAll();
                    this.lastPosX = e.clientX;
                    this.lastPosY = e.clientY;
                }
            });

            canvas.on('mouse:up', function (opt) {
                this.isDragging = false;
                this.selection = true;
            });

            function disableDrawingMode() {
                canvas.isDrawingMode = false;
            }

            canvas.on('mouse:move', function (opt) {
                if (panningEnabled && opt && opt.e && opt.e.buttons === 1) {
                    var delta = new fabric.Point(opt.e.movementX, opt.e.movementY);
                    canvas.relativePan(delta);
                }
            });

            canvas.on('mouse:down', function (opt) {
                var evt = opt.e;
                if (evt.altKey === true) {
                    this.isDragging = true;
                    this.selection = false;
                    this.lastPosX = evt.clientX;
                    this.lastPosY = evt.clientY;
                    disableDrawingMode();
                }
                saveCanvasState();
            });

            canvas.on('mouse:move', function (opt) {
                if (this.isDragging) {
                    var e = opt.e;
                    var vpt = this.viewportTransform;
                    vpt[4] += e.clientX - this.lastPosX;
                    vpt[5] += e.clientY - this.lastPosY;
                    this.requestRenderAll();
                    this.lastPosX = e.clientX;
                    this.lastPosY = e.clientY;
                }
            });

            canvas.on('mouse:up', function (opt) {
                // Termina el arrastre del lienzo
                this.isDragging = false;
                this.selection = true;
                saveCanvasState();
            });

            var isAddingNewElement = false; // Variable para controlar si se está agregando un nuevo elemento
            var elementTypeToAdd = ''; // Variable para almacenar el tipo de elemento que se está agregando

            // Event listener para los botones de formas
            document.getElementById('circle').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'circle';
            });

            document.getElementById('square').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'square';
            });

            document.getElementById('diamond').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'diamond';
            });

            document.getElementById('rectangle').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'rectangle';
            });

            document.getElementById('hexa').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'hexagon';
            });

            document.getElementById('rect-pill').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'pill';
            });

            document.getElementById('line').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'line';
            });

            document.getElementById('add-text').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'text';
            });


            document.getElementById('arrow-up').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'arrow1';
            });
            document.getElementById('arrow2').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'arrow2';
            });
            document.getElementById('arrow3').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'arrow3';
            });
            document.getElementById('arrow4').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'arrow4';
            });

            // Contenido del SVG de las arrow
            var svgArrow1 = `<svg viewBox="0 0 32 35" xmlns="http://www.w3.org/2000/svg"><title/><g data-name="Layer 2" id="Layer_2"><path d="M9.05,10.05a1,1,0,0,0,1.42,0l4.6-4.6V35a1,1,0,0,0,2,0V5.48l4.57,4.57a1,1,0,0,0,1.41-1.41L16.69,2.27a.9.9,0,0,0-1.27,0L9.05,8.64A1,1,0,0,0,9.05,10.05Z"/></g></svg>`;
            var svgArrow2 = `<svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="150" height="150" viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet"><g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
        fill="#000000" stroke="none">
        <path d="M4620 4808 c-45 -30 -66 -72 -54 -107 5 -14 39 -50 75 -81 36 -30 67
        -59 68 -65 1 -5 -29 -13 -66 -18 -1120 -128 -2082 -510 -2822 -1120 -514 -423
        -962 -967 -1324 -1607 -246 -437 -409 -878 -477 -1290 -26 -161 -26 -166 10
        -202 28 -27 36 -30 77 -25 33 3 54 13 75 34 26 26 31 43 49 154 52 325 159
        639 341 1004 395 788 974 1486 1603 1930 574 406 1248 689 1970 829 137 26
        464 76 502 76 19 0 14 -8 -34 -54 -51 -50 -55 -57 -49 -88 13 -64 86 -110 149
        -94 23 5 262 204 361 299 85 81 64 125 -128 272 -76 59 -156 120 -176 137 -52
        41 -105 47 -150 16z"/>
        </g>
        </svg>
        `;
            var svgArrow3 = `<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
        width="150" height="150" viewBox="0 0 512.000000 512.000000"
        preserveAspectRatio="xMidYMid meet">

        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
        fill="#000000" stroke="none">
        <path d="M201 4964 c-12 -15 -21 -32 -21 -38 0 -7 214 -534 476 -1172 262
        -637 479 -1169 481 -1181 3 -14 -166 -439 -472 -1185 -263 -640 -480 -1172
        -482 -1183 -6 -30 33 -75 65 -75 32 0 4623 2346 4664 2383 16 14 28 35 28 47
        0 12 -12 33 -28 47 -41 37 -4632 2383 -4664 2383 -17 0 -34 -10 -47 -26z"/>
        </g>
        </svg>
        `;
            var svgArrow4 = `<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
        width="150" height="150" viewBox="0 0 512.000000 512.000000"
        preserveAspectRatio="xMidYMid meet">

        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
        fill="#000000" stroke="none">
        <path d="M1400 5098 c-44 -17 -77 -44 -171 -137 -144 -143 -163 -177 -164
        -286 0 -58 5 -91 19 -120 13 -27 333 -355 995 -1018 l976 -977 -977 -978
        c-760 -760 -982 -987 -997 -1022 -14 -30 -21 -67 -21 -110 0 -103 29 -153 168
        -291 98 -97 127 -119 175 -137 73 -28 131 -28 204 -1 56 20 108 71 1230 1193
        1297 1296 1223 1214 1223 1346 0 132 74 50 -1223 1346 -1123 1123 -1174 1173
        -1230 1193 -72 26 -136 26 -207 -1z"/>
        </g>
        </svg>
        `;
            // Contenido del SVG que deseas insertar
            var svgString1 = `<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="3000" height="2500" viewBox="370.51 97.79 1896.86 1580.71" xml:space="preserve">
        <desc>Created with Fabric.js 4.5.0</desc>
        <defs>
        </defs>
        <g transform="matrix(1.7 0 0 0.98 950.39 170.5)"  >
        <rect style="stroke: rgb(219,246,241); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(219,246,241); fill-rule: nonzero; opacity: 1;"  x="-75" y="-25" rx="25" ry="25" width="150" height="50" />
        </g>
        <g transform="matrix(-2.45 2.45 -2.45 -2.45 987.38 234.78)"  >
        <line style="stroke: rgb(81,82,76); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.29 0.28 -0.28 0.29 951.7 240.08)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 11; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.14 0.14 -0.14 0.14 621.2 254.57)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.14 0.14 -0.14 0.14 1353.35 254.27)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(1.42 0 0 1.68 625.96 336.05)"  >
        <rect style="stroke: rgb(80,73,79); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.38 0 0 1.65 952.72 335.76)"  >
        <rect style="stroke: rgb(80,73,79); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.41 0 0 1.65 1359.72 339)"  >
        <rect style="stroke: rgb(80,73,79); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.13 0 0 1.24 950.21 280.45)"  >
        <rect style="stroke: rgb(190,174,245); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(190,174,245); fill-rule: nonzero; opacity: 1;"  x="-75" y="-25" rx="25" ry="25" width="150" height="50" />
        </g>
        <g transform="matrix(1.13 0 0 1.24 622.97 279.78)"  >
        <rect style="stroke: rgb(240,184,233); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(240,182,231); fill-rule: nonzero; opacity: 1;"  x="-75" y="-25" rx="25" ry="25" width="150" height="50" />
        </g>
        <g transform="matrix(1.13 0 0 1.24 1357.1 281.47)"  >
        <rect style="stroke: rgb(230,246,175); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(230,246,175); fill-rule: nonzero; opacity: 1;"  x="-75" y="-25" rx="25" ry="25" width="150" height="50" />
        </g>
        <g transform="matrix(0.14 0.14 -0.14 0.14 622.89 420.52)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.14 0.14 -0.14 0.14 951.55 417.44)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.14 0.14 -0.14 0.14 1354.12 419.75)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(-0.48 0.48 -0.48 -0.48 625.73 442.91)"  >
        <line style="stroke: rgb(84,77,83); stroke-width: 5; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(-0.48 0.48 -0.48 -0.48 953.53 440.6)"  >
        <line style="stroke: rgb(84,77,83); stroke-width: 5; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(-0.48 0.48 -0.48 -0.48 1358.39 441.36)"  >
        <line style="stroke: rgb(81,77,81); stroke-width: 5; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.12 0.12 -0.12 0.12 554.39 459.27)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.12 0.12 -0.12 0.12 696.58 459.22)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.12 0.12 -0.12 0.12 882.33 457.29)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.12 0.12 -0.12 0.12 1024.56 457.04)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.12 0.12 -0.12 0.12 1287.44 457.87)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.12 0.12 -0.12 0.12 1429.55 457.55)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.62 0 0 0.71 882.03 489.43)"  >
        <rect style="stroke: rgb(165,242,235); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(162,239,229); fill-rule: nonzero; opacity: 1;"  x="-75" y="-25" rx="25" ry="25" width="150" height="50" />
        </g>
        <g transform="matrix(0.62 0 0 0.71 1025.79 489.15)"  >
        <rect style="stroke: rgb(165,242,235); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(162,239,229); fill-rule: nonzero; opacity: 1;"  x="-75" y="-25" rx="25" ry="25" width="150" height="50" />
        </g>
        <g transform="matrix(0.62 0 0 0.71 697.73 489.15)"  >
        <rect style="stroke: rgb(234,248,174); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(234,248,174); fill-rule: nonzero; opacity: 1;"  x="-75" y="-25" rx="25" ry="25" width="150" height="50" />
        </g>
        <g transform="matrix(0.62 0 0 0.71 554.42 489.41)"  >
        <rect style="stroke: rgb(234,248,174); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(234,248,174); fill-rule: nonzero; opacity: 1;"  x="-75" y="-25" rx="25" ry="25" width="150" height="50" />
        </g>
        <g transform="matrix(0.62 0 0 0.71 1287.06 488.62)"  >
        <rect style="stroke: rgb(230,214,250); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(230,214,250); fill-rule: nonzero; opacity: 1;"  x="-75" y="-25" rx="25" ry="25" width="150" height="50" />
        </g>
        <g transform="matrix(0.62 0 0 0.71 1430.23 487.58)"  >
        <rect style="stroke: rgb(230,214,250); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(230,214,250); fill-rule: nonzero; opacity: 1;"  x="-75" y="-25" rx="25" ry="25" width="150" height="50" />
        </g>
        <g transform="matrix(0.09 0.09 -0.09 0.09 555.07 520.65)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.09 0.08 -0.08 0.09 697.6 520.39)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.09 0.08 -0.08 0.09 883.41 520.63)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.09 0.08 -0.08 0.09 1026.62 520.08)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.09 0.08 -0.08 0.09 1288.67 519.55)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.09 0.08 -0.08 0.09 1431.63 518.91)"  >
        <line style="stroke: rgb(83,83,81); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(1.17 0 0 1.17 555.5 593.36)"  >
        <rect style="stroke: rgb(90,83,89); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.17 0 0 1.17 696.92 593.77)"  >
        <rect style="stroke: rgb(90,83,89); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.17 0 0 1.17 884.59 591.75)"  >
        <rect style="stroke: rgb(90,83,89); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.17 0 0 1.17 1025.47 592.27)"  >
        <rect style="stroke: rgb(90,83,89); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.17 0 0 1.17 1290.28 592.15)"  >
        <rect style="stroke: rgb(90,83,89); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.17 0 0 1.17 1432.43 590.14)"  >
        <rect style="stroke: rgb(90,83,89); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        </svg>`;
            var svgString2 = `<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="3000" height="2500" viewBox="-343.66 -39.88 3862.29 3218.58" xml:space="preserve">
        <desc>Created with Fabric.js 4.5.0</desc>
        <defs>
        </defs>
        <g transform="matrix(-2.68 2.69 -2.69 -2.68 977.97 225.17)"  >
        <line style="stroke: rgb(75,169,169); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(-1.81 -0.02 0.01 -1.54 576.49 248.9)" id="Layer_2"  >
        <path style="stroke: rgb(75,169,169); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(75,169,169); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(-1.81 -0.02 0.01 -1.54 1378.71 248.54)"  >
        <path style="stroke: rgb(75,169,169); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(75,169,169); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(1.46 0 0 1.85 577.61 362.45)"  >
        <rect style="stroke: rgb(254,105,100); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.55 0 0 1.88 962.19 362.97)"  >
        <rect style="stroke: rgb(88,171,225); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.7 0 0 1.91 1379.07 363.45)"  >
        <rect style="stroke: rgb(245,171,196); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(0.83 0 0 0.51 576.64 301.69)"  >
        <rect style="stroke: rgb(254,105,100); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(0.86 0 0 0.55 962.1 300.37)"  >
        <rect style="stroke: rgb(88,171,225); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(3.63 0 0 0.86 965.45 145.74)"  >
        <rect style="stroke: rgb(68,167,167); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(-1.86 -0.01 0.01 -2.51 961.12 222.21)"  >
        <path style="stroke: rgb(75,169,169); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(75,169,169); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(0.95 0 0 0.49 1379.5 301.61)"  >
        <rect style="stroke: rgb(245,171,196); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.09 0 0 2.56 455.32 632.97)"  >
        <rect style="stroke: rgb(255,177,79); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.09 0 0 2.56 681.67 634.29)"  >
        <rect style="stroke: rgb(255,177,79); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.11 0 0 2.55 886.96 635.13)"  >
        <rect style="stroke: rgb(102,95,147); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.11 0 0 2.55 1091.53 633.91)"  >
        <rect style="stroke: rgb(102,95,147); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.1 0 0 2.56 1292.8 632.97)"  >
        <rect style="stroke: rgb(190,182,233); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.09 0 0 2.56 1499.34 631.24)"  >
        <rect style="stroke: rgb(190,182,233); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(-0.1 0.56 -0.56 -0.1 1340.77 468.99)"  >
        <line style="stroke: rgb(245,171,196); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.78 0 0 0.78 1294.36 530.65)"  >
        <rect style="stroke: rgb(190,182,233); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(0.57 -0.05 0.05 0.57 1434.55 474.57)"  >
        <line style="stroke: rgb(245,171,196); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.78 0 0 0.78 1503.83 531.37)"  >
        <rect style="stroke: rgb(190,182,233); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(-0.07 0.59 -0.59 -0.07 925.12 472.6)"  >
        <line style="stroke: rgb(88,171,225); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.59 -0.09 0.09 0.59 1023.01 472.44)"  >
        <line style="stroke: rgb(87,170,223); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.77 0 0 0.76 885.25 534.22)"  >
        <rect style="stroke: rgb(102,95,147); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(0.77 0 0 0.72 1089.74 535.95)"  >
        <rect style="stroke: rgb(102,95,147); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(0.58 -0.08 0.08 0.58 624.69 472.24)"  >
        <line style="stroke: rgb(254,105,100); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(-0.08 0.58 -0.58 -0.08 525.35 470.63)"  >
        <line style="stroke: rgb(254,105,100); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.78 0 0 0.78 460.07 532.95)"  >
        <rect style="stroke: rgb(255,177,79); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(0.78 0 0 0.73 682.03 534.53)"  >
        <rect style="stroke: rgb(255,177,79); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(0.08 -0.58 0.58 0.08 618.13 767.93)"  >
        <line style="stroke: rgb(255,177,79); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.58 -0.08 0.08 0.58 521.72 767.25)"  >
        <line style="stroke: rgb(255,177,79); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.07 -0.59 0.59 0.07 1039.61 767.59)"  >
        <line style="stroke: rgb(102,95,147); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(-0.58 0.08 -0.08 -0.58 943.02 767.79)"  >
        <line style="stroke: rgb(102,95,147); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(-0.58 0.08 -0.08 -0.58 1349.24 766.56)"  >
        <line style="stroke: rgb(190,182,233); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.07 -0.59 0.59 0.07 1444.93 765.61)"  >
        <line style="stroke: rgb(190,182,233); stroke-width: 10; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(1.89 0 0 1.3 568.81 880.99)"  >
        <rect style="stroke: rgb(79,167,116); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1 0 0 0.66 570.13 832.34)"  >
        <rect style="stroke: rgb(79,167,116); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.88 0 0 1.32 989.7 881.45)"  >
        <rect style="stroke: rgb(178,103,174); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1 0 0 0.66 990.68 833.3)"  >
        <rect style="stroke: rgb(178,103,174); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.88 0 0 1.3 1397.84 880.98)"  >
        <rect style="stroke: rgb(70,169,168); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1 0 0 0.64 1397.99 831.39)"  >
        <rect style="stroke: rgb(70,169,168); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        </svg>`;
            var svgString3 = `<svg >
        <desc>Created with Fabric.js 4.5.0</desc>
        <defs>
        </defs>
        <g transform="matrix(1.95 0 0 1.95 954.52 231.73)"  >
        <rect style="stroke: rgb(233,53,162); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(233,53,162); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.95 0 0 1.95 934.52 214.73)"  >
        <rect style="stroke: rgb(11,10,10); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.9 0 0 1.9 1355.34 410.93)"  >
        <rect style="stroke: rgb(125,87,173); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(125,87,173); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.9 0 0 1.9 575.1 404.35)"  >
        <rect style="stroke: rgb(125,87,173); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(125,87,173); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(-1.31 0 0 -1.59 553.47 257.88)" id="Layer_2"  >
        <path style="stroke: rgb(233,53,162); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(233,53,162); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(-1.31 0 0 -1.59 1333.79 264.65)"  >
        <path style="stroke: rgb(233,53,162); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(233,53,162); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(-0.78 0.78 -0.78 -0.78 668.66 231.48)"  >
        <line style="stroke: rgb(233,53,162); stroke-width: 3; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(-0.78 0.78 -0.78 -0.78 1219.06 237.46)"  >
        <line style="stroke: rgb(233,53,162); stroke-width: 3; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(-0.94 0.94 -0.94 -0.94 569.84 545.01)"  >
        <line style="stroke: rgb(125,87,173); stroke-width: 3; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.14 0.14 -0.14 0.14 577.27 522.12)"  >
        <line style="stroke: rgb(125,87,173); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(-0.98 0.01 -0.01 -1.24 430.28 564.81)" id="Layer_2"  >
        <path style="stroke: rgb(125,87,173); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(125,87,173); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(-0.89 0.01 -0.01 -1.3 710.9 565.6)"  >
        <path style="stroke: rgb(125,87,173); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(125,87,173); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 445.65 666.03)"  >
        <rect style="stroke: rgb(242,54,123); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(242,54,123); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.88 0 0 1.88 552.74 384.73)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.88 0 0 1.88 1332.52 390.08)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 424.49 650.77)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 741.66 667.43)"  >
        <rect style="stroke: rgb(5,184,196); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(5,184,196); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 721.35 652.04)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(-0.94 0.94 -0.94 -0.94 1350.21 551.86)"  >
        <line style="stroke: rgb(125,87,173); stroke-width: 3; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.14 0.14 -0.14 0.14 1357.32 528.91)"  >
        <line style="stroke: rgb(125,87,173); stroke-width: 14; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 1225.6 673.14)"  >
        <rect style="stroke: rgb(242,54,123); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(242,54,123); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 1205.29 657.74)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 1521.72 674.5)"  >
        <rect style="stroke: rgb(5,184,196); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(5,184,196); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 1501.41 659.1)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(-0.89 0.01 -0.01 -1.24 1210.28 572.31)"  >
        <path style="stroke: rgb(125,87,173); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(125,87,173); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(-0.89 0.01 -0.01 -1.3 1490.22 572.56)"  >
        <path style="stroke: rgb(125,87,173); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(125,87,173); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(-0.61 0.62 -0.62 -0.61 426.38 774.05)"  >
        <line style="stroke: rgb(242,54,123); stroke-width: 3; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(0.16 0.15 -0.15 0.16 423.78 752.59)"  >
        <line style="stroke: rgb(242,54,123); stroke-width: 15; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(-0.77 0 0 -0.91 335.2 789.34)" id="Layer_2"  >
        <path style="stroke: rgb(242,54,123); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(242,54,123); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(-0.77 0 0 -0.91 517.23 788.91)"  >
        <path style="stroke: rgb(242,54,123); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(242,54,123); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 343.82 885.72)"  >
        <rect style="stroke: rgb(242,54,123); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(242,54,123); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 322.84 870.66)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 570.01 885.24)"  >
        <rect style="stroke: rgb(242,54,123); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(242,54,123); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 549.03 870.18)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(0.16 0.15 -0.15 0.16 1508.72 762.41)"  >
        <line style="stroke: rgb(5,184,196); stroke-width: 15; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 1428.91 895.33)"  >
        <rect style="stroke: rgb(5,184,196); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(5,184,196); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 1408.45 879.78)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 1664.33 896.82)"  >
        <rect style="stroke: rgb(5,184,196); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(5,184,196); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 1644.02 881.42)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(-0.9 -0.01 0.01 -0.93 1420.15 799.17)" id="Layer_2"  >
        <path style="stroke: rgb(5,184,196); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(5,184,196); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(-0.9 0 0 -0.93 1602.2 798.44)"  >
        <path style="stroke: rgb(5,184,196); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(5,184,196); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(-0.62 0.62 -0.62 -0.62 1511.07 783.88)"  >
        <line style="stroke: rgb(5,184,196); stroke-width: 5; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(1.47 1.48 -1.48 1.47 685.69 951.95)"  >
        <line style="stroke: rgb(5,184,196); stroke-width: 3; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(1.46 1.48 -1.48 1.46 1278.43 955.86)"  >
        <line style="stroke: rgb(242,54,123); stroke-width: 3; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 843.25 943.94)"  >
        <rect style="stroke: rgb(5,184,196); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(5,184,196); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 822.94 928.55)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 842.52 1179.99)"  >
        <rect style="stroke: rgb(5,184,196); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(5,184,196); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 822.21 1164.6)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(0 1 -1 0 708.12 927.29)" id="Layer_2"  >
        <path style="stroke: rgb(5,184,196); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(5,184,196); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(0 1 -1 0 706.95 1171.61)"  >
        <path style="stroke: rgb(5,184,196); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(5,184,196); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 1146.07 946.1)"  >
        <rect style="stroke: rgb(242,54,123); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(242,54,123); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 1125.08 931.04)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(0 -1 1 0 1260.37 947.8)" id="Layer_2"  >
        <path style="stroke: rgb(242,54,123); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(242,54,123); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        <g transform="matrix(1.28 0 0 1.67 1142.89 1180.49)"  >
        <rect style="stroke: rgb(242,54,123); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(242,54,123); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
        </g>
        <g transform="matrix(1.91 0 0 1.25 1121.9 1165.44)"  >
        <rect style="stroke: rgb(102,96,99); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
        </g>
        <g transform="matrix(0 -1 1 0 1258.92 1174.85)"  >
        <path style="stroke: rgb(242,54,123); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(242,54,123); fill-rule: nonzero; opacity: 1;"  transform=" translate(-16.02, -19)" d="M 9.05 10.05 C 9.237766599905557 10.239312650823097 9.493362463629442 10.34579832434167 9.760000000000002 10.34579832434167 C 10.02663753637056 10.34579832434167 10.282233400094444 10.239312650823097 10.47 10.05 L 15.07 5.450000000000001 L 15.07 35 C 15.07 35.5522847498308 15.517715250169207 36 16.07 36 C 16.622284749830794 36 17.07 35.5522847498308 17.07 35 L 17.07 5.48 L 21.64 10.05 C 22.036760277455702 10.389776795928704 22.628194171545708 10.366932269681033 22.99756322061337 9.99756322061337 C 23.366932269681033 9.628194171545706 23.389776795928704 9.0367602774557 23.05 8.64 L 16.69 2.27 C 16.338849900051684 1.9203855334820534 15.771150099948319 1.9203855334820534 15.420000000000002 2.27 L 9.05 8.64 C 8.662276405289202 9.030037454310923 8.662276405289202 9.659962545689076 9.05 10.05 Z" stroke-linecap="round" />
        </g>
        </svg>`;

            // Event listener para el lienzo
            canvas.on('mouse:down', function (event) {
                // Verificar si se está agregando un nuevo elemento
                if (isAddingNewElement) {
                    // Obtener las coordenadas del clic dentro del lienzo
                    var pointer = canvas.getPointer(event.e);

                    var x1 = pointer.x;
                    var y1 = pointer.y;
                    // Obtener el color seleccionado
                    var color = document.getElementById('color').value;
                    // Guardar las coordenadas en la consola
                    console.log('Coordenadas del clic: x1 = ' + x1 + ', y1 = ' + y1);

                    function addSvgToCanvas(svgString) {
                        fabric.loadSVGFromString(svgString, function (objects, options) {
                            objects.forEach(function (obj) {
                                obj.set({
                                    left: x1 - 15,
                                    top: y1 - 5
                                });

                                obj.on('mousedown', function (options) {
                                    var color = document.getElementById('color').value;
                                    obj.set({
                                        stroke: color
                                    });
                                    canvas.renderAll();
                                });
                                addObjectToCanvas(obj);
                            });
                            canvas.renderAll();
                        });
                    }

                    // Crear el nuevo elemento según el tipo de elemento a agregar
                    if (elementTypeToAdd === 'circle') {

                        var circle = new fabric.Circle({
                            radius: 50,
                            fill: document.getElementById('shape-fill').checked ? document.getElementById('color').value : '',
                            stroke: document.getElementById('colorBorder').value,
                            strokeWidth: 2,
                            left: x1 - 50,
                            top: y1 - 50
                        });
                        addObjectToCanvas(circle); // Agrega el círculo al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'square') {
                        var square = new fabric.Rect({
                            width: 100,
                            height: 100,
                            fill: document.getElementById('shape-fill').checked ? document.getElementById('color').value : '',
                            stroke: document.getElementById('colorBorder').value,
                            strokeWidth: 2,
                            left: x1 - 50,
                            top: y1 - 50
                        });
                        addObjectToCanvas(square); // Agrega el cuadrado al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'diamond') {
                        var diamond = new fabric.Polygon([
                            {x: x1 - 50, y: y1},
                            {x: x1, y: y1 - 50},
                            {x: x1 + 50, y: y1},
                            {x: x1, y: y1 + 50}
                        ], {
                            fill: document.getElementById('shape-fill').checked ? document.getElementById('color').value : '',
                            stroke: document.getElementById('colorBorder').value,
                            strokeWidth: 2
                        });
                        addObjectToCanvas(diamond); // Agrega el diamante al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'rectangle') {
                        var rectangle = new fabric.Rect({
                            width: 150,
                            height: 75,
                            fill: document.getElementById('shape-fill').checked ? document.getElementById('color').value : '',
                            stroke: document.getElementById('colorBorder').value,
                            strokeWidth: 2,
                            left: x1 - 75,
                            top: y1 - 37.5
                        });
                        addObjectToCanvas(rectangle); // Agrega el rectángulo al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'hexagon') {
                        var hexagon = new fabric.Polygon([
                            {x: 50, y: 0},
                            {x: 100, y: 0},
                            {x: 125, y: 50},
                            {x: 100, y: 100},
                            {x: 50, y: 100},
                            {x: 25, y: 50}
                        ], {
                            fill: document.getElementById('shape-fill').checked ? document.getElementById('color').value : '',
                            stroke: document.getElementById('colorBorder').value,
                            strokeWidth: 2,
                            left: x1 - 75,
                            top: y1 - 37.5
                        });
                        addObjectToCanvas(hexagon); // Agrega el hexágono al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'pill') {
                        var pill = new fabric.Rect({
                            width: 150, // Ancho del rectángulo
                            height: 50, // Alto del rectángulo
                            fill: document.getElementById('shape-fill').checked ? document.getElementById('color').value : '',
                            stroke: document.getElementById('colorBorder').value,
                            strokeWidth: 2,
                            rx: 25, // Radio de redondeo de las esquinas
                            ry: 25, // Radio de redondeo de las esquinas
                            left: x1 - 75, // Posición horizontal
                            top: y1 - 25   // Posición vertical
                        });
                        addObjectToCanvas(pill); // Agrega la pastilla al lienzo y la almacena en canvasObjects
                    } else if (elementTypeToAdd === 'line') {
                        lineWidth = parseInt(document.getElementById('line-width').value); // Obtener el grosor de la línea del control deslizante
                        var line = new fabric.Line([50, 50, 200, 200], {
                            stroke: document.getElementById('color').value,
                            strokeWidth: lineWidth, // Establecer el grosor de la línea
                            left: x1 - 75,
                            top: y1 - 37.5
                        });
                        addObjectToCanvas(line); // Agrega una linea al lienzo y la almacena en canvasObjects
                    } else if (elementTypeToAdd === 'text') {
                        var text = new fabric.Textbox('Texto aquí', {
                            fontFamily: 'Comic Sans',
                            fontSize: 20,
                            fill: document.getElementById('color').value,
                            left: x1 - 25,
                            top: y1 - 17.5
                        });
                        addObjectToCanvas(text); // Agrega el texto al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'image') {
                        var input = document.createElement('input');
                        input.type = 'file';
                        input.accept = 'image/*';
                        input.click();
                        input.addEventListener('change', function (e) {
                            var file = e.target.files[0];
                            var reader = new FileReader();
                            reader.onload = function (event) {
                                var img = new Image();
                                img.onload = function () {
                                    var fabricImg = new fabric.Image(img, {
                                        left: x1 - 75,
                                        top: y1 - 37.5,
                                        selectable: true
                                    });
                                    addObjectToCanvas(fabricImg);
                                };
                                img.src = event.target.result;
                            };
                            reader.readAsDataURL(file);
                        });
                    } else if (elementTypeToAdd === 'arrow1') {
                        fabric.loadSVGFromString(svgArrow1, function (objects, options) {
                            changeSVGColor(objects, color);
                            objects.forEach(function (obj) {
                                obj.set({left: x1 - 15, top: y1 - 5});
                                addObjectToCanvas(obj); // Agregar objeto al lienzo
                            });
                            canvas.renderAll(); // Renderizar el lienzo después de agregar los objetos SVG
                        });
                    } else if (elementTypeToAdd === 'arrow2') {
                        fabric.loadSVGFromString(svgArrow2, function (objects, options) {
                            changeSVGColor(objects, color);
                            objects.forEach(function (obj) {
                                obj.set({left: x1 - 15, top: y1 - 5});
                                addObjectToCanvas(obj); // Agregar objeto al lienzo
                            });
                            canvas.renderAll(); // Renderizar el lienzo después de agregar los objetos SVG
                        });
                    } else if (elementTypeToAdd === 'arrow3') {
                        fabric.loadSVGFromString(svgArrow3, function (objects, options) {
                            changeSVGColor(objects, color);
                            objects.forEach(function (obj) {
                                obj.set({left: x1 - 15, top: y1 - 5});
                                addObjectToCanvas(obj); // Agregar objeto al lienzo
                            });
                            canvas.renderAll(); // Renderizar el lienzo después de agregar los objetos SVG
                        });
                    } else if (elementTypeToAdd === 'arrow4') {
                        fabric.loadSVGFromString(svgArrow4, function (objects, options) {
                            changeSVGColor(objects, color);
                            objects.forEach(function (obj) {
                                obj.set({left: x1 - 15, top: y1 - 5});
                                addObjectToCanvas(obj); // Agregar objeto al lienzo
                            });
                            canvas.renderAll(); // Renderizar el lienzo después de agregar los objetos SVG
                        });
                    }

                    // Restablecer la bandera después de agregar el elemento
                    isAddingNewElement = false;
                    elementTypeToAdd = ''; // Restablecer el tipo de elemento
                }

            });

            var selectedTemplateId = null;
            var lastClickX = 500;
            var lastClickY = 165;

            // Manejador para seleccionar la plantilla
            document.querySelectorAll('.template-card').forEach(function (card) {
                card.addEventListener('click', function () {
                    selectedTemplateId = this.id;
                    document.querySelectorAll('.template-card').forEach(function (card) {
                        card.classList.remove('selected');
                    });
                    this.classList.add('selected');
                });
            });

            // Manejador para el botón "Insertar"
            document.getElementById('insert-template-btn').addEventListener('click', function () {
                if (selectedTemplateId) {
                    var templateSVG;
                    switch (selectedTemplateId) {
                        case 'uSVG-1':
                            templateSVG = svgString1; // Asume que svgString1 contiene el SVG correspondiente
                            break;
                        case 'uSVG-2':
                            templateSVG = svgString2;
                            break;
                        case 'uSVG-3':
                            templateSVG = svgString3;
                            break;
                        case 'uSVG-4':
                            templateSVG = svgString4;
                            break;
                        case 'uSVG-5':
                            templateSVG = svgString5;
                            break;
                            // Agregar más casos según sea necesario
                    }

                    if (templateSVG) {
                        addSvgToCanvas(templateSVG);
                        saveCanvasState();
                    }

                    // Cerrar el modal después de insertar la plantilla
                    $('#myModal').modal('hide');
                }
            });

            // Función para agregar SVG al lienzo respetando las posiciones relativas y separando los objetos
            function addSvgToCanvas(svgString) {
                fabric.loadSVGFromString(svgString, function (objects, options) {
                    objects.forEach(function (obj) {
                        obj.set({
                            left: obj.left + lastClickX,
                            top: obj.top + lastClickY
                        });
                        addObjectToCanvas(obj); // Agregar objeto individual al lienzo
                    });
                    canvas.renderAll();
                });
            }

            // Manejador para registrar la última posición del clic en el lienzo
            canvas.on('mouse:down', function (event) {
                var pointer = canvas.getPointer(event.e);
                lastClickX = pointer.x;
                lastClickY = pointer.y;
            });

            canvas.on('mouse:move', function (opt) {
                if (this.isDragging) {
                    var e = opt.e;
                    var vpt = this.viewportTransform;
                    vpt[4] += e.clientX - this.lastPosX;
                    vpt[5] += e.clientY - this.lastPosY;
                    this.requestRenderAll();
                    this.lastPosX = e.clientX;
                    this.lastPosY = e.clientY;
                }
            });
            canvas.on('mouse:up', function (opt) {
                this.isDragging = false;
                this.selection = true;
            });
            function keepLineInsideCanvas(line) {
                line.setCoords();
                var boundingRect = line.getBoundingRect();
                if (boundingRect.top < 0 || boundingRect.left < 0 || boundingRect.top + boundingRect.height > canvas.height || boundingRect.left + boundingRect.width > canvas.width) {
                    line.remove();
                    alert("La línea está fuera del lienzo. Por favor, inténtalo de nuevo dentro del lienzo.");
                }
            }

            document.getElementById('color').addEventListener('change', function () {
                var selectedColor = this.value;
                canvas.freeDrawingBrush.color = selectedColor; // Aplica el color al lápiz de dibujo libre

                // Aplica el color seleccionado a la línea recta
                if (canvas.getActiveObject() instanceof fabric.Line) {
                    canvas.getActiveObject().set('stroke', selectedColor);
                    canvas.renderAll();
                }
            });

            canvas.on('mouse:wheel', function (opt) {
                var delta = opt.e.deltaY;
                var zoom = canvas.getZoom();
                zoom *= 0.999 ** delta;
                if (zoom > 20)
                    zoom = 20;
                if (zoom < 0.01)
                    zoom = 0.01;
                canvas.zoomToPoint({x: opt.e.offsetX, y: opt.e.offsetY}, zoom);
                opt.e.preventDefault();
                opt.e.stopPropagation();

            });

            canvas.on('mouse:down', function (opt) {
                var evt = opt.e;
                if (evt.altKey === true) {
                    this.isDragging = true;
                    this.selection = false;
                    this.lastPosX = evt.clientX;
                    this.lastPosY = evt.clientY;
                }

            });
            canvas.on('mouse:move', function (opt) {
                if (this.isDragging) {
                    var e = opt.e;
                    var vpt = this.viewportTransform;
                    vpt[4] += e.clientX - this.lastPosX;
                    vpt[5] += e.clientY - this.lastPosY;
                    this.requestRenderAll();
                    this.lastPosX = e.clientX;
                    this.lastPosY = e.clientY;
                }

            });

            canvas.on('mouse:up', function (opt) {
                // on mouse up we want to recalculate new interaction
                // for all objects, so we call setViewportTransform
                this.setViewportTransform(this.viewportTransform);
                this.isDragging = false;
                this.selection = true;

            });

            /*document.getElementById('upload-svg').addEventListener('change', function (e) {
             var files = e.target.files;
             var offsetX = canvas.width / 4; // Definir la posición X por defecto
             var offsetY = canvas.height / 7; // Definir la posición Y por defecto
             
             for (var i = 0; i < files.length; i++) {
             var file = files[i];
             var reader = new FileReader();
             reader.onload = function (event) {
             fabric.loadSVGFromURL(event.target.result, function (objects, options) {
             var svgObjects = fabric.util.groupSVGElements(objects, options);
             svgObjects.set({left: offsetX, top: offsetY}); // Establecer la posición del SVG
             addObjectToCanvas(svgObjects);
             // Almacenar una referencia al objeto SVG cargado
             svgObjects.originalFill = svgObjects.getObjects()[0].fill;
             console.log('SVG cargado correctamente:', svgObjects);
             });
             };
             reader.readAsDataURL(file);
             }
             });*/

            var _clipboard = null; // Variable para almacenar el objeto copiado

            function Copy() {
                // Clonar el objeto activo para copiarlo
                canvas.getActiveObject().clone(function (cloned) {
                    _clipboard = cloned;
                });
            }

            function Paste() {
                // Clonar nuevamente el objeto del portapapeles
                _clipboard.clone(function (clonedObj) {
                    // Generar un nuevo ID único para el objeto clonado
                    var newId = 'object-' + (++objectIdCounter);
                    clonedObj.id = newId;

                    canvas.discardActiveObject();
                    // Establecer nuevas propiedades para el objeto clonado
                    clonedObj.set({
                        left: clonedObj.left + 10, // Desplazamiento a la derecha
                        top: clonedObj.top + 10, // Desplazamiento hacia abajo
                        evented: true,
                    });
                    if (clonedObj.type === 'activeSelection') {
                        // Si es una selección activa, agregar una referencia al lienzo
                        clonedObj.canvas = canvas;
                        clonedObj.forEachObject(function (obj) {
                            canvas.add(obj);
                        });
                        // Actualizar las coordenadas de los objetos de la selección activa
                        clonedObj.setCoords();
                    } else {
                        // Agregar el objeto clonado al lienzo
                        canvas.add(clonedObj);
                    }

                    // Agregar el objeto clonado a svgObjects con su nuevo ID
                    var clonedSVG = clonedObj.toSVG();
                    svgObjects.push({id: newId, svg: clonedSVG});

                    _clipboard.top += 10; // Ajustar la posición del portapapeles
                    _clipboard.left += 10; // Ajustar la posición del portapapeles
                    canvas.setActiveObject(clonedObj); // Establecer el objeto clonado como activo
                    canvas.requestRenderAll(); // Renderizar el lienzo
                });

                saveCanvasState();
            }

            // Escuchar el evento de teclado
            document.addEventListener('keydown', function (e) {
                // Verificar si se presionó la tecla Ctrl + C (67 es el código de tecla para la tecla C)
                if (e.ctrlKey && e.keyCode === 67) {
                    Copy();
                }
                // Verificar si se presionó la tecla Ctrl + V (86 es el código de tecla para la tecla V)
                else if (e.ctrlKey && e.keyCode === 86) {
                    Paste();
                }
            });

            // Obtener el color del input por defecto o seleccionado
            function getColor() {
                return document.getElementById('color').value;
            }
            // Función para cambiar el color de un objeto SVG
            function changeSVGColor(objects, color) {
                objects.forEach(function (obj) {
                    obj.set({fill: color, stroke: color});
                });

            }

            // Función para mover el objeto activo
            function moveObject(keyCode) {
                var activeObject = canvas.getActiveObject();
                if (activeObject) {
                    switch (keyCode) {
                        case 37: // Flecha izquierda
                            activeObject.left -= 5;
                            break;
                        case 38: // Flecha arriba
                            activeObject.top -= 5;
                            break;
                        case 39: // Flecha derecha
                            activeObject.left += 5;
                            break;
                        case 40: // Flecha abajo
                            activeObject.top += 5;
                            break;
                    }
                    activeObject.setCoords(); // Actualiza las coordenadas del objeto
                    canvas.renderAll(); // Vuelve a renderizar el lienzo
                }
            }

            // Escuchar el evento de teclado
            document.addEventListener('keydown', function (e) {
                if (e.keyCode >= 37 && e.keyCode <= 40) {
                    e.preventDefault(); // Prevenir el comportamiento por defecto de las flechas
                    moveObject(e.keyCode);

                }
            });


            // Función para verificar el tamaño de la pantalla y deshabilitar interacciones
            function checkScreenSize() {
                if (window.innerWidth <= 768) { // Puedes ajustar este valor según tus necesidades
                    canvas.selection = false; // Deshabilitar selección de objetos
                    canvas.forEachObject(function (obj) {
                        obj.set({
                            selectable: false, // Deshabilitar selección de cada objeto
                            evented: false     // Deshabilitar eventos en cada objeto
                        });
                    });
                    canvas.off('mouse:down'); // Desactivar eventos del ratón en el lienzo
                } else {
                    canvas.selection = true;
                    canvas.forEachObject(function (obj) {
                        obj.set({
                            selectable: true,
                            evented: true
                        });
                    });
                    canvas.on('mouse:down', function (options) {
                        console.log('Mouse down on canvas', options);
                    });
                }
                canvas.renderAll(); // Renderizar el lienzo nuevamente para aplicar los cambios
            }

            // Ejecutar la función cuando se carga la página
            checkScreenSize();

            // Añadir un event listener para cambiar de tamaño la ventana
            window.addEventListener('resize', checkScreenSize);
        </script>

        <script src="scripts/chat.js"></script>

    </body>
</html>

<%
        } else {
            response.sendRedirect("home.jsp");
        }
    } else {
        response.sendRedirect("home.jsp");
    }

%>
