<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Inicio</title>
        
        <link rel="stylesheet" href="XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Landing page - General</h3>
        
        <a href="escuelas.jsp">Memorand para escuelas</a>
        <br>
        <a href="empresas.jsp">Memorand para empresas</a>
        <br>
        <br>
        
        <p>Inicio sesión</p>
        
        <form action="login" method="post" enctype="multipart/form-data">
            <input type="email" name="user_email" id="user_email" placeholder="Correo Electrónico" required>
            <br>
            <input type="password" name="user_pass" id="user_pass" placeholder="Contraseña" required>
            <br>
            <input type="submit" value="Iniciar sesión">
        </form>
        
        <br>
      
    </body>
    
</html>
