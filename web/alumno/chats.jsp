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
            response.sendRedirect("../index.jsp");
        }
        
        String id_usuario = (String) session.getAttribute("id_usuario");
        String nom_usuario = (String) session.getAttribute("nom_usuario");
        String pat_usuario  = (String) session.getAttribute("pat_usuario");
        
        String accion = request.getParameter("a");
    %>
    
    <body>
        
        <h1>Chat <%=nom_usuario%> <%=pat_usuario%> </h1>
        
        <table border="4">
            <tr>
                <th>Nombre</th>
                <th>Acciones</th>
            </tr>
            <c:forEach items="${usuarios}" var="usuario">
                <tr>
                    <td>${usuario.nom_usuario} ${usuario.pat_usuario}</td>
                    <td>
                        <a href="chat?a=chat&i=${usuario.id_usuario}&n=${usuario.nom_usuario} ${usuario.pat_usuario}">Chatear</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
    </body>
</html>