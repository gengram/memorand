<%@page import="com.memorand.util.Generador"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Memorand | Listado</title>

        <link rel="stylesheet" href="XM-Resources/styles/bootstrap.css">
        <link rel="stylesheet" href="XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="XM-Resources/vector/memorand-bee.svg">
    </head>
    <body>
        
        <jsp:include page="XM-Resources/pages/elements/navbar_admin.jspf"/>
        <div class="row mt-3">
            <div class="col-1"></div>
            <div class="col-10">
                <h2>Personal agregado</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Estatus</th><!-- 9 -->
                            <th scope="col">Nombre</th><!-- 6 -->
                            <th scope="col">Tipo</th><!-- 3 -->
                            <th scope="col"></th><!-- 3 -->
                        </tr>
                    </thead>
                    <tbody>
                        <% for (String[] row : (List<String[]>) request.getAttribute("rows")) { %>
                        <tr>
                            <!-- <td><% Generador g2 = new Generador();
                                String user_id2 = g2.newID();
                                %>
                                <%= user_id2%></td> user_id -->
                            <td style='padding: 20px;' class='align-middle'><i class='bi bi-circle-fill' style='color: #25ce7b'></i></td><!-- user_status -->
                            <td style='padding: 20px;' class='align-middle'><img style="width: 40px" src="XM-Uploads/users/profile/user_icon.png"> <%= row[3].replace("\"", "") +  row[4].replace("\"", "") +  row[5].replace("\"", "")%></td> <!-- user_name -->
                            
                            <td style='padding: 20px;' class='align-middle'><%= row[0].replace("\"", "")%></td> <!-- user_email -->
                            <td style='padding: 20px;' class='align-middle'><% String userType = row[2].replace("\"", "");
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
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <div class="col-1"></div>
        </div>

    </body>
</html>

