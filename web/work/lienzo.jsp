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
        <script src="https://cdn.jsdelivr.net/npm/cropperjs@1.5.11/dist/cropper.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/cropperjs@1.5.11/dist/cropper.min.css">

        <style>
            body, html {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
            }

            canvas {
                display: block;
                border: 2px solid #E3E4E5;
                cursor: move;
                width: 100%;
                height: 100%;
                box-sizing: border-box; /* Para incluir el borde en el tamaño total */
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

        </style>
    </head>
    <body>

        <canvas id="canvas"></canvas>
        <!--BOTONES-->


        <!-- Modal para recortar imagen -->
        <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12 imgModal">
                                <!-- Aquí se insertará la imagen para recortar -->
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="saveCrop">Guardar</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            var canvas = new fabric.Canvas('canvas', {
                backgroundColor: '#fff',
                preserveObjectStacking: true
            });
            var drawingMode = false;
            var panningEnabled = false;

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

            // Ajustar tamaño del canvas dinámicamente
            function resizeCanvas() {
                canvas.setDimensions({
                    width: window.innerWidth,
                    height: window.innerHeight
                }, {renderOnAddRemove: false});
            }

            // Llamar a la función de redimensionamiento al cargar la página y cuando se cambie el tamaño de la ventana
            window.addEventListener('resize', resizeCanvas);
            window.addEventListener('load', function () {
                resizeCanvas();
                // Agregar aquí cualquier inicialización adicional que necesites
            });
        </script>
    </body>
</html>
