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
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        <title>Chat - <%= canva_name%></title>
    </head>

    <body>
        <h1>CHAT <%= (String) session.getAttribute("canva_id")%></h1>
        <a href="lienzo.jsp?id=<%= canva_id%>">Regresar al lienzo</a>
        <a href="tarea.jsp?id=<%= task_id%>">Regresar a la tarea</a>

        <hr>
        <h1>Canva id - <%= canva_id%> </h1>

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
                        <p>UUID: <%= canva_id%></p>
                    </td>
                    <td>
                        <p>UUID: <%= user_id%></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>NAME: <%= canva_name%></p>
                    </td>
                    <td>
                        <p>NAME: <%= user_name%> <%= user_pat%> <%= user_mat%></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>CDAT: <%= canva_cdate%></p>
                    </td>
                    <td>
                        <p>MAIL: <%= user_email%></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>MDAT: <%= canva_mdate%></p>
                    </td>
                    <td>
                        <img src="../<%= user_profile%>" width="40" alt="profile"/>
                    </td>
                </tr>
            </tbody>
        </table>

        <hr>

        <h3>SOURCE</h3>
        <p id="msg_sender"><%= user_name%></p>
        <!-- <div>
            <div>
                <label>MESG:</label>
                <input type="text" id="msg_txt" placeholder="Mensaje" required="true"/>
            </div>
            <div>
                <button id="submit">Enviar</button>
            </div>
            
            <div id="chatter"></div>
        </div> -->
        
        <button type="button" class="btn btn-h des me-5" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i class="bi bi-chat-square-dots" style="font-size: 22px"></i></button>

        <div class="offcanvas offcanvas-end shadow" style="background-color: #E3E4E5; opacity: 95%; max-width: 100%; max-height: 88%;" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasRightLabel">Chat</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="card mx-auto" style="max-width:100%; max-height: 100%;">
                    <div class="card-body p-4" id="chatter" style="max-height: 100%; overflow: auto;">
                        <!-- Mensajes de chat se añadirán aquí -->
                    </div>
                    <div class="card-footer bg-white position-absolute w-100 bottom-0 m-0 p-1">
                        <div class="input-group">
                            <button id="submit" class="btn btn-light">
                                <i class="bi bi-send-fill" style="color: #25ce7b;"></i>
                            </button>
                            <input type="text" id="msg_txt" class="form-control border-0" placeholder="Escribe un mensaje...">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style>
            a.nav-link {
                color: gray;
                font-size: 18px;
                padding: 0;
            }

            .avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                border: 2px solid #25ce7b;
                padding: 2px;
                flex: none;
            }

            input:focus {
                outline: 0px !important;
                box-shadow: none !important;
            }

            .card-text {
                border: 2px solid #ddd;
                border-radius: 8px;
            }
        </style>

        <script src="scripts/chat.js"></script>

    </body>
</html>

<%
            response.sendRedirect("lienzo.jsp?id="+canva_id+"&v=true");
        } else {
            response.sendRedirect("home.jsp");
        }
    } else {
        response.sendRedirect("home.jsp");
    }

%>