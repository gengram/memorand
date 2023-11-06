<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="recursos/import.jsp"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <title>Clases</title>
    </head>
    <body>
        <jsp:include page="recursos/navbar.jsp"/>
        <div class="container text-center" >
            <div class="row" >
                <div class="col-1">
                    <br><br><br>
                </div>
                <div class="col-10">
                    <div class="row">
                        <h1 class="text-start mt-4 " style="color: #7BC3BC; font-size: 350%;">Clases</h1><br>
                        <div class="card  mb-3 ms-5 mt-3" style="max-width: 17rem; background-color: #ffda6a">
                            <div class="card-header text-white"><b>F&iacute;sica</b></div>
                            <div class="card-body">
                                <h5 class="card-title"><br><br><br><br><br></h5>
                                <p class="card-text"></p>
                            </div>
                        </div>
                        <div class="card text-bg-danger mb-3 ms-5 mt-3" style="max-width: 17rem;">
                            <div class="card-header text-white"><b>Algebra</b></div>
                            <div class="card-body">
                                <h5 class="card-title"><br><br><br><br><br></h5>
                                <p class="card-text"></p>
                            </div>
                        </div>
                        <div class="card  mb-3 ms-5 mt-3" style="max-width: 17rem; background-color: #D3BDFF">
                            <div class="card-header text-white"><b>Ciencias Sociales</b></div>
                            <div class="card-body">
                                <h5 class="card-title"><br><br><br><br><br></h5>
                                <p class="card-text"></p>
                            </div>
                        </div>
                        <div class="card  mb-3 ms-5 mt-4" style="max-width: 17rem;  background-color: #89BFFF">
                            <div class="card-header text-white"><b>Literatura</b></div>
                            <div class="card-body">
                                <h5 class="card-title"><br><br><br><br><br></h5>
                                <p class="card-text"></p>
                            </div>
                        </div>
                        <div class="card  mb-3 ms-5 mt-4" style="max-width: 17rem; background-color: #717273">
                            <div class="card-header text-white"><b>Historia</b></div>
                            <div class="card-body">
                                <h5 class="card-title"><br><br><br><br><br></h5>
                                <p class="card-text"></p>
                            </div>
                        </div>
                        <div class="card  mb-3 ms-5 mt-4" style="max-width: 17rem; background-color: #7ED957">
                            <div class="card-header text-white"><b>Qu&iacute;mica</b></div>
                            <div class="card-body">
                                <h5 class="card-title"><br><br><br><br><br></h5>
                                <p class="card-text"></p>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="col-1">
                    <img src="images/extras/circles.png" class="img-fluid float-start mx-4 mt-5" alt="icon" width="35" height="25">
                    <button type="button" class="btn border-0 rounded-circle ms-2" style="color: #27988A;" data-bs-toggle="dropdown" aria-expanded="false">
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <i class="bi bi-question-circle-fill" style="font-size: 30px;"></i>
                        <br>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="recursos/footer.jsp"/>
</body>
</html>
