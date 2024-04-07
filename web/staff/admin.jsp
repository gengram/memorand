<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.beans.User"%>
<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.service.ServicesUtil"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.controller.InstitutionsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String admin_id = request.getParameter("id");
    String inst_id = "null";
    
    InstitutionsController instc = new InstitutionsController();
    
    // PROTECCIÓN
    
    // VARIABLES DEL ADMINISTRADOR
    
    String admin_email = "null", admin_name = "null", admin_pat = "null", admin_mat = "null";
    String admin_type = "null", admin_status = "null", admin_profile = "null";
    
    String action_status = "null";
    String admin_statusC = "null";
    
    if (admin_id != null)
    {
        UsersController userc = new UsersController();
        
        User admin = userc.modelGetUserInfoById(admin_id);
        
        if (admin != null)
        {
            admin_type = admin.getUser_type();

            if (admin_type != null && "admin".equals(admin_type))
            {
                admin_email = admin.getUser_email();
                admin_name = admin.getUser_name();
                admin_pat = admin.getUser_pat();
                admin_mat = admin.getUser_mat();
                admin_status = admin.getUser_status();
                admin_profile = admin.getUser_profile();
                
                ServicesUtil s = new ServicesUtil();
        
                action_status = s.transformActionStatus(admin_status);
                admin_statusC = s.transformServiceStatus(admin_status);
                
                InstitutionsController ic = new InstitutionsController();
                
                Institution inst = ic.modelGetInstByUser(admin_id);
                
                inst_id = inst.getInst_id();
            }
            else
            { response.sendRedirect("home.jsp"); }
        }
        else
        { response.sendRedirect("home.jsp"); }
    }
    else
    { response.sendRedirect("home.jsp"); }
    
    
    
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand Staff | <%= admin_name %> <%= admin_pat %></title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='institucion.jsp?id=<%= inst_id %>'>&larr;</a>Ver un administrador</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='ventas.jsp'>Ventas</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <img width="40" src="../<%= admin_profile %>" alt="Foto de <%= admin_name %> <%= admin_pat %>"/>
        <h2><%= admin_name %> <%= admin_pat %> <%= admin_mat %></h2>
        
        <a href='adminedit.jsp?id=<%= admin_id %>'>Editar</a>
        <a href='adminedit?req=status&id=<%= admin_id %>'><%= action_status %></a>
        
        <p>Correo: <%= admin_email %></p>
        <p>Estatus: <%= admin_statusC %></p>
        
        <p>ID: <%= admin_id %></p>
        
        <hr>
        
        <h2>Institucion a la que pertenece</h2>
        
        <!-- AQUI VA LA TABLA DE LA INSTITUCIÓN, VER COM.MEMORAND.SERVLETS.OBTENER / InstitutionsGet-->
        <div id="content">
            <%= instc.modelInstTableById(inst_id) %>
        </div>
        
        <br>
        
        <a href='admindel.jsp?id=<%= admin_id %>'>Eliminar administrador</a>
        
        <script src="scripts/institucion.js"></script>
        
    </body>

</html>