<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/import.jsp"/>
        <link rel="stylesheet" href="../recursos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/styles.css"  type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <title>Apunte</title>
        <style>
            .text-editor {
                border: 1px solid #ccc;
                padding: 10px;
                min-height: 100px;
                text-align: left;
            }
        </style>
        <style>
            .vertical-divider {
                border-left: 1px solid #ccc; /* Puedes ajustar el color y el grosor según tus necesidades */
                height: 100px; /* Ajusta la altura según tus necesidades */
                margin: 0 10px; /* Ajusta el margen según tus necesidades */
            }
        </style>
    </head>
    <body>
        <jsp:include page="../recursos/navbar.jsp"/>
        <div class="container text-center" >
            <div class="row" >
                <div class="col-1">
                    <br><br><br>
                </div>
                <div class="col-10" >
                    <div class="row row-cols-2">
                        <div class="col-5">
                            <h1 class="text-start mt-4 text-primary" style="font-size: 300%;">
                                Cuaderno</h1><br>
                        </div>
                        <div class="col-1 ms-3">

                            <button class= "custom-bsign mt-5"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy-fill" viewBox="0 0 16 16">
                                <path d="M0 1.5A1.5 1.5 0 0 1 1.5 0H3v5.5A1.5 1.5 0 0 0 4.5 7h7A1.5 1.5 0 0 0 13 5.5V0h.086a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5H14v-5.5A1.5 1.5 0 0 0 12.5 9h-9A1.5 1.5 0 0 0 2 10.5V16h-.5A1.5 1.5 0 0 1 0 14.5v-13Z"/>
                                <path d="M3 16h10v-5.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5V16Zm9-16H4v5.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5V0ZM9 1h2v4H9V1Z"/>
                                </svg>
                            </button>
                        </div>
                        <div class="col-6">
                        </div>
                    </div>
                    <div class="row row-cols-3">
                        <div class="col-5">
                            <h1 class="text-start mt-4" style="color: #62646A; ;">
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
                        <div class="col-1 me-5">
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
                        <div class="col-5">
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
                <div class="col-1">
                    <button type="button" class="btn border-0 rounded-circle ms-5" style="color: #27988A;" data-bs-toggle="dropdown" aria-expanded="false">
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <i class="bi bi-question-circle-fill" style="font-size: 30px;"></i>
                        <br>
                    </button>
                </div>
            </div>
        </div>
        <jsp:include page="../recursos/footer.jsp"/>
    </body>
</html>
