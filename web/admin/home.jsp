<%-- 
    Document   : home
    Created on : Feb 7, 2024, 11:52:39 AM
    Author     : nicojrz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p><%=session.getAttribute("user_name")%></p>
    </body>
</html>
