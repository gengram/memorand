<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title></title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    <body>
        <h1>Memorand</h1>
        <h3>Gestor de Instituciones - </h3>
        
        <a href="editar.jsp?inst_id=">Editar</a>
        <br>
        <a href="../administradores.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
        <br>
        <br>
        <h5>Foto</h5>
        <img src="../../" width="100" alt="inst_profile"/>
        
        <br>
        <br>
        <h5>Email</h5>
        <p></p>
        
        <br>
        <h5>Pass</h5>
        <p></p>
        
        <br>
        <h5>Tipo</h5>
        <p></p>
        
        <br>
        <h5>Nombre</h5>
        <p></p>
        
        <br>
        <h5>Paterno</h5>
        <p></p>
        
        <br>
        <h5>Materno</h5>
        <p></p>
        
        <br>
        <h5>Estatus</h5>
        <p></p>
            
    </body>
    
</html>
