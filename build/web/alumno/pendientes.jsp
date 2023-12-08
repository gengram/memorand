<%-- 
    Memorand by Gengram © 2023
--%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/import.jsp"/>
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css" type="text/css">
        <style>
            table {
                border-collapse: collapse;
                width: 300px;
                margin: 0 auto;
            }

            th, td {
                border: none; /* Eliminamos todos los bordes en las celdas */
                padding: 10px;
                text-align: center;
            }
        </style>
    </style>
    <title>Pendientes</title>
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
                    <div class="col">
                        <table class="table table-responsive  text-center mt-3 ">
                            <tr>
                                <th>Pendiente </th>
                                <th>Vencida</th>
                                <th>Completada</th>
                            </tr>
                            <tr>
                                <th class="" style="background-color: #B7E0DD"></th>
                                <th class="" style="background-color: #309D8F"></th>
                                <th class="" style="background-color: #B7E0DD"></th>
                            </tr>
                        </table>
                    </div>
                    <div class="col"><button class="btn custom-bsign mt-4"><i class="bi bi-plus-circle"></i> Nuevo Pendiente </button></div>
                </div>
                <div class="row row-cols-1">

                    <div class="col">
                        <div class="col" style="max-width: 550px; max-height: 35px;">
                            <table class="table table-responsive mt-2">
                                <tr>
                                    <th class="text-start">7 de Junio</th>
                                    <th></th>
                                    <th class="text-end text-secondary">Vencio hace 4 meses</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-3" style="max-width: 550px; max-height: 130px;background-color: #A3E3CA; border: none">
                            <div class="row g-0">
                                <div class="col-3">
                                    <div class="card-body"></div>
                                </div>
                                <div class="col-9"></div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="col" style="max-width: 550px; max-height: 35px;">
                            <table class="table table-responsive mt-2">
                                <tr>
                                    <th class="text-start">22 de Octubre 2022 </th>
                                    <th></th>
                                    <th class="text-end text-secondary">Completada</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-3" style="max-width: 550px; max-height: 130px;background-color: #A3E3CA; border: none">
                            <div class="row g-0">
                                <div class="col-3">
                                    <div class="card-body"></div>
                                </div>
                                <div class="col-9"></div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="col" style="max-width: 550px; max-height: 35px;">
                            <table class="table table-responsive mt-2">
                                <tr>
                                    <th class="text-start">31 de Octubre</th>
                                    <th></th>
                                    <th class="text-end text-secondary">Pendiente</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-3" style="max-width: 550px; max-height: 130px;background-color: #A3E3CA; border: none">
                            <div class="row g-0">
                                <div class="col-3">
                                    <div class="card-body"></div>
                                </div>
                                <div class="col-9"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="col" style="max-width: 550px; max-height: 35px;">
                            <table class="table table-responsive mt-2">
                                <tr>
                                    <th class="text-start">6 de Noviembre</th>
                                    <th></th>
                                    <th class="text-end text-secondary">Pendiente</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-3" style="max-width: 550px; max-height: 130px;background-color: #A3E3CA; border: none">
                            <div class="row g-0">
                                <div class="col-3">
                                    <div class="card-body"></div>
                                </div>
                                <div class="col-9"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="col" style="max-width: 550px; max-height: 35px;">
                            <table class="table table-responsive mt-2">
                                <tr>
                                    <th class="text-start">15 de Noviembre</th>
                                    <th></th>
                                    <th class="text-end text-secondary">Pendiente</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-3" style="max-width: 550px; max-height: 130px;background-color: #A3E3CA; border: none">
                            <div class="row g-0">
                                <div class="col-3">
                                    <div class="card-body"></div>
                                </div>
                                <div class="col-9"></div>
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
    <jsp:include page="../recursos/paginas/footer.jsp"/>
</body>
</html>
