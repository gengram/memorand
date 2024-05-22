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
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-staff_1.svg">

        <title>Memorand Staff | Nueva instituci&oacute;n</title>

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
                    <h1>Nueva instituci&oacute;n</h1>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #7473C0; font-size: 18px;"><a id="backLink" href='home.jsp' style="color: #7473C0;"><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <form action="../instnew" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
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
                    <div class="col-4 mt-3">

                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-1"></div>
                    <div class="col-5">
                        <label for="exampleInputEmail1" class="form-label">Nombre de la instituci&oacute;n</label>
                        <input type="text" class="form-control" name="inst_name" id="inst_name" placeholder="Instituci&oacute;n" required>
                    </div>
                    <div class="col-5">
                        <label for="exampleInputEmail1" class="form-label">Tipo</label>
                        <select name="inst_type" id="inst_type" class="form-select" style="border-color: #AFB2B3; padding-bottom: 12px">
                            <option value="" disabled selected hidden>Tipo</option>
                            <option value="Empresa">Empresa</option>
                            <option value="Escuela" disabled>Escuela</option>
                        </select>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-1"></div>
                    <div class="col-10">
                        <div class="row">
                            <div class="col-3">
                                <label for="exampleInputEmail1" class="form-label">L&iacute;deres</label>
                                <input class="form-control" name="lim_ch" id="lim_ch" type="text" placeholder="100" required>
                            </div>
                            <div class="col-3">
                                <label for="exampleInputEmail1" class="form-label">Integrantes</label>
                                <input class="form-control" name="lim_wk" id="lim_wk" type="text" placeholder="100" required>
                            </div>
                            <div class="col-3">
                                <label for="exampleInputEmail1" class="form-label">Grupos</label>
                                <input class="form-control" name="lim_gp" id="lim_gp" type="text" placeholder="100" required>
                            </div>
                            <div class="col-3">
                                <label for="exampleInputEmail1" class="form-label">Proyectos</label>
                                <input class="form-control" name="lim_ks" id="lim_ks" type="text" placeholder="100" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>

                <div class="row mt-4">
                    <div class="col-1"></div>
                    <div class="col-10 text-start">
                        <button type="submit" class="btn custom-admin rounded-pill mt-2"><i class="bi bi-plus me-2" style="font-size: 20px"></i>Agregar instituci&oacute;n</button>
                    </div>
                    <div class="col-1"></div>
                </div>
            </form>
        </div> 

    </body>

</html>