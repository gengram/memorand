<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/paginas/import.jsp"/>
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css" type="text/css">
        <link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
        <title>Calendario</title>

        <style>
            .table-bordered td, .table-bordered th {
                border: 1px solid #dee2e6;
            }
            #mesSelector, #añoSelector {
                display: none;
            }
        </style>
        <script src="../recursos/scripts/calendario.js"></script>
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
                    <div class="container mt-5" style="max-width: 800px;">
                        <h3 id="mesAño" style="font-family: 'Fugaz One', cursive;"class="text-primary"></h3>
                        <div class="table-responsive">
                            <table class="table table-bordered mt-3 border-primary border-5">
                                <thead>
                                    <tr class="text-center" style="background-color: transparent;">
                                        <th class="border-white border-3" style="color: #27988A">Dom</th>
                                        <th class="border-white border-3" style="color: #27988A">Lun</th>
                                        <th class="border-white border-3" style="color: #27988A">Mar</th>
                                        <th class="border-white border-3" style="color: #27988A">Mié</th>
                                        <th class="border-white border-3" style="color: #27988A">Jue</th>
                                        <th class="border-white border-3" style="color: #27988A">Vie</th>
                                        <th class="border-white border-3" style="color: #27988A">Sáb</th>
                                    </tr>
                                </thead>
                                <tbody id="calendario">
                                </tbody>
                            </table>
                        </div>
                        <div id="mesSelector" class="table-responsive">
                            <table class="table table-bordered mt-3 border-primary border-5">
                                <thead>
                                    <tr>
                                        <th colspan="4" style="background-color: #7BC3BC">Selecciona un Mes</th>
                                    </tr>
                                </thead>
                                <tbody id="meses" class="border-2" style="color: #7BC3BC">
                                </tbody>
                            </table>
                        </div>
                        <div id="añoSelector" class="table-responsive">
                            <table class="table table-bordered mt-3 border-primary border-5">
                                <thead>
                                    <tr>
                                        <th colspan="4" style="background-color: #7BC3BC">Selecciona un Año</th>
                                    </tr>
                                </thead>
                                <tbody id="años" class="border-2" style="color: #7BC3BC">
                                </tbody>
                            </table>
                        </div>

                        <div class="d-flex justify-content-between align-items-center">
                            <button id="btnAnterior" class="btn custom-bsign"><i class="bi bi-arrow-left"></i></button>
                            <button id="btnSiguiente" class="btn custom-bsign"><i class="bi bi-arrow-right"></i></button>
                            <button id="btnElegirMes" class="btn custom-bsign">Elegir Mes</button>
                            <button id="btnElegirAño" class="btn custom-bsign">Elegir Año</button>
                        </div>
                    </div> 
                </div>
                <div class="col-1">
                    
                </div>
            </div>
        </div>
        <jsp:include page="../recursos/paginas/calendarioJS.jsp"/>
        <jsp:include page="../recursos/paginas/footer.jsp"/>
    </body>
</html>
