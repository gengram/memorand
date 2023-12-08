<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/import.jsp"/>
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css"  type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <title>Apunte</title>
       
    </head>
    <%
        //PROTECCION
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        if (tipo_usuario == null || !tipo_usuario.equals("alumno")) {
            response.sendRedirect("../index.jsp");
        }
    %>
    <body>
        <jsp:include page="../recursos/paginas/navbar.jsp"/>
        <jsp:include page="../recursos/paginas/sidelbar.jsp"/>
        <div class="container text-center" >
            <div class="row" >
                <div class="col-1">
                    <br><br><br>
                </div>
                <div class="col-10">
                    <div class="container">
                        <div class="col-10" >
                            <div class="row row-cols-2">
                                <div class="col-5">
                                    <h1 class="text-start mt-4 text-primary" style="font-size: 300%;">
                                        Cuaderno</h1><br>
                                </div>
                                <div class="col-1 ms-5">
                                    <button class= "custom-bsign mt-5" data-bs-toggle="modal" data-bs-target="#modalApunte">
                                        <i class="bi bi-plus-lg"></i>
                                    </button>
                                </div>
                                <div class="col-6">
                                </div>
                            </div>
                            <div class="row row-cols-3">
                                <div class="col-5 ms-3">
                                    <h1 class="text-start mt-4" style="color: #62646A;">
                                        Apuntes</h1><br>
                                    <div class="card mb-3 shadow-lg" style="max-width: 540px;">
                                        <div class="row g-0">
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card title</h5>
                                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                    <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-3 shadow-lg" style="max-width: 540px;">
                                        <div class="row g-0">
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card title</h5>
                                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                    <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-3 shadow-lg" style="max-width: 540px;">
                                        <div class="row g-0">
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card title</h5>
                                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                    <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Línea divisora vertical -->
                                <div class="col-1">
                                    <div class="mt-5">
                                        <div class="vertical-divider ms-5 border-3"></div>
                                        <div class="vertical-divider ms-5 border-3"></div>
                                        <div class="vertical-divider ms-5 border-3"></div>
                                        <div class="vertical-divider ms-5 border-3"></div>
                                        <div class="vertical-divider ms-5 border-3"></div>
                                        <div class="vertical-divider ms-5 border-3"></div>
                                        <div class="vertical-divider ms-5 border-3"></div>
                                    </div>
                                </div>
                                <div class="col-5 ms-4">
                                    <h1 class="text-start mt-4" style="color: #62646A; font-size: 300%;">
                                        Ideas</h1><br>
                                    <div class="card mb-3 shadow-lg">
                                        <div class="row g-0">
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card title</h5>
                                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                    <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-3 shadow-lg">
                                        <div class="row g-0">
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card title</h5>
                                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                    <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card mb-3 shadow-lg">
                                        <div class="row g-0">
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card title</h5>
                                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                                    <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1">
                    <button type="button" class="btn border-0 rounded-circle ms-5" style="color: #27988A;" data-bs-toggle="dropdown" aria-expanded="false">
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <i class="bi bi-question-circle-fill" style="font-size: 30px;"></i>
                        <br>
                    </button>
                </div>
            </div>
        </div>
        <jsp:include page="../recursos/paginas/footer.jsp"/>
    </body>
    <div class="modal fade" tabindex="-1" role="dialog" id="modalApunte">
        <div class="modal-dialog modal-dialog-centered text-center modal-sm" role="document">
            <div class="modal-content rounded-4 shadow">

                <div class="modal-body p-5 pt-2 mt-4">

                    <form action="login" method="post">
                        <div class="form-check ">
                            <input class="form-check-input border-1" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                            <input class="form-check-input border-1" type="radio" name="flexRadioDefault" id="flexRadioDefault1" onclick="redirigirPagina('apunte.jsp')">
                            <label class="form-check-label" for="flexRadioDefault1">
                                <b>Apunte</b>
                            </label>

                        </div>
                        <div class="form-check">
                            <input class="form-check-input border-1" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
                            <input class="form-check-input border-1" type="radio" name="flexRadioDefault" id="flexRadioDefault1" onclick="redirigirPagina('idea.jsp')">
                            <label class="form-check-label" for="flexRadioDefault1">
                                <b>Idea</b>
                            </label>
                        </div>
                    </form>

                </div>
            </div>

        </div>
    </div>
    <script>
        function redirigirPagina(pagina) {
            window.location.href = pagina;
        }
    </script>

</html>
