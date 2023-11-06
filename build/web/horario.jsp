<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="recursos/import.jsp"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <style>
            .zoom-button {
                transition: transform 0.2s;
                z-index: 999999; /* Asegura que el botón esté en la capa superior */
                position: relative;
                opacity: 20;
            }

            .zoom-button:hover {
                transform: scale(1.2);
            }
        </style>
        <title>Horario</title>
    </head>
    <body>
        <jsp:include page="recursos/navbar.jsp"/>
        <div class="container text-center" >
            <div class="row" >
                <div class="col-1">
                    <br><br><br>
                </div>
                <div class="col-10">
                    <div class="row row-cols-2">
                        <div class="col6">
                            <h1 class="text-start mt-4" style="color: #62646A; font-size: 300%;"><svg width="60" height="60" viewBox="0 0 24 24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><path d="M12 0C5.4 0 0 5.4 0 12s5.4 12 12 12 12-5.4 12-12S18.6 0 12 0zm0 22C6.5 22 2 17.5 2 12S6.5 2 12 2s10 4.5 10 10-4.5 10-10 10z" fill="#26988a" class="fill-000000"></path><path d="M13.9 12.5c0-.2.1-.3.1-.5 0-.7-.4-1.4-1-1.7V4c0-.6-.4-1-1-1s-1 .4-1 1v6.3c-.6.3-1 1-1 1.7 0 1.1.9 2 2 2 .2 0 .3 0 .5-.1l1.8 1.8c.4.4 1 .4 1.4 0s.4-1 0-1.4l-1.8-1.8zM12 13c-.6 0-1-.4-1-1s.4-1 1-1 1 .4 1 1-.4 1-1 1z" fill="#26988a" class="fill-000000"></path><circle cx="20" cy="12" r="1" fill="#26988a" class="fill-000000"></circle><circle cx="4" cy="12" r="1" fill="#26988a" class="fill-000000"></circle><circle cx="17.7" cy="17.7" r="1" fill="#26988a" class="fill-000000"></circle><circle cx="6.3" cy="6.3" r="1" fill="#26988a" class="fill-000000"></circle><circle cx="12" cy="20" r="1" fill="#26988a" class="fill-000000"></circle><circle cx="6.3" cy="17.7" r="1" fill="#26988a" class="fill-000000"></circle><circle cx="17.7" cy="6.3" r="1" fill="#26988a" class="fill-000000"></circle></svg>
                                Mi Zona</h1><br>
                        </div>
                        <div class="col6"><button class="btn custom-bsign mt-4"><i class="bi bi-gear"></i> Configurar mi rutina</button></div>
                    </div>
                    <div class="row row-cols-7">
                        <div class="col">
                            <div class="card border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>L</b></h4>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>M</b></h4>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>Mi</b></h4>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>J</b></h4>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>V</b></h4>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>S</b></h4>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>D</b></h4>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                        <li class="btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-1"><br></li>
                                    </ul>
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
        <jsp:include page="recursos/footer.jsp"/>
    </body>
</html>
