<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.beans.User"%>
<%@page import="com.memorand.controller.UsersController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    String staff_type = (String) session.getAttribute("user_type");

    if (staff_type == null || !staff_type.equals("staff")) {
        response.sendRedirect("../index.jsp?error=100");
        session.invalidate();
    }

    User user = new User();
    UsersController userc = new UsersController();

    Institution inst = new Institution();
    InstitutionsController instc = new InstitutionsController();

    String user_id = request.getParameter("user_id");

    String user_email = null;
    String user_pass = null;
    String user_type = null;
    String user_name = null;
    String user_pat = null;
    String user_mat = null;
    String user_status = null;
    String user_profile = null;

    String inst_id = null;
    String inst_name = null;
    String inst_type = null;
    String inst_profile = null;

    if (user_id != null) {
        user = userc.modelGetUserInfoById(user_id);

        user_email = user.getUser_email();
        user_pass = user.getUser_pass();
        user_type = user.getUser_type();
        user_name = user.getUser_name();
        user_pat = user.getUser_pat();
        user_mat = user.getUser_mat();
        user_status = user.getUser_status();
        user_profile = user.getUser_profile();

        user_type = userc.modelConvUserType(user_type);
        user_status = userc.modelConvUserStatus(user_status);

        inst = instc.modelGetInstByUser(user_id);

        inst_id = inst.getInst_id();
        inst_name = inst.getInst_name();
        inst_type = inst.getInst_type();
        inst_profile = inst.getInst_profile();
    } else {
        response.sendRedirect("../administradores.jsp");
    }

%>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>

        <title><%= user_pat%> <%= user_mat%> <%= user_name%></title>

        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">

    </head>

    <body>

        <jsp:include page="../../XM-Resources/pages/elements/navbar_staff_1.jspf"/>

        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">

                    <h3 class="mt-3" style="color: #404040"><%= user_pat%> <%= user_mat%> <%= user_name%></h3>

                    <div class="mt-4 ms-3"><a href="editar.jsp?user_id=<%= user_id%>">
                            <button class="button custom-bsign rounded-4"><h6><i class="bi bi-pen mt-4"></i> Editar</h6></button>
                        </a>
                    </div>

                    <div class="row mt-4">
                        <div class="col-4">
                            <h5>Foto</h5>
                            <img src="../../<%=user_profile%>" width="100" alt="inst_profile"/>
                        </div>
                        <div class="col-4">
                            <h5>Email</h5>
                            <p><%=user_email%></p>
                        </div>
                        <div class="col-4">
                            <h5>Tipo</h5>
                            <p><%=user_type%></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">  
                            <h5>Nombre</h5>
                            <p><%=user_name%></p>
                        </div>
                        <div class="col-4">
                            <h5>Paterno</h5>
                            <p><%=user_pat%></p>
                        </div>
                        <div class="col-4">
                            <h5>Materno</h5>
                            <p><%=user_mat%></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">  
                            <h5>Estatus</h5>
                            <p><%=user_status%></p>
                        </div>
                        <div class="col-4">
                        </div>
                        <div class="col-4">
                        </div>
                    </div>

                    <h3 class="mt-4" style="color: #404040">Acerca de la institución</h3>
                    <table class="mt-3 table table-bordered border-2" border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>inst_profile</th>
                                <th>inst_name</th>
                                <th>inst_type</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> <img src="../../<%= inst_profile%>" alt="inst_profile" width='40'/> </td>
                                <td><%= inst_name%></td>
                                <td><%= inst_type%></td>
                                <td><a href="../instituciones/ver.jsp?inst_id=<%= inst_id%>">Ver</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

    </body>

</html>
