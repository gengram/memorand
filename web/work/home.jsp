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
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    
    <%-- BODY --%>
    <body>
<<<<<<< HEAD

        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>

        <div class="container">
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col-10">
                    <h3>Inicio  - <%=user_type%>></h3><p><%=session.getAttribute("user_name")%></p>
                    <div class="row mt-5">
                        <div class="col-5">
                            <!--Card-->
                            <a href="apunte.jsp" style="text-decoration: none; ">
                                <div class="card border-primary border-3 mb-3 shadow-sm" style="width: auto; border: 1px solid #25ce7b">
                                    <div class="row g-0">
                                        <div  class="col-md-1"></div>
                                        <div class="col-md-6 my-2">
                                            <div class="card-body">
                                                <h3 class="card-title mt-3">Apunte</h3>
                                            </div>
                                        </div>
                                        <div  class="col-md-1"></div>
                                        <div class="col-md-4 my-4">
                                            <i class="bi bi-pencil-square my-4" style="color: #25ce7b; font-size: 3em;"></i>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-5">
                            <!--Card-->
                            <a href="pizarron.jsp" style="text-decoration: none;">
                                <div class="card border-primary border-3 mb-3 shadow-sm" style="width: auto; border: 1px solid #25ce7b">
                                    <div class="row">
                                        <div  class="col-md-1"></div>
                                        <div class="col-md-6 my-2">
                                            <div class="card-body">
                                                <h3 class="card-title mt-3">Pizarr&oacute;n</h3>
                                            </div>
                                        </div>
                                        <div  class="col-md-1"></div>
                                        <div class="col-md-4 my-4">
                                            <i class="bi bi-easel mt-5" style="color: #25ce7b; font-size: 3em;"></i>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
        </div>

=======
        
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
        
>>>>>>> 85cd1180ac30ddbd4e010735e96d6307155f8e98
    </body>
    
</html>
