<%@page import="com.memorand.beans.Canva"%>
<%@page import="com.memorand.controller.CanvasController"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.memorand.beans.Task"%>
<%@page import="com.memorand.controller.TasksController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String canva_id = request.getParameter("id");

    if (canva_id != null) {
        String task_id = "";
        String canva_name = "", canva_draw = "", canva_status = "";
        Timestamp canva_cdate, canva_mdate;

        CanvasController canvac = new CanvasController();
        Canva canva = canvac.modelGetCanvaById(canva_id);

        if (canva != null) {
            TasksController taskc = new TasksController();
            Task task = taskc.modelgetTaskByTool("canvas", "canva_id", canva_id);

            task_id = task.getTask_id();

            canva_name = canva.getCanva_name();
            canva_draw = canva.getCanva_draw();
            canva_status = canva.getCanva_status();

            canva_cdate = canva.getCanva_cdate();
            canva_mdate = canva.getCanva_mdate();
%>
<html>
    <head>
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

        <title>Memorand</title>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/4.5.0/fabric.min.js"></script>
        <!-- Edit-Image -->

        <style>
            body, html {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
            }

            #canvas-container {
                width: 100%;
                height: 100%;
                position: relative;
            }

            canvas {
                display: block;
                border: 2px solid #E3E4E5;
                cursor: move;
                width: 100%;
                height: 100%;
                box-sizing: border-box;
            }

            .modal-body {
                overflow: hidden;
            }

            .modal-lg {
                max-width: 80%;
            }

            cropper-container {
                width: 100%;
                height: 80vh;
            }
            .contenedor {
                position: relative;
                width: 400px;
                height: 300px;
            }


            .capa1 {
                top: 15px;
                z-index: 2;
                align-content: center;
                position: absolute;
            }
            .capa2 {
                top: 10px;
                z-index: 6;
                position: absolute;
                text-align: center;
            }
            .capa3 {
                top: 170px;
                left: 35px;
                z-index: 4;
                align-content: center;
                position: absolute;
            }
            .capa4 {
                top: 80px;
                left: 35px;
                align-content: center;
                z-index: 5;
                position: absolute;
            }

            .icon-tools {
                font-size: 24px;
            }
            .icon-card {
                font-size: 20px;
            }
            .btn-h{
                border-color: #25ce7b;
                background-color: transparent;
                color: #25ce7b;
            }
            .btn-h:focus {
                border-color: #BDECD5;
                background-color: #BDECD5;
                color: #000;
            }
            .btn-h:active {
                color: #000;
                border-color: #E3E4E5;
                background-color: #E3E4E5;
            }
            .btn-h:hover {
                color: #25ce7b;
                background-color: #BDECD5;
                border-color: #25ce7b;
            }
            .btn-check + .btn:hover {
                color: #25ce7b;
                background-color: #BDECD5;
                border-color: #25ce7b;
            }
            .btn-check:focus-visible + .btn {
                border-color: #BDECD5;
                background-color: #BDECD5;
                color: #000;
            }
            .btn-check:checked + .btn, :not(.btn-check) + .btn:active, .btn:first-child:active, .btn.active, .btn.show {
                border-color: #BDECD5;
                background-color: #BDECD5;
                color: #000;
            }
            .form-check-input:checked {
                background-color: #25ce7b;
                border-color: #E3E4E5;
            }

        </style>
    </head>
    <body>

        <div id="canvas-container">
            <canvas id="canvas"></canvas>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <div class="btn-group dropend capa2 start-0 ms-4">
                        <button type="button" class="btn btn-light rounded-2 des" style="border-color: #E3E4E5" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-list" style="font-size: 25px"></i>
                        </button>
                        <ul class="dropdown-menu shadow ms-2 mt-0">
                            <li><a href="tarea.jsp?id=<%= task_id%>" class="dropdown-item"><i class="bi  bi-box-arrow-left me-2" style="color: #25ce7b"></i>Imagen</a></li>
                            <li><a id="download-image" class="dropdown-item"><i class="bi bi-image me-2" style="color: #25ce7b"></i>Imagen</a></li>
                            <li><a id="download-svg" class="dropdown-item"><i class="bi bi-download me-2" style="color: #25ce7b"></i>SVG</a></li>
                            <li>
                                <input type="file" class="custom-file-input"  id="upload-svg" accept="image/svg+xml" multiple/>
                                <label for="upload-svg" class="custom-file-input-label btn-light  ms-1 border-0" id="customFileLabel"><i class="bi bi-upload me-2"></i><text style="color: #000">Insertar</text></label>
                            </li>
                            <li>
                                <input type="file" class="custom-file-input"  id="uploads-svg" accept="image/svg+xml" multiple/>
                                <label for="uploads-svg" class="custom-file-input-label btn-light  ms-1 border-0" id="customFileLabel"><i class="bi bi-upload me-2"></i><text style="color: #000">Ins elementos</text></label>
                            </li>
                            <li><a id="DB-svg" class="dropdown-item"><i class="bi bi-save-fill me-2" style="color: #25ce7b"></i>Guardar</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-8">
                    <div class="btn-group capa1 shadow-lg" style=" margin-left: 10rem " role="group" aria-label="Basic radio toggle button group">
                        <button id="openModalButton" type="button" class="btn btn-h des"><i class="bi bi-boxes icon-tools"></i></button>
                        <button id="figuras" type="button" class="btn btn-h des">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <g clip-path="url(#clip0_1651_4085)"><path fill-rule="evenodd" clip-rule="evenodd" d="M12 -0.0397949L18.2098 10.9999H5.79015L12 -0.0397949ZM9.20985 8.99993H14.7902L12 4.03966L9.20985 8.99993Z" fill="#25ce7b"/><path fill-rule="evenodd" clip-rule="evenodd" d="M1 17.9999C1 15.2385 3.23858 12.9999 6 12.9999C8.76142 12.9999 11 15.2385 11 17.9999C11 20.7614 8.76142 22.9999 6 22.9999C3.23858 22.9999 1 20.7614 1 17.9999ZM6 14.9999C4.34315 14.9999 3 16.3431 3 17.9999C3 19.6568 4.34315 20.9999 6 20.9999C7.65685 20.9999 9 19.6568 9 17.9999C9 16.3431 7.65685 14.9999 6 14.9999Z" fill="#25ce7b"/><path fill-rule="evenodd" clip-rule="evenodd" d="M13 12.9999H23V22.9999H13V12.9999ZM15 14.9999V20.9999H21V14.9999H15Z" fill="#25ce7b"/></g><defs><clipPath id="clip0_1651_4085"><rect width="24" height="24" fill="white"/></clipPath></defs>
                            </svg>
                        </button>

                        <button id="add-text" type="button" class="btn btn-h des"><i class="bi bi-textarea-t icon-tools"></i></button>
                        <button id="line" type="button" class="btn btn-h des"><i class="bi bi-slash-lg icon-tools"></i></button>

                        <button id="free-drawing" type="button" class="btn btn-h"><i class="bi bi-brush-fill icon-tools"></i></button>

                        <button id="add-image" type="button" class="btn btn-h des"><i class="bi bi-images icon-tools"></i></button>
                        <button id="delete-all" type="button" class="btn btn-h des"><i class="bi bi-trash3 icon-tools"></i></button>
                        <button id="delete-selected" type="button" class="btn btn-h des"><i class="bi bi-eraser-fill icon-tools"></i></button>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel">Plantillas</h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-2">
                                <div class="list-group list-group-flush rounded-2">
                                    <button type="button" class="list-group-item list-group-item-action list-group-item-memorand active" aria-current="true">
                                        Todos
                                    </button>
                                    <button type="button" class="list-group-item list-group-item-action list-group-item-memorand" aria-current="true">
                                        Mapa conceptual
                                    </button>
                                    <button type="button" class="list-group-item list-group-item-action list-group-item-memorand">Mapa mental</button>
                                    <button type="button" class="list-group-item list-group-item-action list-group-item-memorand">Diagramas</button>
                                    <button type="button" class="list-group-item list-group-item-action list-group-item-memorand">Otros</button>
                                </div>
                            </div>
                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    const card = document.getElementById("organigramaCard");
                                    card.addEventListener("click", function () {
                                        console.log("Card clicked!");
                                    });
                                });
                            </script>
                            <div class="col-10">
                                <div class="row">
                                    <div class="col-3">
                                        <div class="card shadow" type="button" style="height: 9.5rem;" id="organigramaCard">
                                            <div class="card-header">
                                                Organigrama
                                            </div>
                                            <div class="card-body">
                                                <img width="200" height="70" src="../XM-Resources/imagen/plantillas/diagrama.png" class="img-fluid rounded-start ms-2 mb-2" alt="...">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="card shadow" style="height: 9.5rem;">
                                            <div class="card-header">
                                                Organigrama
                                            </div>
                                            <div class="card-body">
                                                <img width="200" height="70" src="../XM-Resources/imagen/plantillas/diagrama.png" class="img-fluid rounded-start ms-2 mb-2" alt="...">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="card shadow" style="height: 9.5rem;">
                                            <div class="card-header">
                                                Organigrama
                                            </div>
                                            <div class="card-body">
                                                <img width="200" height="70" src="../XM-Resources/imagen/plantillas/diagrama.png" class="img-fluid rounded-start ms-2 mb-2" alt="...">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="card shadow" style="height: 9.5rem;">
                                            <div class="card-header">
                                                Organigrama
                                            </div>
                                            <div class="card-body">
                                                <img width="200" height="70" src="../XM-Resources/imagen/plantillas/diagrama.png" class="img-fluid rounded-start ms-2 mb-2" alt="...">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-3">
                                        <div class="card shadow" style="height: 9.5rem;">
                                            <div class="card-header">
                                                Organigrama
                                            </div>
                                            <div class="card-body">
                                                <img width="200" height="70" src="../XM-Resources/imagen/plantillas/diagrama.png" class="img-fluid rounded-start ms-2 mb-2" alt="...">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="card shadow" style="height: 9.5rem;">
                                            <div class="card-header">
                                                Organigrama
                                            </div>
                                            <div class="card-body">
                                                <img width="200" height="70" src="../XM-Resources/imagen/plantillas/diagrama.png" class="img-fluid rounded-start ms-2 mb-2" alt="...">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="card shadow" style="height: 9.5rem;">
                                            <div class="card-header">
                                                Organigrama
                                            </div>
                                            <div class="card-body">
                                                <img width="200" height="70" src="../XM-Resources/imagen/plantillas/diagrama.png" class="img-fluid rounded-start ms-2 mb-2" alt="...">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="card shadow" style="height: 9.5rem;">
                                            <div class="card-header">
                                                Organigrama
                                            </div>
                                            <div class="card-body">
                                                <img width="200" height="70" src="../XM-Resources/imagen/plantillas/diagrama.png" class="img-fluid rounded-start ms-2 mb-2" alt="...">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn custom-bsign rounded-pill">Insertar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="card shadow capa4" >
            <div class="card-body">
                <div class="row">
                    <div class="col-12">
                        <input class="ms-3 me-3 form-control form-control-color" type="color" id="color" value="#000000">
                    </div>
                </div>
            </div>
        </div>

        <div class="card-container capa3">
            <div class="card shadow" id="card1" style="display: none;">
                <div class="card-body ms-3 me-3 mb-2">
                    <div class="row mt-2">
                        <div class="col-12">
                            <label for="grosor">Grosor del lápiz:</label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-6 text-center">
                            <input type="range" id="grosor" min="1" max="60" value="4">
                        </div>
                    </div>
                </div>
            </div>
            <div class="card shadow mt-2" id="card2" style="display: none;">
                <div class="card-body ms-3 me-3 mt-2 mb-2">
                    <div class="row ms-3">
                        <div class="col-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="shape-fill" checked>
                                <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g><path d="M0 0h24v24H0z" fill="none"/><path d="M19.228 18.732l1.768-1.768 1.767 1.768a2.5 2.5 0 1 1-3.535 0zM8.878 1.08l11.314 11.313a1 1 0 0 1 0 1.415l-8.485 8.485a1 1 0 0 1-1.414 0l-8.485-8.485a1 1 0 0 1 0-1.415l7.778-7.778-2.122-2.121L8.88 1.08zM11 6.03L3.929 13.1H18.07L11 6.03z"/></g>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="btn-group" role="group" aria-label="Basic outlined example">
                            <button id="square" type="button" class="btn btn-h ms-2"><i class="bi bi-square icon-card"></i></button>
                            <button id="diamond" type="button" class="btn btn-h me-3"><i class="bi bi-diamond icon-card"></i></button>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="btn-group" role="group" aria-label="Basic outlined example">
                            <button id="circle" type="button" class="btn btn-h ms-2"><i class="bi bi-circle icon-card"></i></button>
                            <button id="rectangle" type="button" class="btn btn-h me-3"><i class="bi bi-tablet-landscape icon-card"></i></button>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Incluye jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Incluye Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                                // Función para mostrar el modal al cargar la página
                                $(document).ready(function () {
                                    $('#myModal').modal('show');
                                });

                                // Función para mostrar el modal al hacer clic en el botón
                                $('#openModalButton').click(function () {
                                    $('#myModal').modal('show');
                                });
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Event listener para el botón "figuras"
                document.getElementById('figuras').addEventListener('click', function () {
                    document.getElementById('card2').style.display = 'block'; // Mostrar la tarjeta 2
                    document.getElementById('card1').style.display = 'none'; // Ocultar la tarjeta 1
                });

                // Event listener para el botón "free-drawing"
                document.getElementById('free-drawing').addEventListener('click', function () {
                    document.getElementById('card1').style.display = 'block'; // Mostrar la tarjeta 1
                    document.getElementById('card2').style.display = 'none'; // Ocultar la tarjeta 2
                });

                // Event listener para los otros botones
                var otrosBotones = ['add-text', 'line', 'add-image', 'delete-all', 'delete-selected'];
                otrosBotones.forEach(function (id) {
                    document.getElementById(id).addEventListener('click', function () {
                        var cardContainer = document.querySelector('.card-container');
                        var cards = cardContainer.querySelectorAll('.card');
                        cards.forEach(function (card) {
                            card.style.display = 'none'; // Ocultar todas las tarjetas dentro del contenedor
                        });
                    });
                });
            });

            function openFileInput() {
                const input = document.getElementById('upload-svg');
                input.click();

                // Desvincular el botón personalizado temporalmente
                document.getElementById('customFileLabel').removeAttribute('onclick');

                // Volver a vincular el botón después de un breve retraso
                setTimeout(() => {
                    document.getElementById('customFileLabel').setAttribute('onclick', 'openFileInput()');
                }, 100);
            }

            function updateFileName() {
                const input = document.getElementById('upload-svg');
                const fileNameDisplay = document.getElementById('customFileLabel');
                const fileName = input.value.split('\\').pop(); // Obtener el nombre del archivo seleccionado

                fileNameDisplay.textContent = fileName ? fileName : 'Ningún archivo ha sido elegido';

                // Restablecer el valor del input de archivo
            }

        </script>

        <script>
            var canvas = new fabric.Canvas('canvas', {
                width: 3000,
                height: 2500,
                backgroundColor: '#fff',
                preserveObjectStacking: true
            });

            var drawingMode = false;
            var panningEnabled = false;

            // Variable para almacenar los objetos del lienzo
            var canvasObjects = [];
            // Booleano para controlar si se deben almacenar los objetos en formato SVG
            var saveSVG = true;

            // Array list para almacenar los objetos en formato SVG
            var svgObjects = [];
            var pencilPathsSVG = [];

            // Función para agregar un objeto al lienzo y almacenarlo en canvasObjects
            function addObjectToCanvas(object) {
                // Agrega el objeto al lienzo
                canvas.add(object);
                // Almacena el objeto y sus propiedades en canvasObjects
                canvasObjects.push({
                    type: object.type, // Tipo de objeto (por ejemplo, 'circle', 'rect', etc.)
                    properties: object.toObject(['left', 'top', 'width', 'height', 'fill', 'stroke', 'strokeWidth']) // Propiedades del objeto
                });

                // Si saveSVG es true, convierte el objeto a SVG y lo almacena en svgObjects
                if (saveSVG) {
                    console.log('saveSVG es true. Convirtiendo objeto a SVG');
                    var clonedObject = fabric.util.object.clone(object);
                    var svgObject = clonedObject.toSVG();
                    svgObjects.push(svgObject);

                    // Verificar si el objeto es un trazo del lápiz y convertirlo a SVG si es necesario


                } else {
                    console.log('saveSVG es false. No se convierte el objeto a SVG');
                }
            }

            document.getElementById('DB-svg').addEventListener('click', function () {
                saveSVG = true; // Establece saveSVG como true para comenzar a almacenar objetos en formato SVG

                // Verifica si svgObjects contiene elementos antes de iterar sobre ellos
                if (svgObjects.length === 0) {
                    console.log('svgObjects está vacío. No hay elementos para procesar.');
                } else {
                    console.log('svgObjects contiene ' + svgObjects.length + ' elementos.');

                    // Itera sobre todos los objetos en svgObjects y haz lo que necesites con ellos
                    svgObjects.forEach(function (svgObject, index) {
                        // Aquí puedes guardar svgObject en la base de datos o hacer cualquier otra cosa que necesites
                        console.log(svgObject);
                    });
                }

                if (pencilPathsSVG.length === 0) {
                    console.log('pencilPathObjects está vacío. No hay elementos para procesar.');
                } else {

                    // Itera sobre todos los trazos creados con el lápiz y haz lo que necesites con ellos
                    pencilPathsSVG.forEach(function (pencilPaths, index) {
                        // Aquí puedes guardar pathSVG en la base de datos o hacer cualquier otra cosa que necesites
                        console.log('Trazo de lápiz SVG #' + (index + 1) + ':', pencilPaths);
                    });
                }
            });

            function toggleDrawingMode() {
                drawingMode = !drawingMode;
                canvas.isDrawingMode = drawingMode;
            }

            // Escucha el evento 'path:created' para capturar los trazos del lápiz creados
            canvas.on('path:created', function (event) {
                var path = event.path;
                console.log('Nuevo trazo de lápiz creado:', path);
                var pencilPathSVG = path.toSVG();
                pencilPathsSVG.push(pencilPathSVG);

                // Aquí puedes realizar cualquier acción adicional con el trazo creado, si es necesario
            });

            function togglePanning() {
                panningEnabled = !panningEnabled;
                canvas.selection = panningEnabled;
                canvas.defaultCursor = panningEnabled ? 'default' : 'move';
            }

            // Event listener para cambiar el color de los objetos seleccionados
            document.getElementById('color').addEventListener('change', function () {
                var selectedObjects = canvas.getActiveObjects();
                if (selectedObjects.length > 0) {
                    selectedObjects.forEach(function (object) {
                        // Verificar si el objeto es un círculo, un cuadrado o un rectángulo
                        if (object instanceof fabric.Circle || object instanceof fabric.Rect || object instanceof fabric.Polygon) {
                            object.set('fill', this.value); // Cambiar el relleno
                            object.set('stroke', this.value); // Cambiar el contorno
                        }
                        // Verificar si el objeto es un texto
                        else if (object instanceof fabric.Textbox) {
                            object.set('fill', this.value); // Cambiar el color del texto
                        }
                    }, this);
                    canvas.renderAll();
                }
            });

            // Función para activar o desactivar el modo de dibujo libre
            document.getElementById('free-drawing').addEventListener('click', function () {
                canvas.isDrawingMode = !canvas.isDrawingMode;
            });

            document.getElementById('delete-selected').addEventListener('click', function () {
                var activeObjects = canvas.getActiveObjects();
                if (activeObjects.length > 0) {
                    activeObjects.forEach(function (object) {
                        canvas.remove(object);
                    });
                }
            });

            document.getElementById('delete-all').addEventListener('click', function () {
                canvas.getObjects().forEach(function (obj) {
                    if (!(obj instanceof fabric.Line)) {
                        canvas.remove(obj);
                    }
                });
            });

            document.addEventListener('keydown', function (e) {
                var activeObject = canvas.getActiveObject();
                if (activeObject && activeObject.type === 'textbox' && activeObject.isEditing) {
                    // Si el objeto activo es un textbox y está en modo de edición, no realizar ninguna acción
                    return;
                }

                if (e.keyCode === 46 || e.keyCode === 8) { // Código de tecla para borrar
                    var activeObject = canvas.getActiveObject();
                    if (activeObject) {
                        canvas.remove(activeObject);
                    }
                }
            });

            // Función para descargar la imagen del lienzo
            document.getElementById('download-image').addEventListener('click', function () {
                var link = document.createElement('a');
                link.href = canvas.toDataURL({
                    format: 'png',
                    quality: 1
                });
                link.download = 'lienzo.png';
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            });

            document.getElementById('download-svg').addEventListener('click', function () {
                // Itera sobre todos los objetos en el lienzo
                //toggleGrid();
                const svgContent = canvas.toSVG();

                // Crea un objeto Blob con el contenido SVG
                const blob = new Blob([svgContent], {type: 'image/svg+xml'});

                // Crea un objeto URL para el Blob
                const url = window.URL.createObjectURL(blob);

                // Crea un enlace para descargar el archivo
                const a = document.createElement('a');
                a.href = url;
                a.download = 'canvas.svg'; // Nombre del archivo
                document.body.appendChild(a);

                // Simula el clic en el enlace para iniciar la descarga
                a.click();

                // Elimina el enlace del DOM
                document.body.removeChild(a);

                //toggleGrid();
            });

            document.getElementById('download-image').addEventListener('click', function () {
                downloadImage();
            });

            canvas.freeDrawingBrush.color = '#000000';
            canvas.freeDrawingBrush.width = 4;

            // Función para cambiar el color del lápiz
            document.getElementById('color').addEventListener('change', function () {
                canvas.freeDrawingBrush.color = this.value;
            });

            // Función para cambiar el grosor del lápiz
            document.getElementById('grosor').addEventListener('change', function () {
                canvas.freeDrawingBrush.width = parseInt(this.value, 10) || 1;
            });

            function disableDrawingMode() {
                drawingMode = false;
                canvas.isDrawingMode = drawingMode;

                // Obtener todos los objetos del lienzo
                var objects = canvas.getObjects();

                // Filtrar los trazos del lápiz que están en modo de edición
                var pencilPaths = objects.filter(function (object) {
                    return object instanceof fabric.Path && object.isEditing && object.paintFirstVertex;
                });

                // Recorrer los trazos del lápiz y agregar sus datos SVG al array pencilPathsSVG
                pencilPaths.forEach(function (path) {
                    var pencilPathSVG = path.toSVG();
                    pencilPathsSVG.push(pencilPathSVG);
                });
            }

            document.querySelectorAll('.des').forEach((button) => {
                button.addEventListener('click', () => {
                    disableDrawingMode();
                });
            });


            canvas.on('mouse:move', function (opt) {
                if (panningEnabled && opt && opt.e && opt.e.buttons === 1) {
                    var delta = new fabric.Point(opt.e.movementX, opt.e.movementY);
                    canvas.relativePan(delta);
                }
            });

            canvas.on('mouse:down', function (opt) {
                var evt = opt.e;
                if (evt.altKey === true) {
                    this.isDragging = true;
                    this.selection = false;
                    this.lastPosX = evt.clientX;
                    this.lastPosY = evt.clientY;
                }
            });

            var isAddingNewElement = false; // Variable para controlar si se está agregando un nuevo elemento
            var elementTypeToAdd = ''; // Variable para almacenar el tipo de elemento que se está agregando

            // Event listener para los botones de formas
            document.getElementById('circle').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'circle';
            });

            document.getElementById('square').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'square';
            });

            document.getElementById('diamond').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'diamond';
            });

            document.getElementById('rectangle').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'rectangle';
            });

            document.getElementById('line').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'line';
            });

            document.getElementById('add-text').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'text';
            });

            document.getElementById('add-image').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'image';
            });

            document.getElementById('uploads-svg').addEventListener('click', function () {
                isAddingNewElement = true;
                elementTypeToAdd = 'svg';
            });


            // Event listener para el lienzo
            canvas.on('mouse:down', function (event) {
                // Verificar si se está agregando un nuevo elemento
                if (isAddingNewElement) {
                    // Obtener las coordenadas del clic dentro del lienzo
                    var pointer = canvas.getPointer(event.e);

                    var x1 = pointer.x;
                    var y1 = pointer.y;
                    // Guardar las coordenadas en la consola
                    console.log('Coordenadas del clic: x1 = ' + x1 + ', y1 = ' + y1);

                    // Crear el nuevo elemento según el tipo de elemento a agregar
                    if (elementTypeToAdd === 'circle') {
                        var circle = new fabric.Circle({
                            radius: 50,
                            fill: document.getElementById('shape-fill').checked ? document.getElementById('color').value : '',
                            stroke: document.getElementById('color').value,
                            strokeWidth: 2,
                            left: x1 - 50,
                            top: y1 - 50
                        });
                        addObjectToCanvas(circle); // Agrega el círculo al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'square') {
                        var square = new fabric.Rect({
                            width: 100,
                            height: 100,
                            fill: document.getElementById('shape-fill').checked ? document.getElementById('color').value : '',
                            stroke: document.getElementById('color').value,
                            strokeWidth: 2,
                            left: x1 - 50,
                            top: y1 - 50
                        });
                        addObjectToCanvas(square); // Agrega el cuadrado al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'diamond') {
                        var diamond = new fabric.Polygon([
                            {x: x1 - 50, y: y1},
                            {x: x1, y: y1 - 50},
                            {x: x1 + 50, y: y1},
                            {x: x1, y: y1 + 50}
                        ], {
                            fill: document.getElementById('shape-fill').checked ? document.getElementById('color').value : '',
                            stroke: document.getElementById('color').value,
                            strokeWidth: 2
                        });
                        addObjectToCanvas(diamond); // Agrega el diamante al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'rectangle') {
                        var rectangle = new fabric.Rect({
                            width: 150,
                            height: 75,
                            fill: document.getElementById('shape-fill').checked ? document.getElementById('color').value : '',
                            stroke: document.getElementById('color').value,
                            strokeWidth: 2,
                            left: x1 - 75,
                            top: y1 - 37.5
                        });
                        addObjectToCanvas(rectangle); // Agrega el rectángulo al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'line') {
                        var line = new fabric.Rect({
                            width: 4,
                            height: 170,
                            fill: document.getElementById('shape-fill').checked ? document.getElementById('color').value : '',
                            stroke: document.getElementById('color').value,
                            strokeWidth: 3,
                            left: x1 - 75,
                            top: y1 - 37.5
                        });
                        addObjectToCanvas(line); // Agrega el rectángulo al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'text') {
                        var text = new fabric.Textbox('Texto aquí', {
                            fontSize: 20,
                            fill: document.getElementById('color').value,
                            left: x1 - 25,
                            top: y1 - 17.5
                        });
                        addObjectToCanvas(text); // Agrega el texto al lienzo y lo almacena en canvasObjects
                    } else if (elementTypeToAdd === 'image') {
                        var input = document.createElement('input');
                        input.type = 'file';
                        input.accept = 'image/*';
                        input.click();
                        input.addEventListener('change', function (e) {
                            var file = e.target.files[0];
                            var reader = new FileReader();
                            reader.onload = function (event) {
                                var img = new Image();
                                img.onload = function () {
                                    var fabricImg = new fabric.Image(img, {
                                        left: x1 - 75,
                                        top: y1 - 37.5,
                                        selectable: true
                                    });
                                    addObjectToCanvas(fabricImg);
                                };
                                img.src = event.target.result;
                            };
                            reader.readAsDataURL(file);
                        });
                    } else if (elementTypeToAdd === 'svg') {
                        var input = document.createElement('input');
                        input.type = 'file';
                        input.accept = 'image/svg+xml';
                        input.click();
                        input.addEventListener('change', function (e) {
                            var files = e.target.files;
                            for (var i = 0; i < files.length; i++) {
                                var file = files[i];
                                var reader = new FileReader();
                                reader.onload = function (event) {
                                    var svgString = event.target.result;
                                    fabric.loadSVGFromString(svgString, function (objects, options) {
                                        // Procesar objetos SVG cargados
                                        objects.forEach(function (obj) {
                                            // Ajustar la posición del objeto si es necesario
                                            // Aquí puedes agregar lógica para posicionar los objetos SVG correctamente en el lienzo
                                            var offsetX = x1 - 550; // Ejemplo: desplazamiento horizontal
                                            var offsetY = y1 - 400; // Ejemplo: desplazamiento vertical
                                            obj.set({
                                                left: obj.left + offsetX,
                                                top: obj.top + offsetY
                                            });
                                            canvas.add(obj); // Agregar objeto al lienzo
                                        });
                                        canvas.renderAll(); // Renderizar el lienzo después de agregar los objetos SVG
                                    });
                                };
                                reader.readAsText(file);
                            }
                            isAddingNewElement = false; // Restablecer la bandera después de la carga del SVG
                            elementTypeToAdd = ''; // Restablecer el tipo de elemento
                        });
                    }

                    // Restablecer la bandera después de agregar el elemento
                    isAddingNewElement = false;
                    elementTypeToAdd = ''; // Restablecer el tipo de elemento
                }
            });


            canvas.on('mouse:move', function (opt) {
                if (this.isDragging) {
                    var e = opt.e;
                    var vpt = this.viewportTransform;
                    vpt[4] += e.clientX - this.lastPosX;
                    vpt[5] += e.clientY - this.lastPosY;
                    this.requestRenderAll();
                    this.lastPosX = e.clientX;
                    this.lastPosY = e.clientY;
                }
            });
            canvas.on('mouse:up', function (opt) {
                this.isDragging = false;
                this.selection = true;
            });
            function keepLineInsideCanvas(line) {
                line.setCoords();
                var boundingRect = line.getBoundingRect();
                if (boundingRect.top < 0 || boundingRect.left < 0 || boundingRect.top + boundingRect.height > canvas.height || boundingRect.left + boundingRect.width > canvas.width) {
                    line.remove();
                    alert("La línea está fuera del lienzo. Por favor, inténtalo de nuevo dentro del lienzo.");
                }
            }

            document.getElementById('color').addEventListener('change', function () {
                var selectedColor = this.value;
                canvas.freeDrawingBrush.color = selectedColor; // Aplica el color al lápiz de dibujo libre

                // Aplica el color seleccionado a la línea recta
                if (canvas.getActiveObject() instanceof fabric.Line) {
                    canvas.getActiveObject().set('stroke', selectedColor);
                    canvas.renderAll();
                }
            });
            canvas.on('mouse:wheel', function (opt) {
                var delta = opt.e.deltaY;
                var zoom = canvas.getZoom();
                zoom *= 0.999 ** delta;
                if (zoom > 20)
                    zoom = 20;
                if (zoom < 0.01)
                    zoom = 0.01;
                canvas.zoomToPoint({x: opt.e.offsetX, y: opt.e.offsetY}, zoom);
                opt.e.preventDefault();
                opt.e.stopPropagation();
            });
            canvas.on('mouse:down', function (opt) {
                var evt = opt.e;
                if (evt.altKey === true) {
                    this.isDragging = true;
                    this.selection = false;
                    this.lastPosX = evt.clientX;
                    this.lastPosY = evt.clientY;
                }
            });
            canvas.on('mouse:move', function (opt) {
                if (this.isDragging) {
                    var e = opt.e;
                    var vpt = this.viewportTransform;
                    vpt[4] += e.clientX - this.lastPosX;
                    vpt[5] += e.clientY - this.lastPosY;
                    this.requestRenderAll();
                    this.lastPosX = e.clientX;
                    this.lastPosY = e.clientY;
                }
            });
            canvas.on('mouse:up', function (opt) {
                // on mouse up we want to recalculate new interaction
                // for all objects, so we call setViewportTransform
                this.setViewportTransform(this.viewportTransform);
                this.isDragging = false;
                this.selection = true;
            });
            // Función para actualizar las propiedades de un objeto en canvasObjects cuando se modifica en el lienzo
            function updateObjectPropertiesInCanvasObjects(object) {
                var index = canvasObjects.findIndex(function (item) {
                    return item.id === object.id;
                });
                if (index !== -1) {
                    canvasObjects[index].properties = object.toObject(['left', 'top', 'width', 'height', 'fill', 'stroke', 'strokeWidth']);
                }
            }

            document.getElementById('upload-svg').addEventListener('change', function (e) {
                var files = e.target.files;
                var offsetX = canvas.width / 4; // Definir la posición X por defecto
                var offsetY = canvas.height / 7; // Definir la posición Y por defecto

                for (var i = 0; i < files.length; i++) {
                    var file = files[i];
                    var reader = new FileReader();
                    reader.onload = function (event) {
                        fabric.loadSVGFromURL(event.target.result, function (objects, options) {
                            var svgObjects = fabric.util.groupSVGElements(objects, options);
                            svgObjects.set({left: offsetX, top: offsetY}); // Establecer la posición del SVG
                            addObjectToCanvas(svgObjects);
                            // Almacenar una referencia al objeto SVG cargado
                            svgObjects.originalFill = svgObjects.getObjects()[0].fill;
                            console.log('SVG cargado correctamente:', svgObjects);
                        });
                    };
                    reader.readAsDataURL(file);
                }
            });

        </script>

    </body>
</html>

<%
        } else {
            response.sendRedirect("home.jsp");
        }
    } else {
        response.sendRedirect("home.jsp");
    }

%>
