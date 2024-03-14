<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Nuevo administrador</title>

        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">

    </head>

    <%-- BODY --%>
    <body>

        <jsp:include page="../../XM-Resources/pages/elements/navbar_staff_adm.jspf"/>

        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">

                    <h3 class="mt-4 text-center" style="color: #CEC7C7;">Nuevo administrador</h3>

                    <div class="row">
                        <div class="col-3"></div>
                        <div class="col-6">

                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="row mt-3 ms-2 me-2">
                                        <form action="../../usernew" method="post" enctype="multipart/form-data" accept-charset="UTF-8">

                                            <input class="form-control" type="email" name="user_email" id="user_email" placeholder="Correo usuario" required>     

                                            <input class="form-control mt-3" type="password" name="user_pass" id="user_pass" placeholder="Contraseña usuario" required>

                                            <input class="form-control mt-3" type="text" name="user_name" id="user_name" placeholder="Nombre usuario" required>

                                            <input class="form-control mt-3" type="text" name="user_pat "id="user_pat" placeholder="Apellido paterno" required>

                                            <input class="form-control mt-3" type="text" name="user_mat" id="user_mat" placeholder="Apellido materno" required>

                                            <input class="form-control mt-3" type="file" name="inst_profile" id="inst_profile" required>

                                            <select class="form-select mt-3" name="inst_name" id="inst_name">
                                                <option value="" disabled selected hidden>Institución</option>
                                                <%=instc.modelGetOptionInst()%>
                                            </select>
                                            <div class="text-center">     
                                                <input class="btn custom-bsign mt-3 mb-3 " type="submit" value="Nuevo administrador">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-3"></div>
                    </div>        

                    <div class="col-1"></div>
                </div>
            </div>


    </body>

</html>
