<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es" data-bs-theme="auto">
    
    <head>
        <jsp:include page="recursos/import.jsp"/>
        <link rel="stylesheet" href="recursos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="recursos/styles.css"  type="text/css">
        <title>Memorand</title>
    </head>
    
    <body>
        <jsp:include page="recursos/shortbar.jsp"/>
        <jsp:include page="recursos/login.jsp"/>
        <jsp:include page="recursos/signup.jsp"/>
        
        <div class="container text-center" >
            <div class="row" >
                <div class="col">
                    <div class="container">
                        <div class="row">
                            <div class="col-6">
                                <img  src="images/extras/inicioM.png" class="img-fluid float-start mx-4 mt-5 shadow-lg mb-5" alt="icon" width="600" height="550">
                                <h4 class="mt-5 mb-5 p-2 text-justify text-start">Gestiona tus rutinas, tareas y convive con tus compañeros en todo momento.</h4>
                                <br><br><br><br>
                            </div>
                            <div class="col-6">
                                <br><br><br>
                                <div class="row">
                                    <br><br><br>
                                    <img  src="images/logotypes/me-bee.png" class="img-fluid float-start mx-4 w-25 h-25" alt="icon" width="250" height="83">
                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-9">
                                            <h4 class="mt-5 mb-1 p-2 text-justify text-end">Memorand es tu espacio ideal para planear tu día como estudiante en poco tiempo.</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
        
        <footer class="d-flex justify-content-between align-items-center  mt-4  border-top sticky-top">
            <a href="http://gengram.gerdoc.com/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                <img  src="images/logotypes/logoextG.png" alt="gengram" style="width: 30%;">
            </a>

            <p class="col-md-4 mb-0 text-body-secondary">&copy; 2023 Gengram srl.</p>

            <ul class="nav col-md-3 justify-content-end ">
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary my-3"><i class="bi bi-envelope-open-fill"></i>    Escribenos</a></li>
                <li class="nav-item"><a href="https://github.com/mygengram" class="nav-link px-2 text-body-secondary mx-5 my-3"><i class="bi bi-github"></i>     Github</a></li>
            </ul>
        </footer>
    </body>
    
</html>




