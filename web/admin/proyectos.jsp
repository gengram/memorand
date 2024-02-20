<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.ProjectsController"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String user_type = (String) session.getAttribute("user_type");
    String staff_name = (String) session.getAttribute("user_name");

    String inst_id = (String) session.getAttribute("inst_id");
    String inst_type = (String) session.getAttribute("inst_type");
    String inst_name = (String) session.getAttribute("inst_name");

    //if (user_type == null || !user_type.equals("admin"))
    //{
    //    response.sendRedirect("../index.jsp?error=100");
    //    session.invalidate();
    //}
    ProjectsController projc = new ProjectsController();
%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Gestor de Proyectos</title>
        
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    <body>
        
        <h1>Memorand para <%=inst_type%>s</h1>
        <h3>Gestor de Proyectos</h3>
        
        <a href="proyectos/nuevo.jsp">
            <button>Proyecto nuevo</button>
        </a>
        <a href="#">
            <button>Lista Completa</button>
        </a>
        <a href="#">
            <button>Por Departamentos</button>
        </a>
        
        <br>
        <br>
        <h3>Lista</h3>
        
        <table border="2" style="text-align: center">
            <thead>
                <tr>
                    <th>class_id</th>
                    <th>class_name</th>
                    <th>class_icon</th>
                    <th>class_color</th>
                    <th>class_bkg</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%= projc.modelGetAllProjectsByInst(inst_id, 0) %>
            </tbody>
        </table>

        <br>
        <br>
        <a href="home.jsp">Regresar</a>
        <br>
        <a href="../signout">Cerrar sesión</a>
        
    </body>
    
</html>
