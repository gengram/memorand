<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Inicio</title>
</head>
<%
    String tipo_usuario = (String) session.getAttribute("tipo_usuario");
    if (tipo_usuario == null || !tipo_usuario.equals("profesor")) {
        response.sendRedirect("Login.jsp?intruso=1");
    }
%>

<body>
    <!-- Contenido específico para cada tipo de usuario -->
    <h2>Bienvenido, ${tipo_usuario}</h2>
    <a href="logout">Cerrar sesión</a>

</body>
</html>

