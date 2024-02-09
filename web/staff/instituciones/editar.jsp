<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<% 
    InstitutionsController instc = new InstitutionsController();
    
    String inst_id = request.getParameter("inst_id");
%>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Editar institución</title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Editar institución</h3>
        
        <form action="../../instedit" method="post" enctype="multipart/form-data">
            <input type="text" name="inst_name" id="inst_name" placeholder="Nombre institucion" required>
            <br>
            <input type="text" name="inst_type" id="inst_type" placeholder="Tipo institucion" required>
            <br>
            <input type="file" name="inst_profile" id="inst_profile" placeholder="Tipo institucion" required>
            <br>
            <input type="text" name="lim_ch" id="lim_ch" placeholder="Limite lideres" required>
            <br>
            <input type="text" name="lim_wk" id="lim_wk" placeholder="Limite integrantes" required>
            <br>
            <input type="text" name="lim_gp" id="lim_gp" placeholder="Limite grupos" required>
            <br>
            <input type="text" name="lim_ks" id="lim_ks" placeholder="Limite clases" required>
            <br>
            <input type="submit" value="Alta institucion">
        </form>

        <a href="ver.jsp?inst_id=<%=inst_id%>">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
    </body>
    
</html>
