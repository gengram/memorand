<%-- Memorand by Gengram © 2023 --%>

<%@page import="com.memorand.beans.Task"%>
<%@page import="com.memorand.controller.TasksController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    TasksController taskc = new TasksController();
    Task task = null;
    
    String task_id = request.getParameter("task_id");
    String task_name = "null";
    
    if (task_id != null)
    {
        task = taskc.modelGetTaskInfoById(task_id);
        task_name = task.getTask_name();
    }
    
    
%>

<!DOCTYPE html>

<html>

    <%-- HEAD --%>
    <head>
        
        <jsp:include page="../XM-Resources/pages/imports.jspf"/>
        
        <title><%= task_name %></title>
        
        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
        
    </head>

    <%-- BODY --%>
    <body>
        
        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>

        <div class="container">
            
            <div class="row">
                <div class="col">
                    <br>
                    <h3><%= task_name %></h3>
                </div>
                
                <div class="col">
                    <br>
                    <a href="idea/nuevo.jsp?task_id=<%= task_id %>">
                        <button>Nueva idea</button>
                    </a>
                    <a href="lienzo/nuevo.jsp?task_id=<%= task_id %>">
                        <button>Nuevo lienzo</button>
                    </a>
                    <a href="nota/nuevo.jsp?task_id=<%= task_id %>">
                        <button>Nueva nota</button>
                    </a>
                </div>
            </div>
            
            <br>
            
            <div class="row">
                <div class="col">
                    <h3>Panel de ideas</h3>
                </div>
            </div>
            
            <div class="row">
                <div class="col">
                    <h3>Lienzos y notas</h3>
                </div>
            </div>
            
        </div>
        
    </body>

</html>
