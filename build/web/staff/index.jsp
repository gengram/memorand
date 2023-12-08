<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <jsp:include page="../recursos/import.jsp"/>
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css" type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <title>Inicio-Staff</title>
    </head>

    <%
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        String nom_usuario = (String) session.getAttribute("nom_usuario");
        String pat_usuario = (String) session.getAttribute("pat_usuario");

        if (tipo_usuario == null || !tipo_usuario.equals("staff")) {
            response.sendRedirect("../index.jsp");
        }
    %>

    <body>
        <jsp:include page="../recursos/paginas/navbar.jsp"/>
        <jsp:include page="../recursos/paginas/sidelbar_SV.jsp"/>
        <div class="container text-center">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row">
                        <div class="row">
                            <h1 class="text-start mt-4 text-memorand" style="font-size: 350%;">Memorand ${tipo_usuario}</h1>
                            <h2 class="text-start mt-2 ms-4 text-memorand-claro">Bienvenido, ${nom_usuario} ${pat_usuario}</h2>
                            <div class="col-6">
                                <h2 class="text-start mt-3 ms-4 text-tertiary">Administradores</h2>
                                <div class="row">
                                    <div class="col-6">
                                        <button type="button" class="btn custom-b4 btn-lg mt-4 float-start custom-size-b1 shadow" ><a class="l" href="../listaadmin"><i class="bi bi-person-fill-gear custom-icon3"></i><br><b>VER ADMINISTRADORES</b></a></button>
                                    </div>
                                    <div class="col-6">
                                        <button type="button" class="btn custom-b4 btn-lg mt-4 mb-5 float-start custom-size-b1 shadow"><a class="l" href="admin.jsp?a=nuevo"><i class="bi bi-person-fill-add custom-icon3"></i><br><b>NUEVO ADMINISTRADOR</b></a></button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <h2 class="text-start mt-3 ms-4 text-tertiary">Instituciones</h2>
                                <div class="row">
                                    <div class="col-6">
                                        <button type="button" class="btn custom-b4 btn-lg mt-4 float-start custom-size-b1 shadow" ><a class="l" href="../listainst"><svg class="mb-2" width="55" height="55" viewBox="0 0 24 24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><path d="M23.3 7.5C22.5 7 12.8.2 12.8.2c-.4-.3-1.2-.3-1.6 0C11.2.2 1.4 7 .7 7.5s-.7 1-.7 1V9c0 .5.4 1 .9 1H2v12H1c-.6 0-1 .5-1 1v1h24v-1c0-.6-.5-1-1-1h-1V10h1c.5 0 1-.4 1-1v-.5s.1-.4-.7-1zM12 2l8.9 6H3.1L12 2zM3 22V10h2v12H3zm3 0V10h4v12H6zm5 0V10h2v12h-2zm3 0V10h4v12h-4zm7 0h-2V10h2v12z" fill="#00a98f" class="fill-000000"></path></svg><br><b>VER INSTITUCIONES</b></a></button>
                                    </div>
                                    <div class="col-6">
                                        <button type="button" class="btn custom-b4 btn-lg mt-4 mb-5 float-start custom-size-b1 shadow" ><a class="l" href="inst.jsp?a=nuevo"><i class="bi bi-plus-square custom-icon3"></i><br><b>NUEVA INSTITUCI&Oacute;N</b></a></button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <br><br><br><br><br><br>
                </div>
                <div class="col-1"></div>
            </div>
        </div>
        <jsp:include page="../recursos/paginas/footer.jsp"/>
    </body>
</html>

