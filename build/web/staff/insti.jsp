<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instituciones</title>
    </head>

    <%
        String accion = request.getParameter("a");

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

        <form action="../createinstitucion" method="post">

            <input type="text" name="nombre_institucion" id="nombre_institucion" placeholder="Nombre institucion" required>
            <input type="text" name="limite_profes" id="limite_profes" placeholder="Limite de profesores" required>
            <input type="text" name="limite_alumnos" id="limite_alumnos" placeholder="Limite de alumnos" required>

            <input type="submit" value="Alta institucion">

        </form>

        <%
                }

            } else {
                response.sendRedirect("insti.jsp?a=nuevo");
            }

        %>

        <a href="index.jsp">Regresar</a>

    </body>

</html>
