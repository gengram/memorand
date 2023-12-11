<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/import.jsp"/>
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css" type="text/css">
        <title>Lista Chat</title>
    </head>
    <%
        //PROTECCION
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        if (tipo_usuario == null || !tipo_usuario.equals("alumno")) {
            response.sendRedirect("../index.jsp");
        }

        String id_usuario = (String) session.getAttribute("id_usuario");
        String nom_usuario = (String) session.getAttribute("nom_usuario");
        String pat_usuario = (String) session.getAttribute("pat_usuario");

        String accion = request.getParameter("a");
    %>

    <body>
        <jsp:include page="../recursos/paginas/navbar.jsp"/>
        <jsp:include page="../recursos/paginas/sidelbar.jsp"/>
        <div class="container" >
            <div class="row" >
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row" ">

                        <h1 class="mt-4">Mis Chats  </h1>
                        <h3 class="text-center"><i class="bi bi-person-circle"></i> <%=nom_usuario%> <%=pat_usuario%></h3>

                        <table class="table mt-5" >
                            <thead>
                                <th>Nombre</th>
                            <th>Acciones</th>
                            </thead>
                            <c:forEach items="${usuarios}" var="usuario">
                                <tbody>
                                <td>${usuario.nom_usuario} ${usuario.pat_usuario}</td>
                                <td>
                                    <a href="chat?a=chat&i=${usuario.id_usuario}&n=${usuario.nom_usuario} ${usuario.pat_usuario}"><i class="bi bi-chat-dots-fill"></i></a>
                                </td>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="col-1"></div>
                </div>
            </div>
        </div>
    </body>
</html>
