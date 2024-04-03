<!-- Memorand by Gengram © 2023 -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // REDIRECCIONAR SI YA INICIÓ SESIÓN
    String user_type = (String) session.getAttribute("user_type");

    if (user_type != null || "".equals(user_type))
    {
        switch (user_type)
        {
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

    <%-- HEAD --%>
    <head>

        <jsp:include page="XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Inicio</title>

        <link rel="stylesheet" href="XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="XM-Resources/vector/memorand-bee.svg">

    </head>

    <%-- BODY --%>
    <body>

        <jsp:include page="XM-Resources/pages/elements/shortbar.jspf"/>
        <jsp:include page="XM-Resources/pages/elements/login.jspf"/>

        <div class="container">
            
            <div class="row mt-3">
                <div class="col-lg-7 col-md-12 text-center" style="background-color: transparent">
                    <img class="img-fluid" src="XM-Resources/vector/8614928.jpg" alt="Imagen" style="max-width: 450px;">
                </div>
                <div class="col-lg-5 col-md-12" style="color: #6c757d; background-color: transparent">
                    <h3 class="mt-2 mb-4">Organízate en equipo sin complicaciones</h3>
                    <h5>Memorand es una aplicación de gestión para empresas y toma de apuntes colaborativos que ayuda a la comunicación en equipos de trabajo.</h5>
                    <br>
                    <h5>Está diseñada para mejorar la coordinación y la productividad a través de un sistema accesible y multiplataforma de manera grupal.</h5>
                    <br>
                    <h5 class="mb-5"> La aplicación también cuenta con funcionalidades de apuntes dinámicos, un lienzo de dibujo, ideas rápidas y compartimiento instantáneo.</h5>
                </div>
            </div>
           
        </div>

    </body>

</html>
