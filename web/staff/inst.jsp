<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instituciones</title>
    </head>

    <%
        String accion = request.getParameter("a");

        //PROTECCION
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        if (tipo_usuario == null || !tipo_usuario.equals("staff")) {
            response.sendRedirect("../index.jsp");
        }
    %>

    <body>

        <%
            if (accion != null) {
                if (accion.contains("nuevo")) {
        %>

        <h1>Nueva institucion</h1>

        <form action="../altainst" method="post">
            <div style="margin-bottom: 15px;">
                <label for="nom_inst">Nombre de la Institución:</label><br>
                <input type="text" name="nom_inst" id="nom_inst" pattern="[A-Za-zÁ-ú ]+" title="Solo se permiten letras y espacios" placeholder="Nombre de la institución" required>
            </div>
            <div style="margin-bottom: 15px;">
                <label for="tipo_inst">Tipo de Institución:</label><br>
                <select name="tipo_inst" id="tipo_inst" required>
                    <option value="" selected disabled hidden>Selecciona</option>
                    <option value="Escolar">Escolar</option>
                    <option value="Empresa">Empresa</option>
                </select>
            </div>
            <div style="margin-bottom: 15px;">
                <label for="lim_lider">Límite de Líderes:</label><br>
                <input type="text" name="lim_lider" id="lim_lider" placeholder="Límite de líderes" required>
                <div style="margin-top: 5px;">
                    <button type="button" onclick="aumentarLimites('lim_lider')">Aumentar</button>
                    <button type="button" onclick="reducirLimites('lim_lider')">Reducir</button>
                </div>
            </div>
            <div style="margin-bottom: 15px;">
                <label for="lim_part">Límite de Participantes:</label><br>
                <input type="text" name="lim_part" id="lim_part" placeholder="Límite de participantes" required>
                <div style="margin-top: 5px;">
                    <button type="button" onclick="aumentarLimites('lim_part')">Aumentar</button>
                    <button type="button" onclick="reducirLimites('lim_part')">Reducir</button>
                </div>
            </div>
            <div style="margin-bottom: 15px;">
                <label for="lim_grupo">Límite de Grupos:</label><br>
                <input type="text" name="lim_grupo" id="lim_grupo" pattern="[0-9]+" title="Solo se permiten números" placeholder="Límite de grupos" required>
            </div>
            <div style="margin-bottom: 15px;">
                <label for="lim_sector">Límite de Sectores:</label><br>
                <input type="text" name="lim_sector" id="lim_sector" pattern="[0-9]+" title="Solo se permiten números" placeholder="Límite de sectores" required>
            </div>
            <div style="margin-bottom: 15px;">
                <input type="button" value="Limpiar Campos" onclick="confirmarLimpiarCampos()" id="botonLimpiar">
            </div>
            <div>
                <input type="submit" value="Alta Institución">
            </div>
        </form>

        <%
            if (accion.contains("2")) {
        %>
        <br>
        <a href="../listainst">Regresar</a>
        <%
        } else {
        %>
        <br>
        <a href="index.jsp">Regresar</a>
        <%
                }
            }

            if ("editar".equals(accion)) {

                String id_inst = request.getParameter("i");
                String nom_inst = request.getParameter("n");
                String tipo_inst = request.getParameter("t");
                String lim_lider = request.getParameter("l");
                String lim_part = request.getParameter("p");
                String lim_grupo = request.getParameter("g");
                String lim_sector = request.getParameter("s");

        %>

        <h1>Editar institucion</h1>

        <form action="../editainst" method="post">
            <input type="text" name="id_inst" id="id_inst" value="<%=id_inst%>" hidden="true">
            <div style="margin-bottom: 15px;">
                <label for="nom_inst">Nombre de la Institución</label><br>
                <input type="text" name="nom_inst" id="nom_inst" value="<%=nom_inst%>" pattern="[A-Za-zÁ-ú ]+" title="Solo se permiten letras y espacios" placeholder="Nombre de la institución" required>
            </div>
            <div style="margin-bottom: 15px;">
                <label for="tipo_inst">Tipo de Institución:</label><br>
                <select name="tipo_inst" id="tipo_inst" required>
                    <option value="" selected disabled hidden>Selecciona</option>
                    <option value="Escolar">Escolar</option>
                    <option value="Empresa">Empresa</option>
                </select>
            </div>
            <div style="margin-bottom: 15px;">
                <label for="lim_lider">Límite de Líderes:</label><br>
                <input type="text" name="lim_lider" id="lim_lider" value="<%=lim_lider%>" placeholder="Límite de líderes" required>
                <div style="margin-top: 5px;">
                    <button type="button" onclick="aumentarLimites('lim_lider')">Aumentar</button>
                    <button type="button" onclick="reducirLimites('lim_lider')">Reducir</button>
                </div>
            </div>
            <div style="margin-bottom: 15px;">
                <label for="lim_part">Límite de Participantes:</label><br>
                <input type="text" name="lim_part" id="lim_part" value="<%=lim_part%>" placeholder="Límite de participantes" required>
                <div style="margin-top: 5px;">
                    <button type="button" onclick="aumentarLimites('lim_part')">Aumentar</button>
                    <button type="button" onclick="reducirLimites('lim_part')">Reducir</button>
                </div>
            </div>
            <div style="margin-bottom: 15px;">
                <label for="lim_grupo">Límite de Grupos:</label><br>
                <input type="text" name="lim_grupo" id="lim_grupo" value="<%=lim_grupo%>" pattern="[0-9]+" title="Solo se permiten números" placeholder="Límite de grupos" required>
            </div>
            <div style="margin-bottom: 15px;">
                <label for="lim_sector">Límite de Sectores:</label><br>
                <input type="text" name="lim_sector" id="lim_sector" value="<%=lim_sector%>" pattern="[0-9]+" title="Solo se permiten números" placeholder="Límite de sectores" required>
            </div>
            <div style="margin-bottom: 15px;">
                <input type="button" value="Limpiar Campos" onclick="confirmarLimpiarCampos()" id="botonLimpiar">
            </div>
            <div>
                <input type="submit" value="Editar Institución">
            </div>
        </form>

        <br>
        <a href="../listainst">Regresar</a>

        <%
                }

            } else {
                response.sendRedirect("insti.jsp?a=nuevo");
            }

        %>


    </body>
    
    <script>

            function aumentarLimites(campo) {
                var field = document.getElementById(campo);
                var valorActual = parseInt(field.value) || 0;

                if (campo === 'lim_lider') {
                    valorActual += 10;
                } else if (campo === 'lim_part') {
                    valorActual += 100;
                }

                field.value = valorActual;
            }

            function reducirLimites(campo) {
                var field = document.getElementById(campo);
                var valorActual = parseInt(field.value) || 0;

                if (valorActual > 0) {
                    if (campo === 'lim_lider') {
                        valorActual -= 10;
                    } else if (campo === 'lim_part') {
                        valorActual -= 100;
                    }

                    // No permitir que el valor sea menor que cero
                    if (valorActual < 0) {
                        valorActual = 0;
                    }

                    field.value = valorActual;
                }
            }

            function confirmarLimpiarCampos() {
                if (confirm("¿Estás seguro de que deseas limpiar todos los campos?")) {
                    limpiarCampos();
                }
            }

            function limpiarCampos() {
                var formulario = document.forms[0];
                var campos = formulario.getElementsByTagName("input");

                for (var i = 0; i < campos.length; i++) {
                    if (campos[i].type === "text") {
                        campos[i].value = "";
                    }
                }
            }
        </script>


</html>
