<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/paginas/import.jsp"/>
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css" type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <title>Memorand - Inicio</title>
    </head>
    <style>
        .l{
            text-decoration: none;
            color: #fff;
        }
        .l:hover {
            color: #62646A;
        }
    </style>
    <body>
        <jsp:include page="../recursos/paginas/navbar.jsp"/>
        <jsp:include page="../recursos/paginas/sidelbar.jsp"/>
        <div class="container text-center" >
            <div class="row" >
                <div class="col-1">
                    <br><br><br>
                </div>
                <div class="col-10">
                    <div class="row" ">
                        <h1 class="text-start mt-5 text-yellow-osc" style="font-size: 350%;">Mi Zona</h1><br>
                        <button type="button" class="btn custom-b3 btn-lg me-4 mt-4 float-start custom-size-b1" ><a class="l" href="/memorand/alumno/horario.jsp"><svg width="74" height="74" viewBox="0 0 24 24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><path d="M12 0C5.4 0 0 5.4 0 12s5.4 12 12 12 12-5.4 12-12S18.6 0 12 0zm0 22C6.5 22 2 17.5 2 12S6.5 2 12 2s10 4.5 10 10-4.5 10-10 10z" fill="#f5ea61" class="fill-000000"></path><path d="M13.9 12.5c0-.2.1-.3.1-.5 0-.7-.4-1.4-1-1.7V4c0-.6-.4-1-1-1s-1 .4-1 1v6.3c-.6.3-1 1-1 1.7 0 1.1.9 2 2 2 .2 0 .3 0 .5-.1l1.8 1.8c.4.4 1 .4 1.4 0s.4-1 0-1.4l-1.8-1.8zM12 13c-.6 0-1-.4-1-1s.4-1 1-1 1 .4 1 1-.4 1-1 1z" fill="#f5ea61" class="fill-000000"></path><circle cx="20" cy="12" r="1" fill="#f5ea61" class="fill-000000"></circle><circle cx="4" cy="12" r="1" fill="#f5ea61" class="fill-000000"></circle><circle cx="17.7" cy="17.7" r="1" fill="#f5ea61" class="fill-000000"></circle><circle cx="6.3" cy="6.3" r="1" fill="#f5ea61" class="fill-000000"></circle><circle cx="12" cy="20" r="1" fill="#f5ea61" class="fill-000000"></circle><circle cx="6.3" cy="17.7" r="1" fill="#f5ea61" class="fill-000000"></circle><circle cx="17.7" cy="6.3" r="1" fill="#f5ea61" class="fill-000000"></circle></svg><br>HORARIO</a></button>
                        <button type="button" class="btn custom-b3 btn-lg mx-4 mt-4 float-start custom-size-b1"><a class="l" href="/memorand/alumno/calendario.jsp"><i class="bi bi-calendar3 custom-icon1"></i><br>CALENDARIO</a></button>
                        <button type="button" class="btn custom-b3 btn-lg mx-4 mt-4 float-start custom-size-b1"><a class="l"href="/memorand/alumno/cuaderno.jsp"><i class="bi bi-journals custom-icon1"></i><br>CUADERNO</a></button>
                        <button type="button" class="btn custom-b3 btn-lg mx-4 mt-4 mb-5 float-start custom-size-b1"><a class="l" href="/memorand/alumno/pendientes.jsp"><i class="bi bi-check2-circle custom-icon1"></i><br>PENDIENTES</a></button>
                        <br>
                        <h1 class="text-start mt-3 text-yellow-osc" style="font-size: 350%;">Mis Espacios</h1><br>
                        <div class="card mb-3" style="max-width: 990px; max-height: 165px;background-color: #A3E3CA; border: none">
                            <div class="row g-0">
                                <div class="col-3">
                                    <div class="card-body">
                                        <h1 class="card-title text-center mt-4 text-primary-emphasis me-4" style="font-size: 310%;"><b>Escuela</b></h1>
                                    </div>
                                </div>
                                <div class="col-9">
                                    <button  type="button" class="btn custom-b3 btn-lg float-end me-5 mt-4  custom-size-b1" style="height: 110px; width: 210px"><a class="l" href="/memorand/alumno/clases.jsp"><svg width="60" height="60" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M445.055 384.794v-162.93l-26.25 13.125v149.788l-17.504 45.008h61.25l-17.496-44.991zM229.065 306.37 121.3 252.49v53.776c0 36.243 58.764 65.625 131.25 65.625 72.49 0 131.25-29.382 131.25-65.625V252.49l-107.772 53.884c-18.447 7.307-28.515 7.305-46.963-.003Z" fill="#f5ea61" class="fill-000000"></path><path d="m264.291 282.897 186.52-93.26c6.459-3.229 6.459-8.51 0-11.74l-186.52-93.26c-6.455-3.229-17.021-3.229-23.48 0l-186.52 93.26c-6.455 3.229-6.455 8.51 0 11.74l186.52 93.26c6.459 3.229 17.025 3.229 23.48 0Z" fill="#f5ea61" class="fill-000000"></path></svg><br>CLASES</a></button>
                                    <button type="button" class="btn custom-b3 btn-lg float-start ms-3 mt-4  custom-size-b1" style="height: 110px; width: 210px"><a class="l" href="/memorand/alumno/foro.jsp"><svg width="60" height="60" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h48v48H0z" fill="none"></path><path d="M42 12h-4v18H12v4c0 1.1.9 2 2 2h22l8 8V14c0-1.1-.9-2-2-2zm-8 12V6c0-1.1-.9-2-2-2H6c-1.1 0-2 .9-2 2v28l8-8h20c1.1 0 2-.9 2-2z" fill="#f5ea61" class="fill-000000"></path></svg><br>FORO</a></button>
                                    <button type="button" class="btn custom-b3 btn-lg mx-3 float-end mt-4 ms-2 mb-5 custom-size-b1" style="height: 110px; width: 210px"><a class="l" href="/memorand/alumno/verchat"><i class="bi bi-telegram custom-icon1"></i><br>CHAT</a></button>

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
</html>
