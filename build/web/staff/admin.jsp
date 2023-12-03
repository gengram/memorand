<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administradores</title>
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

        <h1>Nuevo administrador</h1>

        <form action="altaadmin" method="post">

            <input type="text" name="correo_usuario" id="correo_usuario" placeholder="Correo administrador" required>
            <input type="text" name="pass_usuario" id="pass_usuario" placeholder="Contraseña administrador" required>
            <input type="text" name="nom_usuario" id="nom_usuario" placeholder="Nombre(s)" required>
            <input type="text" name="pat_usuario" id="pat_usuario" placeholder="Apellido paterno" required>
            <input type="text" name="mat_usuario" id="mat_usuario" placeholder="Apellido materno" required>

            <select name="est_usuario" id="est_usuario" placeholder="Selecciona">
                <option value="" selected disabled hidden>Selecciona</option>
                <option value="si">Activo</option>
                <option value="no">Inactivo</option>
            </select>

            <select name="nom_inst" id="nom_inst" placeholder="Selecciona">
                <option value="" selected disabled hidden>Selecciona</option>
                <c:forEach items="${inst}" var="institucion">
                    <option value="${institucion.nom_inst}">${institucion.nom_inst}</option>
                </c:forEach>
            </select>

            <input type="submit" value="Alta administrador">

        </form>

        <br>
        <a href="staff/index.jsp">Regresar</a>

        <%
            }
            if ("editar".equals(accion)) {

                String id_usuario = request.getParameter("i");
                String correo_usuario = request.getParameter("c");
                String nom_usuario = request.getParameter("n");
                String pat_usuario = request.getParameter("p");
                String mat_usuario = request.getParameter("m");
                String est_usuario = request.getParameter("e");
        %>

        <h1>Editar administrador</h1>

        <form action="editaadmin" method="post">

            <input type="text" name="id_usuario" id="id_usuario" value="<%=id_usuario%>" hidden="true">
            <input type="email" name="correo_usuario" id="correo_usuario" placeholder="Correo administrador" value="<%=correo_usuario%>" required>
            <input type="text" name="pass_usuario" id="pass_usuario" placeholder="Nueva Contraseña" required>
            <input type="text" name="nom_usuario" id="nom_usuario" placeholder="Nombre(s)" value="<%=nom_usuario%>" required>
            <input type="text" name="pat_usuario" id="pat_usuario" placeholder="Apellido paterno" value="<%=pat_usuario%>" required>
            <input type="text" name="mat_usuario" id="mat_usuario" placeholder="Apellido materno" value="<%=mat_usuario%>" required>
            
            <select name="est_usuario" id="est_usuario" placeholder="Selecciona">
                <option value="" selected disabled hidden>Selecciona</option>
                <option value="si">Activo</option>
                <option value="no">Inactivo</option>
            </select>

            <select name="nom_inst" id="nom_inst" placeholder="Selecciona">
                <option value="" selected disabled hidden>Selecciona</option>
                <c:forEach items="${inst}" var="institucion">
                    <option value="${institucion.nom_inst}">${institucion.nom_inst}</option>
                </c:forEach>
            </select>

            <input type="submit" value="Editar administrador">

        </form>

        <br>
        <a href="listaadmin">Regresar</a>

        <%
            }
            if ("nuevo2".equals(accion)) {
        %>

        <h1>Nuevo administrador</h1>

        <form action="altaadmin" method="post">

            <input type="text" name="correo_usuario" id="correo_usuario" placeholder="Correo administrador" required>
            <input type="text" name="pass_usuario" id="pass_usuario" placeholder="Contraseña administrador" required>
            <input type="text" name="nom_usuario" id="nom_usuario" placeholder="Nombre(s)" required>
            <input type="text" name="pat_usuario" id="pat_usuario" placeholder="Apellido paterno" required>
            <input type="text" name="mat_usuario" id="mat_usuario" placeholder="Apellido materno" required>

            <select name="est_usuario" id="est_usuario" placeholder="Selecciona">
                <option value="" selected disabled hidden>Selecciona</option>
                <option value="si">Activo</option>
                <option value="no">Inactivo</option>
            </select>

            <select name="nom_inst" id="nom_inst" placeholder="Selecciona">
                <option value="" selected disabled hidden>Selecciona</option>
                <c:forEach items="${inst}" var="institucion">
                    <option value="${institucion.nom_inst}">${institucion.nom_inst}</option>
                </c:forEach>
            </select>

            <input type="submit" value="Alta administrador">

        </form>

        <br>
        <a href="listaadmin">Regresar</a>

        <%
                }
            } else {
                response.sendRedirect("admin.jsp?a=lista");
            }

        %>

    </body>

</html>
