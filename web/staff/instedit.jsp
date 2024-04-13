<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.service.ServicesUtil"%>
<%@page import="com.memorand.beans.Institution"%>
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
        
        Institution inst = instc.modelGetInst(inst_id);
        
        if (inst != null)
        {
            inst_name = inst.getInst_name();
            inst_type = inst.getInst_type();
            inst_profile = inst.getInst_profile();
            inst_status = inst.getInst_status();
            lim_ch = inst.getLim_ch();
            lim_wk = inst.getLim_wk();
            lim_gp = inst.getLim_gp();
            lim_ks = inst.getLim_ks();

            InstitutionsController instcounter = new InstitutionsController();

            count_ch = instcounter.modelGetResourceCount(inst_id, "ch");
            count_wk = instcounter.modelGetResourceCount(inst_id, "wk");
            count_gp = instcounter.modelGetResourceCount(inst_id, "teams");
            count_ks = instcounter.modelGetResourceCount(inst_id, "projects");
            
            ServicesUtil s = new ServicesUtil();

            action_status = s.transformActionStatus(inst_status);
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

        <title>Memorand Staff | Editar instituci&oacute;n</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='institucion.jsp?id=<%= inst_id %>'>&larr;</a>Editar instituci&oacute;n</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='ventas.jsp'>Ventas</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <form action="../instnew" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <input type="file" name="inst_profile" id="inst_profile" required>
            
            <br> <br>
            
            <input type="text" name="inst_name" id="inst_name" placeholder="Nombre institucion" required>

            <select name="inst_type" id="inst_type">
                <option value="" disabled selected hidden>Tipo</option>
                <option value="Empresa">Empresa</option>
                <option value="Escuela" disabled>Escuela</option>
            </select>

            <br> <br>
            
            <input type="text" name="lim_ch" id="lim_ch" placeholder="Limite lideres" required>

            <input type="text" name="lim_wk" id="lim_wk" placeholder="Limite integrantes" required>

            <input type="text" name="lim_gp" id="lim_gp" placeholder="Limite grupos" required>

            <input type="text" name="lim_ks" id="lim_ks" placeholder="Limite clases" required>        

            <br> <br>
            
            <input type="submit" value="Alta institucion">
        </form>
        
    </body>

</html>