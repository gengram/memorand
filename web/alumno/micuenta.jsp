<%-- 
    Memorand by Gengram © 2023
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mi Cuenta</title>
        <jsp:include page="../recursos/paginas/import.jsp"/>

        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css"  type="text/css">
    </head>
    <body>
        <jsp:include page="../recursos/paginas/navbar.jsp"/>
        <jsp:include page="../recursos/paginas/sidelbar.jsp"/>
        <div class="container text-center" >
            <div class="row" >
                <div class="col-1">
                    <br><br><br>
                </div>
                <div class="col-10">
                    <div class="row row-cols-2">
                        <div class="col-5">
                            <h1 class="text-start mt-4 text-primary" style="font-size: 300%;">
                                Mi Cuenta</h1><br>
                        </div>
                        <div class="col-1 ms-5">

                        </div>
                        <div class="col-6">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6" style="background-color: coral">
                            <div class="row row-cols-1">
                                <div class="col-12" style="background-color: #6610f2">
                                    <h1 class="text-start  text-tertiary" style="font-size: 250%;">
                                        Informaci&oacute;n personal</h1><br>
                                </div>
                            </div>
                            <div class="row ">
                                <div class="col-12" style="background-color: #6610f2">
                                    <h1 class="text-start text-tertiary ms-4" style="font-size: 140%;">
                                        Nombre </h1><br>
                                </div>
                                <div class="col-6" style="background-color: #00A98F">
                                    <h1 class="text-start  text-tertiary ms-4 mt-4" style="font-size: 110%;">
                                        Nombre del usuario </h1><br>
                                </div>
                                <div class="col-6" style="background-color: #e685b5">
                                    <div class="btn-group mt-4" role="" aria-label="Basic example">
                                        <button type="button" class="btn btn-primary rounded-circle"></button>
                                        <button type="button" class="btn btn-primary rounded-circle ms-3"></button>
                                        <button type="button" class="btn btn-primary rounded-circle ms-3"></button>
                                        <button type="button" class="btn btn-primary rounded-circle ms-3"></button>
                                        <button type="button" class="btn btn-primary rounded-circle ms-3"></button>
                                        <button type="button" class="btn btn-primary rounded-circle ms-3"></button>
                                        <br>
                                    </div>
                                </div> 

                            </div>
                        </div>
                        <div class="col-6 mt-0 border-5 border-start">
                            <div class="row" >
                                <div class="col-6">
                                    <div class="row row-cols-2">
                                        <div class="col-5 ms-5">
                                            <h1 class="text-start  text-tertiary" style="font-size: 250%;">
                                                Suscripci&oacute;n</h1><br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-1">

            </div>
        </div>
    </div>
    <jsp:include page="../recursos/paginas/footer.jsp"/>
</body>
</html>
