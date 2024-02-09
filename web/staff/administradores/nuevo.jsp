<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    InstitutionsController instc = new InstitutionsController();
%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Nuevo administrador</title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Nuevo administrador</h3>
        
        <form action="../../usernew" method="post" enctype="multipart/form-data">
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
            <select name="inst_name" id="inst_name">
                <option value="" disabled selected hidden>Institución</option>
                <%=instc.modelGetOptionInst()%>
             </select>
            <br>
            <input type="submit" value="Nuevo administrador">
        </form>

        <a href="../administradores.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
    </body>
    
</html>
