<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administradores</title>
    </head>
    
    <%
        String accion = request.getParameter("a");
        
        String tipo_usuario = (String) session.getAttribute("tipo_usuario");
        if (tipo_usuario == null || !tipo_usuario.equals("staff")) {
            response.sendRedirect("../index.jsp");
        }
    %>
    
    <body>
        
        <%
            if(accion != null) {
                
                if("lista".equals(accion)) {
        %>
                    <h1>Administradores</h1>
                    
        <%
                }
                
                if("nuevo".equals(accion)) {
        %>
                    <h1>Nuevo administrador</h1>
            
        <%
                }
                
            } else {
                response.sendRedirect("admin.jsp?a=lista");
            }
            
        %>
        
        <a href="index.jsp">Regresar</a>
        
    </body>
    
</html>
