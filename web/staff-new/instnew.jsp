<!-- Memorand by Gengram © 2023 -->
<%@page import="com.memorand.service.ServicesUtil"%>
<%@page import="com.memorand.beans.Institution"%>

<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // PROTECCIÓN
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand Staff | Nueva instituci&oacute;n</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='home.jsp'>&larr;</a>Nueva instituci&oacute;n</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='ventas.jsp'>Ventas</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <form action="../instnew" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <input type="file" name="inst_profile" id="inst_profile" required>
            
            <br> <br>
            
            <input type="text" name="inst_name" id="inst_name" placeholder="Nombre institucion" required>

            <select name="inst_type" id="inst_type">
                <option value="" disabled selected hidden>Tipo</option>
                <option value="empresa">Empresa</option>
            </select>

            <br> <br>
            
            <input type="text" name="lim_ch" id="lim_ch" placeholder="Limite lideres" required>

            <input type="text" name="lim_wk" id="lim_wk" placeholder="Limite integrantes" required>

            <input type="text" name="lim_gp" id="lim_gp" placeholder="Limite grupos" required>

            <input type="text" name="lim_ks" id="lim_ks" placeholder="Limite clases" required>        

            <br> <br>
            
            <input type="submit" value="Alta institucion">
        </form>
        
    </body>

</html>