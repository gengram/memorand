<%-- Memorand by Gengram © 2023 --%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String user_type = (String) session.getAttribute("user_type");
    String staff_name = (String) session.getAttribute("user_name");

    String inst_type = (String) session.getAttribute("inst_type");
    String inst_name = (String) session.getAttribute("inst_name");

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
        <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
        <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">

    </head>

    <%-- BODY --%>
    <body>
        
        <h1>Memorand para <%=inst_type%>s</h1>
        <h3>Home - Staff <%=inst_name%></h3>
        
        <p>Hola <%=session.getAttribute("user_name")%> <%=session.getAttribute("user_pat")%></p>
        
        <a href="departamentos.jsp">
            <button>Departamentos</button>
        </a>
        <a href="proyectos.jsp">
            <button>Proyectos</button>
        </a>
        <a href="lideres.jsp">
            <button>Líderes</button>
        </a>
        <a href="integrantes.jsp">
            <button>Integrantes</button>
        </a>
        
        <br>
        <br>
        
        <a href="gestion/integrantes.jsp">
            <button>Gestionar integrantes de departamentos</button>
        </a>
        <a href="gestion/proyectos.jsp">
            <button>Gestionar proyectos de departamentos</button>
        </a>
        <a href="gestion/lideres.jsp">
            <button>Gestionar líderes de proyectos</button>
        </a>
        
        <br>
        <br>
        <table>
            <td>
                <h4>Cargar archivo CSV</h4>
                <form action="/memorand/readfile" method="post" enctype="multipart/form-data">
                    Seleccione un archivo CSV:
                    <input type="file" name="file" accept=".csv">
                    <input type="submit" value="Listar">
                </form>
            </td>
            <%-- <td>
                <form action="/memorand/uploadfile" method="post" enctype="multipart/form-data">
                    Seleccione un archivo CSV para cargar:
                    <input type="file" name="file" accept=".csv">
                    <input type="submit" value="Cargar">
                </form>
                <% String fileName = request.getParameter("fileName"); %>
            </td>
            <td>
                <a href="/memorand/downloadfile?fileName=<%= fileName %>"><h4>Descargar CSV</h4></a>
            </td>comment --%>
        </table>
        <a href="../signout">Cerrar sesión</a>

        <jsp:include page="../XM-Resources/pages/elements/navbar_admin.jspf"/>

        <div class="container">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10 mt-3">
                    <h3>Home - Staff <%=inst_name%></h3>

                    <p>Hola <%=session.getAttribute("user_name")%> <%=session.getAttribute("user_pat")%></p>

                    <div class="row mt-3 text-center">
                        <div class="col-3">
                            <a href="departamentos.jsp" style="text-decoration: none; ">
                                <button  class="btn custom-bsign">
                                    <div class="row">
                                        <div class="col-4">
                                            <i class="bi bi-diagram-3-fill" style="color: #fff; font-size: 1.5rem;"></i>
                                        </div>
                                        <div class="col-4">
                                            <h6 class="mt-2 me-1" style="font-size: 18px;">Departamentos</h6>
                                        </div>
                                    </div>
                                </button>
                            </a>
                        </div>
                        <div class="col-3" >
                            <a href="proyectos.jsp" style="text-decoration: none; ">
                                <button  class="btn custom-bsign">
                                    <div class="row">
                                        <div class="col-4">
                                            <i class="bi bi-collection-fill" style="color: #fff; font-size: 1.5rem;"></i>
                                        </div>
                                        <div class="col-4">
                                            <h6 class="mt-2" style="font-size: 18px;">Proyectos</h6>
                                        </div>
                                    </div>
                                </button>
                            </a>
                        </div>
                        <div class="col-3">
                            <a href="lideres.jsp" style="text-decoration: none; ">
                                <button  class="btn custom-bsign">
                                    <div class="row">
                                        <div class="col-4">
                                            <svg width="38" height="38" version="1.0" viewBox="0 0 32 32" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 32 32"><path d="M11 2h10v15H11z" fill="#ffffff" class="fill-152730"></path><path d="M8 24v-8M24 24v-8M11 27h10M16 30v-6M22 30v-2M10 30v-2" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="10" class="stroke-152730"></path><path d="M13 17h6v3h-6z" fill="#ffffff" class="fill-152730"></path><path d="M9 19v5h14v-5H9zm13 3H10v-1h12v1z" fill="#ffffff" class="fill-152730"></path></svg>
                                        </div>
                                        <div class="col-4">
                                            <h6 class="mt-2" style="font-size: 18px;">Líderes</h6>
                                        </div>
                                    </div>
                                </button>
                            </a>
                        </div>
                        <div class="col-3">
                            <a href="integrantes.jsp" style="text-decoration: none; ">
                                <button  class="btn custom-bsign">
                                    <div class="row">
                                        <div class="col-4">
                                            <i class="bi bi-people-fill" style="color: #fff; font-size: 1.5rem;"></i>
                                        </div>
                                        <div class="col-4">
                                            <h6 class="mt-2" style="font-size: 18px;">Integrantes</h6>
                                        </div>
                                    </div>
                                </button>            
                            </a>
                        </div>
                    </div>
                    
                    <h3 class="mt-3" style="color: #CEC7C7">Gesti&oacute;n</h3>
                    <div class="row mt-2">
                        <div class="col-4">
                            <a href="gestion/integrantes.jsp">
                                <button class="btn custom-blog mt-2">Gestionar integrantes de departamentos</button>
                            </a> 
                            <a href="gestion/proyectos.jsp">
                                <button class="btn custom-blog mt-3">Gestionar proyectos de departamentos</button>
                            </a>
                            <a href="gestion/lideres.jsp">
                                <button class="btn custom-blog mt-3">Gestionar líderes de proyectos</button>
                            </a>
                        </div>
                        <div class="col-4"></div>
                        <div class="col-4"></div>
                    </div>

                </div>
                <div class="col-1"></div>
            </div>
        </div>

    </body>

</html>
