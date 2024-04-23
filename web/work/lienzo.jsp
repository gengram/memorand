<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        <title>Memorand</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/4.5.0/fabric.min.js"></script>
        <style>
            canvas {
                border: 2px solid #E3E4E5;
                cursor: move;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>
        <div class="container">
            <div class="row">
                <div class="col-12 mt-2">
                    <canvas id="canvas"></canvas>
                    <label for="shape-color">Color del contorno:</label>
                    <input type="color" id="shape-color" value="#000000">
                    <label for="shape-fill">Rellenar figura:</label>
                    <input type="checkbox" id="shape-fill" checked>
                    <label for="text-color">Color del texto:</label>
                    <input type="color" id="text-color" value="#000000">
                    <label for="color">Color del lápiz:</label>
                    <input type="color" id="color" value="#000000">
                    <label for="grosor">Grosor del lápiz:</label>
                    <input type="number" id="grosor" value="5">
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
                    <button id="download-image">Descargar Imagen</button>
                    <button id="download-svg">Descargar SVG</button>
                    <br>
                    <button id="arrow">Agregar Flecha</button>
                    <button id="line">Agregar Línea Recta</button>
                    <br>
                    <input type="file" id="upload-svg" accept=".svg" multiple>
                </div>
            </div>
        </div>

        <script>
            var canvas = new fabric.Canvas('canvas', {
                width: 1300,
                height: 600,
                backgroundColor: '#fff',
                preserveObjectStacking: true
            });
            var panningEnabled = false;

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
                            var obj = fabric.util.groupSVGElements(objects, options);
                            canvas.add(obj).renderAll();
                        });
                    };
                    reader.readAsText(file);
                }
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
        </script>
    </body>
</html>
