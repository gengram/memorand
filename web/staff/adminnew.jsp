<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.service.ServicesUtil"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.controller.InstitutionsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // PROTECCIÓN
    String u = (String) session.getAttribute("user_type");
    
    if(session == null || u == null || !u.equals("staff"))
    {
        response.sendRedirect("../index.jsp?error=InvalidSession");
    }
    
    String inst_id = request.getParameter("id");

    if (inst_id != null) {
        InstitutionsController instc = new InstitutionsController();

        Institution inst = instc.modelGetInst(inst_id);

        if (inst == null) {
            response.sendRedirect("home.jsp");
        }
    } else {
        response.sendRedirect("home.jsp");
    }

%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-staff_1.svg">

        <title>Memorand Staff | Agregar administrador</title>

    </head>

    <style>
        .custom-admin{
            display: inline-block;
            padding: 4px 12px;
            border: 2px solid #7473C0; /* Color del contorno */
            color: #fff; /* Color del texto */
            text-align: center;
            text-decoration: none;
            font-size: 17px;
            cursor: pointer;
            border-radius: 4px;
            background-color: #7473C0; /* Fondo transparente */
        }
        .custom-admin:hover {
            background-color: #fff; /* Cambiar el color de fondo al pasar el ratón */
            border: 2px solid #7473C0; /* Color del contorno */
            color: #7473C0; /* Cambiar el color del texto al pasar el ratón */
        }
    </style>

    <!-- BODY -->
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_staff.jspf"/>

        <div class="container">
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-9">
                    <h1>Agregar administrador</h1>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #7473C0; font-size: 18px;"><a id="backLink" href='institucion.jsp?id=<%= inst_id%>' style="color: #7473C0;"><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <form action="../usernew?id=<%= inst_id%>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
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

                    </div>
                    <div class="col-5 mt-3">
                        <label for="exampleInputEmail1" class="form-label">Perfil del administrador</label>
                        <input class="form-control" type="file" name="inst_profile" id="inst_profile" required>
                    </div>
                    <div class="col-4 mt-3"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-1"></div>
                    <div class="col-5">
                        <label for="exampleInputEmail1" class="form-label">Correo electr&oacute;nico</label>
                        <input type="email" class="form-control" name="user_email" id="user_email" placeholder="name@gmail.com" required>
                    </div>
                    <div class="col-5">
                        <label for="exampleInputPassword1" class="form-label">Contrase&ntilde;a</label>
                        <input type="password" name="user_pass" id="user_pass" class="form-control" placeholder="********" required>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-1"></div>
                    <div class="col-4">
                        <label for="exampleInputEmail1" class="form-label">Nombre</label>
                        <input class="form-control" name="user_name" id="user_name"  type="text" placeholder="Nombre" required>
                    </div>
                    <div class="col-3">
                        <label for="exampleInputEmail1" class="form-label">Apellidos</label>
                        <input class="form-control" type="text" name="user_pat "id="user_pat" placeholder="Paterno" required>
                    </div>
                    <div class="col-3 mt-2">
                        <label for="exampleInputEmail1" class="form-label"></label>
                        <input class="form-control" type="text" name="user_mat" id="user_mat" placeholder="Materno" required>
                    </div>
                    <div class="col-1"></div>
                </div>

                <div class="row mt-4">
                    <div class="col-1"></div>
                    <div class="col-10 text-start">
                        <button type="submit" class="btn custom-admin rounded-pill mt-2"><i class="bi bi-plus me-2" style="font-size: 20px"></i>Agregar administrador</button>
                    </div>
                    <div class="col-1"></div>
                </div>
            </form>
        </div>

    </body>

</html>