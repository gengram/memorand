<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
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
            <div class="row mt-4">
                <div class="col-5"></div>
                <div class="col-2 text-center">
                    <h1>Memorand</h1>
                    <!--<h3>Landing page - General</h3>-->
                    <button class="mt-3 ms-2 btn custom-blog btn-sm fs-6 border-opacity-25 rounded-4"><a href="work/home.jsp" style="text-decoration: none">Iniciar Memorand</a></button>
                    <br>
                    <!--<a href="escuelas.jsp">Memorand para escuelas</a>
                    <br>
                    <a href="empresas.jsp">Memorand para empresas</a> -->
                    <br>
                    <br>
                </div>
                <div class="col-5"></div>
            </div>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    

                </div>
                <div class="col-1"></div>
            </div>
        </div>

    </body>
    
</html>
