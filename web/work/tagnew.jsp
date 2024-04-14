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
        .btn-color {
            border-color: #E3E4E5;
            background-color: transparent;
            padding-bottom: 0.05rem;
            padding-top: 0.05rem;
            padding-left: 0.35rem;
            padding-right: 0.35rem;
        }
        .btn-color:hover{
            border-color: #E3E4E5;
            background-color: #E3E4E5;
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
            <button class="btn btn-color" type="button" onclick="selectColor('#25CE7B')"><i style="color: #25CE7B; font-size: 30px;" class="bi bi-square-fill"></i></button>
            <button class="btn btn-color" type="button" onclick="selectColor('#2ADAE5')"><i style="color: #2ADAE5; font-size: 30px;" class="bi bi-square-fill"></i></button>
            <button class="btn btn-color" type="button" onclick="selectColor('#7473C0')"><i style="color: #7473C0; font-size: 30px;" class="bi bi-square-fill"></i></button>
            <button class="btn btn-color" type="button" onclick="selectColor('#F37DBD')"><i style="color: #F37DBD; font-size: 30px;" class="bi bi-square-fill"></i></button>
            <button class="btn btn-color" type="button" onclick="selectColor('#F3894D')"><i style="color: #F3894D; font-size: 30px;" class="bi bi-square-fill"></i></button>
            <button class="btn btn-color" type="button" onclick="selectColor('#FDB600')"><i style="color: #FDB600; font-size: 30px;" class="bi bi-square-fill"></i></button>
            <button class="btn btn-color" type="button" onclick="selectColor('#F25063')"><i style="color: #F25063; font-size: 30px;" class="bi bi-square-fill"></i></button>
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