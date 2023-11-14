<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <title>Inicio staff</title>
    </head>

    <%
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        String nombre_usuario = (String) session.getAttribute("nombre_usuario");
        String paterno_usuario  = (String) session.getAttribute("paterno_usuario");
        if (tipo_usuario == null || !tipo_usuario.equals("staff")) {
            response.sendRedirect("../index.jsp");
        }
    %>

    <body>
        
        <h1>Memorand ${tipo_usuario}</h1>
        <h2>Bienvenido, ${nombre_usuario} ${paterno_usuario}</h2>
        <a href="../logout">Cerrar sesión</a>

        <h2>Administradores</h2>
        <a href="admin.jsp?a=lista">Ver administradores</a> <br> 
        <a href="admin.jsp?a=nuevo">Nuevo admin</a> <br> 

        <h2>Instituciones</h2>
        <a href="../listainstituciones">Ver instituciones</a> <br> 
        <a href="insti.jsp?a=nuevo">Nueva institucion</a>

    </body>

</html>

