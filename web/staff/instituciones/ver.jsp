<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    Institution inst = new Institution();
    InstitutionsController instc = new InstitutionsController();
    UsersController userc = new UsersController();
    
    String inst_id = request.getParameter("inst_id");
    
    String inst_name = null;
    String inst_type = null;
    String inst_profile = null;
    String lim_ch = null;
    String lim_wk = null;
    String lim_gp = null;
    String lim_ks = null;
    
    if (inst_id != null)
    {
        inst = instc.modelGetInstById(inst_id);

        inst_name = inst.getInst_name();
        inst_type = inst.getInst_name();
        inst_profile = inst.getInst_profile();
        lim_ch = inst.getLim_ch();
        lim_wk = inst.getLim_wk();
        lim_gp = inst.getLim_gp();
        lim_ks = inst.getLim_ks();
    }
    else
    {
        response.sendRedirect("../instituciones.jsp");
    }
    
%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title><%=inst_name%></title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    <body>
        <h1>Memorand</h1>
        <h3>Gestor de Instituciones - <%=inst_name%></h3>
        
        <a href="editar.jsp?inst_id=<%=inst_id%>">Editar</a>
        <br>
        <a href="../instituciones.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
        <br>
        <br>
        <h5>Foto</h5>
        <img src="../../<%=inst_profile%>" width="100" alt="inst_profile"/>
        
        <br>
        <br>
        <h5>Nombre</h5>
        <p><%=inst_name%></p>
        
        <br>
        <h5>Tipo</h5>
        <p><%=inst_type%></p>
        
        <br>
        <h5>Límite Líderes</h5>
        <p><%=lim_ch%></p>
        
        <br>
        <h5>Límite Participantes</h5>
        <p><%=lim_wk%></p>
        
        <br>
        <h5>Límite grupos</h5>
        <p><%=inst_name%></p>
        
        <br>
        <h5>Límite clases</h5>
        <p><%=inst_name%></p>
        
        <h3>Lista Administradores</h3>
        <table border="2" style="text-align: center">
            <thead>
                <tr>
                    <th>admin_profile</th>
                    <th>admin_pat</th>
                    <th>admin_mat</th>
                    <th>admin_name</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%=userc.modelGetAllAdminByInst(inst_id, 2, 1)%>
            </tbody>
        </table>
            
    </body>
</html>
