<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String staff_type = (String) session.getAttribute("user_type");

    if (staff_type == null || !staff_type.equals("staff")) {
        response.sendRedirect("../index.jsp?error=100");
        session.invalidate();
    }

    InstitutionsController instc = new InstitutionsController();
%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Gestor de Instituciones</title>

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
                    <h2 style="color: #404040">Gestor de Instituciones</h2>

                    <div class="mt-4"><a href="instituciones/nuevo.jsp">
                            <button class="button custom-blog rounded-4"><h6><i class="bi bi-plus-circle-fill mt-4"></i> Nueva institución</h6></button>
                        </a>
                    </div>

                    <h3 class="mt-5 text-center">Lista</h3>

                    <table class="table" border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th scope="col">inst_id</th>
                                <th scope="col">inst_name</th>
                                <th scope="col">inst_type</th>
                                <th scope="col">inst_profile</th>
                                <th scope="col">lim_ch</th>
                                <th scope="col">lim_wk</th>
                                <th scope="col">lim_gp</th>
                                <th scope="col">lim_ks</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <%=instc.modelGetAllInst()%>
                        </tbody>
                    </table>

                </div>
                <div class="col-1"></div>
            </div>
        </div>

    </body>

</html>
