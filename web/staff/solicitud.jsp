<%@page import="java.sql.Timestamp"%>
<%@page import="com.memorand.beans.AppRequest"%>
<%@page import="com.memorand.controller.AppRequestsController"%>
<!-- Memorand by Gengram © 2023 -->

<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String req_id = request.getParameter("id");
    
    String req_name = "", req_pat = "", req_mat = "", req_email = "", req_phone = "", req_job = "";
    String req_inst = "", req_num = "", req_status = "", req_msg = "";
    
    Timestamp req_date;
    
    if (req_id != null) 
    {
        AppRequestsController reqc = new AppRequestsController();
        AppRequest req = reqc.modelGetRequest(req_id);
        
        if (req != null) 
        {
            req_name = req.getReq_name();
            req_pat = req.getReq_pat();
            req_mat = req.getReq_mat();
            req_email = req.getReq_email();
            req_phone = req.getReq_phone();
            req_job = req.getReq_job();
            
            req_date = req.getReq_date();
            
            req_inst = req.getReq_inst();
            req_num = req.getReq_num();
            req_status = req.getReq_status();
            req_msg = req.getReq_msg();
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand Staff | Solicitud</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='ventas.jsp'>&larr;</a> Solicitud</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='home.jsp'>Panel de control</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <p>Estado de la solicitud: <%= reqc.convertStatus(req_status).get(0) %></p>
        <h2>Solicitud: <%= req_id %></h2>
        
        <h3>Informaci&oacute;n del solicitante:</h3>
        <p>Nombre: <%= req_name %></p>
        <p>Apellido P: <%= req_pat %></p>
        <p>Apellido M: <%= req_mat %></p>
        <p>Correo E: <%= req_email %></p>
        <p>Tel&eacute;fono: <%= req_phone %></p>
        <p>Puesto: <%= req_job %></p>
        
        <h3>Informaci&oacute;n de la solicitud</h3>
        <p>Empresa: <%= req_inst %></p>
        <p>Usuarios: <%= req_num %></p>
        
        <h3>Informaci&oacute;n adicional</h3>
        <p><%= req_msg %></p>
        
        <a href='../reqdel?id=<%= req_id %>'>Eliminar solicitud</a>
        <a href='../reqstat?id=<%= req_id %>&status=<%= req_status %>'><%= reqc.convertStatus(req_status).get(1) %></a>
        
    </body>

</html>

<%
        }
        else
        { response.sendRedirect("ventas.jsp"); }
    }
    else
    { response.sendRedirect("ventas.jsp"); }
%>
