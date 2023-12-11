<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <jsp:include page="../recursos/import.jsp"/>

        <title>Apunte</title>
        <!-- Edit-Image -->
        <script src="https://cdn.jsdelivr.net/npm/cropperjs@1.5.11/dist/cropper.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/cropperjs@1.5.11/dist/cropper.min.css">
        <!-- Style -->
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css"  type="text/css">
        <!-- Image-Text -->
        <script src="https://cdn.jsdelivr.net/npm/tesseract.js@2"></script>
        <!-- Fuente -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <!-- Scripts -->
        <script src="../recursos/scripts/voice-text.js"></script>
        <script src="../recursos/scripts/voice_1text.js"></script>
        <script src="../recursos/scripts/imageTtext.js"></script>
        <script src="../recursos/scripts/style_edit.js"></script>
        <script src="../recursos/scripts/jspdf.min.js"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
    </head>
     <%
        //PROTECCION
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        if (tipo_usuario == null || !tipo_usuario.equals("alumno")) {
            response.sendRedirect("../index.jsp");
        }
    %>
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
                        <div class="col-6">
                            <h1 class="text-start mt-4" style="color: #62646A; font-size: 300%;">
                                Apunte</h1><br>
                        </div>
                        <div class="col-6">

                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-1 mt-4">

                            <button class="custom-blog" onclick="bold()"><i class="bi bi-type-bold"></i></button>
                            <button class="custom-blog  mt-3" onclick="italic()"><i class="bi bi-type-italic"></i></button>
                            <button class="custom-blog  mt-3" onclick="underline()"><i class="bi bi-type-underline"></i></button>
                            <input type="color" class="form-control-sm form-control-color border-2 ms-2 mt-3" id="exampleColorInput" style=" border-color: #00A98F" value="#00A98F">
                            <button  class="custom-blog  mt-3" onclick="insertList()"><i class="bi bi-list-ul"></i></button>

                        </div>
                        <div class="col-11 mt-1">
                            <div class="row g-0 border rounded overflow-hidden flex-md-row shadow h-md-250 position-relative">
                                <div class="col mt-2 mb-2 p-4 d-flex flex-column position-static text-start">
                                    <div class="mb-3">
                                        <label for="" class="form-label">T&iacute;tulo</label>

                                        <div class="input-group mb-3">
                                            <button class="btn btn-focus custom-blog border-2" type="button" id="btnStart"><i class="bi bi-mic"></i></button>
                                            <button class="btn btn-focus custom-blog border-2" type="button" id="btnStop"><i class="bi bi-mic-mute"></i></button>
                                            <input class="form-control text-editor border-2" type="text"role="textbox" contenteditable="true" id="titulo">
                                        </div>

                                        <div class="mb-3">
                                            <label for="" class="form-label mt-2">Contenido</label>
                                            <div class="row">
                                                <div class="col-1">
                                                    <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                                                        <button class="btn btn-focus custom-blog border-2" type="button" id="btnStartcon"><i class="bi bi-mic"></i></button>
                                                        <button class="btn btn-focus custom-blog border-2 mt-1" type="button" id="btnStopcont"><i class="bi bi-mic-mute"></i></button>
                                                    </div>
                                                </div>
                                                <div class="col-11">
                                                    <div class="form-control text-editor contenido border-2" type="text"role="textbox" contenteditable="true" id="contE" ></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mt-2">
                                <div class="card-body ">
                                    <div class="row">
                                        <div class="col-6 text-start">
                                            <div class="btn-group" role="group" aria-label="Basic example">
                                                <input class="custom-file-input" type="file" id="imagenInput" accept="image/*" onchange="updateFileName()">
                                                <label for="imagenInput" class="custom-file-input-label" id="customFileLabel">Elegir archivo</label>
                                                <button class="btn custom-blog  ms-2" onclick="extraerTextoDeImagen()">
                                                    <span class="spinner-grow spinner-grow-sm" id="loader" style="display:none;"></span>
                                                    Extraer Texto</button>
                                            </div>
                                        </div>
                                        <div class="col-6 text-end">
                                            <button class="btn custom-bsign" onclick="generatePDF()">
                                                Descargar <i class="bi bi-filetype-pdf custom-icon6"></i>
                                            </button>
                                            <button class="btn custom-bsign"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" fill="currentColor" class="bi bi-floppy-fill" viewBox="0 0 16 16">
                                                <path d="M0 1.5A1.5 1.5 0 0 1 1.5 0H3v5.5A1.5 1.5 0 0 0 4.5 7h7A1.5 1.5 0 0 0 13 5.5V0h.086a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5H14v-5.5A1.5 1.5 0 0 0 12.5 9h-9A1.5 1.5 0 0 0 2 10.5V16h-.5A1.5 1.5 0 0 1 0 14.5v-13Z"/>
                                                <path d="M3 16h10v-5.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5V16Zm9-16H4v5.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5V0ZM9 1h2v4H9V1Z"/>
                                                </svg>  Guardar
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1">
                    
                </div>
            </div>
        </div>
    </body>
    <script>
        function generatePDF() {
            let titulo = document.getElementById('titulo').value;
            let contenido = document.getElementById('contE').textContent;

            const pdf = new jsPDF('p', 'pt', 'letter');
            pdf.setFontSize(12);

            // Verifica si el título está vacío
            if (titulo.trim() !== '') {
                pdf.text(20, 40, titulo); // Ajustar las coordenadas según sea necesario
            }

            const lineHeight = 20; // Ajusta esto según el tamaño de fuente y el espaciado deseado
            const margin = 20; // Márgenes laterales
            const maxLineLength = 550; // Máximo ancho de línea
            const maxHeight = 800; // Máximo alto antes de cambiar de página

            let lines = pdf.splitTextToSize(contenido, maxLineLength); // Divide el texto en líneas
            let y = 80; // Inicio del texto en la primera página

            for (let i = 0; i < lines.length; i++) {
                if (y > maxHeight) {
                    pdf.addPage();
                    y = 40; // Inicio del texto en nuevas páginas
                }
                pdf.text(margin, y, lines[i]);
                y += lineHeight;
            }

            pdf.save(titulo + ".pdf");
        }

    </script>
</html>
