<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String staff_type = (String) session.getAttribute("user_type");
    
    String staff_name = null;
    
    if (session != null)
    {
        staff_name = (String) session.getAttribute("user_name");
    }

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
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Home - Staff</h3>
        
        <p>Hola <%= staff_name %></p>
        
        <a href="administradores.jsp">
            <button>Administradores</button>
        </a>
        <a href="instituciones.jsp">
            <button>Instituciones</button>
        </a>
        <a href="#">
            <button>DEBUG PAGE</button>
        </a>
        
        <br>
        <br>
        <a href="../signout">Cerrar sesión</a>
        
    </body>
    
</html>
