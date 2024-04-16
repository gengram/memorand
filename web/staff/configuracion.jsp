<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.service.ServicesModel"%>
<%@page import="com.memorand.service.ServicesUtil"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ServicesModel servicem = new ServicesModel();
    ServicesUtil serviceu = new ServicesUtil();

    String system_status = servicem.getServiceStatus("9cd15faf-0fa5-482c-a7dd-d07790797528", false);
    String sales_status = servicem.getServiceStatus("c10c1331-6801-4402-b62d-b860d443885b", false);
    String tester_status = servicem.getServiceStatus("99949271-4466-46bc-b306-aa171e7e81b3", true);

    String system_statusC = "null", sales_statusC = "null", tester_statusC = "null";

    String system_statusA = "null", sales_statusA = "null", tester_statusA = "null";

    if (sales_status != null && system_status != null && tester_status != null)
    {
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

        <title>Memorand Staff | Configuracion</title>
        
        <script src="scripts/configuracion.js"></script>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='home.jsp'>&larr;</a> Configuraci&oacute;n</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='ventas.jsp'>Ventas</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <!-- PONER ESTOS COMO EL LOOK AND FEEL-->
        <p><a href=''>Descargar formato de administradores</a></p>
        <p><a href=''>Descargar formato de personal</a></p>
        <p><a href='#' onclick="confirmAction('sales','<%= sales_status %>');"><%= sales_statusA %> formulario de ventas</a> Status actual: <%= sales_statusC %></p>
        <p><a href='#' onclick="confirmAction('tester','<%= tester_status %>');"><%= tester_statusA %> formulario de testers</a> Status actual: <%= tester_statusC %></p>
        <p><a href='#' onclick="confirmAction('system','<%= system_status %>');"><%= system_statusA %> memorand</a> Status actual: <%= system_statusC %></p>
        
    </body>

</html>