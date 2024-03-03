<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String staff_type = (String) session.getAttribute("user_type");
    String staff_name = (String) session.getAttribute("user_name");

    if (staff_type == null || !staff_type.equals("staff"))
    {
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
        

        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10 mt-5">
                    <h1>Home - Staff</h1>

                    <h3 class="mt-3">Hola <%= staff_name%></h3>
                    <div class="row mt-4">
                        <div class="col-5">
                            <!--Card-->
                            <a href="administradores.jsp" style="text-decoration: none; ">
                                <div class="card border-primary border-3 mb-3 shadow-sm" style="width: auto; border: 1px solid #25ce7b">
                                    <div class="row g-0">
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <h3 class="card-title mt-4 ms-4">Administradores</h3>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <svg class="my-4" width="74" height="74" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><g fill="#25ce7b" class="fill-241f20"><path d="M23.999 22.863c-10.014 0-18.131 8.119-18.131 18.133v6.973h36.264V40.997c0-10.015-8.119-18.134-18.133-18.134zM14.479 15.936l1.859-.656a8.867 8.867 0 0 0 1.916 2.236l-.898 1.877 4.033 1.928.896-1.877c.963.189 1.933.22 2.88.095l.682 1.934 3.371-1.191-.674-1.904a8.85 8.85 0 0 0 2.298-1.957l1.875.897 1.923-4.02-1.877-.898a8.885 8.885 0 0 0 .09-2.951l1.858-.655-1.19-3.371-1.859.655a8.875 8.875 0 0 0-1.907-2.229l.898-1.879L26.602.032l-.898 1.881a8.892 8.892 0 0 0-2.997-.079l-.63-1.785-3.373 1.191.641 1.815a8.824 8.824 0 0 0-2.176 1.872l-1.879-.898-1.935 4.046 1.88.898a8.845 8.845 0 0 0-.086 2.936l-1.859.655 1.189 3.372zM24 7.562a3 3 0 1 1 0 6 3 3 0 0 1 0-6z"></path></g></svg>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-5">
                            <!--Card-->
                            <a href="instituciones.jsp" style="text-decoration: none;">
                                <div class="card border-primary border-3 mb-3 shadow-sm" style="width: auto; border: 1px solid #25ce7b">
                                    <div class="row g-0">
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <h3 class="card-title mt-4 ms-4">Instituciones</h3>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <svg class="my-4" width="74" height="74" viewBox="0 0 24 24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><path d="M23.3 7.5C22.5 7 12.8.2 12.8.2c-.4-.3-1.2-.3-1.6 0C11.2.2 1.4 7 .7 7.5s-.7 1-.7 1V9c0 .5.4 1 .9 1H2v12H1c-.6 0-1 .5-1 1v1h24v-1c0-.6-.5-1-1-1h-1V10h1c.5 0 1-.4 1-1v-.5s.1-.4-.7-1zM12 2l8.9 6H3.1L12 2zM3 22V10h2v12H3zm3 0V10h4v12H6zm5 0V10h2v12h-2zm3 0V10h4v12h-4zm7 0h-2V10h2v12z" fill="#25ce7b" class="fill-000000"></path></svg>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>

    </body>
    
</html>
