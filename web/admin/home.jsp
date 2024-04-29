<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.TeamsController"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.controller.UsersController"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String user_type = (String) session.getAttribute("user_type");
    String staff_name = (String) session.getAttribute("user_name");

    String inst_type = (String) session.getAttribute("inst_type");
    String inst_name = (String) session.getAttribute("inst_name");
    String inst_id = (String) session.getAttribute("inst_id");
    String team_id = request.getParameter("team_id");

    //if (user_type == null || !user_type.equals("admin"))
    //{
    //    response.sendRedirect("../index.jsp?error=100");
    //    session.invalidate();
    //}
    UsersController userc = new UsersController();
    ProjectsController projc = new ProjectsController();
    TeamsController teamc = new TeamsController();

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

        .content {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        /* Ocultar los contenidos de notas y lienzo inicialmente */
        .hidden {
            display: none;
        }
        .modal-custom {
            max-width: 510px;
        }

        .btn-color {
            border-color: #E3E4E5;
            background-color: transparent;

        }
        .btn-color:hover{
            border-color: #E3E4E5;
            background-color: #E3E4E5;
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
                        <div class="col-2 mt-2"><h4 id="contentName">Personal</h4></div>
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
                                <label class="btn btn-h rounded-start btnnav" id="get_Personal" for="rPersonal" style="padding: 3px 10px"><text style="color: #000" class="ms-2 me-2">Personal</text></label>

                                <input type="radio" class="btn-check" name="btnradio" id="rProyectos" autocomplete="off">
                                <label class="btn btn-h btnnav" id="get_Proyectos" for="rProyectos" style="padding: 3px 10px"><text style="color: #000" class="ms-2 me-2">Proyectos</text></label>

                                <input type="radio" class="btn-check" name="btnradio" id="rEquipos" autocomplete="off">
                                <label class="btn btn-h btnnav" id="get_Equipos" for="rEquipos" style="padding: 3px 10px"><text style="color: #000" class="ms-2 me-2">Equipos</text></label>

                                <input type="radio" class="btn-check" name="btnradio" id="rGestionar" autocomplete="off">
                                <label class="btn btn-h rounded-end btnnav" id="get_Gestionar" for="rGestionar" style="padding: 3px 10px"><text style="color: #000" class="ms-2 me-2">Gestionar</text></label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-1"></div>
            </div>
        </div>
        <div class="container">
            <div id="content" style="position: relative;">

                <div id="personal_content" class="content">
                    <div class="row mt-2">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="row ">
                                <div class="col-4 text-start">
                                    <a href="lideres/nuevo.jsp"><button type="submit" class="btn rounded-pill custom-admin me-3 mt-2"><i class="bi bi-plus-lg me-2"></i>Agregar personal</button></a>
                                </div>

                                <div class="col-8 mt-2"  >
                                    <form action="/memorand/readfile" method="post" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-3">
                                                <label for="upload-csv" class="custom-file-input-label custom-admin rounded-pill mt-1" style="padding-bottom: 5px; padding-top: 5px"><i class="bi bi-upload ms-1 me-1"></i>Instant&aacute;neo</label>
                                            </div>
                                            <div class="col-6 text-start">
                                                <input type="file" name="file" accept=".csv" id="upload-csv" class="form-control mt-1">
                                            </div>
                                            <div class="col-3">
                                                <button type="submit" class="btn custom-admin rounded-pill mt-1"><i class="bi bi-capslock-fill me-2"></i>Agregar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-3"><h4>L&iacute;deres</h4></div>
                                <div class="col-6"><div class="input-group"> 
                                        <input id="searchInputLider" class="form-control me-2 rounded-pill" type="search" aria-label="Search" placeholder="&telrec;                                     Buscar l&iacute;der">
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
                                    <tbody  id='table-bodyProj'>
                                        <%= userc.modelGetAllChByInst(inst_id, 1, 0)%>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-1"></div> 
                        </div>
                    </div>

                    <div class="row mt-2 mb-5">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="row mb-3">
                                <div class="col-3"><h4>Integrantes</h4></div>
                                <div class="col-6"><div class="input-group"> 
                                        <input id="searchInputInte" class="form-control me-2 rounded-pill" type="search" aria-label="Search" placeholder="&telrec;                             Buscar integrante">
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
                                    <tbody  id='table-bodyInte'>
                                        <%= userc.modelGetAllWkByInst(inst_id, 1, 0)%>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-1"></div> 
                        </div>
                    </div>
                </div>
                <div id="proyectos_content" class="content hidden">
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="row mb-3 mt-3">
                                <div class="col-3">
                                    <button type="submit" class="btn rounded-pill custom-admin me-3" data-bs-toggle="modal" data-bs-target="#modalProyectoNew"><i class="bi bi-plus-lg me-2"></i>Crear proyecto</button>
                                </div>
                                <div class="col-6"><div class="input-group"> 
                                        <input id="searchInputProyecto" class="form-control ms-3 rounded-pill" type="search" aria-label="Search" placeholder="&telrec;                                 Buscar proyecto">
                                    </div>

                                    <div class="col-3"></div>
                                </div>
                                <table class="table mt-3" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="text-start"><text class="ms-5">Nombre</text></th>
                                            <th scope="col" ></th>
                                        </tr>
                                    </thead>
                                    <tbody  id="table-bodyProyecto">
                                        <%= projc.modelGetAllProjectsByInst(inst_id, 0)%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </div>             
                <div id="equipos_content" class="content hidden">
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="row mb-3 mt-3">
                                <div class="col-3">
                                    <button type="submit" class="btn rounded-pill custom-admin me-3" data-bs-toggle="modal" data-bs-target="#modalEquipoNew"><i class="bi bi-plus-lg me-2"></i>Crear equipo</button>
                                </div>
                                <div class="col-6"><div class="input-group"> 
                                        <input id="searchInputEquipo" class="form-control ms-3 rounded-pill" type="search" aria-label="Search" placeholder="&telrec;                                 Buscar equipo">
                                    </div>

                                    <div class="col-3"></div>
                                </div>
                                <table class="table mt-3" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="text-start"><text class="ms-5">Nombre</text></th>
                                            <th scope="col" ></th>
                                        </tr>
                                    </thead>
                                    <tbody  id='table-bodyEquipo'>
                                        <%=teamc.modelGetAllTeamsByInst(inst_id, 0)%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </div>             
                <div id="gestion_content" class="content hidden">
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col-10">
                            <div class="row mb-3 mt-3">
                                <div class="col-3">
                                    <button type="submit" class="btn rounded-pill custom-admin me-3" data-bs-toggle="modal" data-bs-target="#modalAsignarProj"><i class="bi bi-plus-lg me-2"></i>Asignar proyecto</button>
                                </div>
                                <div class="col-6 text-end mt-1" >
                                    <span>Filtrar por equipo:</span>
                                </div>
                                <div class="col-3 text-start" >
                                    <select onchange="redireccionar(this)" class="form-select form-control" style="border-color: #AFB2B3" aria-label="Default select example">
                                        <option selected>Selecciona uno</option>
                                        <%= teamc.modelGetAllTeamsByInstRed(inst_id)%>
                                    </select>
                                </div>
                            </div>
                            <table class="table mt-3" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th scope="col" class="text-start"><text class="ms-5">Nombre</text></th>
                                        <th scope="col" ></th>
                                    </tr>
                                </thead>
                                <tbody  id="table-bodyProyecto">
                                    <%= projc.modelGetAllProjectsByInst(inst_id, 0)%>
                                </tbody>
                            </table>
                            <h3>Proyectos</h3>
                            <table border="2" style="text-align: center">
                                <thead>
                                    <tr>
                                        <th>proj_name</th>
                                        <th>proj_color</th>
                                        <th>collab_status</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%= projc.modelGetAllProjectsByTeamRed(team_id)%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
            </div>             
        </div>
        <!-- Modal Asignar proyecto-->
        <div class="modal fade" tabindex="-1" role="dialog" id="modalAsignarProj">

            <div class="modal-dialog modal-dialog-centered text-center modal-custom" role="document">

                <div class="modal-content rounded-4 shadow">

                    <div class="modal-header p-5 pb-4 border-bottom-0">
                        <h2 class="mb-0 fs-2">Asignar proyecto</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-5 pt-2">
                        <form action="../collabnew" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
                            <div class="row">
                                <div class="col-12 text-start ms-5">
                                    <label for="exampleInputEmail1" class="form-label">Equipo</label>
                                    <select class="form-select form-control-lg" style="border-color: #AFB2B3" name="team_name" id="team_name" required>
                                        <option selected>Selecciona uno</option>
                                        <%= teamc.modelGetListTeamsByInst(inst_id)%>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 text-start ms-5 mt-3 mb-2">
                                    <label for="" class="form-label">Proyecto</label>
                                    <select class="form-select form-control-lg" style="border-color: #AFB2B3" name="proj_name" id="proj_name" required>
                                        <option selected>Selecciona uno</option>
                                        <%= projc.modelGetListProjectsByInst(inst_id)%>
                                    </select>
                                </div>
                            </div>
                            <div class="text-start mt-3 ms-5">
                                <button type="submit" class="fw-bold mb-2 btn btn-lg rounded-pill custom-admin"><text class="ms-3 me-3 mt-2 mb-2">Asignar</text></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div> 
        </div>

        <jsp:include page="../XM-Resources/pages/elements/modals_admin.jspf"/>
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

    </body>
    <script>
        window.addEventListener('resize', function () {
            // Obtener la posición vertical de ideas_content
            var personalPosition = document.getElementById('personal_content').getBoundingClientRect().top;

            // Aplicar la misma posición a los contenedores de notas y lienzo
            document.getElementById('proyectos_content').style.top = personalPosition + 'px';
            document.getElementById('equipos_content').style.top = personalPosition + 'px';
            document.getElementById('gestion_content').style.top = personalPosition + 'px';
        });

        document.getElementById('searchInputLider').addEventListener('input', function () {
            var input, filter, table, tbody, tr, td, i, txtValue;
            input = document.getElementById("searchInputLider");
            filter = input.value.toLowerCase(); // Convertir a minúsculas
            table = document.querySelector(".table");
            tbody = document.getElementById("table-bodyProj");
            tr = tbody.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // Considera la primera celda para el nombre
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    txtValue = txtValue.toLowerCase(); // Convertir a minúsculas
                    if (txtValue.indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        });

        document.getElementById('searchInputInte').addEventListener('input', function () {
            var input, filter, table, tbody, tr, td, i, txtValue;
            input = document.getElementById("searchInputInte");
            filter = input.value.toLowerCase(); // Convertir a minúsculas
            table = document.querySelector(".table");
            tbody = document.getElementById("table-bodyInte");
            tr = tbody.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // Considera la primera celda para el nombre
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    txtValue = txtValue.toLowerCase(); // Convertir a minúsculas
                    if (txtValue.indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        });

        document.getElementById('searchInputEquipo').addEventListener('input', function () {
            var input, filter, table, tbody, tr, td, i, txtValue;
            input = document.getElementById("searchInputEquipo");
            filter = input.value.toLowerCase(); // Convertir a minúsculas
            table = document.querySelector(".table");
            tbody = document.getElementById("table-bodyEquipo");
            tr = tbody.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0]; // Considera la primera celda para el nombre
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    txtValue = txtValue.toLowerCase(); // Convertir a minúsculas
                    if (txtValue.indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        });

        document.getElementById('searchInputProyecto').addEventListener('input', function () {
            var input, filter, table, tbody, tr, td, i, txtValue;
            input = document.getElementById("searchInputProyecto");
            filter = input.value.toLowerCase(); // Convertir a minúsculas
            table = document.querySelector(".table");
            tbody = document.getElementById("table-bodyProyecto");
            tr = tbody.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0]; // Considera la primera celda para el nombre
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    txtValue = txtValue.toLowerCase(); // Convertir a minúsculas
                    if (txtValue.indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        });
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const labels = document.querySelectorAll('.btnnav');

            function activateLabel(label) {
                labels.forEach(lbl => {
                    lbl.previousElementSibling.checked = false;
                });
                label.previousElementSibling.checked = true;
                localStorage.setItem('activeLabelId', label.id);
                const labelText = label.textContent.trim();
                localStorage.setItem('activeLabelText', labelText);
                document.getElementById('contentName').textContent = labelText;
            }

            labels.forEach(label => {
                label.addEventListener('click', function () {
                    activateLabel(this);
                });
            });

            // Al cargar la página, restaurar el label que estaba marcado como checked previamente
            const activeLabelId = localStorage.getItem('activeLabelId');
            if (activeLabelId) {
                const activeLabel = document.getElementById(activeLabelId);
                if (activeLabel) {
                    activateLabel(activeLabel);
                }
            }

            const backButton = document.getElementById('backLink');
            backButton.addEventListener('click', function () {
                localStorage.removeItem('activeLabelId');
                localStorage.removeItem('activeLabelText');
            });

            function showContent(contentId) {
                var contents = document.querySelectorAll('.content');
                contents.forEach(function (content) {
                    if (content.id === contentId) {
                        content.classList.remove('hidden');
                    } else {
                        content.classList.add('hidden');
                    }
                });
                localStorage.setItem('activeContentId', contentId);
            }

            window.addEventListener('load', function () {
                var activeContentId = localStorage.getItem('activeContentId');
                if (!activeContentId) {
                    // Si no hay contenido activo guardado, mostrar el contenido predeterminado 'personal_content'
                    showContent('personal_content');
                } else {
                    // Si hay contenido activo guardado, mostrar ese contenido
                    showContent(activeContentId);
                }
            });


            document.getElementById('get_Personal').addEventListener('click', function () {
                showContent('personal_content');
            });
            document.getElementById('get_Proyectos').addEventListener('click', function () {
                showContent('proyectos_content');
            });
            document.getElementById('get_Equipos').addEventListener('click', function () {
                showContent('equipos_content');
            });
            document.getElementById('get_Gestionar').addEventListener('click', function () {
                showContent('gestion_content');
            });
        });

        document.getElementById('backLink').addEventListener('click', function () {
            localStorage.removeItem('activeContentId');
            localStorage.removeItem('activeLabelText');
        });
    </script>


</html>
