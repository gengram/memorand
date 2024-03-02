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

    </head>

    <%-- BODY --%>
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_staff.jspf"/>

        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10 mt-4">
                    <h1>Memorand</h1>
                    <h3>Gestor de Administradores</h3>
                    <div class="row mt-3">
                        <div class="col-3">
                            <a href="administradores/nuevo.jsp" style="text-decoration: none; ">
                                <div class="card border-primary border-3 mb-3 shadow-sm" style="width: auto; border: 1px solid #25ce7b">
                                    <div class="row">
                                        <div class="card-body text-center">
                                            <div class="row ">
                                                <i class="bi bi-plus-lg" style="color: #25ce7b; font-size: 2em;"></i>
                                            </div>
                                            <div class="row">
                                                <h6 class="card-title mt-3">Nuevo administrador</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-3">
                            <a href="administradores/hojadecalc.jsp" style="text-decoration: none; ">
                                <div class="card border-primary border-3 mb-3 shadow-sm" style="width: auto; border: 1px solid #25ce7b">
                                    <div class="row">
                                        <div class="card-body text-center">
                                            <div class="row ">
                                                <i class="bi bi-upload" style="color: #25ce7b; font-size: 2em;"></i>
                                            </div>
                                            <h6 class="card-title mt-3">Subir archivo</h6>
                                            <div class="row">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-3">
                            <a href="?view=all" style="text-decoration: none; ">
                                <div class="card border-primary border-3 mb-3 shadow-sm" style="width: auto; border: 1px solid #25ce7b">
                                    <div class="row">
                                        <div class="card-body text-center">
                                            <div class="row ">
                                                <i class="bi bi-view-list" style="color: #25ce7b; font-size: 2em;"></i>
                                            </div>
                                            <div class="row">
                                                <h6 class="card-title mt-3">Lista Completa</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-3">
                            <a href="?view=inst" style="text-decoration: none; ">
                                <div class="card border-primary border-3 mb-3 shadow-sm" style="width: auto; border: 1px solid #25ce7b">
                                    <div class="row">
                                        <div class="card-body text-center">
                                            <div class="row ">
                                                <svg class="my-0" width="54" height="54" viewBox="0 0 24 24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><path d="M23.3 7.5C22.5 7 12.8.2 12.8.2c-.4-.3-1.2-.3-1.6 0C11.2.2 1.4 7 .7 7.5s-.7 1-.7 1V9c0 .5.4 1 .9 1H2v12H1c-.6 0-1 .5-1 1v1h24v-1c0-.6-.5-1-1-1h-1V10h1c.5 0 1-.4 1-1v-.5s.1-.4-.7-1zM12 2l8.9 6H3.1L12 2zM3 22V10h2v12H3zm3 0V10h4v12H6zm5 0V10h2v12h-2zm3 0V10h4v12h-4zm7 0h-2V10h2v12z" fill="#25ce7b" class="fill-000000"></path></svg>
                                            </div>
                                            <div class="row">
                                                <h6 class="card-title mt-3">Por instituciones</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <%
                        if (view_atr != null) {
                            switch (view_atr) {
                                case "all":
                    %>

                    <h3 class="mt-3">Lista completa</h3>

                    <table class="mt-3 table" border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>user_id</th>
                                <th>user_email</th>
                                <th>user_pass</th>
                                <th>user_type</th>
                                <th>user_name</th>
                                <th>user_pat</th>
                                <th>user_mat</th>
                                <th>user_status</th>
                                <th>user_profile</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <%=userc.modelGetAllAdmin()%>
                        </tbody>
                    </table>
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
                    <h3>Lista Instituciones</h3>

                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>inst_profile</th>
                                <th>inst_name</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%=instc.modelGetLimInst()%>
                        </tbody>
                    </table>

                </div>
                <div class="col">
                    <h3>Lista Administradores</h3>

                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>admin_profile</th>
                                <th>admin_pat</th>
                                <th>admin_mat</th>
                                <th>admin_name</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%=userc.modelGetAllAdminByInst(inst_id, 1, 0)%>
                        </tbody>
                    </table>

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
