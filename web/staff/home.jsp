<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String staff_type = (String) session.getAttribute("user_type");
    String staff_name = (String) session.getAttribute("user_name");

    if (staff_type == null || !staff_type.equals("staff")) {
        response.sendRedirect("../index.jsp?error=100");
        session.invalidate();
    }
%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Home Staff</title>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

    </head>

    <%-- BODY --%>
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_staff.jspf"/>

        <a href='../staff-new/home.jsp'>IR AL NUEVO STAFF</a>
        
        <div class="container">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10 mt-3" >
                    
                    <h1 class="mt-3 ms-3" style="color: #CEC7C7;">Hola <%= staff_name%></h1>
                    <div class="row mt-5">
                        <div class="col-md-1"></div>
                        <div class="col-md-5">
                            <!--Card-->
                            <a href="administradores.jsp" style="text-decoration: none;">
                                <div class="card border-primary border-3 mb-3 shadow-sm text-center" style="border: 1px solid #25ce7b">
                                    <div class="row g-0">
                                        <div class="col-md-12">
                                            <div class="card-body">
                                                
                                                <i class="bi bi-person-fill" style="color: #25ce7b; font-size: 4.5em;"></i>
                                                <h3 class="card-title mt-4 ms-4">Administradores</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-5">
                            <!--Card-->
                            <a href="instituciones.jsp" style="text-decoration: none;">
                                <div class="card border-primary border-3 mb-3 shadow-sm text-center" style="border: 1px solid #25ce7b">
                                    <div class="row g-0">
                                        <div class="col-md-12">
                                            <div class="card-body">
                                                <svg class="my-4" width="62" height="62" viewBox="0 0 24 24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M23.3 7.5C22.5 7 12.8.2 12.8.2c-.4-.3-1.2-.3-1.6 0C11.2.2 1.4 7 .7 7.5s-.7 1-.7 1V9c0 .5.4 1 .9 1H2v12H1c-.6 0-1 .5-1 1v1h24v-1c0-.6-.5-1-1-1h-1V10h1c.5 0 1-.4 1-1v-.5s.1-.4-.7-1zM12 2l8.9 6H3.1L12 2zM3 22V10h2v12H3zm3 0V10h4v12H6zm5 0V10h2v12h-2zm3 0V10h4v12h-4zm7 0h-2V10h2v12z" fill="#25ce7b" class="fill-000000"></path>
                                                </svg>
                                                <h3 class="card-title mt-4 ms-4">Instituciones</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>

    </body>

</html>
