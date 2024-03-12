<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Proyecto nuevo</title>

        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">

    </head>

    <%-- BODY --%>
    <body>

        <jsp:include page="../../XM-Resources/pages/elements/navbar_admin_project.jspf"/>

        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10 mt-3">
                    <h3 class="mt-4 text-center">Proyecto nuevo</h3>

                    <div class="row">
                        <div class="col-4"></div>
                        <div class="col-4">

                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="row mt-3 ms-2 me-2">
                                        <form action="../../projnew" method="post" enctype="multipart/form-data" accept-charset="UTF-8">

                                            <input class="form-control" type="text" name="proj_name" id="proj_name" placeholder="Nombre proyecto" required>
                                            <div class="ms-4 me-4 mt-3">
                                                <div class="ms-5 me-5 mt-3">
                                                    <input class="form-control" type="color" name="proj_color" id="proj_color" required>
                                                </div>
                                            </div>
                                            <div class="text-center">
                                                <input class="btn custom-bsign mt-3 mb-3" type="submit" value="Alta proyecto">
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
        </div>


    </body>

</html>
