<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String user_type = (String) session.getAttribute("user_type");
    String staff_name = (String) session.getAttribute("user_name");

    String inst_type = (String) session.getAttribute("inst_type");
    String inst_name = (String) session.getAttribute("inst_name");
    
    String class_type = null;
    String class_typeS = null;
    
    String ch_type = null;
    String ch_typeS = null;
    
    String wk_type = null;
    String wk_typeS = null;
    
    if (inst_type != null)
    {
        switch (inst_type) {
                case "escuela":
                    class_type = "clases";
                    class_typeS = "Clases";
                    ch_type = "profesores";
                    ch_typeS = "Profesores";
                    wk_type = "alumnos";
                    wk_typeS = "Alumnos";
                    break;
                case "empresa":
                    class_type = "equipos";
                    class_typeS = "Equipos";
                    ch_type = "lideres";
                    ch_typeS = "Líderes";
                    wk_type = "participantes";
                    wk_typeS = "Participantes";
                    break;
                default:
                    throw new AssertionError();
            }
    }
    
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
        
        <a href="grupos.jsp">
            <button>Grupos</button>
        </a>
        <a href="<%=class_type%>.jsp">
            <button><%=class_typeS%></button>
        </a>
        <a href="<%=ch_type%>.jsp">
            <button><%=ch_typeS%></button>
        </a>
        <a href="<%=wk_type%>.jsp">
            <button><%=wk_typeS%></button>
        </a>
        
        <br>
        <br>
        <a href="../signout">Cerrar sesión</a>
        
    </body>
    
</html>
