<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.UsersController"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String user_type = (String) session.getAttribute("user_type");
    String staff_name = (String) session.getAttribute("user_name");

    String inst_type = (String) session.getAttribute("inst_type");
    String inst_name = (String) session.getAttribute("inst_name");
    String inst_id = (String) session.getAttribute("inst_id");

    //if (user_type == null || !user_type.equals("admin"))
    //{
    //    response.sendRedirect("../index.jsp?error=100");
    //    session.invalidate();
    //}
    UsersController userc = new UsersController();
%>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Home Admin</title>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

    </head>
    <style>
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

    <%-- BODY --%>
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_admin.jspf"/>

        <div class="container">
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-10">
                    <h2>Panel de administrador</h2>
                </div>
                <div class="col-1"></div>
            </div>

            <div class="row mt-3">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row">
                        <div class="col-2 mt-2"><h4>Personal</h4></div>
                        <div class="col-5" >
                            <div class="row ms-2">
                                <div class="col-6"></div>
                                <div class="col-3 mt-2">
                                    <p>Estatus:</p>
                                </div>
                                <div class="col-3 mt-2">
                                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                        <input type="radio" class="btn-check" name="options" id="check" autocomplete="off" checked>
                                        <label class="btn btn-h rounded-start" for="check" id="active_inst"><i class="bi bi-check-lg"style="color: #000"></i></label>

                                        <input type="radio" class="btn-check" name="options" id="x" autocomplete="off">
                                        <label class="btn btn-h rounded-end" for="x" id="inactive_inst"><i class="bi bi-x-lg" style="color: #000"></i></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-5 text-start">
                            <div class="btn-group mt-2" role="group" aria-label="Basic radio toggle button group">
                                <input type="radio" class="btn-check" name="btnradio" id="rPersonal" autocomplete="off" checked>
                                <label class="btn btn-h rounded-start" for="rPersonal" style="padding: 3px 10px"><text style="color: #000" class="ms-2 me-2">Personal</text></label>

                                <input type="radio" class="btn-check" name="btnradio" id="rProyectos" autocomplete="off">
                                <label class="btn btn-h" for="rProyectos" style="padding: 3px 10px"><text style="color: #000" class="ms-2 me-2">Proyectos</text></label>

                                <input type="radio" class="btn-check" name="btnradio" id="rEquipos" autocomplete="off">
                                <label class="btn btn-h" for="rEquipos" style="padding: 3px 10px"><text style="color: #000" class="ms-2 me-2">Equipos</text></label>

                                <input type="radio" class="btn-check" name="btnradio" id="rGestionar" autocomplete="off">
                                <label class="btn btn-h rounded-end" for="rGestionar" style="padding: 3px 10px" data-bs-toggle="modal" data-bs-target="#gestionarModal"><text style="color: #000" class="ms-2 me-2">Gestionar</text></label>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-4 text-start">
                            <button type="submit" class="btn rounded-pill custom-admin me-3 mt-2" data-bs-toggle="modal" data-bs-target="#personalModal"><i class="bi bi-plus-lg me-2"></i>Agregar personal</button>
                        </div>

                        <div class="col-8"  >
                            <form action="/memorand/readfile" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-3">
                                        <label for="upload-csv" class="custom-file-input-label custom-admin rounded-pill mt-1" style="padding-bottom: 5px; padding-top: 5px"><i class="bi bi-upload ms-1 me-1"></i>Instant&aacute;neo</label>
                                    </div>
                                    <div class="col-7 text-start">
                                        <input type="file" name="file" accept=".csv" id="upload-csv" class="form-control mt-1">
                                    </div>
                                    <div class="col-2">
                                        <input type="submit" class="btn custom-admin rounded-pill mt-1" value="Listar">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>

            <div class="row mt-2">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row mb-3">
                        <div class="col-3"><h4>L&iacute;deres</h4></div>
                        <div class="col-6"><div class="input-group"> 
                                <input class="form-control me-2 rounded-pill" type="search" aria-label="Search" placeholder="&telrec;                                     Buscar l&iacute;der">
                            </div>

                            <div class="col-3"></div>
                        </div>
                        <table class="table" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th scope='col'></th>
                                    <th scope='col' class="text-start"><text class="ms-2">Nombre</text></th>
                                    <th scope='col'></th>
                                    <th scope='col'></th>
                                </tr>
                            </thead>
                            <tbody  id='table-body'>
                                <%= userc.modelGetAllChByInst(inst_id, 1, 0)%>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-1"></div> 
                </div>
            </div>
                            
            <div class="row mt-2">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row mb-3">
                        <div class="col-3"><h4>Integrantes</h4></div>
                        <div class="col-6"><div class="input-group"> 
                                <input class="form-control me-2 rounded-pill" type="search" aria-label="Search" placeholder="&telrec;                             Buscar integrante">
                            </div>

                            <div class="col-3"></div>
                        </div>
                        <table class="table" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th scope='col'></th>
                                    <th scope='col' class="text-start"><text class="ms-2">Nombre</text></th>
                                    <th scope='col'></th>
                                    <th scope='col'></th>
                                </tr>
                            </thead>
                            <tbody  id='table-body'>
                                <%= userc.modelGetAllWkByInst(inst_id, 1, 0) %>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-1"></div> 
                </div>
            </div>
            <%--<table>
                 <td>
                    <form action="/memorand/uploadfile" method="post" enctype="multipart/form-data">
                        Seleccione un archivo CSV para cargar:
                        <input type="file" name="file" accept=".csv">
                        <input type="submit" value="Cargar">
                    </form>
                    <% String fileName = request.getParameter("fileName"); %>
                </td>
                <td>
                    <a href="/memorand/downloadfile?fileName=<%= fileName %>"><h4>Descargar CSV</h4></a>
                </td>
            </table> --%>


            <div class="modal fade" id="personalModal"  data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Personal</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="form-check">
                                <input class="form-check-input rounded-circle" type="checkbox" value="" id="checkLider">
                                <label class="form-check-label" for="checkLider">
                                    L&iacute;deres
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input rounded-circle" type="checkbox" value="" id="checkInte">
                                <label class="form-check-label" for="checkInte">
                                    Integrantes
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="gestionarModal"  data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Gestionar</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="form-check">
                                <input class="form-check-input rounded-circle" type="checkbox" value="" id="ckGproyectos">
                                <label class="form-check-label" for="ckGproyectos">
                                    Proyectos
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input rounded-circle" type="checkbox" value="" id="ckGlideres">
                                <label class="form-check-label" for="ckGlideres">
                                    L&iacute;deres
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input rounded-circle" type="checkbox" value="" id="ckGintegr">
                                <label class="form-check-label" for="ckGintegr">
                                    Integrantes
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </body>
    <script>
        // Función para redirigir a la página correspondiente
        function redirectToPage(option) {
            switch (option) {
                case 'rProyectos':
                    window.location.href = 'proyectos.jsp';
                    break;
                case 'rEquipos':
                    window.location.href = 'departamentos.jsp';
                    break;
                default:
                    break;
            }
        }

        // Event listener para detectar cambios en la selección
        document.querySelectorAll('.btn-check').forEach(item => {
            item.addEventListener('change', event => {
                if (event.target.checked) {
                    redirectToPage(event.target.id);
                }
            });
        });


        // Función para redirigir a la página correspondiente
        function redirectToPage(option) {
            switch (option) {
                case 'checkLider':
                    window.location.href = 'lideres/nuevo.jsp';
                    break;
                case 'checkInte':
                    window.location.href = 'integrantes/nuevo.jsp';
                    break;
                case 'ckGproyectos':
                    window.location.href = 'gestion/proyectos.jsp';
                    break;
                case 'ckGlideres':
                    window.location.href = 'gestion/lideres.jsp';
                    break;
                case 'ckGintegr':
                    window.location.href = 'gestion/integrantes.jsp';
                    break;
                default:
                    break;
            }
        }

        // Event listener para detectar cambios en la selección de los checkbox
        document.querySelectorAll('.form-check-input').forEach(item => {
            item.addEventListener('change', event => {
                if (event.target.checked) {
                    redirectToPage(event.target.id);
                }
            });
        });
    </script>

</html>
