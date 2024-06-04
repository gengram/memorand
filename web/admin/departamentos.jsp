<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.TeamsController"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String user_type = (String) session.getAttribute("user_type");
    String staff_name = (String) session.getAttribute("user_name");

    String inst_id = (String) session.getAttribute("inst_id");
    String inst_type = (String) session.getAttribute("inst_type");
    String inst_name = (String) session.getAttribute("inst_name");

    //if (user_type == null || !user_type.equals("admin"))
    //{
    //    response.sendRedirect("../index.jsp?error=100");
    //    session.invalidate();
    //}
    TeamsController teamc = new TeamsController();
%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Gestor de Departamentos</title>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

    </head>

    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_admin.jspf"/>

        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10 mt-3">
                    <h3>Gestor de Departamentos</h3>

                    <a class="" href="departamentos/nuevo.jsp">
                        <button class="button custom-bsign rounded-3 mt-3"><h6 class="mt-1"><i class="bi bi-plus " style="font-size: 1.5rem;"></i> Departamento nuevo</h6></button>
                    </a>
                    <h3 class="mt-3" style="color: #CEC7C7">Lista</h3>

                    <div class="card mt-3 shadow rounded-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped-columns" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="color: #000">Nombre</th>
                                            <th scope="col" style="color: #000">Color</th>
                                            <th scope="col" style="color: #000"></th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <%=teamc.adminGetTeamsByInstitution(inst_id)%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
        </div>




    </body>

</html>
