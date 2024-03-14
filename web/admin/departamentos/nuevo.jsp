<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Departamento nuevo</title>

        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">

    </head>

    <%-- BODY --%>
    <body>

        <jsp:include page="../../XM-Resources/pages/elements/navbar_admin_depto.jspf"/>

        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10 mt-3">

                    <h3 class="mt-4 text-center">Departamento nuevo</h3>

                    <div class="row">
                        <div class="col-4"></div>
                        <div class="col-4">

                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="row mt-3 ms-2 me-2">
                                        <form action="../../teamnew" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                                            <input class="form-control" type="text" name="team_name" id="team_name" placeholder="Nombre departamento" required>
                                            <div class="ms-4 me-4 mt-3">
                                                <div class="ms-5 me-5 mt-3">
                                                    <input class="form-control" type="color" name="team_color" id="team_color" required>
                                                </div>
                                            </div>
                                            <div class="text-center">
                                                <input class="btn custom-bsign mt-3 mb-3" type="submit" value="Alta departamento">
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-4"></div>

                    </div>
                </div>
                <div class="col-1"></div>
            </div>

    </body>

</html>
