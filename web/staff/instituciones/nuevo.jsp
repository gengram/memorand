<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String staff_type = (String) session.getAttribute("user_type");

    if (staff_type == null || !staff_type.equals("staff")) {
        response.sendRedirect("../index.jsp?error=100");
        session.invalidate();
    }
%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Nueva institución</title>

        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">

    </head>

    <%-- BODY --%>
    <body>

        <jsp:include page="../../XM-Resources/pages/elements/navbar_staff_1.jspf"/>

        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">

                    <h3 class="mt-4" style="color: #404040">Nueva institución</h3>
                    <form action="../../instnew" method="post" enctype="multipart/form-data" accept-charset="UTF-8">

                        <div class="row mt-3">
                            <div class="col-4">
                                <input class="form-control" type="text" name="inst_name" id="inst_name" placeholder="Nombre institucion" required>
                            </div>
                            <div class="col-1">
                            </div>
                            <div class="col-4">
                                <select class="form-select" name="inst_type" id="inst_type">
                                    <option value="" disabled selected hidden>Tipo</option>
                                    <option value="empresa">Empresa</option>
                                </select>

                            </div>
                            <div class="col-3"></div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-4">
                                <input class="form-control" type="file" name="inst_profile" id="inst_profile" required>
                            </div>
                            <div class="col-1">
                            </div>
                            <div class="col-4">

                                <input class="form-control" type="text" name="lim_ch" id="lim_ch" placeholder="Limite lideres" required>
                            </div>
                            <div class="col-3"></div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-4">
                                <input class="form-control" type="text" name="lim_wk" id="lim_wk" placeholder="Limite integrantes" required>
                            </div>
                            <div class="col-1">
                            </div>
                            <div class="col-4">
                                <input class="form-control" type="text" name="lim_gp" id="lim_gp" placeholder="Limite grupos" required>
                            </div>
                            <div class="col-3"></div>
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-4">
                        <input class="form-control" type="text" name="lim_ks" id="lim_ks" placeholder="Limite clases" required>        
                            </div>
                            <div class="col-1">
                            </div>
                            <div class="col-4">

                            </div>
                            <div class="col-3"></div>
                        </div>

                        <input class="btn custom-blog mt-4" type="submit" value="Alta institucion">
                    </form>

                </div>
                <div class="col-1"></div>
            </div>
        </div>


    </body>

</html>
