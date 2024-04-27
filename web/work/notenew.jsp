<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.TeamsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String team_id = request.getParameter("id");
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | Crear nota</title>

    </head>

    <!-- BODY -->
    <body>

        <?xml version="1.0" encoding="UTF-8" standalone="no" ?>
        <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="3500" height="3000" viewBox="0 0 3500 3000" xml:space="preserve">
    <desc>Created with Fabric.js 4.5.0</desc>
    <defs>
    </defs>
    <rect x="0" y="0" width="100%" height="100%" fill="#fff"></rect>
    <g transform="matrix(1 0 0 1 0.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 50.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 100.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 150.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 200.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 250.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 300.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 350.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 400.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 450.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 500.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 550.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 600.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 650.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 700.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 750.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 800.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 850.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 900.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 950.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1000.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1050.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1100.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1150.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1200.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1250.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1300.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1350.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1400.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1450.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1500.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1550.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1600.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1650.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1700.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1750.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1800.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1850.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1900.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1950.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2000.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2050.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2100.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2150.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2200.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2250.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2300.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2350.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2400.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2450.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2500.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2550.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2600.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2650.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2700.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2750.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2800.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2850.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2900.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 2950.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 3000.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 3050.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 3100.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 3150.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 3200.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 3250.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 3300.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 3350.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 3400.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 3450.5 1500)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="0" y1="-1500" x2="0" y2="1500" />
    </g>
    <g transform="matrix(1 0 0 1 1750 0.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 50.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 100.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 150.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 200.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 250.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 300.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 350.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 400.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 450.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 500.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 550.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 600.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 650.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 700.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 750.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 800.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 850.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 900.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 950.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1000.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1050.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1100.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1150.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1200.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1250.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1300.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1350.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1400.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1450.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1500.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1550.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1600.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1650.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1700.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1750.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1800.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1850.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1900.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 1950.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2000.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2050.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2100.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2150.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2200.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2250.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2300.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2350.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2400.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2450.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2500.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2550.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2600.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2650.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2700.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2750.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2800.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2850.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2900.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(1 0 0 1 1750 2950.5)"  >
    <line style="stroke: rgb(255,255,255); stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-1750" y1="0" x2="1750" y2="0" />
    </g>
    <g transform="matrix(3.66 0 0 3.66 545.61 447.18)"  >
    <rect style="stroke: rgb(169,106,210); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(169,106,210); fill-rule: nonzero; opacity: 1;"  x="-50" y="-50" rx="0" ry="0" width="100" height="100" />
    </g>
    <g transform="matrix(3.51 0 0 3.51 811.86 445.43)"  >
    <circle style="stroke: rgb(106,210,176); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(106,210,176); fill-rule: nonzero; opacity: 1;"  cx="0" cy="0" r="50" />
    </g>
    <g transform="matrix(3.6 0 0 3.6 1109.61 446.18)"  >
    <polygon style="stroke: rgb(210,106,151); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(210,106,151); fill-rule: nonzero; opacity: 1;"  points="-50,0 0,-50 50,0 0,50 " />
    </g>
    <g transform="matrix(3.88 0 0 3.88 1440.02 456.52)"  >
    <rect style="stroke: rgb(193,119,16); stroke-width: 2; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(193,119,16); fill-rule: nonzero; opacity: 1;"  x="-75" y="-37.5" rx="0" ry="0" width="150" height="75" />
    </g>
    <g transform="matrix(5.04 0 0 5.04 1287.62 448.17)" style=""  >
    <text xml:space="preserve" font-family="Times New Roman" font-size="20" font-style="normal" font-weight="normal" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(222,194,156); fill-rule: nonzero; opacity: 1; white-space: pre;" ><tspan x="-22.63" y="-6.83" >Texto</tspan><tspan x="-22.63" y="19.39" >aquí</tspan></text>
    </g>
    <g transform="matrix(1 0 0 1 807.5 447.07)"  >
    <line style="stroke: rgb(195,156,222); stroke-width: 3; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(0,0,0); fill-rule: nonzero; opacity: 1;"  x1="-75" y1="-75" x2="75" y2="75" />
    </g>
    <g transform="matrix(1 0 0 1 534 426.5)"  >
    <path style="stroke: rgb(195,156,222); stroke-width: 4; stroke-dasharray: none; stroke-linecap: round; stroke-dashoffset: 0; stroke-linejoin: round; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;"  transform=" translate(-534, -426.5)" d="M 619.004 311.004 Q 619 311 618 311 Q 617 311 615.5 310.5 Q 614 310 612.5 309.5 Q 611 309 607.5 308 Q 604 307 601 306 Q 598 305 596 305 Q 594 305 592 305 Q 590 305 586.5 305 Q 583 305 577.5 304 Q 572 303 564.5 301.5 Q 557 300 550.5 299.5 Q 544 299 539 297.5 Q 534 296 526 295.5 Q 518 295 513.5 294.5 Q 509 294 506 294 Q 503 294 499.5 294 Q 496 294 491.5 295 Q 487 296 481.5 297.5 Q 476 299 471.5 300.5 Q 467 302 464.5 303.5 Q 462 305 460.5 306.5 Q 459 308 457 310 Q 455 312 453.5 314 Q 452 316 450.5 318.5 Q 449 321 447 324 Q 445 327 443 331 Q 441 335 440 339 Q 439 343 439 344.5 Q 439 346 439 347.5 Q 439 349 439 350 Q 439 351 440 353 Q 441 355 442 356.5 Q 443 358 444 359.5 Q 445 361 446.5 362.5 Q 448 364 449.5 365.5 Q 451 367 452.5 368 Q 454 369 455.5 370.5 Q 457 372 458.5 373.5 Q 460 375 463 376.5 Q 466 378 473.5 381.5 Q 481 385 486 387.5 Q 491 390 497 393.5 Q 503 397 509.5 400 Q 516 403 522 405 Q 528 407 533 409 Q 538 411 540.5 412 Q 543 413 544 413.5 Q 545 414 546.5 414 Q 548 414 552 414.5 Q 556 415 561 416 Q 566 417 571.5 417.5 Q 577 418 582.5 418.5 Q 588 419 593 419 Q 598 419 600 420 Q 602 421 602.5 421 Q 603 421 604 422 Q 605 423 606.5 424.5 Q 608 426 609.5 427.5 Q 611 429 612.5 430.5 Q 614 432 615 433.5 Q 616 435 617.5 437 Q 619 439 620 440.5 Q 621 442 622 445 Q 623 448 624 451 Q 625 454 625.5 462.5 Q 626 471 626.5 476.5 Q 627 482 627.5 486 Q 628 490 628.5 493 Q 629 496 629 498 Q 629 500 628.5 501.5 Q 628 503 627 504.5 Q 626 506 625 507.5 Q 624 509 621.5 511.5 Q 619 514 617.5 516.5 Q 616 519 614.5 521 Q 613 523 611.5 525.5 Q 610 528 608 530 Q 606 532 605 533.5 Q 604 535 602 536.5 Q 600 538 597.5 538.5 Q 595 539 593.5 540 Q 592 541 587.5 542.5 Q 583 544 581 544.5 Q 579 545 576 546 Q 573 547 568.5 548.5 Q 564 550 559 550.5 Q 554 551 551 552 Q 548 553 545 553.5 Q 542 554 538 554.5 Q 534 555 530 556.5 Q 526 558 522 558.5 Q 518 559 513.5 559 Q 509 559 506 559 Q 503 559 500.5 558 Q 498 557 495 555.5 Q 492 554 487 552 Q 482 550 476 548 Q 470 546 465 544.5 Q 460 543 458 543 Q 456 543 454 541.5 L 451.996 539.996" stroke-linecap="round" />
    </g>
    </svg>

</body>

</html>