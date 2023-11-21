<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/import.jsp"/>
        <link rel="stylesheet" href="../recursos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/styles.css"  type="text/css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <title>Apunte</title>
        <style>
            .text-editor {
                border: 1px solid #ccc;
                padding: 10px;
                min-height: 100px;
                text-align: left;
            }
        </style>
        <style>
            .vertical-divider {
                border-left: 1px solid #ccc; /* Puedes ajustar el color y el grosor según tus necesidades */
                height: 100px; /* Ajusta la altura según tus necesidades */
                margin: 0 10px; /* Ajusta el margen según tus necesidades */
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
                <div class="col-1">
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
=======
                <div class="col-10" >
                    <div class="row row-cols-2">
                        <div class="col-5">
                            <h1 class="text-start mt-4 text-primary" style="font-size: 300%;">
                                Cuaderno</h1><br>
                        </div>
                        <div class="col-1 ms-3">

                            <button class= "custom-bsign mt-5"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy-fill" viewBox="0 0 16 16">
                                <path d="M0 1.5A1.5 1.5 0 0 1 1.5 0H3v5.5A1.5 1.5 0 0 0 4.5 7h7A1.5 1.5 0 0 0 13 5.5V0h.086a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5H14v-5.5A1.5 1.5 0 0 0 12.5 9h-9A1.5 1.5 0 0 0 2 10.5V16h-.5A1.5 1.5 0 0 1 0 14.5v-13Z"/>
                                <path d="M3 16h10v-5.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5V16Zm9-16H4v5.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5V0ZM9 1h2v4H9V1Z"/>
                                </svg>
                            </button>
                        </div>
                        <div class="col-6">
                        </div>
                    </div>
                    <div class="row row-cols-3">
                        <div class="col-5">
                            <h1 class="text-start mt-4" style="color: #62646A; ;">
                                Apuntes</h1><br>
                            <div class="card mb-3 shadow-lg" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-3 shadow-lg" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-3 shadow-lg" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Línea divisora vertical -->
                        <div class="col-1 me-5">
                            <div class="mt-5">
                                <div class="vertical-divider ms-5 border-3"></div>
                                <div class="vertical-divider ms-5 border-3"></div>
                                <div class="vertical-divider ms-5 border-3"></div>
                                <div class="vertical-divider ms-5 border-3"></div>
                                <div class="vertical-divider ms-5 border-3"></div>
                                <div class="vertical-divider ms-5 border-3"></div>
                                <div class="vertical-divider ms-5 border-3"></div>
                            </div>
                        </div>
                        <div class="col-5">
                            <h1 class="text-start mt-4" style="color: #62646A; font-size: 300%;">
                                Ideas</h1><br>
                            <div class="card mb-3 shadow-lg">
                                <div class="row g-0">
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-3 shadow-lg">
                                <div class="row g-0">
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-3 shadow-lg">
                                <div class="row g-0">
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
>>>>>>> 097d7585242fa389511148797ec2d3935fe9fe10
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
