<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../../recursos/import.jsp"/>
        <link rel="stylesheet" href="../../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../../recursos/estilos/styless.css" type="text/css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>Chat</title>
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
        <jsp:include page="../../recursos/paginas/navbar_1.jsp"/>
        <jsp:include page="../../recursos/paginas/sidelbar_1.jsp"/>
        <%
            if (accion != null) {
                if ("chat".equals(accion)) {
                    String id_rem = request.getParameter("i");
                    String nom_rem = request.getParameter("n");
        %>
        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10 mt-5 ms-3" >
                    
                        <section class="d-flex h-100 overflow-hidden">
                            <div class="bg-gray-100 col-xl-9 col-lg-8 d-none d-lg-block shadow">
                                <div class="py-4 px-5 border-bottom">
                                    <div class="d-flex">
                                        <div class="d-grid flex-grow">
                                            <div class="position-relative me-4">
                                                <i class="bi bi-person-fill"></i>
                                            </div>
                                            <div>
                                                <p class="font-medium"><%=nom_rem%></p><!-- Con quien es el chat -->
                                            </div>
                                        </div>
                                        <div class="d-flex">

                                            <svg class="w-6 text-gray-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <!-- Icono -->
                                            </svg>
                                        </div>
                                    </div>
                                </div>

                                <div class="py-1 px-3 h-80 overflow-auto " id="output">
                                    <!-- Ejemplo de mensaje 1 -->


                                    <!-- Otros mensajes de la conversación... -->
                                </div>
                            </div>

                        </section>

                        <div class="row ">
                            <div class="col-8">
                                <input id="username_to" type="text" value="<%=id_rem%>" hidden>
                                <input id="nom_to" type="text" value="<%=nom_rem%>" hidden>
                                <input id="username_in" typse="text" value="<%=id_usuario%>" hidden>
                                <input id="nom_in" type="text" value="<%=com_usuario%>" hidden>
                                <input id="message_in" type="text" class="rounded-sm px-20 py-2 focus:outline-none bg-gray-100 w-full" placeholder="Escribe tu mensaje..."> 
                            </div>
                            <div class="col-4">
                                <button onclick="send()" type="button" class="btn custom-b1 rounded me-5">Enviar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

        <script src="../../recursos/scripts/websocket.js"></script>

        <%
                }
            }
        %>
    </body>
</html>
