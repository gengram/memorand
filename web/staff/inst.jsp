<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instituciones</title>
    </head>

    <%
        String id_inst = request.getParameter("i");
        String nom_inst = request.getParameter("n");
        String lim_profes = request.getParameter("lp");
        String lim_alumnos = request.getParameter("la");

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
                if ("nuevo".equals(accion)) {
        %>

        <h1>Nueva institucion</h1>

        <form action="../altainst" method="post">

            <input type="text" name="nom_inst" id="nom_inst" placeholder="Nombre institucion" required>
            <select name="tipo_inst" id="tipo_inst" placeholder="Selecciona" required>
                <option value="pescolar">Escolar Lite</option>
                <option value="mescolar">Escolar Medio</option>
                <option value="gescolar">Escolar Grande</option>
                <option value="pempresa">Empresa Lite</option>
                <option value="mempresa">Empresa Medio</option>
                <option value="gempresa">Empresa Grande</option>
            </select>
            <input type="text" name="lim_lider" id="lim_lider" placeholder="Limite de lideres" required>
            <input type="text" name="lim_part" id="lim_part" placeholder="Limite de participantes" required>
            <input type="text" name="lim_grupo" id="lim_grupo" placeholder="Limite de grupos" required>
            <input type="text" name="lim_sector" id="lim_sector" placeholder="Limite de sectores" required>

            <input type="submit" value="Alta institucion">

        </form>

        <br>
        <a href="index.jsp">Regresar</a>

        <%
                }
                if ("editar".equals(accion)) {

                    
        %>

        <h1>Editar institucion</h1>

        <form action="../editainst" method="post">

            <input type="text" name="id_inst" id="id_inst" value="<%=id_inst%>" hidden="true">
            <input type="text" name="nom_inst" id="nom_inst" placeholder="Nuevo nombre" value="<%=nom_inst%>" required>
            <input type="text" name="lim_profes" id="lim_profes" placeholder="Nuevo Lim. Profes" value="<%=lim_profes%>" required>
            <input type="text" name="lim_alumnos" id="lim_alumnos" placeholder="Nuevo Lim. Alumnos" value="<%=lim_alumnos%>" required>

            <input type="submit" value="Editar institucion">

        </form>

        <br>
        <a href="../listainst">Regresar</a>

        <%
                }
                if ("nuevo2".equals(accion)) {
        %>

        <h1>Nueva institucion</h1>

        <form action="../altainst" method="post">

            <input type="text" name="nom_inst" id="nom_inst" placeholder="Nombre institucion" required>
            <select name="tipo_inst" id="tipo_inst" placeholder="Selecciona" required>
                <option value="pescolar">Escolar Lite</option>
                <option value="mescolar">Escolar Medio</option>
                <option value="gescolar">Escolar Grande</option>
                <option value="pempresa">Empresa Lite</option>
                <option value="mempresa">Empresa Medio</option>
                <option value="gempresa">Empresa Grande</option>
            </select>
            <input type="text" name="lim_lider" id="lim_lider" placeholder="Limite de lideres" required>
            <input type="text" name="lim_part" id="lim_part" placeholder="Limite de participantes" required>
            <input type="text" name="lim_grupo" id="lim_grupo" placeholder="Limite de grupos" required>
            <input type="text" name="lim_sector" id="lim_sector" placeholder="Limite de sectores" required>

            <input type="submit" value="Alta institucion">

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

</html>
