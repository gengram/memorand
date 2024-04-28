<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    //String staff_type = (String) session.getAttribute("user_type");

    //if (staff_type == null || !staff_type.equals("staff"))
    //{
    //    response.sendRedirect("../index.jsp?error=100");
    //    session.invalidate();
    //}
    //InstitutionsController instc = new InstitutionsController();
%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Nuevo líder</title>

        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">

    </head>

    <style>
        .selected-image {
            border-color: green; /* Cambia el color del borde cuando se selecciona una imagen */
        }
    </style>

    <%-- BODY --%>
    <body>

        <jsp:include page="../../XM-Resources/pages/elements/navbar_admin_sub.jspf"/>

        <div class="container">
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-9">
                    <h1>Agregar personal</h1>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #25ce7b; font-size: 18px;"><a id="backLink" href='../home.jsp'><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <form action="../../usernew?user_type=ch" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                <div class="row mt-4">
                    <div class="col-1"></div>
                    <div class="col-2" >

                        <div class="btn card border" id="image-card" style="width: 180px; height: 180px; background-color: #F8F9FA; border-color: #AFB2B3;">
                            <div class="card-body text-center">
                                <label for="inst_profile">
                                    <p class="mt-3 mb-4"><i class="bi bi-plus-lg" style="color: #2A2927; font-size: 60px"></i></p>
                                </label>
                            </div>
                        </div>
                                <input type="file" name="inst_profile" id="inst_profile" required>
                        
                    </div>
                    <div class="col-6">

                    </div>
                    <div class="col-2">

                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">

                </div>
                <div class="col-1"></div>
            </div>
        </div>
        <h3>Nuevo líder</h3>


        <input type="email" name="user_email" id="user_email" placeholder="Correo usuario" required>
        <br>
        <input type="password" name="user_pass" id="user_pass" placeholder="Contraseña usuario" required>
        <br>
        <input type="text" name="user_name" id="user_name" placeholder="Nombre usuario" required>
        <br>
        <input type="text" name="user_pat "id="user_pat" placeholder="Apellido paterno" required>
        <br>
        <input type="text" name="user_mat" id="user_mat" placeholder="Apellido materno" required>
        <br>
        <input type="file" name="inst_profile" id="inst_profile" required>
        <br>
        <input type="submit" value="Nuevo líder">

    </body>



</html>
