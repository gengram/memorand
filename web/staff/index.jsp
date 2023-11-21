<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <title>Inicio staff</title>
    </head>

    <%
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        String nom_usuario = (String) session.getAttribute("nom_usuario");
        String pat_usuario  = (String) session.getAttribute("pat_usuario");
        
        if (tipo_usuario == null || !tipo_usuario.equals("staff")) {
            response.sendRedirect("../index.jsp");
        }
    %>

    <body>
        
        <h1>Memorand ${tipo_usuario}</h1>
        <h2>Bienvenido, ${nom_usuario} ${pat_usuario}</h2>
        <a href="../logout">Cerrar sesión</a>

        <h2>Administradores</h2>
        <a href="../listaadmin">Ver administradores</a> <br> 
        <a href="../nuevoadmin?a=nuevo">Nuevo admin</a> <br> 

        <h2>Instituciones</h2>
        <a href="../listainst">Ver instituciones</a> <br> 
        <a href="inst.jsp?a=nuevo">Nueva institucion</a>

    </body>

</html>

