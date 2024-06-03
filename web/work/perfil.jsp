<%@page import="com.memorand.controller.UsersController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UsersController userc = new UsersController();
    
    String user_id = (String) session.getAttribute("user_id");
    String user_email = (String) session.getAttribute("user_email");
    String user_name = (String) session.getAttribute("user_name");
    String user_pat = (String) session.getAttribute("user_pat");
    String user_mat = (String) session.getAttribute("user_mat");
    String user_status = (String) session.getAttribute("user_status");
    String user_profile = (String) session.getAttribute("user_profile");
    
    String user_statusS = userc.convertUserStatus(user_status);
%>

<!DOCTYPE html>

<html>
    
    <head>

        <jsp:include page="../XM-Resources/pages/imports.jspf"/>

        <title>Memorand | <%= user_name%> <%= user_pat%></title>

        <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

    </head>
    
    <style>
        .btn-red {
            border-color: red;
            color: red;
            background-color: transparent;
        }
        .btn-red:hover {
            border-color: red;
            color: #fff;
            background-color: red;
        }

        .btn-gray {
            border-color: #E3E4E5;
            color: #000;
            background-color: #E3E4E5;
        }
        .btn-gray:hover {
            border-color: #E3E4E5;
            color: #000;
            background-color: transparent;
        }

        .custom-admin{
            display: inline-block;
            padding: 4px 12px;
            border: 2px solid #25ce7b; /* Color del contorno */
            color: #fff; /* Color del texto */
            text-align: center;
            text-decoration: none;
            font-size: 17px;
            cursor: pointer;
            border-radius: 4px;
            background-color: #25ce7b; /* Fondo transparente */
        }
        .custom-admin:hover {
            background-color: #fff; /* Cambiar el color de fondo al pasar el ratón */
            border: 2px solid #25ce7b; /* Color del contorno */
            color: #25ce7b; /* Cambiar el color del texto al pasar el ratón */
        }

        .modal-custom {
            max-width: 510px;
        }

    </style>
    
    <body>
        
        <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>
        
        <div class="container">
            <div class="row mt-5">
                <div class="col-2"></div>
                <div class="col-7">
                    <h1> Mi perfil</h1>
                </div>
                <div class="col-3 mt-3">
                    <p style="color: #25ce7b; font-size: 18px;"><a id="backLink" href='home.jsp'><i class="bi bi-chevron-left me-1"></i>Regresar</a></p>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-2"></div>
                <div class="col-2" >
                    <img class="rounded-1" src="../<%=user_profile%>" width="150" height="150" alt="inst_profile"/>
                </div>
                <div class="col-4">
                    <div class="mt-4">
                        <p><texto style="color: #AFB2B3">Nombre: </texto><texto style="color: #2A2927"><%=user_name%> <%=user_pat%> <%=user_mat%></texto></p>
                        <p><text  style="color: #AFB2B3">Correo: </text><text style="color: #2A2927"><%=user_email%></text></p>
                        <p><text  style="color: #AFB2B3">Estatus: </text><text style="color: #2A2927"><%=user_statusS%></text></p>
                    </div>
                </div>
                <div class="col-2 text-end mt-3">
                    <a href="">
                        <button class="btn btn-gray rounded-pill mt-3">Editar foto de perfil</button>
                    </a>
                    <a href="">
                        <button class="btn btn-gray rounded-pill mt-2">Cambiar contrase&ntilde;a</button>
                    </a>
                </div>
                <div class="col-2"></div>
            </div>
                        
            
            
        </div>
        
    </body>
    
</html>