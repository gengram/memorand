<!-- Memorand by Gengram © 2023 -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // REDIRECCIONAR SI YA INICIÓ SESIÓN
    String user_type = (String) session.getAttribute("user_type");

    if (user_type != null || "".equals(user_type)) {
        switch (user_type) {
            case "staff":
                response.sendRedirect("staff/home.jsp");
                break;
            case "admin":
                response.sendRedirect("admin/home.jsp");
                break;
            default:
                response.sendRedirect("work/home.jsp");
                break;
        }
    }
%>

<!DOCTYPE html>

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
                <div class="col-6">
                    <h1 style=" margin-bottom: 1px;">Habla con nuestro </h1>
                    <h1 class="mb-4">equipo de ventas</h1>
                    <p style="font-size: 30px; margin-bottom: 0.4px;">Contrata <img src="XM-Resources/vector/memorand-ext.svg" alt="memorand" width="180"></p>
                    <p style="font-size: 30px;">para tu empresa o negocio.</p>
                    <br>
                    <p style="font-size: 30px; margin-bottom: 0.4px;">Llena este formulario y nos</p>
                    <p style="font-size: 30px; margin-bottom: 0.4px;">pondremos en contacto</p>
                    <p style="font-size: 30px; margin-bottom: 0.4px;">contigo en poco tiempo.</p>
                </div>
                <div class="col-4">
                    <form action="reqnew" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <input id="req_name" name="req_name" type="text" class="form-control" placeholder="John" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Apellidos</label>
                            <div class="row">
                                <div class="col-6">
                                    <input id="req_pat" name="req_pat" type="text" class="form-control" placeholder="Doe" required>
                                </div>
                                <div class="col-6">
                                    <input id="req_mat" name="req_mat" type="text" class="form-control" placeholder="Foo" required>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nombre de tu instituci&oacute;n</label>
                            <input id="req_inst" name="req_inst" type="text" class="form-control" placeholder="Empresa genial" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Correo electr&oacute;nico de la instituci&oacute;n</label>
                            <input id="req_email" name="req_email" type="email" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tel&eacute;fono</label>
                            <input id="req_phone" name="req_phone" type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Puesto de trabajo</label>
                            <input id="req_job" name="req_job" type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="req_num" class="form-label">N&uacute;mero de usuarios esperados</label>
                            <select id="req_num" name="req_num" class="form-select" required>
                                <option value="" disabled selected hidden>Selecciona una opci&oacute;n</option>
                                <option value="-100">Menos de 100 personas</option>
                                <option value="-1000">Menos de 1,000 personas</option>
                                <option value="-5000">Menos de 5,000 personas</option>
                                <option value="+5000">M&aacute;s de 5,000 personas</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mensaje</label>
                            <textarea id="req_msg" name="req_msg" class="form-control" required style="width: 100%; height: 200px;" id="exampleFormControlTextarea1" rows="3" placeholder="Este es tu espacio donde puedes hacer preguntas, tus expectativas o cualquier cosa que necesites de nosotros."></textarea>
                        </div>
                        <div class="d-grid gap-2 text-center">
                            <button type="submit" class="btn custom-bsign">Contactar ventas</button>
                            <hr class="my-2">
                            <p class="mb-3 text-primary" style="font-size: 80%;">Condiciones de uso | Política de privacidad</p>
                        </div>
                    </form>
                </div>
                <div class="col-1"></div>
            </div>
        </div>
</body>

</html>
