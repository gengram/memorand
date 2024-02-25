<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Departamento nuevo</title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Departamento nuevo</h3>
        
        <form action="../../teamnew" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <input type="text" name="team_name" id="team_name" placeholder="Nombre departamento" required>
            <br>
            <input type="color" name="team_color" id="team_color" required>
            <br>
            <input type="submit" value="Alta departamento">
        </form>

        <a href="../departamentos.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
    </body>
    
</html>
