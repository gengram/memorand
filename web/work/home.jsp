<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.TeamsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    String user_id = (String) session.getAttribute("user_id");

    String user_type = (String) session.getAttribute("user_type");
    String inst_type = (String) session.getAttribute("inst_type");

    if (user_type != null)
    {
        switch (user_type)
        {
            case "ch":
                user_type = "Lider";
                break;
            case "wk":
                user_type = "Integrante";
                break;
            default:
                user_type = "ERROR";
        }
    } 
    
    TeamsController teamc = new TeamsController();
    
%>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Inicio</title>
        
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    
    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Inicio - <%=user_type%></h3>
        
        <p><%=session.getAttribute("user_name")%></p>
        
        <h3>Departamentos</h3>
        <table border="2" style="text-align: center">
            <thead>
                <tr>
                    <th>team_name</th>
                    <th>team_color</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%= teamc.modelGetAllTeamsByUserRed(user_id) %>
            </tbody>
        </table>
        
        <a href="../signout">Cerrar sesión</a>
        <br>
        
    </body>
    
</html>
