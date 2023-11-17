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
    </head>
    <body>
        <jsp:include page="../recursos/navbar.jsp"/>
        <div class="container text-center" >
            <div class="row" >
                <div class="col-1">
                    <br><br><br>
                </div>
                <div class="col-10" >
                    <div class="row row-cols-2">
                        <div class="col6">
                            <h1 class="text-start mt-4" style="color: #62646A; font-size: 300%;">
                                Apunte</h1><br>
                        </div>
                        <div class="col6">
                            <button class="btn custom-bsign mt-5"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy-fill" viewBox="0 0 16 16">
                                <path d="M0 1.5A1.5 1.5 0 0 1 1.5 0H3v5.5A1.5 1.5 0 0 0 4.5 7h7A1.5 1.5 0 0 0 13 5.5V0h.086a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5H14v-5.5A1.5 1.5 0 0 0 12.5 9h-9A1.5 1.5 0 0 0 2 10.5V16h-.5A1.5 1.5 0 0 1 0 14.5v-13Z"/>
                                <path d="M3 16h10v-5.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5V16Zm9-16H4v5.5a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5V0ZM9 1h2v4H9V1Z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row mt-3">
                            <div class="col-1 mt-4">

                                <button class="custom-blog" onclick="bold()"><i class="bi bi-type-bold"></i></button>
                                <button class="custom-blog  mt-3" onclick="italic()"><i class="bi bi-type-italic"></i></button>
                                <button class="custom-blog  mt-3" onclick="underline()"><i class="bi bi-type-underline"></i></button>
                                <input type="color" class="form-control-sm form-control-color border-2 ms-2  mt-3" id="exampleColorInput" style=" border-color: #00A98F" value="#00A98F">
                                <button  class="custom-blog  mt-3" onclick="insertList()"><i class="bi bi-list-ul"></i></button>

                            </div>
                            <div class="col-11 mt-4">
                                <div class="row g-0 border rounded overflow-hidden flex-md-row shadow-sm h-md-250 position-relative">
                                    <div class="col mt-2 mb-2 p-4 d-flex flex-column position-static text-start">
                                        <div class="mb-3">
                                            <label for="" class="form-label">T&iacute;tulo</label>
                                            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="T&iacute;tulo...">
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="form-label ">Contenido</label>
                                            <div class="form-control text-editor" role="textbox" contenteditable="true" id="editor" ></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
        <script>
            function bold() {
                document.execCommand('bold', false, null);
            }

            function italic() {
                document.execCommand('italic', false, null);
            }

            function underline() {
                document.execCommand('underline', false, null);
            }

            document.getElementById('exampleColorInput').addEventListener('input', function (event) {
                var selectedColor = event.target.value;
                applyColor(selectedColor);
            });
            function changeColor() {
                var color = prompt('Introduce el color en formato hexadecimal:', '#000000');
                document.execCommand('foreColor', false, color);
            }
            function applyColor(color) {
                // Puedes hacer algo con el color seleccionado, como aplicarlo a un elemento en la página
                // Aquí hay un ejemplo donde se cambia el color del texto de un elemento con id 'miTexto'
                document.execCommand('foreColor', false, color);
            }
            function insertList() {
                document.execCommand('insertUnorderedList', false, null);
            }
        </script>
        <jsp:include page="../recursos/footer.jsp"/>
    </body>
</html>
