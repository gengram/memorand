<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/import.jsp"/>
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css" type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <title>Memorand - Inicio</title>
    </head>
    <style>
        .btn.custom-b3 {
            margin-top: 10px; /* o el valor que desees */
            margin-bottom: 10px; /* o el valor que desees */
            /* Puedes también ajustar el padding si es necesario */
            padding: 10px 15px; /* ajusta según tus necesidades */
        }
        .text-start {
            margin-bottom: 20px; /* o el valor que desees */
        }
        /* Cambiar el color del ícono cuando el ratón pasa sobre el enlace */
        .nav-link:hover svg,
        .nav-link:hover i {
            fill: #00A98F; /* Cambia esto al color que desees */
        }
    </style>
    
    <%
        //PROTECCION
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        if (tipo_usuario == null || !tipo_usuario.equals("alumno")) {
            response.sendRedirect("../index.jsp");
        }

        String id_usuario = (String) session.getAttribute("id_usuario");
        String nom_usuario = (String) session.getAttribute("nom_usuario");
        String pat_usuario = (String) session.getAttribute("pat_usuario");
    %>

    <body>
        <jsp:include page="../recursos/paginas/navbar.jsp"/>
        <jsp:include page="../recursos/paginas/sidelbar.jsp"/>
        <div class="container text-center" >
            <div class="row" >
                <div class="col-1"></div>
                <div class="col-10">
                    <div class="row" ">
                        <div class="row" ">
                            <h1 class="text-start mt-5 text-gray-osc" style="font-size: 350%;">Mi Zona</h1>
                            <div class="col-3">
                                <button type="button" class="btn custom-b4 btn-lg mt-4 float-start custom-size-b1 shadow" ><a class="k" href="/memorand/alumno/horario.jsp"><svg width="74" height="74" viewBox="0 0 24 24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><path d="M12 0C5.4 0 0 5.4 0 12s5.4 12 12 12 12-5.4 12-12S18.6 0 12 0zm0 22C6.5 22 2 17.5 2 12S6.5 2 12 2s10 4.5 10 10-4.5 10-10 10z" fill="#00a98f" class="fill-000000"></path><path d="M13.9 12.5c0-.2.1-.3.1-.5 0-.7-.4-1.4-1-1.7V4c0-.6-.4-1-1-1s-1 .4-1 1v6.3c-.6.3-1 1-1 1.7 0 1.1.9 2 2 2 .2 0 .3 0 .5-.1l1.8 1.8c.4.4 1 .4 1.4 0s.4-1 0-1.4l-1.8-1.8zM12 13c-.6 0-1-.4-1-1s.4-1 1-1 1 .4 1 1-.4 1-1 1z" fill="#00a98f" class="fill-000000"></path><circle cx="20" cy="12" r="1" fill="#00a98f" class="fill-000000"></circle><circle cx="4" cy="12" r="1" fill="#00a98f" class="fill-000000"></circle><circle cx="17.7" cy="17.7" r="1" fill="#00a98f" class="fill-000000"></circle><circle cx="6.3" cy="6.3" r="1" fill="#00a98f" class="fill-000000"></circle><circle cx="12" cy="20" r="1" fill="#00a98f" class="fill-000000"></circle><circle cx="6.3" cy="17.7" r="1" fill="#00a98f" class="fill-000000"></circle><circle cx="17.7" cy="6.3" r="1" fill="#00a98f" class="fill-000000"></circle></svg><br><b>HORARIO</b></a></button>
                            </div>
                            <div class="col-3">
                                <button type="button" class="btn custom-b4 btn-lg mt-4 float-start custom-size-b1 shadow"><a class="k" href="/memorand/alumno/calendario.jsp"><i class="bi bi-calendar-week-fill custom-icon3"></i><br><b>CALENDARIO</b></a></button>
                            </div>
                            <div class="col-3">
                                <button type="button" class="btn custom-b4 btn-lg mt-4 float-start custom-size-b1 shadow"><a class="k"href="/memorand/alumno/cuaderno.jsp"><i class="bi bi-book-fill custom-icon3"></i><br><b>CUADERNO</b></a></button>
                            </div>
                            <div class="col-3">
                                <button type="button" class="btn custom-b4 btn-lg mt-4 mb-5 float-start custom-size-b1 shadow"><a class="k" href="/memorand/alumno/pendientes.jsp"><i class="bi bi-check-circle-fill custom-icon3"></i><br><b>PENDIENTES</b></a></button>
                            </div>
                            <br>
                        </div>
                        <h1 class="text-start mt-3 text-gray-osc" style="font-size: 350%;">Mis Espacios</h1><br>
                        <div class="card mb-5 shadow" style="max-width: 1070px; max-height: 170px; background-color: #FFF89A; border: none">
                            <div class="row g-0">
                                <div class="col-3">
                                    <div class="card-body">
                                        <h1 class="card-title text-center mt-4 me-4" style="font-size: 310%; color: #EEBA2B;"><b>Escuela</b></h1>
                                    </div>
                                </div>
                                <div class="col-9">
                                    <button disabled="true" type="button" class="btn custom-b4 btn-lg float-end me-5 mt-4 custom-size-b1 shadow-lg" style="height: 110px; width: 210px"><a class="l" href="/memorand/alumno/clases.jsp"><svg width="60" height="60"  viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M445.055 384.794v-162.93l-26.25 13.125v149.788l-17.504 45.008h61.25l-17.496-44.991zM229.065 306.37 121.3 252.49v53.776c0 36.243 58.764 65.625 131.25 65.625 72.49 0 131.25-29.382 131.25-65.625V252.49l-107.772 53.884c-18.447 7.307-28.515 7.305-46.963-.003Z" fill="#404040" class="fill-000000"></path><path d="m264.291 282.897 186.52-93.26c6.459-3.229 6.459-8.51 0-11.74l-186.52-93.26c-6.455-3.229-17.021-3.229-23.48 0l-186.52 93.26c-6.455 3.229-6.455 8.51 0 11.74l186.52 93.26c6.459 3.229 17.025 3.229 23.48 0Z" fill="#404040" class="fill-000000"></path></svg><br><b>CLASES</b</a></button>
                                    <button disabled="true" type="button" class="btn custom-b4 btn-lg float-start mt-4 custom-size-b1 shadow-lg" style="height: 110px; width: 210px"><b class="text-gray-clr"><a class="l" href="/memorand/alumno/foro.jsp"><svg  width="60" height="60"  viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h48v48H0z" fill="none"></path><path d="M42 12h-4v18H12v4c0 1.1.9 2 2 2h22l8 8V14c0-1.1-.9-2-2-2zm-8 12V6c0-1.1-.9-2-2-2H6c-1.1 0-2 .9-2 2v28l8-8h20c1.1 0 2-.9 2-2z" fill="#404040" class="fill-000000"></path></svg><br>FORO</a></b></button>
                                    <button type="button" class="btn custom-b4 btn-lg mx-3 float-start mt-4 ms-5 mb-5 custom-size-b1 shadow-lg" style="height: 110px; width: 210px"><a class="l" href="/memorand/alumno/verchat"><i class="bi bi-telegram custom-icon5 mt-0"></i><br><b>CHAT</b></a></button>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
                <div class="col-1"></div>
            </div>
        </div>
        <jsp:include page="../recursos/paginas/footer.jsp"/>
    </body>
</html>
