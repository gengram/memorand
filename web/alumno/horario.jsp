<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <jsp:include page="../recursos/import.jsp"/>
        
        <link rel="stylesheet" href="../recursos/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="../recursos/styles.css" type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css" />

        
        <style>
            .zoom-button {
                transition: transform 0.2s;
                position: relative;
                opacity: 20;
            }

            .zoom-button:hover {
                transform: scale(1.2);
            }
            .iconos {
                display: none;
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
            }

            .btn:hover .iconos {
                display: block;
            }

        </style>
        <title>Horario</title>
    </head>
    <body>
        <jsp:include page="../recursos/navbar.jsp"/>

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
        <jsp:include page="../recursos/footer.jsp"/>
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
    
    <div class="modal" tabindex="-1" role="dialog" id="modalEditar">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Editar Rutina</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="hora_inicio_editar">Hora de Inicio</label>
                            <input type="time" class="form-control" id="hora_inicio_editar">
                        </div>
                        <div class="form-group">
                            <label for="rutinaname_editar">Nombre de la Rutina</label>
                            <input type="text" class="form-control" id="rutinaname_editar">
                        </div>
                        <div class="form-group">
                            <label for="hora_final_editar">Hora de Finalización</label>
                            <input type="time" class="form-control" id="hora_final_editar">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="guardarCambios">Guardar Cambios</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Variables para llevar el conteo de los botones por día
        var nidL = 1;
        var nidM = 1;
        var nidMi = 1;
        var nidJ = 1;
        var nidV = 1;
        var nidS = 1;
        var nidD = 1;

        // Esta función guarda el estado actual de los botones en localStorage
        function guardarEstado() {
            let estado = [];
            ['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo'].forEach(dia => {
                let botones = document.querySelectorAll("#botones" + dia + " ul.list-group li");
                botones.forEach(boton => {
                    estado.push({
                        dia: dia,
                        id: boton.id,
                        texto: boton.innerText
                    });
                });
            });
            localStorage.setItem('estadoBotones', JSON.stringify(estado));
        }

        // Esta función reconstruye los botones al cargar la página
        function reconstruirBotones() {
            let estado = JSON.parse(localStorage.getItem('estadoBotones')) || [];
            estado.forEach(item => {
                // Usa la función crearBoton para incluir los iconos y eventos
                let nuevoBoton = crearBoton(item.texto, item.id);

                document.getElementById("botones" + item.dia).querySelector("ul.list-group").appendChild(nuevoBoton);
            });
        }
        // Evento para agregar botones y guardar el estado
        document.getElementById("agregarBtn").addEventListener("click", function () {
            let horin = document.getElementById('hora_inicio').value;
            let horfin = document.getElementById('hora_final').value;
            let rutina = document.getElementById('rutinaname').value;
            let dia = document.getElementById('dias').value;
            var botonesActuales = document.querySelectorAll("#botones" + dia + " ul.list-group li").length;

            if (botonesActuales < 7) {
                var textoBoton = horin + "\n" + rutina + "\n" + horfin;
                var idBoton = "btnRutina" + dia[0] + "-" + (dia === 'Miercoles' ? 'Mi' : dia[0]) + botonesActuales + 1;
                var nuevoBoton = crearBoton(textoBoton, idBoton);

                document.getElementById("botones" + dia).querySelector("ul.list-group").appendChild(nuevoBoton);
                alert("Se ha agregado.");
            } else {
                alert("Se ha alcanzado el límite de 6 botones.");
            }

            // Luego de agregar un botón, guardar el estado
            guardarEstado();
        });

        
        function crearBoton(texto, id) {
            var nuevoBoton = document.createElement("li");
            nuevoBoton.className = "btn zoom-button list-group-item shadow border-primary border-1 rounded-4 mt-2";
            nuevoBoton.id = id;

            // Agregar texto e icono de borrar al botón
            nuevoBoton.innerHTML = texto +
                '<span class="iconos">' +
                '<i class="bi bi-trash borrar"></i>' +
                '</span>';

            // Evento para el botón que abre el modal de edición
            nuevoBoton.addEventListener('click', function(event) {
                event.stopPropagation(); // Evita que se active el evento del icono de borrar
                abrirModalEditar(nuevoBoton);
            });

            // Evento para el icono de borrar
            nuevoBoton.querySelector('.borrar').addEventListener('click', function(event) {
                event.stopPropagation(); // Evita que se active el evento del botón
                nuevoBoton.remove();
                guardarEstado(); // Actualizar el estado en localStorage
            });

            return nuevoBoton;
        }


        function abrirModalEditar(boton) {
            var datos = boton.innerText.split('\n');
            document.getElementById('hora_inicio_editar').value = datos[0];
            document.getElementById('rutinaname_editar').value = datos[1];
            document.getElementById('hora_final_editar').value = datos[2];

            // Configurar una función para actualizar los datos del botón después de la edición
            document.getElementById('guardarCambios').onclick = function() {
                boton.innerText = document.getElementById('hora_inicio_editar').value + '\n' +
                                  document.getElementById('rutinaname_editar').value + '\n' +
                                  document.getElementById('hora_final_editar').value;
                guardarEstado(); // Actualizar el estado en localStorage
                $('#modalEditar').modal('hide');
            };

            $('#modalEditar').modal('show');
        }
        document.getElementById('guardarCambios').onclick = function() {
        // Obtén los valores actualizados del modal
        var horaInicioActualizada = document.getElementById('hora_inicio_editar').value;
        var nombreRutinaActualizado = document.getElementById('rutinaname_editar').value;
        var horaFinalActualizada = document.getElementById('hora_final_editar').value;

        // Actualiza el botón con el nuevo contenido y los iconos
        boton.innerHTML = horaInicioActualizada + "\n" + nombreRutinaActualizado + "\n" + horaFinalActualizada +
            '<span class="iconos">' +
            '<i class="bi bi-trash borrar"></i>' +
            '</span>';

        // Vuelve a agregar el evento de clic para el icono de borrar
        boton.querySelector('.borrar').addEventListener('click', function(event) {
            event.stopPropagation(); // Evita que se active el evento del botón
            boton.remove();
            guardarEstado(); // Actualizar el estado en localStorage
        });

        guardarEstado(); // Actualizar el estado en localStorage
        $('#modalEditar').modal('hide');
    };




        // Reconstruir botones cuando se carga el documento
        document.addEventListener('DOMContentLoaded', reconstruirBotones);
    </script>

</html>
