<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Ventas</title>

        <link rel="stylesheet" href="XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="XM-Resources/vector/memorand-bee.svg">

    </head>

    <!-- BODY -->
    <body>

        <jsp:include page="XM-Resources/pages/elements/shortbar.jspf"/>
        <jsp:include page="XM-Resources/pages/elements/login.jspf"/>

        <div class="container">
            <div class="row mt-5 mb-5">
                <div class="col-1"></div>
                <div class="col-6 mt-4">
                    <h1 class="ms-3" style=" margin-bottom: 1px;">Restablece tu</h1>
                    <h1 class="mb-4 ms-3">contrase&ntilde;a</h1>
                </div>
                <div class="col-4 mt-4">
                    <form>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Nueva contrase&ntilde;a</label>
                            <input type="text" id="disabledTextInput" class="form-control" placeholder="******">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Confirmar</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="******">
                        </div>
                        <div class="d-grid gap-2 text-center">
                            <button type="submit" class="btn custom-bsign">Contactar ventas</button>
                        </div>
                    </form>
                </div>
                <div class="col-1"></div>
            </div>
        </div>
        
        
        <!-- Confirmación -->
        <div class="container">
            <div class="row mt-5 mb-5">
                <div class="col-1"></div>
                <div class="col-6 mt-4">
                    <h1 class="ms-3" style=" margin-bottom: 1px;">Restablece tu</h1>
                    <h1 class="mb-4 ms-3">contrase&ntilde;a</h1>
                    <p class="ms-3" style="font-size: 30px; margin-bottom: 0.4px;">Token ya utilizado</p>
                </div>
                <div class="col-4 mt-4 text-end">
                    <p style="color: #25ce7b; font-size: 20px;"><i class="bi bi-chevron-left me-1"></i>Regresar al inicio</p>
                </div>
                <div class="col-1"></div>
            </div>
        </div>
        
    </body>
</html>

