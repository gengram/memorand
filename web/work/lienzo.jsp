<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
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

            .capa2 {
                top: 10px;
                z-index: 2;
                position: absolute;
                text-align: center;
            }
            .capa1 {
                top: 15px;
                align-content: center;
                position: absolute;
            }
            .capa3 {
                top: 80px;
                align-content: center;
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
                        <button type="button" class="btn btn-light rounded-2" style="border-color: #E3E4E5" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-list" style="font-size: 25px"></i>
                        </button>
                        <ul class="dropdown-menu shadow ms-2 mt-0">
                            <li><a id="toggleGrid" class="dropdown-item" href="#"><i class="bi bi-grid-3x3 me-2" style="color: #25ce7b"></i>Cuadrícula</a></li>
                            <li><a id="download-image" class="dropdown-item" href="#"><i class="bi bi-download me-2" style="color: #25ce7b"></i>Imagen</a></li>
                            <li><a id="download-image" class="dropdown-item" href="#"><i class="bi bi-download me-2" style="color: #25ce7b"></i>SVG</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-8">
                    <div class="btn-group capa1" style=" margin-left: 10rem " role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off">
                        <label class="btn btn-h" for="btnradio1">
                            <i class="bi bi-boxes icon-tools"></i></label>

                        <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                        <label class="btn btn-h" for="btnradio2">
                            <i class="bi bi-textarea-t icon-tools"></i>
                        </label>

                        <button type="button" class="btn btn-h"><i class="bi bi-slash-lg icon-tools"></i></button>

                        <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" checked>
                        <label class="btn btn-h" for="btnradio4"><i class="bi bi-brush-fill icon-tools"></i></label>

                        <button type="button" class="btn btn-h"><i class="bi bi-arrow-up-right icon-tools"></i></button>
                        <button type="button" class="btn btn-h"><i class="bi bi-card-image icon-tools"></i></button>
                        <button type="button" class="btn btn-h"><i class="bi bi-trash3 icon-tools"></i></button>
                        <button type="button" class="btn btn-h"><i class="bi bi-eraser-fill icon-tools"></i></button>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
        </div>

        <div class="card-container capa3 ms-4">
            <div class="card shadow" id="card1" style="display: none;">
                <div class="card-body ms-3 me-3 mt-2 mb-2">
                    <div class="row">
                        <label for="shape-color">Color del contorno:</label>
                    </div>
                    <div class="row mb-2">
                        <div class="col-1">
                            <input class="ms-2 mt-2 form-control form-control-color" type="color" id="shape-color" value="#000000">
                        </div>
                        <div class="col-11"></div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="shape-fill" checked>
                                <label class="form-check-label" for="shape-fill">
                                    <text style="color: #000">Rellenar figura</text>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-6 text-center">
                            <button type="button" class="btn btn-h ms-2"><i class="bi bi-square icon-card"></i></button>
                        </div>
                        <div class="col-6 text-center">
                            <button type="button" class="btn btn-h me-3"><i class="bi bi-diamond icon-card"></i></button>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-6 text-center">
                            <button type="button" class="btn btn-h ms-2"><i class="bi bi-circle icon-card"></i></button>
                        </div>
                        <div class="col-6 text-center">
                            <button type="button" class="btn btn-h me-3"><i class="bi bi-arrow-up-right icon-card"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card shadow" id="card2" style="display: none;">
                <div class="card-body ms-3 me-3 mt-2 mb-2">
                    <div class="row">
                        <label for="text-color">Color del texto:</label>
                    </div>
                    <div class="row mb-2">
                        <div class="col-1">
                            <input class="ms-2 mt-2 form-control form-control-color" type="color" id="text-color" value="#000000">
                        </div>
                        <div class="col-11"></div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-6 text-center">
                            <button type="button" class="btn btn-h ms-2"><i class="bi bi-type-bold icon-card"></i></button>
                        </div>
                        <div class="col-6 text-center">
                            <button type="button" class="btn btn-h me-3"><i class="bi bi-type-italic icon-card"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card shadow" id="card4">
                <div class="card-body ms-3 me-3 mt-2 mb-2">
                    <div class="row">
                        <label for="color">Color del l&aacute;piz</label>
                    </div>
                    <div class="row mb-2">
                        <div class="col-1">
                            <input class="ms-2 mt-2 form-control form-control-color" type="color" id="color" value="#000000">
                        </div>
                        <div class="col-11"></div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <label for="grosor">Grosor del lápiz:</label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-6 text-center">
                            <input type="range" id="grosor" min="1" max="30" value="4">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const cards = document.querySelectorAll('.card');
            const radioButtons = document.querySelectorAll('.btn-check');

            radioButtons.forEach((button, index) => {
                button.addEventListener('change', () => {
                    if (button.checked) {
                        cards.forEach((card, i) => {
                            if (i === index) {
                                card.style.display = 'block';
                            } else {
                                card.style.display = 'none';
                            }
                        });
                    }
                });
            });
        </script>

        <!--BOTONES-->
        <!--<div class=" mt-5">
            <div class="capa2 mt-5">
                <label for="shape-color">Color del contorno:</label>
                <input type="color" id="shape-color" value="#000000">
        
                <label for="shape-fill">Rellenar figura:</label>
                <input type="checkbox" id="shape-fill" checked>
        
                <label for="text-color">Color del texto:</label>
                <input type="color" id="text-color" value="#000000">
        
                <label for="color">Color del lápiz:</label>
                <input type="color" id="color" value="#000000">
        
                <label for="grosor">Grosor del lápiz:</label>
                <input type="range" id="grosor" min="1" max="30" value="4">

                <br>
                <button id="circle">Círculo</button>
                <button id="square">Cuadrado</button>
                <button id="diamond">Rombo</button>
                <button id="rectangle">Rectángulo</button>
                <button id="add-text">Agregar Texto</button>
                <button id="add-image">Agregar Imagen</button>
        
                <button id="free-drawing">Dibujo Libre</button>
                <button id="delete-selected">Eliminar Seleccionados</button>
                <button id="delete-all">Borrar Todo</button>
                <button>Descargar Imagen</button>
                <button id="download-svg">Descargar SVG</button>
                <br>
                <button id="arrow">Agregar Flecha</button>
                <button id="line">Agregar Línea Recta</button>
                <br>
                <input type="file" id="upload-svg" accept=".svg" multiple>
            </div>
        </div>-->

        <script>
            var canvas = new fabric.Canvas('canvas', {
                width: 2500,
                height: 2000,
                backgroundColor: '#fff',
                preserveObjectStacking: true
            });

            var drawingMode = false;
            var panningEnabled = false;

            var gridLines = []; // Almacenar las líneas de la cuadrícula

            function createGrid(gridSpacing) {
                // Eliminar la cuadrícula existente si la hay
                gridLines.forEach(function (line) {
                    canvas.remove(line);
                });
                gridLines.length = 0; // Vaciar el array

                // Crear la cuadrícula horizontal
                for (var i = gridSpacing; i < canvas.height; i += gridSpacing) {
                    var line = new fabric.Line([0, i, canvas.width, i], {
                        stroke: '#ccc',
                        selectable: false,
                        evented: false
                    });
                    gridLines.push(line);
                    canvas.add(line);
                }

                // Crear la cuadrícula vertical
                for (var j = gridSpacing; j < canvas.width; j += gridSpacing) {
                    var line = new fabric.Line([j, 0, j, canvas.height], {
                        stroke: '#ccc',
                        selectable: false,
                        evented: false
                    });
                    gridLines.push(line);
                    canvas.add(line);
                }
            }

            // Llama a la función para crear la cuadrícula al cargar la página
            window.onload = function () {
                createGrid(50); // Ajusta el espaciado de la cuadrícula según tus necesidades
            };

            // Función para activar o desactivar la cuadrícula
            function toggleGrid() {
                if (gridLines.length === 0) { // Si no hay líneas en la cuadrícula, crearla
                    createGrid(50);
                } else { // Si ya hay líneas en la cuadrícula, eliminarlas
                    gridLines.forEach(function (line) {
                        canvas.remove(line);
                    });
                    gridLines.length = 0; // Vaciar el array
                }
            }

            // Agrega un evento clic al enlace de la cuadrícula
            document.getElementById('toggleGrid').addEventListener('click', function () {
                toggleGrid(); // Llama a la función para activar o desactivar la cuadrícula
            });

            function toggleDrawingMode() {
                drawingMode = !drawingMode;
                canvas.isDrawingMode = drawingMode;
            }

            function togglePanning() {
                panningEnabled = !panningEnabled;
                canvas.selection = panningEnabled;
                canvas.defaultCursor = panningEnabled ? 'default' : 'move';
            }

            document.getElementById('circle').addEventListener('click', function () {
                var circle = new fabric.Circle({
                    radius: 50,
                    fill: document.getElementById('shape-fill').checked ? document.getElementById('shape-color').value : '',
                    stroke: document.getElementById('shape-color').value,
                    strokeWidth: 2,
                    left: canvas.width / 2,
                    top: canvas.height / 2
                });
                canvas.add(circle);
            });

            document.getElementById('square').addEventListener('click', function () {
                var square = new fabric.Rect({
                    width: 100,
                    height: 100,
                    fill: document.getElementById('shape-fill').checked ? document.getElementById('shape-color').value : '',
                    stroke: document.getElementById('shape-color').value,
                    strokeWidth: 2,
                    left: canvas.width / 2 - 50,
                    top: canvas.height / 2 - 50
                });
                canvas.add(square);
            });

            document.getElementById('diamond').addEventListener('click', function () {
                var diamond = new fabric.Polygon([
                    {x: 0, y: 50},
                    {x: 50, y: 0},
                    {x: 100, y: 50},
                    {x: 50, y: 100}
                ], {
                    fill: document.getElementById('shape-fill').checked ? document.getElementById('shape-color').value : '',
                    stroke: document.getElementById('shape-color').value,
                    strokeWidth: 2,
                    left: canvas.width / 2 - 50,
                    top: canvas.height / 2 - 50
                });
                canvas.add(diamond);
            });

            document.getElementById('rectangle').addEventListener('click', function () {
                var rectangle = new fabric.Rect({
                    width: 150,
                    height: 75,
                    fill: document.getElementById('shape-fill').checked ? document.getElementById('shape-color').value : '',
                    stroke: document.getElementById('shape-color').value,
                    strokeWidth: 2,
                    left: canvas.width / 2 - 75,
                    top: canvas.height / 2 - 37.5
                });
                canvas.add(rectangle);
            });

            document.getElementById('add-text').addEventListener('click', function () {
                var text = new fabric.Textbox('Texto aquí', {
                    fontSize: 20,
                    fill: document.getElementById('text-color').value,
                    left: canvas.width / 2,
                    top: canvas.height / 2
                });
                canvas.add(text);
            });

            document.getElementById('add-image').addEventListener('click', function () {
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
                                left: canvas.width / 2 - img.width / 2,
                                top: canvas.height / 2 - img.height / 2,
                                selectable: true
                            });
                            canvas.add(fabricImg);
                        };
                        img.src = event.target.result;
                    };
                    reader.readAsDataURL(file);
                });
            });

            document.getElementById('free-drawing').addEventListener('click', function () {
                toggleDrawingMode();
            });

            document.getElementById('delete-selected').addEventListener('click', function () {
                var activeObject = canvas.getActiveObject();
                if (activeObject) {
                    canvas.remove(activeObject);
                }
            });

            document.getElementById('delete-all').addEventListener('click', function () {
                canvas.clear();
            });

            // Mostrar modal para recortar imagen antes de descargarla
            /*document.getElementById('download-image').addEventListener('click', function () {
             // Obtener la imagen como base64
             var imageUrl = canvas.toDataURL({
             format: 'png',
             quality: 1
             });
             
             // Mostrar modal
             var imageModal = new bootstrap.Modal(document.getElementById('imageModal'));
             imageModal.show();
             
             // Crear un elemento de imagen dentro del modal
             var modalBody = document.querySelector('.imgModal');
             modalBody.innerHTML = '';
             var img = document.createElement('img');
             img.onload = function () {
             // Redimensionar la imagen si su altura es mayor a 550px
             var maxHeight = 550;
             if (img.height > maxHeight) {
             var ratio = maxHeight / img.height;
             img.width *= ratio;
             img.height = maxHeight;
             }
             };
             img.src = imageUrl;
             img.id = 'imageToCrop';
             modalBody.appendChild(img);
             
             // Establecer un máximo en la altura y ancho del cropper-container
             var cropperMaxWidth = img.width;
             var cropperMaxHeight = img.height;
             
             if (cropperMaxWidth > modalDialog.clientWidth) {
             cropperMaxWidth = modalDialog.clientWidth;
             }
             
             if (cropperMaxHeight > maxHeight) {
             cropperMaxHeight = maxHeight;
             }
             
             // Establecer un máximo en la altura y ancho del cropper-container
             var cropperMaxWidth = Math.min(modalDialog.clientWidth, img.width);
             var cropperMaxHeight = Math.min(maxHeight, img.height);
             
             // Inicializar Cropper.js después de cargar la imagen
             img.onload = function () {
             var cropper = new Cropper(img, {
             aspectRatio: NaN, // Permitir cualquier relación de aspecto
             viewMode: 1, // Modo de vista: 0, 1, 2, 3
             dragMode: 'move', // Modo de arrastre: 'crop', 'move'
             autoCropArea: 1, // Área de recorte automático al cargar la imagen
             cropBoxResizable: true,
             cropBoxMovable: true,
             minCropBoxWidth: 50, // Establecer un valor mínimo
             minCropBoxHeight: 50, // Establecer un valor mínimo
             maxCropBoxWidth: cropperMaxWidth,
             maxCropBoxHeight: cropperMaxHeight,
             
             crop: function (event) {
             // La función se llama cuando el usuario realiza un recorte
             console.log(event.detail.x);
             console.log(event.detail.y);
             console.log(event.detail.width);
             console.log(event.detail.height);
             }
             });
             
             // Guardar recorte y cerrar modal
             document.getElementById('saveCrop').addEventListener('click', function () {
             // Obtener la imagen recortada como un nuevo Data URL
             var croppedDataUrl = cropper.getCroppedCanvas().toDataURL();
             
             // Descargar la imagen recortada
             var link = document.createElement('a');
             link.href = croppedDataUrl;
             link.download = 'canvas.png';
             document.body.appendChild(link);
             link.click();
             document.body.removeChild(link);
             
             // Ocultar modal
             imageModal.hide();
             });
             
             };
             });*/
            function downloadImage() {
                var objects = canvas.getObjects();
                var minX = canvas.width,
                        minY = canvas.height,
                        maxX = 0,
                        maxY = 0;

                objects.forEach(function (obj) {
                    var objWidth = obj.getScaledWidth() * obj.scaleX,
                            objHeight = obj.getScaledHeight() * obj.scaleY,
                            objLeft = obj.left - objWidth / 2,
                            objTop = obj.top - objHeight / 2;

                    minX = Math.min(minX, objLeft);
                    minY = Math.min(minY, objTop);
                    maxX = Math.max(maxX, objLeft + objWidth);
                    maxY = Math.max(maxY, objTop + objHeight);
                });

                var link = document.createElement('a');
                link.href = canvas.toDataURL({
                    format: 'png',
                    quality: 1,
                    left: minX,
                    top: minY,
                    width: 1350,
                    height: 650
                });
                link.download = 'canvas.png';
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            }


            function downloadSVG() {
                var objects = canvas.getObjects();
                objects.forEach(function (obj, index) {
                    var svg = obj.toSVG();
                    var blob = new Blob([svg], {type: 'image/svg+xml'});
                    var link = document.createElement('a');
                    link.href = window.URL.createObjectURL(blob);
                    link.download = 'element_' + index + '.svg';
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                });
            }

            document.getElementById('download-image').addEventListener('click', function () {
                downloadImage();
            });

            document.getElementById('download-svg').addEventListener('click', function () {
                downloadSVG();
            });

            document.getElementById('upload-svg').addEventListener('change', function (e) {
                var files = e.target.files;
                for (var i = 0; i < files.length; i++) {
                    var file = files[i];
                    var reader = new FileReader();
                    reader.onload = function (event) {
                        var svgString = event.target.result;
                        fabric.loadSVGFromString(svgString, function (objects, options) {
                            var group = new fabric.Group(objects, {
                                left: canvas.width / 2,
                                top: canvas.height / 2
                            });
                            canvas.add(group).renderAll();
                        });
                    };
                    reader.readAsText(file);
                }
            });


            canvas.freeDrawingBrush.color = '#000000';
            canvas.freeDrawingBrush.width = 4;

            document.getElementById('color').addEventListener('change', function () {
                canvas.freeDrawingBrush.color = this.value;
            });

            document.getElementById('grosor').addEventListener('change', function () {
                canvas.freeDrawingBrush.width = parseInt(this.value, 10) || 1;
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

            document.getElementById('arrow').addEventListener('click', function () {
                var arrow = new fabric.Path('M 0 0 L 20 10 L 0 20 L 5 10 L 0 0 z', {
                    fill: document.getElementById('shape-fill').checked ? document.getElementById('shape-color').value : '',
                    stroke: document.getElementById('shape-color').value,
                    strokeWidth: 2,
                    left: canvas.width / 2,
                    top: canvas.height / 2
                });
                keepArrowInsideCanvas(arrow);
                canvas.add(arrow);
            });

            document.getElementById('line').addEventListener('click', function () {
                var line = new fabric.Line([50, 50, 200, 200], {
                    stroke: document.getElementById('shape-color').value,
                    strokeWidth: 2
                });
                keepLineInsideCanvas(line);
                canvas.add(line);
            });

            function keepArrowInsideCanvas(arrow) {
                arrow.setCoords();
                var boundingRect = arrow.getBoundingRect();
                if (boundingRect.top < 0 || boundingRect.left < 0 || boundingRect.top + boundingRect.height > canvas.height || boundingRect.left + boundingRect.width > canvas.width) {
                    arrow.remove();
                    alert("La flecha está fuera del lienzo. Por favor, inténtalo de nuevo dentro del lienzo.");
                }
            }

            function keepLineInsideCanvas(line) {
                line.setCoords();
                var boundingRect = line.getBoundingRect();
                if (boundingRect.top < 0 || boundingRect.left < 0 || boundingRect.top + boundingRect.height > canvas.height || boundingRect.left + boundingRect.width > canvas.width) {
                    line.remove();
                    alert("La línea está fuera del lienzo. Por favor, inténtalo de nuevo dentro del lienzo.");
                }
            }

            document.addEventListener('keydown', function (e) {
                if (e.keyCode === 46 || e.keyCode === 8) { // Código de tecla para borrar
                    var activeObject = canvas.getActiveObject();
                    if (activeObject) {
                        canvas.remove(activeObject);
                    }
                }
            });

        </script>
    </body>
</html>
