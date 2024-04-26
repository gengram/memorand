<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        <title>Memorand</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/4.5.0/fabric.min.js"></script>
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
                            <li><a id="download-image" class="dropdown-item" href="#"><i class="bi bi-image me-2" style="color: #25ce7b"></i>Imagen</a></li>
                            <li><a id="download-svg" class="dropdown-item" href="#"><i class="bi bi-download me-2" style="color: #25ce7b"></i>SVG</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-8">
                    <div class="btn-group capa1" style=" margin-left: 10rem " role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check btn-c" name="btnradio" id="btnradio1" autocomplete="off">
                        <label class="btn btn-h" for="btnradio1">
                            <i class="bi bi-boxes icon-tools"></i>
                        </label>

                        <input type="radio" class="btn-check btn-c" name="btnradio" id="btnradio2" autocomplete="off">
                        <label id="add-text" class="btn btn-h" for="btnradio2">
                            <i class="bi bi-textarea-t icon-tools"></i>
                        </label>

                        <button id="line" type="button" class="btn btn-h"><i class="bi bi-slash-lg icon-tools"></i></button>

                        <input type="radio" class="btn-check btn-c" name="btnradio" id="btnradio4" autocomplete="off" checked>
                        <label id="free-drawing" class="btn btn-h" for="btnradio4"><i class="bi bi-brush-fill icon-tools"></i></label>

                        <button id="arrow" type="button" class="btn btn-h"><i class="bi bi-arrow-up-right icon-tools"></i></button>
                        <button id="add-image" type="button" class="btn btn-h"><i class="bi bi-images icon-tools"></i></button>
                        <button id="delete-all" type="button" class="btn btn-h"><i class="bi bi-trash3 icon-tools"></i></button>
                        <button id="delete-selected" type="button" class="btn btn-h"><i class="bi bi-eraser-fill icon-tools"></i></button>
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
                            <button id="square" type="button" class="btn btn-h ms-2"><i class="bi bi-square icon-card"></i></button>
                        </div>
                        <div class="col-6 text-center">
                            <button id="diamond" type="button" class="btn btn-h me-3"><i class="bi bi-diamond icon-card"></i></button>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-6 text-center">
                            <button id="circle" type="button" class="btn btn-h ms-2"><i class="bi bi-circle icon-card"></i></button>
                        </div>
                        <div class="col-6 text-center">
                            <button id="rectangle" type="button" class="btn btn-h me-3"><i class="bi bi-tablet-landscape icon-card"></i></button>
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
                </div>
            </div>
            <div class="card shadow" id="card4">
                <div class="card-body ms-3 me-3 mt-2 mb-2">
                    <div class="row">
                        <label for="color">Color del lápiz</label>
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

        <script>
            var canvas = new fabric.Canvas('canvas', {
                width: 800,
                height: 600,
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
                    left: canvas.width / 4,
                    top: canvas.height / 4
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
                    left: canvas.width / 4 - 50,
                    top: canvas.height / 4 - 50
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
                    left: canvas.width / 4 - 50,
                    top: canvas.height / 4 - 50
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
                    left: canvas.width / 4 - 75,
                    top: canvas.height / 4 - 37.5
                });
                canvas.add(rectangle);
            });

            document.getElementById('add-text').addEventListener('click', function () {
                var text = new fabric.Textbox('Texto aquí', {
                    fontSize: 20,
                    fill: document.getElementById('text-color').value,
                    left: canvas.width / 4,
                    top: canvas.height / 4
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
                                left: canvas.width / 4 - img.width / 4,
                                top: canvas.height / 4 - img.height / 4,
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
            
            document.addEventListener('keydown', function (e) {
                if (e.keyCode === 46 || e.keyCode === 8) { // Código de tecla para borrar
                    var activeObject = canvas.getActiveObject();
                    if (activeObject) {
                        canvas.remove(activeObject);
                    }
                }
            });

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
                                left: canvas.width / 4,
                                top: canvas.height / 4
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
                    left: canvas.width / 4,
                    top: canvas.height / 4
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
        </script>

    </body>
</html>
