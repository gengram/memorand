<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String user_name = (String) session.getAttribute("user_name");
    String user_pat = (String) session.getAttribute("user_pat");
%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title><%= user_name +" "+ user_pat %></title>
        
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
    </head>
    
    <%-- BODY --%>
    <body>
        
        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>
        
        <div class="container">
            <br>
            <h3>Configuración</h3>
            <br>
            <a href="home.jsp">Regresar</a>
            <br>
            
            <a href="../signout">Cerrar sesión</a>
            <br>
        </div>
        
    </body>

</html>
