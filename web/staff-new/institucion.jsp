<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.service.ServicesUtil"%>
<%@page import="com.memorand.beans.Institution"%>
<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String inst_id = request.getParameter("id");
    
    // PROTECCIÓN
    
    // VARIABLES DE LA INSTITUCIÓN
    
    String inst_name = "null", inst_type = "null", inst_profile = "null", inst_status = "null";
    String lim_ch= "null", lim_wk = "null", lim_gp = "null", lim_ks = "null";
    String count_ch = "null", count_wk = "null", count_gp = "null", count_ks = "null";
    
    String action_status = "null";
    
    if (inst_id != null)
    {
        InstitutionsController instc = new InstitutionsController();
        
        Institution inst = instc.modelGetInstById(inst_id);
        
        inst_name = inst.getInst_name();
        inst_type = inst.getInst_type();
        inst_profile = inst.getInst_profile();
        inst_status = inst.getInst_status();
        lim_ch = inst.getLim_ch();
        lim_wk = inst.getLim_wk();
        lim_gp = inst.getLim_gp();
        lim_ks = inst.getLim_ks();
        
        InstitutionsController instcounter = new InstitutionsController();
        
        count_ch = instcounter.modelGetResourceCountById(inst_id, "ch");
        count_wk = instcounter.modelGetResourceCountById(inst_id, "wk");
        count_gp = instcounter.modelGetResourceCountById(inst_id, "teams");
        count_ks = instcounter.modelGetResourceCountById(inst_id, "projects");
        
        ServicesUtil s = new ServicesUtil();
        
        action_status = s.transformActionStatus(inst_status);
    }
    else { response.sendRedirect("home.jsp"); }
    
    // ADMINISTRADORES
    
    UsersController usersc = new UsersController();
    
%>

<!DOCTYPE html>

<html>

    <!-- HEAD -->
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand Staff | <%= inst_name %></title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='home.jsp'>&larr;</a>Ver una instituci&oacute;n</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='ventas.jsp'>Ventas</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <img width="40" src="../<%= inst_profile %>" alt="Foto de <%= inst_name %>"/>
        <h2><%= inst_name %></h2>
        
        <a href='instedit.jsp?id=<%= inst_id %>'>Editar</a>
        <a href='instedit?req=status&id=<%= inst_id %>'><%= action_status %></a>
        
        <p>Tipo: <%= inst_type %></p>
        <p>Lideres: <%= count_ch %>/<%= lim_ch %></p>
        <p>Integrantes: <%= count_wk %>/<%= lim_wk %></p>
        <p>Grupos: <%= count_gp %>/<%= lim_gp %></p>
        <p>Proyectos: <%= count_ks %>/<%= lim_ks %></p>
        
        <hr>
        
        <h2>Administradores</h2>
        
        <a href='adminnew.jsp?id=<%= inst_id %>'>Agregar administrador</a>
        <a href='#'>Instant&aacute;neo</a>
        
        <p>Estatus: <button id="active_admin">Activos</button> <button id="inactive_admin">Inactivos</button></p>
        
        <!-- AQUI VA LA TABLA DE ADMINISTRADORES, VER COM.MEMORAND.SERVLETS.OBTENER / User-->
        <div id="content">
            <%= usersc.modelGetAdmins(inst_id, "si") %>
        </div>
        
        <script src="scripts/institucion.js"></script>
        
    </body>

</html>