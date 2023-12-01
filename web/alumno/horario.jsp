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
        <style>
            .zoom-button {
                transition: transform 0.2s;
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
        <jsp:include page="../recursos/paginas/navbar.jsp"/>
        <jsp:include page="../recursos/paginas/sidelbar.jsp"/>
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
                        <div class="col6"><button class="btn custom-bsign mt-4"><i class="bi bi-gear"></i> Configurar mi rutina</button>
                            <button class="btn custom-bsign mt-4" data-bs-toggle="modal" data-bs-target="#modalAgregarRutina">Agregar</button></div>
                    </div>
                    <div class="row row-cols-7">
                        <div class="col">
                            <div class="card border border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>L</b></h4>
                                </div>
                                <div class="card-body" id="botonesLunes">
                                    <ul class="list-group list-group-flush">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>M</b></h4>
                                </div>
                                <div class="card-body" id="botonesMartes">
                                    <ul class="list-group list-group-flush">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>Mi</b></h4>
                                </div>
                                <div class="card-body" id="botonesMiercoles">
                                    <ul class="list-group list-group-flush">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>J</b></h4>
                                </div>
                                <div class="card-body" id="botonesJueves">
                                    <ul class="list-group list-group-flush">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>V</b></h4>
                                </div>
                                <div class="card-body" id="botonesViernes">
                                    <ul class="list-group list-group-flush">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>S</b></h4>
                                </div>
                                <div class="card-body" id="botonesSabado">
                                    <ul class="list-group list-group-flush">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card border border-primary" style="width: 8rem;">
                                <div class="card-header py-3" style="background-color: #3ba79c;">
                                    <h4 class="my-0 fw-normal text-white"><b>D</b></h4>
                                </div>
                                <div class="card-body" id="botonesDomingo">
                                    <ul class="list-group list-group-flush">
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
        <jsp:include page="../recursos/paginas/footer.jsp"/>
    </body>
    <div class="modal fade" tabindex="-1" role="dialog" id="modalAgregarRutina">
        <div class="modal-dialog modal-dialog-centered text-center" role="document">
            <div class="modal-content rounded-4 shadow">
                <div class="modal-header p-5 pb-4 border-bottom-0">
                    <h1 class="fw-bold mb-0 fs-2 text-primary ">Horario</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-5 pt-2">
                    <form method="post">
                        <div class="form-floating mb-4">
                            <input type="time" name="hora_inicio" id="hora_inicio" required placeholder="Incio"><br>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="time" name="hora_final" id="hora_final" required placeholder="Final"><br>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="text" name="rutinaname" id="rutinaname" required ><br>
                        </div>
                        <div class="form-floating mb-4">
                            <select name="dias" id="dias">
                                <option vales="Lunes">Lunes</option>
                                <option vales="Martes">Martes</option>
                                <option vales="Miercoles">Miercoles</option>
                                <option vales="Jueves">Jueves</option>
                                <option vales="Viernes">Viernes</option>
                                <option vales="Sabado">Sabado</option>
                                <option vales="Domingo">Domingo</option>
                            </select>
                        </div>
                        <button type="button" id="agregarBtn" class="w-100 mb-2 btn btn-lg rounded-3 custom-bsign">Guardar</button>
                    </form>
                    <hr class="my-4">
                    <p class="mb-3 text-primary" style="font-size: 70%;">Condiciones de uso | Política de privacidad</p>
                </div>
            </div>
        </div>
    </div>
    <script>
        var nidL = 1;
        var nidM = 1;
        var nidMi = 1;
        var nidJ = 1;
        var nidV = 1;
        var nidS = 1;
        var nidD = 1;
        let did = 'dia';
        document.getElementById("agregarBtn").addEventListener("click", function () {
            // Verifica si ya hay 6 botones
            let horin = document.getElementById('hora_inicio').value;
            let horfin = document.getElementById('hora_final').value;
            let rutina = document.getElementById('rutinaname').value;
            let dia = document.getElementById('dias').value;
            var botonesActuales = document.querySelectorAll("#botones" + dia + " " + "ul.list-group li").length;
            if (dia === "Lunes") {
                did = 'L-';
                if (botonesActuales < 7) {
                    var nuevoBoton = document.createElement("li");
                    nuevoBoton.className = "btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-2";
                    nuevoBoton.id = "btnRutina" + did + nidL;
                    nidL++;
                    nuevoBoton.innerText = horin + "\n" + rutina + "\n" + horfin;

                    document.getElementById("botonesLunes").querySelector("ul.list-group").appendChild(nuevoBoton);
                    alert("Se ha agregado.");
                } else {
                    alert("Se ha alcanzado el límite de 6 botones.");
                    nidL = 1;
                }
            } else if (dia === "Martes") {
                did = 'M-';
                if (botonesActuales < 7) {
                    var nuevoBoton = document.createElement("li");
                    nuevoBoton.className = "btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-2";
                    nuevoBoton.id = "btnRutina" + did + +nidM;
                    nidM++;
                    nuevoBoton.innerText = horin + "\n" + rutina + "\n" + horfin;

                    document.getElementById("botonesMartes").querySelector("ul.list-group").appendChild(nuevoBoton);
                    alert("Se ha agregado.");
                } else {
                    alert("Se ha alcanzado el límite de 6 botones.");
                    nidM = 1;
                }
            } else if (dia === "Miercoles") {
                did = 'Mi-';
                if (botonesActuales < 7) {
                    var nuevoBoton = document.createElement("li");
                    nuevoBoton.className = "btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-2";
                    nuevoBoton.id = "btnRutina" + did + +nidMi;
                    nidMi++;
                    nuevoBoton.innerText = horin + "\n" + rutina + "\n" + horfin;

                    document.getElementById("botonesMiercoles").querySelector("ul.list-group").appendChild(nuevoBoton);
                    alert("Se ha agregado.");
                } else {
                    alert("Se ha alcanzado el límite de 6 botones.");
                    nidMi = 1;
                }
            } else if (dia === "Jueves") {
                did = 'J-';
                if (botonesActuales < 7) {
                    var nuevoBoton = document.createElement("li");
                    nuevoBoton.className = "btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-2";
                    nuevoBoton.id = "btnRutina" + did + +nidJ;
                    nidJ++;
                    nuevoBoton.innerText = horin + "\n" + rutina + "\n" + horfin;

                    document.getElementById("botonesJueves").querySelector("ul.list-group").appendChild(nuevoBoton);
                    alert("Se ha agregado.");
                } else {
                    alert("Se ha alcanzado el límite de 6 botones.");
                    nidJ = 1;
                }
            } else if (dia === "Viernes") {
                did = 'V-';
                if (botonesActuales < 7) {
                    var nuevoBoton = document.createElement("li");
                    nuevoBoton.className = "btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-2";
                    nuevoBoton.id = "btnRutina" + did + +nidV;
                    nidV++;
                    nuevoBoton.innerText = horin + "\n" + rutina + "\n" + horfin;

                    document.getElementById("botonesViernes").querySelector("ul.list-group").appendChild(nuevoBoton);
                    alert("Se ha agregado.");
                } else {
                    alert("Se ha alcanzado el límite de 6 botones.");
                    nidV = 1;
                }
            } else if (dia === "Sabado") {
                did = 'S-';
                if (botonesActuales < 7) {
                    var nuevoBoton = document.createElement("li");
                    nuevoBoton.className = "btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-2";
                    nuevoBoton.id = "btnRutina" + did + +nidS;
                    nidS++;
                    nuevoBoton.innerText = horin + "\n" + rutina + "\n" + horfin;

                    document.getElementById("botonesSabado").querySelector("ul.list-group").appendChild(nuevoBoton);
                    alert("Se ha agregado.");
                } else {
                    alert("Se ha alcanzado el límite de 6 botones.");
                    nidS = 1;
                }
            } else if (dia === "Domingo") {
                did = 'D-';
                if (botonesActuales < 7) {
                    var nuevoBoton = document.createElement("li");
                    nuevoBoton.className = "btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-2";
                    nuevoBoton.id = "btnRutina" + did + +nidD;
                    nidD++;
                    nuevoBoton.innerText = horin + "\n" + rutina + "\n" + horfin;

                    document.getElementById("botonesDomingo").querySelector("ul.list-group").appendChild(nuevoBoton);
                    alert("Se ha agregado.");
                } else {
                    alert("Se ha alcanzado el límite de 6 botones.");
                    nidD = 1;
                }
            }

        });

    </script>
</html>
