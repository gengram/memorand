<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es" data-bs-theme="auto">
    
    <head>
        <jsp:include page="recursos/import.jsp"/>
        <link rel="stylesheet" href="recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="recursos/estilos/styless.css"  type="text/css">
        <title>Memorand</title>
    </head>
    
    <body>
        <jsp:include page="recursos/paginas/shortbar.jsp"/>
        <jsp:include page="recursos/paginas/login.jsp"/>
        <jsp:include page="recursos/paginas/signup.jsp"/>
        
        <div class="container text-center" >
            <div class="row" >
                <div class="col">
                    <div class="container">
                        <div class="row">
                            <div class="col-6">
                                <img  src="recursos/imagenes/extras/inici.png" class="img-fluid float-start mx-4 mt-5 shadow-lg mb-5" alt="icon" width="600" height="550">
                                <h4 class="mt-5 mb-5 p-2 text-justify text-start">Gestiona tus rutinas, tareas y convive con tus compañeros en todo momento.</h4>
                                <br><br><br><br>
                            </div>
                            <div class="col-6">
                                <br><br><br>
                                <div class="row">
                                    <br><br><br>
                                    <img  src="recursos/imagenes/logotypes/me-bee.png" class="img-fluid float-start mx-4 w-25 h-25" alt="icon" width="250" height="83">
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
        
        <div class="container-fluid bg-body-tertiary" style="padding:5%;" id="contacto">
            <div class="row">
                <div class="col-4 text-center">
                    <a href="http://gengram.gerdoc.com/"><img src="recursos/imagenes/logotypes/logoextG.png" alt="gengram" style="width: 30%;"></a>
                    <h2 class="text-body-tertiary"><strong>Contacto</strong></h2>
                    <h6 class="text-body-tertiary">&copy; gengram 2023</h6>
                </div>
                <div class="col-8 text-left">
                    <a style="text-decoration: none" href="mailto:mygengram@gmail.com?Subject=Hola">
                        <h6><i class="fa fa-envelope"></i>  Escr&iacute;benos</h6>
                    </a>
                    <a style="text-decoration: none" href="https://github.com/mygengram">
                        <h6><i class="bi bi-github"></i>  Repositorios</h6>
                    </a>
                </div>
            </div>
        </div>
        
    </body>
    
</html>




