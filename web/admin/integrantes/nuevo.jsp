<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%  
    //String staff_type = (String) session.getAttribute("user_type");
    
    //if (staff_type == null || !staff_type.equals("staff"))
    //{
    //    response.sendRedirect("../index.jsp?error=100");
    //    session.invalidate();
    //}
    
    //InstitutionsController instc = new InstitutionsController();
%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Nuevo integrante</title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Nuevo integrante</h3>
        
        <form action="../../usernew?user_type=wk" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <input type="email" name="user_email" id="user_email" placeholder="Correo usuario" required>
            <br>
            <input type="password" name="user_pass" id="user_pass" placeholder="Contraseña usuario" required>
            <br>
            <input type="text" name="user_name" id="user_name" placeholder="Nombre usuario" required>
            <br>
            <input type="text" name="user_pat "id="user_pat" placeholder="Apellido paterno" required>
            <br>
            <input type="text" name="user_mat" id="user_mat" placeholder="Apellido materno" required>
            <br>
            <input type="file" name="inst_profile" id="inst_profile" required>
            <br>
            <input type="submit" value="Nuevo integrante">
        </form>

        <a href="../integrantes.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
    </body>
    
</html>
