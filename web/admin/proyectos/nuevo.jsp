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
            
            <select name="proj_icon" id="proj_icon">
                <option value="" disabled selected hidden>Icono</option>
                <option value="XM-Resources/server/project/icons/icon1.png">Icono 1</option>
                <option value="XM-Resources/server/project/icons/icon2.png">Icono 2</option>
                <option value="XM-Resources/server/project/icons/icon3.png">Icono 3</option>
                <option value="XM-Resources/server/project/icons/icon4.png">Icono 4</option>
                <option value="XM-Resources/server/project/icons/icon5.png">Icono 5</option>
             </select>
            <br>
            
            <input type="color" name="proj_color" id="proj_color" required>
            <br>
            
            <select name="inst_type" id="inst_type">
                <option value="" disabled selected hidden>Fondo</option>
                <option value="XM-Resources/server/project/backgrounds/bg1.png">Fondo 1</option>
                <option value="XM-Resources/server/project/backgrounds/bg2.png">Fondo 2</option>
                <option value="XM-Resources/server/project/backgrounds/bg3.png">Fondo 3</option>
                <option value="XM-Resources/server/project/backgrounds/bg4.png">Fondo 4</option>
                <option value="XM-Resources/server/project/backgrounds/bg5.png">Fondo 5</option>
             </select>
            <br>
            
            <input type="submit" value="Alta proyecto">
        </form>

        <a href="../proyectos.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
    </body>
    
</html>
