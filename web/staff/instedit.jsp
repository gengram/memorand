<%@page import="com.memorand.service.ServicesUtil"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.controller.InstitutionsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // PROTECCIÓN
    String u = (String) session.getAttribute("user_type");
    
    if(session == null || u == null || !u.equals("staff")) {
        response.sendRedirect("../index.jsp?error=InvalidSession");
    }
    
    String inst_id = request.getParameter("id");
    
    // PROTECCIÓN
    
    // VARIABLES DE LA INSTITUCIÓN
    String inst_name = "null", inst_type = "null", inst_profile = "null", inst_status = "null";
    String lim_ch = "null", lim_wk = "null", lim_gp = "null", lim_ks = "null";
    String count_ch = "null", count_wk = "null", count_gp = "null", count_ks = "null";
    
    String action_status = "null";
    
    if (inst_id != null) {
        InstitutionsController instc = new InstitutionsController();
        
        Institution inst = instc.beanGetInstitution(inst_id);
        
        if (inst != null) {
            inst_name = inst.getInst_name();
            inst_type = inst.getInst_type();
            inst_profile = inst.getInst_profile();
            inst_status = inst.getInst_status();
            lim_ch = inst.getLim_ch();
            lim_wk = inst.getLim_wk();
            lim_gp = inst.getLim_gp();
            lim_ks = inst.getLim_ks();

            InstitutionsController instcounter = new InstitutionsController();

            count_ch = instcounter.modelGetInstitutionResource(inst_id, "ch");
            count_wk = instcounter.modelGetInstitutionResource(inst_id, "wk");
            count_gp = instcounter.modelGetInstitutionResource(inst_id, "teams");
            count_ks = instcounter.modelGetInstitutionResource(inst_id, "projects");
            
            ServicesUtil s = new ServicesUtil();

            action_status = s.transformActionStatus(inst_status);
        } else {
            response.sendRedirect("home.jsp");
        }
        
    } else {
        response.sendRedirect("home.jsp");
    }
%>

<!DOCTYPE html>

<html>

<!-- HEAD -->
<head>
    <jsp:include page="../XM-Resources/pages/imports.jspf"/>
    <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee-staff.svg">

    <title>Memorand Staff | Editar instituci&oacute;n</title>
    
    <script type="text/javascript">
        function validateFileExtension()
        {
            var fileInput = document.getElementById('inst_profile');
            var filePath = fileInput.value;
            var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.webp)$/i;

            if (!allowedExtensions.exec(filePath)) {
                alert('Sube un archivo válido. (PNG, JPG y WEBP)');
                fileInput.value = '';
                return false;
            }
            return true;
        }
    </script>
</head>

<!-- BODY -->
<body>
    <h1><a href='institucion.jsp?id=<%= inst_id %>'>&larr;</a>Editar instituci&oacute;n</h1>
    <!-- PONER ESTOS EN LA NAVBAR-->
    <a href='ventas.jsp'>Ventas</a>
    <a href='configuracion.jsp'>Configuracion</a>
    <a href='../signout'>Cerrar sesi&oacute;n</a>
    
    <hr>
    
    <form action="../instedit?id=<%= inst_id %>" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return validateFileExtension();">
        <input type="file" name="inst_profile" id="inst_profile" required>
        
        <br> <br>
        
        <input type="text" name="inst_name" id="inst_name" value="<%= inst_name %>" required>

        <input type="text" name="lim_ch" id="lim_ch" value="<%= lim_ch %>" required>

        <input type="text" name="lim_wk" id="lim_wk" value="<%= lim_wk %>" required>

        <input type="text" name="lim_gp" id="lim_gp" value="<%= lim_gp %>" required>

        <input type="text" name="lim_ks" id="lim_ks" value="<%= lim_ks %>" required>        

        <br> <br>
        
        <input type="submit" value="Editar institucion">
    </form>
    
</body>

</html>
