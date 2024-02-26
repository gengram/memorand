<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String user_type = (String) session.getAttribute("user_type");
    String staff_name = (String) session.getAttribute("user_name");

    String inst_type = (String) session.getAttribute("inst_type");
    String inst_name = (String) session.getAttribute("inst_name");

    //if (user_type == null || !user_type.equals("admin"))
    //{
    //    response.sendRedirect("../index.jsp?error=100");
    //    session.invalidate();
    //}
%>

<!DOCTYPE html>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Home Admin</title>
        
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand para <%=inst_type%>s</h1>
        <h3>Home - Staff <%=inst_name%></h3>
        
        <p>Hola <%=session.getAttribute("user_name")%> <%=session.getAttribute("user_pat")%></p>
        
        <a href="departamentos.jsp">
            <button>Departamentos</button>
        </a>
        <a href="proyectos.jsp">
            <button>Proyectos</button>
        </a>
        <a href="lideres.jsp">
            <button>Líderes</button>
        </a>
        <a href="integrantes.jsp">
            <button>Integrantes</button>
        </a>
        
        <br>
        <br>
        
        <a href="gestion/integrantes.jsp">
            <button>Gestionar integrantes de departamentos</button>
        </a>
        <a href="gestion/proyectos.jsp">
            <button>Gestionar proyectos de departamentos</button>
        </a>
        <a href="gestion/lideres.jsp">
            <button>Gestionar líderes de proyectos</button>
        </a>
        
        <br>
        <br>
        <a href="../signout">Cerrar sesión</a>
        
    </body>
    
</html>
