<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/import.jsp"/>
        <link rel="stylesheet" href="../recursos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/styles.css" type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <title>Memorand - Inicio</title>
        <style>
            .toolbar {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }

            .font-family, .font-size {
                width: 120px;
            }

            .text-editor {
                border: 1px solid #ccc;
                padding: 10px;
                min-height: 200px;
            }
            .loader {
                border: 4px solid #f3f3f3;
                border-radius: 50%;
                border-top: 4px solid #3498db;
                width: 20px;
                height: 20px;
                animation: spin 2s linear infinite;
            }
            #textoInput {
                width: 100%;
                margin-top: 10px;
                background-color: transparent; /* Fondo transparente */
                border: none; /* Borde transparente */
                color: black; /* Color del texto */
            }
            #imagenInput, #textoInput {
                padding: 10px;
                margin-bottom: 10px;
            }
            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
            .notebook {
                background-color: #fff;
                width: 210mm; /* Ancho aproximado de una hoja de cuaderno A4 */
                height: 297mm; /* Altura aproximada de una hoja de cuaderno A4 */
                margin: 20mm auto;
                box-shadow: 0 0 10px rgba(0,0,0,0.5); /* Sombra para simular el efecto de página */
                position: relative;
                overflow: hidden;
                background-image: linear-gradient(to bottom, #000 1px, transparent 1px);
                background-size: 100% 25px; /* Espaciado de las líneas horizontales */
            }

            .margin-line {
                position: absolute;
                left: 25mm; /* Ajuste de la línea vertical al margen izquierdo */
                top: 0;
                bottom: 0;
                width: 2px;
                background-color: #ff0000; /* Color de la línea vertical roja */
            }
        </style> 
    </head>
    <body>
        <jsp:include page="../recursos/navbar.jsp"/>
        <div class="container text-center" >
            <div class="row" >
                <div class="col-1" style="background-color: blueviolet">
                    <br><br><br>
                </div>
                <div class="col-10" style="background-color: #fd7e14">
                    <div class="container">
                        <div class="toolbar">
                            <button class="btn btn-secondary">B</button>
                            <button class="btn btn-secondary">I</button>
                            <button class="btn btn-secondary">U</button>
                            <input type="file" id="imagenInput" accept="image/*">
                            <button class="btn btn-secondary" onclick="extraerTextoDeImagen()">Extraer Texto</button>
                            <div id="loader" class="loader" style="display:none;"></div>
                            <select class="form-control font-family">
                                <option value="Arial">Arial</option>
                                <option value="Times New Roman">Times New Roman</option>
                                <option value="Courier New">Courier New</option>
                            </select>
                            <select class="form-control font-size">
                                <option value="12">12</option>
                                <option value="14">14</option>
                                <option value="16">16</option>
                            </select>
                        </div>
                        <div class="text-editor" contenteditable="true">
                            <!-- El área de edición de texto -->
                            <input class="text-editor" contenteditable="true" type="text" id="textoInput" placeholder="Texto de la imagen se mostrará aquí">
                        </div>
                    </div>
                </div>
                <div class="col-1" style="background-color: blueviolet">
                    <button type="button" class="btn border-0 rounded-circle ms-5" style="color: #27988A;" data-bs-toggle="dropdown" aria-expanded="false">
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <i class="bi bi-question-circle-fill" style="font-size: 30px;"></i>
                        <br>
                    </button>
                </div>
            </div>
        </div>
        <!-- Cuaderno -->
        <div class="notebook">
            <div class="margin-line"></div>
        </div>
        <jsp:include page="../recursos/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/tesseract.js@2"></script>
    
        <script>
            function extraerTextoDeImagen() {
                var imagenInput = document.getElementById('imagenInput');
                var textoInput = document.getElementById('textoInput');
                var loader = document.getElementById('loader');
                var file = imagenInput.files[0];

                if (file) {
                    loader.style.display = 'inline-block'; // Mostrar el indicador de carga
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        var imgDataUrl = e.target.result;

                        Tesseract.recognize(
                            imgDataUrl,
                            'spa',
                            { logger: m => console.log(m) }
                        ).then(({ data: { text } }) => {
                            textoInput.value = text; // Muestra el texto extraído
                            loader.style.display = 'none'; // Ocultar el indicador de carga
                        }).catch(err => {
                            console.error(err);
                            alert('Error al procesar la imagen');
                            loader.style.display = 'none';
                        });
                    };
                    reader.readAsDataURL(file);
                } else {
                    alert('Por favor, carga una imagen.');
                }
            }
        </script>
    </body>
    
</html>
