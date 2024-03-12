<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String staff_type = (String) session.getAttribute("user_type");

    if (staff_type == null || !staff_type.equals("staff")) {
        response.sendRedirect("../index.jsp?error=100");
        session.invalidate();
    }

    Institution inst = new Institution();
    InstitutionsController instc = new InstitutionsController();
    UsersController userc = new UsersController();

    String inst_id = request.getParameter("inst_id");

    String inst_name = null;
    String inst_type = null;
    String inst_profile = null;
    String lim_ch = null;
    String lim_wk = null;
    String lim_gp = null;
    String lim_ks = null;

    if (inst_id != null) {
        inst = instc.modelGetInstById(inst_id);

        inst_name = inst.getInst_name();
        inst_type = inst.getInst_type();
        inst_profile = inst.getInst_profile();
        lim_ch = inst.getLim_ch();
        lim_wk = inst.getLim_wk();
        lim_gp = inst.getLim_gp();
        lim_ks = inst.getLim_ks();
    } else {
        response.sendRedirect("../instituciones.jsp");
    }

%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>

        <title><%=inst_name%></title>

        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">

    </head>

    <body>

        <jsp:include page="../../XM-Resources/pages/elements/navbar_staff_inst.jspf"/>
        
        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">

                    <h3 class="mt-3" style="color: #404040">
                        <img class="rounded-3 me-2" src="../../<%=inst_profile%>" width="60" alt="inst_profile"/>
                        Gestor de Instituciones - <%=inst_name%></h3>

                    <div class="mt-4"><a href="editar.jsp?inst_id=<%=inst_id%>">
                            <button class="button custom-bsign rounded-3"><h6 class="mt-1"><i class="bi bi-pen mt-4"></i> Editar</h6></button>
                        </a>
                    </div>

                    <div class="row">
                        <div class="col-4">
                            <h5 class="mt-4">Nombre</h5>
                            <p><%=inst_name%></p>
                        </div>
                        <div class="col-4">
                            <h5 class="mt-4">Tipo</h5>
                            <p><%=inst_type%></p>
                        </div>
                        <div class="col-4">
                            <h5 class="mt-4">Límite Líderes</h5>
                            <p><%=lim_ch%></p>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-4">
                            <h5 class="mt-4">Límite Participantes</h5>
                            <p><%=lim_wk%></p>
                        </div>
                        <div class="col-4">
                            <h5 class="mt-4">Límite grupos</h5>
                            <p><%=lim_gp%></p>
                        </div>
                        <div class="col-4">
                            <h5 class="mt-4">Límite clases</h5>
                            <p><%=lim_ks%></p>
                        </div>
                    </div>

                    <h3 class="mt-4" style="color: #CEC7C7;">Lista Administradores</h3>
                    <div class="card mt-3 shadow rounded-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped-columns" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="color: #000">admin_profile</th>
                                            <th scope="col" style="color: #000">admin_pat</th>
                                            <th scope="col" style="color: #000">admin_mat</th>
                                            <th scope="col" style="color: #000">admin_name</th>
                                            <th v>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider">
                                        <%=userc.modelGetAllAdminByInst(inst_id, 2, 1)%>
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
