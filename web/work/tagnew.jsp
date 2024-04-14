<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.TeamsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String collab_id = request.getParameter("id");
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

        <title>Memorand | Nueva etiqueta</title>

    </head>
    <style>
        .btn-sm{
    --bs-btn-padding-y: 0.25rem;
    --bs-btn-padding-x: 0.3rem;
    --bs-btn-font-size: 0.875rem;
    --bs-btn-border-radius: var(--bs-border-radius-sm);
}
    </style>
    <!-- BODY -->
    <body>

        <h1><a href='collab.jsp?id=<%= collab_id%>'>&larr;</a> Nueva etiqueta</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='perfil.jsp'>Mi perfil</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>

        <hr>

        <form action="../tagnew?id=<%= collab_id%>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <input type="text" name="tag_name" id="tag_name" placeholder="Nombre etiqueta" required>
            <br>
            <label for="tag_color">Color de etiqueta:</label>
            <br>
            <button class="btn btn-light" type="button" onclick="selectColor('#ff0000')"><i style="color: #ff0000;" class="bi bi-square-fill"></i></button>
            <button class="btn btn-light btn-sm" type="button" onclick="selectColor('#00ff00')"><i style="color: #00ff00; font-size: 30px;" class="bi bi-square-fill"></i></button>
            <button class="btn btn-light" type="button" onclick="selectColor('#0000ff')"><i style="color: #0000ff;" class="bi bi-square-fill"></i></button>
            <button class="btn btn-light" type="button" onclick="selectColor('#ffff00')"><i style="color: #ffff00;" class="bi bi-square-fill"></i></button>
            <input type="hidden" name="tag_color" id="selected_color" required>
            <br><br>
            <input type="submit" value="Nueva etiqueta">
        </form>

        <script>
            function selectColor(color) {
                document.getElementById("selected_color").value = color;
            }
        </script>



    </body>

</html>