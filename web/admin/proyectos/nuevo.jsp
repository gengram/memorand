<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Proyecto nuevo</title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Proyecto nuevo</h3>
        
        <form action="../../projnew" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            
            <input type="text" name="proj_name" id="proj_name" placeholder="Nombre proyecto" required>
            <br>
            
            <input type="color" name="proj_color" id="proj_color" required>
            <br>
            
            <input type="submit" value="Alta proyecto">
        </form>

        <a href="../proyectos.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
    </body>
    
</html>
