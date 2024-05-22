<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String user_email = null;
    String user_pass = null;
    String user_type = null;
    String user_name = null;
    String user_pat = null;
    String user_mat = null;
    String user_status = null;
    String user_profile = null;

    String inst_id = null;
    String inst_name = null;
    String inst_type = null;
    String inst_profile = null;

  
%>

<!DOCTYPE html>

<html>
    
    <head>
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        <title>Memorand | </title>
    </head>
    
    <head>

        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>

        <title>Memorand - <%= user_name%></title>

        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">

    </head>
    
    <body>
        
        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>
        
        <div class="container">
            <div class="row mt-5">
                <div class="col-2"></div>
                <div class="col-7">
                    <h1>Mi perfil</h1>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #00ce7c; font-size: 18px;"><a id="backLink" href='home.jsp' style="color: #00ce7c;"><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <div class="row mt-4">
                
                
            </div>
        </div>
        
    </body>
    
</html>