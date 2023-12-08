<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
        //PROTECCION
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        if (tipo_usuario == null || !tipo_usuario.equals("alumno")) {
            response.sendRedirect("../../index.jsp");
        }

        String id_usuario = (String) session.getAttribute("id_usuario");
        String nom_usuario = (String) session.getAttribute("nom_usuario");
        String pat_usuario = (String) session.getAttribute("pat_usuario");
        String com_usuario = nom_usuario + " " + pat_usuario;

        String accion = request.getParameter("a");
    %>

    <body>

        <%
            if (accion != null) {
                if ("chat".equals(accion)) {
                    String id_rem = request.getParameter("i");
                    String nom_rem = request.getParameter("n");
        %>

        <h1>Chat de <%=com_usuario%></h1>
        <h2>con <%=nom_rem%></h2>

        <div id="output"></div>

        <input id="username_to" type="text" value="<%=id_rem%>" hidden>
        <input id="nom_to" type="text" value="<%=nom_rem%>" hidden>
        <input id="message_in" type="text">
        <input id="username_in" typse="text" value="<%=id_usuario%>" hidden>
        <input id="nom_in" type="text" value="<%=com_usuario%>" hidden>
        <button onclick="send()">Enviar</button>

        <script src="../../recursos/scripts/websocket.js"></script>

        <%
                }
            }
        %>
    </body>
</html>
