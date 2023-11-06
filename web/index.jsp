<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" data-bs-theme="auto">
    <head>
        <jsp:include page="recursos/import.jsp"/>
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
        <jsp:include page="recursos/planes.jsp"/>
        <jsp:include page="recursos/footer.jsp"/>
    </body>
</html>




