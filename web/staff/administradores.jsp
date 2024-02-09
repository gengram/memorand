<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.controller.UsersController"%>
<%@page import="com.memorand.controller.InstitutionsController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<% 
    String staff_type = (String) session.getAttribute("user_type");
    
    if (staff_type == null || !staff_type.equals("staff"))
    {
        response.sendRedirect("../index.jsp?error=100");
        session.invalidate();
    }
    
    InstitutionsController instc = new InstitutionsController();
    UsersController userc = new UsersController();
    
    String view_atr = request.getParameter("view");
    String inst_id = request.getParameter("inst_id");
%>

<html>
    
    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title>Memorand | Gestor de Administradores</title>
        
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand</h1>
        <h3>Gestor de Administradores</h3>
        
        <a href="administradores/nuevo.jsp">
            <button>Nuevo administrador</button>
        </a>
        <a href="">
            <button>Subir archivo</button>
        </a>
        <a href="?view=all">
            <button>Lista Completa</button>
        </a>
        <a href="?view=inst">
            <button>Por instituciones</button>
        </a>
        
        <br>
        <br>
      
    <% 
        if (view_atr != null)
        {
            switch (view_atr)
            {
                case "all":
    %>
        
        <h3>Lista completa</h3>

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
                <%=userc.modelGetAllAdmin()%>
            </tbody>
        </table>
                        
    <% 
                    break;
                case "inst":
    %>
        
        
        <div class="container">
            <div class="row">
                <div class="col">
                    <h3>Lista Instituciones</h3>
                    
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>inst_profile</th>
                                <th>inst_name</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%=instc.modelGetLimInst()%>
                        </tbody>
                    </table>
                    
                </div>
                <div class="col">
                    <h3>Lista Administradores</h3>
                    
                    <table border="2" style="text-align: center">
                        <thead>
                            <tr>
                                <th>admin_profile</th>
                                <th>admin_pat</th>
                                <th>admin_mat</th>
                                <th>admin_name</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%=userc.modelGetAllAdminByInst(inst_id, 1, 0)%>
                        </tbody>
                    </table>
                    
                </div>
            </div>
        </div>
    
    <% 
                    break;
                default:
                    response.sendRedirect("administradores.jsp?view=all");
                    break;
            }
        }
        else
        {
            response.sendRedirect("administradores.jsp?view=all");
        }
    %>
        
        <br>
        <br>
        <a href="home.jsp">Regresar</a>
        <br>
        <a href="../signout">Cerrar sesión</a>
        
    </body>
    
</html>
