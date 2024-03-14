<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.beans.Project"%>
<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page import="com.memorand.beans.Institution"%>
<%@page import="com.memorand.beans.User"%>
<%@page import="com.memorand.controller.UsersController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    //String staff_type = (String) session.getAttribute("user_type");

    //if (staff_type == null || !staff_type.equals("staff"))
    //{
    //    response.sendRedirect("../index.jsp?error=100");
    //    session.invalidate();
    //}
    Project proj = new Project();
    ProjectsController projc = new ProjectsController();

    String proj_id = request.getParameter("proj_id");
    String proj_name = null;
    String proj_color = null;

    if (proj_id != null) {
        proj = projc.modelGetProjectInfoById(proj_id);

        proj_name = proj.getProj_name();
        proj_color = proj.getProj_color();
    } else {
        response.sendRedirect("../proyectos.jsp");
    }

%>

<html>

    <%-- HEAD --%>
    <head>

        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>

        <title><%= proj_name%></title>

        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">

    </head>

    <body>

        <jsp:include page="../../XM-Resources/pages/elements/navbar_admin_project.jspf"/>
        
        <div class="container">
             <div class="row">
                 <div class="col-1"></div>
                 <div class="col-10">
                     <h3 class="mt-3" style="color: #<%= proj_color%>">
                         <i class="bi bi-circle-fill" ></i>
                         <%= proj_name%>
                     </h3>

                     <!--<a href="editar.jsp?user_id="--> 
                     <button class="button custom-bsign rounded-3 mt-2"><h6 class="mt-1"><i class="bi bi-pen mt-4"></i> Editar</h6></button>
                     <!-- </a> -->

                     


                     <h3 class="mt-3">Acerca del proyecto</h3>
                     <h5 class="mt-3">Nombre</h5>
                     <p><%= proj_name%></p>
                     <!--
                     <h3>Departamentos con este proyecto</h3>
                     <table border="2" style="text-align: center">
                         <thead>
                             <tr>
                                 <th></th>
                             </tr>
                         </thead>
                         <tbody>
                         </tbody>
                     </table> -->
                 </div>
                 <div class="col-1"></div>
             </div>
         </div>
        

    </body>

</html>
