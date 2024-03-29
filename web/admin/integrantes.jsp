<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.UsersController"%>
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
    
    UsersController userc = new UsersController();
%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Gestor de Integrantes</title>
        
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    <body>
        
        <h1>Memorand para <%=inst_type%>s</h1>
        <h3>Gestor de Integrantes</h3>
        
        <a href="integrantes/nuevo.jsp">
            <button>Integrante nuevo</button>
        </a>
            
        <br>
        <br>
        <h3>Lista</h3>
        
        <table border="2" style="text-align: center">
            <thead>
                <tr>
                    <th>user_id</th>
                    <th>user_email</th>
                    <th>user_pass</th>
                    <th>user_type</th>
                    <th>user_name</th>
                    <th>user_pat</th>
                    <th>user_mat</th>
                    <th>user_status</th>
                    <th>user_profile</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%= userc.modelGetAllWkByInst(inst_id, 1, 0) %>
            </tbody>
        </table>
        
        <br>
        <br>
        <a href="home.jsp">Regresar</a>
        <br>
        <a href="../signout">Cerrar sesión</a>
        
    </body>
    
</html>
