<%@page import="com.memorand.beans.User"%>
<%@page import="com.memorand.controller.UsersController"%>
<!-- Memorand by Gengram © 2023 -->

<%@page import="com.memorand.service.ServicesUtil"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.controller.InstitutionsController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // PROTECCIÓN
    String u = (String) session.getAttribute("user_type");
    
    if(session == null || u == null || !u.equals("staff"))
    {
        response.sendRedirect("../index.jsp?error=InvalidSession");
    }
    
    String user_id = request.getParameter("id");
    
    // VARIABLES DEL USUARIO
    
    String user_email = "", user_pass = "", user_type = "";
    String user_name = "", user_pat = "null", user_mat = "null";
    String user_status = "", user_profile = "";
    
    if (user_id != null)
    {
        UsersController userc = new UsersController();
        
        User user = userc.modelGetUserInfoById(user_id);
        
        if (user != null)
        {
            user_email = user.getUser_email();
            user_pass = user.getUser_pass();
            user_type = user.getUser_type();
            user_name = user.getUser_name();
            user_pat = user.getUser_pat();
            user_mat = user.getUser_mat();
            user_status = user.getUser_status();
            user_profile = user.getUser_profile();
            
            if (!user_type.equals("admin"))
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

        <title>Memorand Staff | Editar administrador</title>
        
    </head>

    <!-- BODY -->
    <body>
        
        <h1><a href='admin.jsp?id=<%= user_id %>'>&larr;</a>Editar administrador</h1>
        <!-- PONER ESTOS EN LA NAVBAR-->
        <a href='ventas.jsp'>Ventas</a>
        <a href='configuracion.jsp'>Configuracion</a>
        <a href='../signout'>Cerrar sesi&oacute;n</a>
        
        <hr>
        
        <form action="../useredit?id=<%= user_id %>" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <input type="file" name="inst_profile" id="inst_profile">
            
            <br> <br>
            
            <input type="text" name="user_name" id="user_name" value="<%= user_name %>" required>

            <input type="text" name="user_pat "id="user_pat" value="<%= user_pat %>" required>

            <input type="text" name="user_mat" id="user_mat" value="<%= user_mat %>" required>
            
            <br> <br>

            <input type="submit" value="Editar administrador">
        </form>
        
    </body>

</html>