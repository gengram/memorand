<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    String staff_type = (String) session.getAttribute("user_type");

    if (staff_type == null || !staff_type.equals("staff")) {
        response.sendRedirect("../index.jsp?error=100");
        session.invalidate();
    } else {
        InstitutionsController instc = new InstitutionsController();
        UsersController userc = new UsersController();

        String view_atr = request.getParameter("view");
        String inst_id = request.getParameter("inst_id");
%>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Gestor de Administradores</title>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        <script src="../XM-Resources/scripts/vanishC.js"></script>

    </head>

    <%-- BODY --%>
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_staff.jspf"/>

        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10 mt-4">
                    <h3 style=";">Gestor de Administradores</h3>
                    <div class="row mt-3">
                        <div class="col-3">
                            <a href="administradores/nuevo.jsp" style="text-decoration: none; ">
                                <button  class="btn custom-bsign">
                                    <div class="row">
                                        <div class="col-4">
                                            <i class="bi bi-plus-lg" style="color: #fff; font-size: 2.5em;"></i>

                                        </div>
                                        <div class="col-4">
                                            <h6 class="mt-2" style="font-size: 18px;">Nuevo administrador</h6>
                                        </div>
                                    </div>
                                </button>
                            </a>
                        </div>
                        <div class="col-3">
                            <a href="" style="text-decoration: none; ">
                                <button  class="btn custom-bsign">
                                    <div class="row">
                                        <div class="col-4">
                                            <i class="bi bi-upload" style="color: #fff; font-size: 2.5em;"></i>
                                        </div>
                                        <div class="col-4">
                                            <h6 class="mt-2" style="font-size: 18px;">Subir archivo</h6>
                                        </div>
                                    </div>
                                </button>
                            </a>
                        </div>
                        <div class="col-3">
                            <a href="?view=all" style="text-decoration: none; ">
                                <button  class="btn custom-bsign">
                                    <div class="row">
                                        <div class="col-4">
                                            <i class="bi bi-view-list" style="color: #fff; font-size: 2.5em;"></i>
                                        </div>
                                        <div class="col-4">
                                            <h6 class="mt-2" style="font-size: 18px;">Lista Completa</h6>
                                        </div>
                                    </div>
                                </button>
                            </a>
                        </div>
                        <div class="col-3">
                            <a href="?view=inst" style="text-decoration: none; ">
                                <button  class="btn custom-bsign">
                                    <div class="row">
                                        <div class="col-4">
                                            <svg class="mt-2" width="38" height="38" viewBox="0 0 24 24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><path d="M23.3 7.5C22.5 7 12.8.2 12.8.2c-.4-.3-1.2-.3-1.6 0C11.2.2 1.4 7 .7 7.5s-.7 1-.7 1V9c0 .5.4 1 .9 1H2v12H1c-.6 0-1 .5-1 1v1h24v-1c0-.6-.5-1-1-1h-1V10h1c.5 0 1-.4 1-1v-.5s.1-.4-.7-1zM12 2l8.9 6H3.1L12 2zM3 22V10h2v12H3zm3 0V10h4v12H6zm5 0V10h2v12h-2zm3 0V10h4v12h-4zm7 0h-2V10h2v12z" fill="#ffffff" class="fill-000000"></path></svg>
                                        </div>
                                        <div class="col-4">
                                            <h6 class="mt-2" style="font-size: 18px;">Por instituciones</h6>
                                        </div>
                                    </div>
                                </button>            
                            </a>
                        </div>
                    </div>

                    <%
                        if (view_atr != null) {
                            switch (view_atr) {
                                case "all":
                    %>

                    <h3 class="mt-3" style="color: #CEC7C7">Lista completa</h3>

                    <div class="card mt-3 shadow rounded-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped-columns" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="color: #000">Nombre</th>
                                            <th scope="col" style="color: #000">Paterno</th>
                                            <th scope="col" style="color: #000">Materno</th>
                                            <th scope="col" style="color: #000">Estatus</th>
                                            <th scope="col" style="color: #000"></th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <%=userc.modelGetAllAdmin()%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-1"></div>
            </div>
        </div>      
        <%
                break;
            case "inst":
        %>


        <div class="container">
            <div class="row">
                <div class="col">
                    <h3 class="mt-3" style="color: #CEC7C7">Lista Instituciones</h3>
                    <div class="card mt-3 shadow rounded-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped-columns" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="color: #000">Perfil</th>
                                            <th scope="col" style="color: #000">Nombre</th>
                                            <th scope="col" style="color: #000"></th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <%=instc.modelGetLimInst()%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col">
                    <h3 class="mt-3" style="color: #CEC7C7">Lista Administradores</h3>
                    <div class="card mt-3 shadow rounded-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped-columns" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="color: #000">Perfil</th>
                                            <th scope="col" style="color: #000">Paterno</th>
                                            <th scope="col" style="color: #000">Materno</th>
                                            <th scope="col" style="color: #000">Nombre</th>
                                            <th scope="col" style="color: #000"></th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <%=userc.modelGetAllAdminByInst(inst_id, 1, 0)%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
                                    
        <%
                            break;
                        default:
                            response.sendRedirect("administradores.jsp?view=all");
                            break;
                    }
                } else {
                    response.sendRedirect("administradores.jsp?view=all");
                }
            }
        %>


    </body>

</html>
