function openFileInput() {
    const input = document.getElementById('imagenInput');
    input.click();

    // Desvincular el botón personalizado temporalmente
    document.getElementById('customFileLabel').removeAttribute('onclick');

    // Volver a vincular el botón después de un breve retraso
    setTimeout(() => {
        document.getElementById('customFileLabel').setAttribute('onclick', 'openFileInput()');
    }, 100);
}

function updateFileName() {
    const input = document.getElementById('imagenInput');
    const fileNameDisplay = document.getElementById('customFileLabel');
    const fileName = input.value.split('\\').pop(); // Obtener el nombre del archivo seleccionado

    fileNameDisplay.textContent = fileName ? fileName : 'Ningún archivo ha sido elegido';

    // Restablecer el valor del input de archivo
}
function extraerTextoDeImagen() {
    var imagenInput = document.getElementById('imagenInput');
    var loader = document.getElementById('loader');
    var file = imagenInput.files[0];

    if (file) {
        loader.style.display = 'inline-block'; // Mostrar el indicador de carga
        var reader = new FileReader();
        reader.onload = function (e) {
            var imgDataUrl = e.target.result;

            // Crear un nuevo elemento de imagen
            // Crear un nuevo elemento de imagen
            var img = new Image();
            img.onload = function () {
                // Redimensionar la imagen si su altura es mayor a 550px
                var maxHeight = 550;
                if (img.height > maxHeight) {
                    var ratio = maxHeight / img.height;
                    img.width *= ratio;
                    img.height = maxHeight;
                }
                // Crear un contenedor para Cropper.js dentro de un modal
                var modalContent = document.createElement('div');
                modalContent.classList.add('modal-content');

                var modalDialog = document.createElement('div');
                modalDialog.classList.add('modal-dialog');
                modalDialog.classList.add('modal-lg');
                modalDialog.appendChild(modalContent);

                var modal = document.createElement('div');
                modal.classList.add('modal');
                modal.appendChild(modalDialog);

                // Establecer un máximo en la altura y ancho del cropper-container
                var cropperMaxWidth = img.width;
                var cropperMaxHeight = img.height;

                if (cropperMaxWidth > modalDialog.clientWidth) {
                    cropperMaxWidth = modalDialog.clientWidth;
                }

                if (cropperMaxHeight > maxHeight) {
                    cropperMaxHeight = maxHeight;
                }

                // Agregar el modal al final del cuerpo del documento
                document.body.appendChild(modal);

                // Crear un contenedor para la imagen dentro del modal
                var imageContainer = document.createElement('div');
                imageContainer.classList.add('modal-body');
                imageContainer.appendChild(img);
                modalContent.appendChild(imageContainer);

                // Establecer un máximo en la altura y ancho del cropper-container
                var cropperMaxWidth = Math.min(modalDialog.clientWidth, img.width);
                var cropperMaxHeight = Math.min(maxHeight, img.height);


                // Inicializar Cropper.js
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
                    },
                });

                var controlsContainer = document.createElement('div');
                controlsContainer.classList.add('modal-footer');
                modalContent.appendChild(controlsContainer);

                // Agregar el botón de "Guardar" al modal
                var saveButton = document.createElement('button');
                saveButton.classList.add('btn', 'btn-primary');
                saveButton.textContent = 'Guardar';
                saveButton.addEventListener('click', function () {
                    // Obtener la imagen recortada como un nuevo Data URL
                    var croppedDataUrl = cropper.getCroppedCanvas().toDataURL();

                    // Procesar la imagen recortada con Tesseract.js
                    Tesseract.recognize(
                            croppedDataUrl,
                            'spa',
                            {logger: m => console.log(m)}
                    ).then(({ data: { text } }) => {
                        var editor = document.getElementById('contE');
                        var textoAInsertar = text;
                        editor.innerHTML += " " + textoAInsertar;
                        loader.style.display = 'none'; // Ocultar el indicador de carga

                        // Cerrar el modal después del procesamiento
                        bootstrap.Modal.getInstance(modal).hide();
                    }).catch(err => {
                        console.error(err);
                        alert('Error al procesar la imagen');
                        loader.style.display = 'none';
                        bootstrap.Modal.getInstance(modal).hide();
                    });
                });
                controlsContainer.appendChild(saveButton);

                // Inicializar el modal de Bootstrap
                var modalInstance = new bootstrap.Modal(modal);
                modalInstance.show();

                // Cuando el modal se cierre, eliminar el contenedor de Cropper.js y el modal del DOM
                modal.addEventListener('hidden.bs.modal', function () {
                    document.body.removeChild(modal);
                });

            };

            // Establecer la fuente de la imagen
            img.src = imgDataUrl;
        };
        reader.readAsDataURL(file);
    } else {
        alert('Por favor, carga una imagen.');
    }
}
