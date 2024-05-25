<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.service.ServicesModel"%>
<%@page import="com.memorand.service.ServicesUtil"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // PROTECCIÓN
    String u = (String) session.getAttribute("user_type");
    
    if(session == null || u == null || !u.equals("staff"))
    {
        response.sendRedirect("../index.jsp?error=InvalidSession");
    }
    
    ServicesModel servicem = new ServicesModel();
    ServicesUtil serviceu = new ServicesUtil();

    String system_status = servicem.getServiceStatus("9cd15faf-0fa5-482c-a7dd-d07790797528", false);
    String sales_status = servicem.getServiceStatus("c10c1331-6801-4402-b62d-b860d443885b", false);
    String tester_status = servicem.getServiceStatus("99949271-4466-46bc-b306-aa171e7e81b3", true);

    String system_statusC = "null", sales_statusC = "null", tester_statusC = "null";

    String system_statusA = "null", sales_statusA = "null", tester_statusA = "null";

    if (sales_status != null && system_status != null && tester_status != null) {
        system_statusC = serviceu.transformServiceStatus(system_status);
        sales_statusC = serviceu.transformServiceStatus(sales_status);
        tester_statusC = serviceu.transformServiceStatus(tester_status);

        system_statusA = serviceu.transformActionStatus(system_status);
        sales_statusA = serviceu.transformActionStatus(sales_status);
        tester_statusA = serviceu.transformActionStatus(tester_status);
    }
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-staff_1.svg">

        <title>Memorand Staff | Configuracion</title>

        <script src="scripts/configuracion.js"></script>

    </head>

    <!-- BODY -->
    <body>

        <jsp:include page="../XM-Resources/pages/elements/navbar_staff.jspf"/>

        <div class="container">
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-9">
                    <h1>Configuraci&oacute;n</h1>
                </div>
                <div class="col-2 mt-3">
                    <p style="color: #7473C0; font-size: 18px;"><a id="backLink" href='home.jsp' style="color: #7473C0;"><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-10">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="align-middle">
                                    <div class="row mt-2 mb-2">
                                        <div class="col-12">
                                            <a href=''><p class="mt-2" style="color: #4A4F54;">Descargar formato de administradores</p></a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="align-middle">
                                    <div class="row mt-2 mb-2">
                                        <div class="col-12">
                                            <a hrredef=''><p class="mt-2" style="color: #4A4F54;">Descargar formato de personal</p></a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="align-middle">
                                    <div class="row mt-3 mb-2">
                                        <div class="col-6">
                                            <a href='#' onclick="confirmAction('sales', '<%= sales_status%>');"><p style="color: red"><%= sales_statusA%> formulario de ventas</p></a>
                                        </div>
                                        <div class="col-6 text-end">
                                            <p><%= sales_statusC%></p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="align-middle">
                                    <div class="row mt-3 mb-2">
                                        <div class="col-6">
                                            <a href='#' onclick="confirmAction('tester', '<%= tester_status%>');"><p style="color: red"><%= tester_statusA%> formulario de testers</p></a> 
                                        </div>
                                        <div class="col-6 text-end">
                                            <p><%= tester_statusC%></p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="align-middle">
                                    <div class="row mt-3 mb-2">
                                        <div class="col-6">
                                            <a href='#' onclick="confirmAction('system', '<%= system_status%>');"><p style="color: red"><%= system_statusA%> memorand</p></a>
                                        </div>
                                        <div class="col-6 text-end">
                                            <p><%= system_statusC%></p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

    </body>

</html>