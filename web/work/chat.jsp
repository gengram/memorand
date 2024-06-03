<%@page import="com.memorand.beans.Task"%>
<%@page import="com.memorand.controller.TasksController"%>
<%@page import="com.memorand.beans.Canva"%>
<%@page import="com.memorand.controller.CanvasController"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
    String canva_id = request.getParameter("id");
    
    String user_id = (String) session.getAttribute("user_id");
    String user_email = (String) session.getAttribute("user_email");
    String user_name = (String) session.getAttribute("user_name");
    String user_pat = (String) session.getAttribute("user_pat");
    String user_mat = (String) session.getAttribute("user_mat");
    String user_profile = (String) session.getAttribute("user_profile");
    
    session.setAttribute("canva_id", canva_id);
    
    if (canva_id != null) {
        String task_id = "";
        String canva_name = "", canva_draw = "", canva_status = "";
        Timestamp canva_cdate, canva_mdate;

        CanvasController canvac = new CanvasController();
        Canva canva = canvac.beanGetCanva(canva_id);

        if (canva != null) {
            TasksController taskc = new TasksController();
            Task task = taskc.beanGetTaskByTool("canvas", "canva_id", canva_id);

            task_id = task.getTask_id();

            canva_name = canva.getCanva_name();
            canva_draw = canva.getCanva_draw();
            canva_status = canva.getCanva_status();

            canva_cdate = canva.getCanva_cdate();
            canva_mdate = canva.getCanva_mdate();
%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat - <%= canva_name %></title>
    </head>

    <body>
        <h1>CHAT <%= (String) session.getAttribute("canva_id") %></h1>
        <a href="lienzo.jsp?id=<%= canva_id %>">Regresar al lienzo</a>
        <a href="tarea.jsp?id=<%= task_id %>">Regresar a la tarea</a>
        
        <hr>
        
        <table border="1">
            <thead>
                <tr>
                    <th>
                        <h3>Informaci&oacute;n del lienzo:</h3>
                    </th>
                    <th>
                        <h3>Informaci&oacute;n del usuario:</h3>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <p>UUID: <%= canva_id %></p>
                    </td>
                    <td>
                        <p>UUID: <%= user_id %></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>NAME: <%= canva_name %></p>
                    </td>
                    <td>
                        <p>NAME: <%= user_name %> <%= user_pat %> <%= user_mat %></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>CDAT: <%= canva_cdate %></p>
                    </td>
                    <td>
                        <p>MAIL: <%= user_email %></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>MDAT: <%= canva_mdate %></p>
                    </td>
                    <td>
                        <img src="../<%= user_profile %>" width="40" alt="profile"/>
                    </td>
                </tr>
            </tbody>
        </table>
                    
        <hr>
        
        <h3>SOURCE</h3>
        <p id="msg_sender"><%= user_name %> <%= user_pat %> <%= user_mat %></p>
        <div>
            <div>
                <label>MESG:</label>
                <input type="text" id="msg_txt" placeholder="Mensaje" required="true"/>
            </div>
            <div>
                <button id="submit">Enviar</button>
            </div>
            
            <div id="chatter"></div>
        </div>
        
        <script src="scripts/chat.js"></script>
        
    </body>
</html>

<%
        } else {
            response.sendRedirect("home.jsp");
        }
    } else {
        response.sendRedirect("home.jsp");
    }

%>