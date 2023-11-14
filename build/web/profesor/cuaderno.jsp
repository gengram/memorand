<%-- 
    Memorand by Gengram © 2023
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/import.jsp"/>
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
        <jsp:include page="../recursos/footer.jsp"/>
    </body>
</html>
