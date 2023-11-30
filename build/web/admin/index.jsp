<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio administrador</title>
    </head>

    <%
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        String nom_usuario = (String) session.getAttribute("nom_usuario");
        String pat_usuario  = (String) session.getAttribute("pat_usuario");
        String id_inst = (String) session.getAttribute("id_inst");
        String nom_inst = (String) session.getAttribute("nom_inst");
        
        if (tipo_usuario == null || !tipo_usuario.equals("admin")) {
            response.sendRedirect("../index.jsp");
        }
    %>

    <body>
        <h1>Memorand ${tipo_usuario} - ${nom_inst}</h1>
        <h2>Bienvenido, ${nom_usuario} ${pat_usuario}</h2>
        <a href="../logout">Cerrar sesión</a>

        <h2>Alumnos</h2>
        <a href="#">Ver alumnos</a> <br> 
        <a href="#">Nuevo alumno</a> <br> 

        <h2>Profesores</h2>
        <a href="#">Ver profesores</a> <br> 
        <a href="#">Nueva profesor</a> <br> 
        
        <h2>Grupos</h2>
        <a href="#">Ver grupos</a> <br> 
        <a href="#">Nuevo grupo</a>
        
        <h2>Asignaturas</h2>
        <a href="#">Ver asignaturas</a> <br> 
        <a href="#">Nueva asignatura</a>
    </body>
    
</html>
