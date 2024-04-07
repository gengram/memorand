<!-- Memorand by Gengram © 2023 -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // REDIRECCIONAR SI YA INICIÓ SESIÓN
    String user_type = (String) session.getAttribute("user_type");

    if (user_type != null || "".equals(user_type))
    {
        switch (user_type) {
            case "staff":
                response.sendRedirect("staff/home.jsp");
                break;
            case "admin":
                response.sendRedirect("admin/home.jsp");
                break;
            default:
                response.sendRedirect("work/home.jsp");
                break;
        }
    }
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Inicio</title>

        <link rel="stylesheet" href="XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="XM-Resources/vector/memorand-bee.svg">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap">

    </head>
    <style>
        /* Estilos CSS */
        .titulo {
            display: inline-block; /* Hace que los elementos estén en línea */
            vertical-align: top; /* Alinea verticalmente */
            margin-right: 10px; /* Espacio entre los elementos */
            font-family: 'Pacifico', cursive;
            color: #25ce7b;
        }

        .subtitulo {
            display: inline-block; /* Hace que los elementos estén en línea */
            vertical-align: top; /* Alinea verticalmente */
            margin-top: 2px; /* Margen superior */
            margin-bottom: 4px; /* Margen inferior */
        }
    </style>

    <!-- BODY -->
    <body>

        <jsp:include page="XM-Resources/pages/elements/shortbar.jspf"/>
        <jsp:include page="XM-Resources/pages/elements/login.jspf"/>
        

        <div class="container">
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-10 text-center" >
                    <h1 class="titulo" style="font-family: 'Pacifico', cursive; color: #25ce7b; font-size: 55px;"> Organízate</h1> 
                    <h1 class="mt-3 ms-2 subtitulo" style="font-size: 40px;">en equipo sin complicaciones</h1>
                </div>
                <div class="col-1"></div>
            </div>

            <div class="row mt-3">
                <div class="col-lg-1"></div>
                <div class="col-lg-6">
                    <img class="img-fluid" src="XM-Resources/imagen/8614928.jpg" alt="Imagen" style="max-width: 450px;">
                </div>
                <div class="col-lg-4" >
                    <br><br><br><br>
                    <h4 class="mt-lg-5 ms-2" style="color: #2A2927;">Memorand es una aplicación de gestión para empresas y toma de apuntes colaborativos que ayuda a la comunicación en equipos de trabajo.</h4>
                </div>
                <div class="col-lg-1"></div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-1"></div>
                <div class="col-lg-4">
                    <br><br><br><br>
                    <h4 class="mt-lg-5 ms-2" style="color: #2A2927;">Está diseñada para mejorar la coordinación y la productividad a través de un sistema accesible y multiplataforma de manera grupal.</h4>
                </div>
                <div class="col-lg-6 text-sm-end">
                    <img class="img-fluid" src="XM-Resources/imagen/Collab-amico.png" alt="Imagen" style="max-width: 450px;">
                </div>
                <div class="col-lg-1"></div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-1"></div>
                <div class="col-lg-6">
                    <img class="img-fluid" src="XM-Resources/imagen/Time management-amico.png" alt="Imagen" style="max-width: 450px;">
                </div>
                <div class="col-lg-4 text">
                    <br><br><br><br>
                    <h4 class="mt-lg-5 ms-2" style="color: #2A2927;">La aplicación también cuenta con funcionalidades de apuntes dinámicos, un lienzo de dibujo, ideas rápidas y compartimiento instantáneo.</h4>
                </div>
                <div class="col-lg-1"></div>
            </div>
            
        <jsp:include page="XM-Resources/pages/elements/footer.jspf"/>
        
        </div>

    </body>
    
</html>
