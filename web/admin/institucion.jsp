<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page import="com.memorand.controller.UsersController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    InstitutionsController instc = new InstitutionsController();
    
    String inst_id = (String) session.getAttribute("inst_id");
    String inst_name = (String) session.getAttribute("inst_name");
    String inst_type = (String) session.getAttribute("inst_type");
    String inst_profile = (String) session.getAttribute("inst_profile");
    String inst_status = (String) session.getAttribute("inst_status");
    String lim_ch = (String) session.getAttribute("lim_ch");
    String lim_wk = (String) session.getAttribute("lim_wk");
    String lim_gp = (String) session.getAttribute("lim_gp");
    String lim_ks = (String) session.getAttribute("lim_ks");
    
    String count_ch = instc.modelGetResourceCount(inst_id, "ch");
    String count_wk = instc.modelGetResourceCount(inst_id, "wk");
    String count_gp = instc.modelGetResourceCount(inst_id, "gp");
    String count_ks = instc.modelGetResourceCount(inst_id, "ks");
%>

<!DOCTYPE html>

<html>
    
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | <%= inst_name %></title>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

    </head>
    
    <style>
        .btn-red {
            border-color: red;
            color: red;
            background-color: transparent;
        }
        .btn-red:hover {
            border-color: red;
            color: #fff;
            background-color: red;
        }

        .btn-gray {
            border-color: #E3E4E5;
            color: #000;
            background-color: #E3E4E5;
        }
        .btn-gray:hover {
            border-color: #E3E4E5;
            color: #000;
            background-color: transparent;
        }

        .custom-admin{
            display: inline-block;
            padding: 4px 12px;
            border: 2px solid #25ce7b; /* Color del contorno */
            color: #fff; /* Color del texto */
            text-align: center;
            text-decoration: none;
            font-size: 17px;
            cursor: pointer;
            border-radius: 4px;
            background-color: #25ce7b; /* Fondo transparente */
        }
        .custom-admin:hover {
            background-color: #fff; /* Cambiar el color de fondo al pasar el ratón */
            border: 2px solid #25ce7b; /* Color del contorno */
            color: #25ce7b; /* Cambiar el color del texto al pasar el ratón */
        }

        .modal-custom {
            max-width: 510px;
        }

    </style>
    
    <body>
        <jsp:include page="../XM-Resources/pages/elements/navbar_admin.jspf"/>
        
        <div class="container">
            <div class="row mt-5">
                <div class="col-2"></div>
                
                <div class="col-7">
                    <h1> Mi instituci&oacute;n</h1>
                </div>
                
                <div class="col-3 mt-3">
                    <p style="color: #25ce7b; font-size: 18px;"><a id="backLink" href='home.jsp'><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-2"></div>
                
                <div class="col-2 mt-4">
                    <img class="rounded-1" src="../<%= inst_profile%>" width="150" height="150" alt="inst_profile"/>
                </div>
                
                <div class="col-4">
                    <div>
                        
                        <p><text style="color: #AFB2B3">Nombre: </texto><texto style="color: #2A2927"><%= inst_name%></texto></p>
                        <p><text  style="color: #AFB2B3">Tipo: </text><text style="color: #2A2927"><%= inst_type%></text></p>
                        <p><text  style="color: #AFB2B3">L&iacute;deres: </text><text style="color: #2A2927"><%= count_ch%></text><text style="color: #AFB2B3">/<%= lim_ch%></text></p>
                        <p><text  style="color: #AFB2B3">Integrantes: </text><text style="color: #2A2927"><%= count_wk%></text><text style="color: #AFB2B3">/<%= lim_wk%></text></p>
                        <p><text  style="color: #AFB2B3">Equipos: </text><text style="color: #2A2927"><%= count_gp%></text><text style="color: #AFB2B3">/<%= lim_gp%></text></p>
                        <p><text  style="color: #AFB2B3">Proyectos: </text><text style="color: #2A2927"><%= count_ks%></text><text style="color: #AFB2B3">/<%= lim_ks%></text></p>
                    
                    </div>
                </div>
                        
                <div class="col-2"></div>
            </div>
                   
<%
        double per_ch = Double.parseDouble(count_ch) / Double.parseDouble(lim_ch);
        double per_wk = Double.parseDouble(count_wk) / Double.parseDouble(lim_wk);
        double per_gp = Double.parseDouble(count_gp) / Double.parseDouble(lim_gp);
        double per_ks = Double.parseDouble(count_ks) / Double.parseDouble(lim_ks);
        
        if (per_ch >= 0.8 || per_wk >= 0.8 || per_gp >= 0.8 || per_ks >= 0.8)
        {
%>
            <div class="row mt-5">
                <div class="col-2"></div>

                <div class="col-7">
                    <h1> Avisos</h1>
                    <p class="mt-4">¡Tu institución está cerca del límite!</p>
                    <p>Elimina algunos elementos o habla con tu institución para aumentar la cantidad de recursos disponibles.</p>
                </div>
            </div>
<%
        }
%>
        </div>
    </body>
</html>