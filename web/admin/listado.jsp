<%@page import="com.memorand.util.Generador"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Memorand | Listado</title>

        <link rel="stylesheet" href="XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="XM-Resources/vector/memorand-bee.svg">
    </head>
    <body>
        <h1>Recuento de Usuarios</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th><!-- 2 -->
                    <th>Email</th><!-- 3 -->
                    <th>Contraseña</th><!-- 4 -->
                    <th>Rol de Usuario</th><!-- 5 -->
                    <th>Nombre</th><!-- 6 -->
                    <th>Apellido Paterno</th><!-- 7 -->
                    <th>Apellido Materno</th><!-- 8 -->
                    <th>Estatus</th><!-- 9 -->
                    <th>Imagen</th><!-- 10 -->
                </tr>
            </thead>
            <tbody>
                <% for (String[] row : (List<String[]>) request.getAttribute("rows")) { %>
                <tr>
                    <td><% Generador g2 = new Generador();
                        String user_id2 = g2.newID();
                        %>
                        <%= user_id2%></td><!-- user_id -->
                    <td><%= row[0].replace("\"", "")%></td> <!-- user_email -->
                    <td><%= row[1].replace("\"", "")%></td> <!-- user_pass -->
                    <td><% String userType = row[2].replace("\"", "");
                        String userTypeLabel = "Desconocido"; // Por defecto

                        switch (userType) {
                            case "ch":
                                userTypeLabel = "Líder";
                                break;
                            case "wk":
                                userTypeLabel = "Trabajador";
                                break;
                        }%>
                        <%=userTypeLabel%></td>
                    <td><%= row[3].replace("\"", "")%></td> <!-- user_name -->
                    <td><%= row[4].replace("\"", "")%></td> <!-- user_pat -->
                    <td><%= row[5].replace("\"", "")%></td> <!-- user_mat -->
                    <td>si</td><!-- user_status -->
                    <td><img style="width: 40px" src="XM-Uploads/users/profile/user_icon.png"></td><!-- user_profile -->
                </tr>
                <% }%>
            </tbody>
        </table>

    </body>
</html>

