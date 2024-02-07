<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% 
    InstitutionsController instc = new InstitutionsController();
%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Gestor de Instituciones</title>
        
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Gestor de Instituciones</h3>
        
        <a href="instituciones/nuevo.jsp">
            <button>Nueva institución</button>
        </a>
        <a href="">
            <button>Subir archivo</button>
        </a>
        
        <h3>Lista</h3>
        
        <table border="2" style="text-align: center">
            <thead>
                <tr>
                    <th>inst_id</th>
                    <th>inst_name</th>
                    <th>inst_type</th>
                    <th>inst_profile</th>
                    <th>lim_ch</th>
                    <th>lim_wk</th>
                    <th>lim_gp</th>
                    <th>lim_ks</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%=instc.modelGetAllInst()%>
            </tbody>
        </table>

        <br>
        <br>
        <a href="home.jsp">Regresar</a>
        <br>
        <a href="../signout">Cerrar sesión</a>
        
    </body>
    
</html>
