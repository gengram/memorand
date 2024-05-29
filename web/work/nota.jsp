<%@page import="java.sql.Timestamp"%>
<%@page import="com.memorand.beans.Task"%>
<%@page import="com.memorand.controller.TasksController"%>
<%@page import="com.memorand.beans.Note"%>
<%@page import="com.memorand.controller.NotesController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String note_id = request.getParameter("id");
    
    session.setAttribute("upd_type", "note");
    session.setAttribute("upd_id", note_id);

    if (note_id != null) {
        String task_id = "";
        String note_name = "", note_text = "", note_status = "";
        Timestamp note_cdate, note_mdate;

        NotesController notec = new NotesController();
        Note note = notec.modelGetNoteById(note_id);

        if (note != null) {
            TasksController taskc = new TasksController();
            Task task = taskc.modelgetTaskByTool("notes", "note_id", note_id);

            task_id = task.getTask_id();

            note_name = note.getNote_name();
            note_text = note.getNote_text();
            note_status = note.getNote_status();

            note_cdate = note.getNote_cdate();
            note_mdate = note.getNote_mdate();
%>

<html>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

        <title>Memorand | <%= note_name%></title>
        <!-- Edit-Image -->
        <script src="https://cdn.jsdelivr.net/npm/cropperjs@1.5.11/dist/cropper.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/cropperjs@1.5.11/dist/cropper.min.css">
        <!-- Image-Text -->
        <script src="https://cdn.jsdelivr.net/npm/tesseract.js@2"></script>
        <!-- Fuente -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display&display=swap">
        <!-- Scripts -->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>

    </head>
    
    <style>
        .btn-h{
            color: #000;
            border-color: #E3E4E5;
            background-color: #E3E4E5;
        }
        .btn-h:focus {
            border-color: #BDECD5;
            background-color: #BDECD5;
            color: #000;
        }
        .btn-h:active {
            border-color: #BDECD5;
            background-color: #BDECD5;
            color: #000;
        }
        .btn-h:hover {
            color: #BDECD5;
            background-color: #E3E4E5;
            border-color: #BDECD5;
        }

        .custom-btnA{
            color: #fff;
            border-color: #25ce7b;
            background-color: #25ce7b;
        }
        .custom-btnA:hover {
            background-color: #fff; /* Cambiar el color de fondo al pasar el ratón */
            border: 2px solid #25CE7B; /* Color del contorno */
            color: #E3E4E5; /* Cambiar el color del texto al pasar el ratón */
        }

        .btn-color {
            border-color: #E3E4E5;
            background-color: transparent;
            padding-bottom: 0.05rem;
            padding-top: 0.05rem;
            padding-left: 0.35rem;
            padding-right: 0.35rem;
        }
        .btn-color:hover{
            border-color: #E3E4E5;
            background-color: #E3E4E5;
        }

        /* Estilo para el botón personalizado #25CE7B */
        .btn-color-25CE7B {
            border-color: #E3E4E5;
            background-color: transparent;
            padding: 0.05rem 0.35rem;
        }

        .btn-color-25CE7B:hover,
        .btn-color-25CE7B:focus {
            border-color: #BDECD5;
            background-color: #BDECD5;
        }

        /* Estilo para el botón personalizado #2ADAE5 */
        .btn-color-2ADAE5 {
            border-color: #E3E4E5;
            background-color: transparent;
            padding: 0.05rem 0.35rem;
        }

        .btn-color-2ADAE5:hover,
        .btn-color-2ADAE5:focus {
            border-color: #A2DFF0;
            background-color: #A2DFF0;
        }

        /* Estilo para el botón personalizado #7473C0 */
        .btn-color-7473C0 {
            border-color: #E3E4E5;
            background-color: transparent;
            padding: 0.05rem 0.35rem;
        }

        .btn-color-7473C0:hover,
        .btn-color-7473C0:focus {
            border-color: #C7C6D2;
            background-color: #C7C6D2;
        }

        /* Estilo para el botón personalizado #F37DBD */
        .btn-color-F37DBD {
            border-color: #E3E4E5;
            background-color: transparent;
            padding: 0.05rem 0.35rem;
        }

        .btn-color-F37DBD:hover,
        .btn-color-F37DBD:focus {
            border-color: #F7C9E9;
            background-color: #F7C9E9;
        }

        /* Estilo para el botón personalizado #F3894D */
        .btn-color-F3894D {
            border-color: #E3E4E5;
            background-color: transparent;
            padding: 0.05rem 0.35rem;
        }

        .btn-color-F3894D:hover,
        .btn-color-F3894D:focus {
            border-color: #F7C9C9;
            background-color: #F7C9C9;
        }

        /* Estilo para el botón personalizado #FDB600 */
        .btn-color-FDB600 {
            border-color: #E3E4E5;
            background-color: transparent;
            padding: 0.05rem 0.35rem;
        }

        .btn-color-FDB600:hover,
        .btn-color-FDB600:focus {
            border-color: #FFEB99;
            background-color: #FFEB99;
        }

        /* Estilo para el botón personalizado #F25063 */
        .btn-color-F25063 {
            border-color: #E3E4E5;
            background-color: transparent;
            padding: 0.05rem 0.35rem;
        }

        .btn-color-F25063:hover,
        .btn-color-F25063:focus {
            border-color: #FAC7C7;
            background-color: #FAC7C7;
        }
        
        /* Estilo para el botón personalizado #000 */
        .btn-color-000 {
            border-color: #E3E4E5;
            background-color: transparent;
            padding: 0.05rem 0.35rem;
        }

        .btn-color-000:hover,
        .btn-color-000:focus {
            border-color: #000;
            background-color: #000;
        }

    </style>

    <body>
        
        <span id="type" style="display: none">note</span>

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>

        <div class="container text-center" >

            <br>

            <div class="row">
                <div class="col-12 mt-2">
                    <div class="card border">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-4">
                                    <a href="tarea.jsp?id=<%= task_id%>">
                                        <div class="btn-group me-5 mb-2" role="group" aria-label="Default button group">
                                            <button type="button" class="btn" style="background-color: #AFB2B3;"><i class="bi bi-chevron-left ms-1" style="color: #fff; font-size: 20px"></i></button>
                                            <button type="button" class="btn border-2" style="border-color: #AFB2B3" disabled><b class="ms-1 me-4" style="color: #000"><%= note_name%></b></button>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-5 border-start">
                                    <input class="custom-file-input" type="file" id="imagenInput" accept="image/*" onchange="updateFileName()">
                                    <label for="imagenInput" class="custom-file-input-label custom-btnA" id="customFileLabel"><i class="bi bi-upload"></i></label>

                                    <button class="btn custom-btnA" onclick="extraerTextoDeImagen()" style="padding: 0.5px 20px;">
                                        <span class="spinner-grow spinner-grow-sm" id="loader" style="display:none;"></span>
                                        <p class="mt-1 me-2 ms-2 mb-2">Extraer</p> 
                                    </button>
                                    <button class="btn btn-h" type="button" id="btnStartcon"><i class="bi bi-mic-fill"></i></button>
                                    <button class="btn btn-h" type="button" id="btnStopcont"><i class="bi bi-mic-mute-fill"></i></button>
                                    <!--<input class="form-control text-editor border-2" type="text"role="textbox" contenteditable="true" id="titulo">-->
                                </div>
                                <div class="col-3 text-end">
                                    <i class="bi bi-three-dots-vertical me-4" style="font-size: 22px; color: #000"></i>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <hr style="color: #6c757d">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-3 border-end" style="background-color: transparent;">
                                    <button class="btn btn-h" onclick="bold()"><i class="bi bi-type-bold"></i></button>
                                    <button class="btn btn-h" onclick="italic()"><i class="bi bi-type-italic"></i></button>
                                    <button class="btn btn-h" onclick="underline()"><i class="bi bi-type-underline"></i></button>
                                </div>
                                <div class="col-6 border-end" style="background-color: transparent">
                                    <button class="btn btn-color-25CE7B me-2" type="button" onclick="selectColorApunte('#25CE7B')"><i style="color: #25CE7B; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color-2ADAE5 me-2" type="button" onclick="selectColorApunte('#2ADAE5')"><i style="color: #2ADAE5; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color-7473C0 me-2" type="button" onclick="selectColorApunte('#7473C0')"><i style="color: #7473C0; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color-F37DBD me-2" type="button" onclick="selectColorApunte('#F37DBD')"><i style="color: #F37DBD; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color-F3894D me-2" type="button" onclick="selectColorApunte('#F3894D')"><i style="color: #F3894D; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color-FDB600 me-2" type="button" onclick="selectColorApunte('#FDB600')"><i style="color: #FDB600; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color-F25063 me-2" type="button" onclick="selectColorApunte('#F25063')"><i style="color: #F25063; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <button class="btn btn-color-000" type="button" onclick="selectColorApunte('#000')"><i style="color: #000; font-size: 30px;" class="bi bi-square-fill"></i></button>
                                    <input type="hidden" id="exampleColorInput">
                                </div>
                                <script>
                                    function selectColorApunte(color) {
                                        console.log("Color seleccionado:", color);
                                        document.getElementById("exampleColorInput").value = color;
                                        // Aplica el color al texto en el área de edición
                                        applyColor(color);
                                        saveChanges();
                                    }
                                </script>
                                <div class="col-3">
                                    <button class="btn btn-h" onclick="insertList()"><i class="bi bi-list-ul"></i></button>
                                    <button class="btn btn-h" onclick="insertOrderedList()"><i class="bi bi-list-ol"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" >
                <div class="col-12">
                    <div class="form-control text-editor contenido border-1 mt-3 text-start" type="text"role="textbox" contenteditable="true" id="contE" style=" min-height: 350px;">
                        <%= note_text%>
                    </div>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-2"></div>
                <div class="col-10 text-end">
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

    </body>

    <script>
        let timeoutId;

        function saveChanges() {
            clearTimeout(timeoutId); // Borra el temporizador existente
            timeoutId = setTimeout(function () {
                let contenido = document.getElementById('contE').innerHTML.trim();
                let urlParams = new URLSearchParams(window.location.search);
                let note_id = urlParams.get('id');
                let data = {
                    "note_id": note_id,
                    "note_text": contenido
                };
                let xhr = new XMLHttpRequest();
                let url = "/memorand/notetext";
                xhr.open("POST", url, true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        console.log(xhr.responseText);
                    }
                };
                xhr.send(JSON.stringify(data));
            }, 4500); // 5000 milisegundos = 5 segundos
        }

        document.getElementById('contE').addEventListener('input', function () {
            saveChanges();
        });

        function generatePDF() {
            // Obtener el contenido del área de texto
            let contenido = document.getElementById('contE').innerHTML.trim();

            // Opciones para la conversión a PDF
            let options = {
                margin: 1,
                filename: 'contenido.pdf',
                image: {type: 'jpeg', quality: 0.98},
                html2canvas: {scale: 2},
                jsPDF: {unit: 'in', format: 'letter', orientation: 'portrait'}
            };

            // Convertir el contenido HTML a PDF
            html2pdf().from(contenido).set(options).save();
        }
    </script>

    <script src="../XM-Resources/scripts/voice_1text.js"></script>
    <script src="../XM-Resources/scripts/imageTtext.js"></script>
    <script src="../XM-Resources/scripts/styles_apunte.js"></script>

    <script src="scripts/broker.js"></script>
    
</html>

<%
        } else {
            response.sendRedirect("home.jsp");
        }
    } else {
        response.sendRedirect("home.jsp");
    }

%>

