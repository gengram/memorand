<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.service.ServicesUtil"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.controller.InstitutionsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String inst_id = request.getParameter("id");
    
    if (inst_id != null)
    {
        InstitutionsController instc = new InstitutionsController();
        
        Institution inst = instc.modelGetInst(inst_id);
        
        if (inst == null)
        { response.sendRedirect("home.jsp"); }
    }
    else
    { response.sendRedirect("home.jsp"); }
    
    // PROTECCIÓN
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand Staff | Agregar administrador</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='institucion.jsp?id=<%= inst_id %>'>&larr;</a>Agregar administrador</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='ventas.jsp'>Ventas</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <form action="../usernew?id=<%= inst_id %>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <input type="file" name="inst_profile" id="inst_profile">
            
            <br> <br>
            
            <input type="email" name="user_email" id="user_email" placeholder="Correo usuario" required>     

            <input type="password" name="user_pass" id="user_pass" placeholder="Contraseña usuario" required>

            <br> <br>
            
            <input type="text" name="user_name" id="user_name" placeholder="Nombre usuario" required>

            <input type="text" name="user_pat "id="user_pat" placeholder="Apellido paterno" required>

            <input type="text" name="user_mat" id="user_mat" placeholder="Apellido materno" required>
            
            <br> <br>

            <input type="submit" value="Agregar administrador">
        </form>
        
    </body>

</html>