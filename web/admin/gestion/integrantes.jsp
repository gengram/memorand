<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.controller.TeamsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String inst_id = (String) session.getAttribute("inst_id");
    
    String team_id = request.getParameter("team_id");
    
    TeamsController teamc = new TeamsController();
    UsersController userc = new UsersController();
%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Gestionar integrantes</title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Gestionar integrantes por departamento</h3>
        
        <br>
        <h3>Inscribir integrante a departamento</h3>
        
        <form action="../../tunew" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h3>Departamentos</h3>
                        <select name="team_name" id="team_name" required>
                            <option value="" disabled selected hidden>Departamento</option>
                            <%= teamc.modelGetListTeamsByInst(inst_id) %>
                        </select>
                    </div>
                    <div class="col">
                        <h3>Integrantes</h3>
                        <select name="wk_name" id="wk_name" required>
                            <option value="" disabled selected hidden>Integrante</option>
                            <%= userc.modelGetListWkByInst(inst_id) %>
                        </select>
                    </div>
                </div>
                
                <br>
                <input type="submit" value="Agregar integrante">
            </div>
        </form>
        
        <br>
        <h3>Ver integrantes por departamento</h3>
        
        <div class="container">
            <div class="row">
                <div class="col">
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
                            <%= teamc.modelGetAllTeamsByInstRed(inst_id) %>
                        </tbody>
                    </table>
                </div>
                <div class="col">
                    <h3>Integrantes</h3>
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>wk_name</th>
                                <th>wk_profile</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%= userc.modelGetAllWkByTeamRed(team_id) %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <a href="../home.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
    </body>

</html>
