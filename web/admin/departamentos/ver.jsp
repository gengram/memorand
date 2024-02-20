<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.ClustersController"%>
<%@page import="com.memorand.beans.Cluster"%>
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
    
    Cluster clust = new Cluster();
    ClustersController clustc = new ClustersController();
    
    String clust_id = request.getParameter("clust_id");
    String clust_name = null;
    String clust_color = null;
    
    if (clust_id != null)
    {
        clust = clustc.modelGetClusterInfoById(clust_id);
        
        clust_name = clust.getCluster_name();
        clust_color = clust.getCluster_color();
    }
    else
    {
        response.sendRedirect("../departamentos.jsp");
    }
    
%>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../../XM-Resources/pages/imports.jspf"/>
        
        <title><%= clust_name %></title>
        
        <link rel="stylesheet" href="../../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../../XM-Resources/vector/memorand-bee.svg">
        
    </head>
    
    <body>
        <h1>Memorand</h1>
        <h3><%= clust_name %></h3>
        
        <a href="editar.jsp?user_id=">Editar</a>
        <br>
        <a href="../departamentos.jsp">Regresar</a>
        <br>
        <a href="../../signout">Cerrar sesión</a>
        
        <br>
        <br>
        <h5>Color</h5>
        <svg width='200' height='100'>
            <rect width='200' height='100' style='fill:#<%= clust_color %>; stroke:black; stroke-width:2'/>\n" +
        </svg>
        
        <br>
        <br>
        <h5>Nombre</h5>
        <p><%= clust_name %></p>
        
        <h3>Acerca del departamento</h3>
        <br>
        <h3>Lideres</h3>
        <table border="2" style="text-align: center">
            <thead>
                <tr>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <h3>Integrantes</h3>
        <table border="2" style="text-align: center">
            <thead>
                <tr>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <h3>Proyectos</h3>
        <table border="2" style="text-align: center">
            <thead>
                <tr>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </body>
    
</html>
