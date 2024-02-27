<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.controller.ProjectsController"%>
<%@page import="com.memorand.controller.TeamsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String inst_id = (String) session.getAttribute("inst_id");
    
    String team_id = request.getParameter("team_id");
    String proj_id = request.getParameter("proj_id");
    
    TeamsController teamc = new TeamsController();
    ProjectsController projc = new ProjectsController();
    UsersController userc = new UsersController();
%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Gestionar lideres</title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Gestionar lideres por proyecto</h3>
        
        <br>
        <h3>Ver lideres por proyecto</h3>
        
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
                    <h3>Proyectos</h3>
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>proj_name</th>
                                <th>proj_color</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%= projc.modelGetAllProjectsByTeamRed1(team_id) %>
                        </tbody>
                    </table>
                </div>
                <div class="col">
                    <h3>Lideres</h3>
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>ch_name</th>
                                <th>ch_profile</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%= userc.modelGetAllChByCollabRed(team_id, proj_id) %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
                        

        <form action="../../cunew" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h3>Lideres</h3>
                        <select name="team_id" id="team_id" required hidden>
                            <option value="<%= team_id %>" selected><%= team_id %></option>
                        </select>
                        <select name="proj_id" id="proj_id" required hidden>
                            <option value="<%= proj_id %>" selected><%= proj_id %></option>
                        </select>
                        <select name="ch_name" id="ch_name" required>
                            <option value="" disabled selected hidden>Lideres</option>
                            <%= userc.modelGetListChByInst(inst_id) %>
                        </select>
                    </div>
                </div>
                <br>
<%
    if (team_id != null && proj_id != null)
    {
%>
                <input type="submit" value="Agregar lider">
<%
    }
%>
            </div>
        </form>
                            
        
        <a href="../home.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
    </body>
</html>
