<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="resources/pages/imports.jspf"/>
        
        <title>memorand</title>
        
        <link rel="shortcut icon" href="resources/vector/memorand-bee.svg">
        <link rel="stylesheet" href="resources/styles/bootstrap.css">
        
    </head>
    
    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        
        <p>Crea una institucion</p>
        
        <form action="instnew" method="post" enctype="multipart/form-data">
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
        
    </body>
    
</html>
