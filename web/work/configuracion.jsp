<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    // PROTECCIÓN
    String u = (String) session.getAttribute("user_type");
    
    if(session == null || u == null)
    {
        response.sendRedirect("../index.jsp?error=InvalidSession");
    }
%>

<html>
    
    <head>
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        <title>Memorand | Configuraci&oacute;n</title>
    </head>
    
    <body>
        
        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>
        
        <div class="container">
            <div class="row mt-5">
                <div class="col-2"></div>
                <div class="col-7">
                    <h1>Configuraci&oacute;n</h1>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #00ce7c; font-size: 18px;"><a id="backLink" href='home.jsp' style="color: #00ce7c;"><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-2"></div>
                <div class="col-8">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="align-middle">
                                    <div class="row mt-2 mb-2">
                                        <div class="col-12">
                                            <a href='perfil.jsp'><p class="mt-2" style="color: #4A4F54;">Mi perfil</p></a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="align-middle">
                                    <div class="row mt-2 mb-2">
                                        <div class="col-12">
                                            <a href='../signout'><p class="mt-2" style="color: #4A4F54;">Cerrar sesi&oacute;n</p></a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-2"></div>
            </div>
        </div>
        
    </body>
    
</html>
