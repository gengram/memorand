<%-- 
    Memorand by Gengram © 2023
--%>
<%@ page import="java.util.*,java.text.*" %>
<%@ page import="com.miaplicacion.Pendiente" %> <%-- Reemplaza 'tu.paquete' con el nombre de tu paquete real --%>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/paginas/import.jsp"/>
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css" type="text/css">
        <style>
            table {
                border-collapse: collapse;
                width: 300px;
                margin: 0 auto;
            }

            th, td {
                border: none; /* Eliminamos todos los bordes en las celdas */
                padding: 10px;
                text-align: center;
            }
        </style>
    </style>
    <title>Pendientes</title>
    <script>
        function agregarPendiente() {
            var textoPendiente = prompt("Ingrese el nuevo pendiente:");
            var fechaExpiracion = prompt("Ingrese la fecha de expiración (dd/MM/yyyy):");
            if (textoPendiente && fechaExpiracion) {
                window.location.href = '/memorand/agregarPendiente?texto=' + encodeURIComponent(textoPendiente) +
                                       '&fechaExpiracion=' + encodeURIComponent(fechaExpiracion);
            }
        }

        function calcularTiempoRestante(fechaExpiracion) {
            var fechaVencimiento = new Date(fechaExpiracion);
            var hoy = new Date();
            var diferencia = fechaVencimiento.getTime() - hoy.getTime();
            var diasRestantes = Math.ceil(diferencia / (1000 * 3600 * 24));
            return diasRestantes > 0 ? diasRestantes + ' días restantes' : 'Vencido';
        }
    </script>

</head>

<%
        //PROTECCION
        /*String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        if (tipo_usuario == null || !tipo_usuario.equals("alumno")) {
            response.sendRedirect("../index.jsp");
        }*/
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
                <div class="row row-cols-2">
                    <div class="col">
                        <table class="table table-responsive  text-center mt-3 ">
                            <tr>
                                <th>Pendiente </th>
                                <th>Vencida</th>
                                <th>Completada</th>
                            </tr>
                            <tr>
                                <th class="" style="background-color: #B7E0DD"></th>
                                <th class="" style="background-color: #309D8F"></th>
                                <th class="" style="background-color: #B7E0DD"></th>
                            </tr>
                        </table>
                    </div>
                    <div class="col"><button class="btn custom-bsign mt-4" onclick="agregarPendiente()"><i class="bi bi-plus-circle"></i> Nuevo Pendiente </button></div>
                </div>
                
                <% 
                List<Pendiente> pendientes = (List<Pendiente>) application.getAttribute("pendientes");
                if (pendientes == null) {
                    pendientes = new ArrayList<>();
                    application.setAttribute("pendientes", pendientes);
                }
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                for (Pendiente p : pendientes) { 
                %>
                <div class="row row-cols-1">

                    <div class="col">
                        <div class="col" style="max-width: 550px; max-height: 35px;">
                            <table class="table table-responsive mt-2">
                                <tr>
                                    <th class="text-start"><%= sdf.format(p.getFechaCreacion()) %></th>
                                    <th></th>
                                    <th class="text-end text-secondary">Expira el: <%= sdf.format(p.getFechaExpiracion()) %></th>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card mb-3" style="max-width: 550px; max-height: 130px;background-color: #A3E3CA; border: none">
                            <div class="row g-0">
                                <div class="col-3">
                                    <div class="card-body"><%= p.getTexto() %></div>
                                </div>
                                <div class="col-9"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
                
            </div>
            <div class="col-1">
                <button type="button" class="btn border-0 rounded-circle ms-5" style="color: #27988A;" data-bs-toggle="dropdown" aria-expanded="false">
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <i class="bi bi-question-circle-fill" style="font-size: 30px;"></i>
                    <br>
                </button>
            </div>
        </div>
    </div>
    <jsp:include page="../recursos/paginas/footer.jsp"/>
</body>
</html>
