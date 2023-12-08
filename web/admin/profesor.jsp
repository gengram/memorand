<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profesores</title>
    </head>

    <%
        String accion = request.getParameter("a");

        //PROTECCION
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        if (tipo_usuario == null || !tipo_usuario.equals("admin")) {
            response.sendRedirect("../index.jsp");
        }
    %>

    <body>

        <%
            if (accion != null) {
                if (accion.contains("n")) {
        %>

        <h1>Nuevo profesor</h1>

        <form action="../altaprofe" method="post">
            <div style="margin-bottom: 15px;">

                <input type="text" name="correo_usuario" id="correo_usuario" placeholder="Correo profesor" required>
                <input type="text" name="pass_usuario" id="pass_usuario" placeholder="Contraseña profesor" required>
                <input type="text" name="nom_usuario" id="nom_usuario" placeholder="Nombre(s)" required>
                <input type="text" name="pat_usuario" id="pat_usuario" placeholder="Apellido paterno" required>
                <input type="text" name="mat_usuario" id="mat_usuario" placeholder="Apellido materno" required>
                
                <select name="est_usuario" id="est_usuario" placeholder="Selecciona">
                    <option value="" selected disabled hidden>Selecciona</option>
                    <option value="si">Activo</option>
                    <option value="no">Inactivo</option>
                </select>
                
            </div>
            <div>
                <input type="submit" value="Alta Profesor">
            </div>
        </form>

        <%
            if (accion.contains("2")) {
        %>
        <br>
        <a href="../listagrupo?a=v">Regresar</a>
        <%
        } else {
        %>
        <br>
        <a href="index.jsp">Regresar</a>
        <%
                }
            }

            if ("e".equals(accion)) {

                String id_grupo = request.getParameter("i");
                String nom_grupo = request.getParameter("n");

        %>

        <h1>Editar institucion</h1>

        <form action="../editagrupo" method="post">
            <div style="margin-bottom: 15px;">
                <input type="text" name="id_grupo" id="id_grupo" value="<%=id_grupo%>" hidden="true">
                <label for="nom_grupo">Nombre del grupo</label><br>
                <input type="text" name="nom_grupo" id="nom_grupo" value="<%=nom_grupo%>" placeholder="Nombre del grupo" required>
            </div>
            <div>
                <input type="submit" value="Editar Grupo">
            </div>
        </form>

        <br>
        <a href="listagrupo?a=v">Regresar</a>

        <%
            }

            if (accion.equals("v")) {
        %>

        <h1>Ver grupos</h1>

        <a href="admin/grupo.jsp?a=n2">Nuevo grupo</a>
        <br> <br>

        <table border="4">
            <tr>
                <th>Nombre</th>
                <th>Acciones</th>
            </tr>
            <c:forEach items="${grupos}" var="grupo">
                <tr>
                    <td>${grupo.nom_grupo}</td>
                    <td>
                        <a href="?a=e&i=${grupo.id_grupo}&n=${grupo.nom_grupo}">Editar</a>
                        <a href="bajagrupo?id_grupo=${grupo.id_grupo}">Borrar</a>
                        <a href="infogrupo?id_grupo=${grupo.id_grupo}">Ver información</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <br>
        <a href="admin/index.jsp">Regresar</a>

        <%
                }
                if (accion.equals("i")) {
                }

            } else {
                response.sendRedirect("grupo.jsp?a=nuevo");
            }

        %>


    </body>

</html>
