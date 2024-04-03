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

    <!-- HEAD -->
    <head>
        
        <jsp:include page="XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Ventas</title>

        <link rel="stylesheet" href="XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <!-- BODY -->
    <body>
        
        <jsp:include page="XM-Resources/pages/elements/shortbar.jspf"/>
        <jsp:include page="XM-Resources/pages/elements/login.jspf"/>
        
    </body>

</html>
