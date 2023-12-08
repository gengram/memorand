<%-- 
    Document   : foro
    Created on : 15 nov. 2023, 23:08:15
    Author     : zunig
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        //PROTECCION
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        if (tipo_usuario == null || !tipo_usuario.equals("alumno")) {
            response.sendRedirect("../index.jsp");
        }
    %>
    <body>
        <h1>Hello World!</h1>
        <jsp:include page="../recursos/paginas/sidelbar.jsp"/>
    </body>
</html>


<div class="col-6 text-start">
    <div class="btn-group" role="group" aria-label="Basic example">
        <input class="custom-file-input" type="file" id="imagenInput" accept="image/*" onchange="updateFileName()">
        <label for="imagenInput" class="custom-file-input-label" id="customFileLabel">Elegir archivo</label>
        <button class="btn custom-blog  ms-2" onclick="extraerTextoDeImagen()">
            <span class="spinner-grow spinner-grow-sm" id="loader" style="display:none;"></span>
            Extraer Texto</button>
    </div>
</div>
