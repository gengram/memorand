<!-- Memorand by Gengram © 2023 -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand Staff | Configuracion</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='home.jsp'>&larr;</a> Panel de ventas</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='ventas.jsp'>Ventas</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <h2>Solicitudes</h2>
        <p>Estatus: <button onclick="getReqByStatus('si')">Activas</button> <button onclick="getReqByStatus('si')">Inactivas</button></p>
        
    </body>

</html>