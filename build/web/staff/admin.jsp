<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <jsp:include page="../recursos/import.jsp"/>
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css" type="text/css">
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
        <jsp:include page="../recursos/paginas/navbar.jsp"/>
        <jsp:include page="../recursos/paginas/sidelbar_SV.jsp"/>
        <div class="container text-center">
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="row">
                        <%
                            if (accion != null) {

                                if ("nuevo".equals(accion)) {
                        %>
                        <div class="row">
                            <div class="col mt-5">
                                <h1>Nuevo administrador</h1>
                            </div>
                        </div>

                        <form action="altaadmin" method="post">
                            <div class="row mt-3">
                                <div class="col-5">
                                    <input class="form-control-sm" type="text" name="correo_usuario" id="correo_usuario" placeholder="Correo administrador" required>
                                </div>
                                <div class="col-5">
                                    <input class="form-control-sm" type="text" name="pass_usuario" id="pass_usuario" placeholder="Contraseña administrador" required>
                                </div>
                                <div class="col-2">
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col-4">
                                    <input class="form-control-sm" type="text" name="nom_usuario" id="nom_usuario" placeholder="Nombre(s)" required> 
                                </div>
                                <div class="col-4">
                                    <input class="form-control-sm" type="text" name="pat_usuario" id="pat_usuario" placeholder="Apellido paterno" required>
                                </div>
                                <div class="col-4">
                                    <input class="form-control-sm" type="text" name="mat_usuario" id="mat_usuario" placeholder="Apellido materno" required> 
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <div class="form-floating mt-4">
                                        <select name="est_usuario" id="est_usuario" class="form-select-sm" placeholder="Selecciona">
                                            <option value="si">Activo</option>
                                            <option value="no">Inactivo</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-floating mt-4">
                                        <select name="nom_inst" id="nom_inst" class="form-select-sm" placeholder="Selecciona">
                                            <c:forEach items="${inst}" var="institucion">
                                                <option value="${institucion.nom_inst}">${institucion.nom_inst}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-4">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                </div>
                                <div class="col-4">
                                    <input type="submit" value="Alta administrador" class="w-100 mt-4 mb-2 btn btn-lg rounded-3 custom-bsign">
                                    <a href="index.jsp">Regresar</a>
                                </div>
                                <div class="col-4 mt-5">
                                </div>
                            </div>

                        </form>

                        <br>

                        <%
                            }
                            if ("editar".equals(accion)) {

                                String id_usuario = request.getParameter("i");
                                String correo_usuario = request.getParameter("c");
                                String nom_usuario = request.getParameter("n");
                                String pat_usuario = request.getParameter("p");
                                String mat_usuario = request.getParameter("m");
                                String est_usuario = request.getParameter("e");
                        %>

                        <div class="row">
                            <div class="col mt-5">
                                <h1>Editar administrador</h1>
                            </div>
                        </div>

                        <form action="editaadmin" method="post">
                            <div class="row mt-4">
                                <div class="col-7">
                                    <input class="form-control-sm" type="text" name="id_usuario" id="id_usuario" value="<%=id_usuario%>" hidden="true">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-5">
                                    <input class="form-control-sm" type="email" name="correo_usuario" id="correo_usuario" placeholder="Correo administrador" value="<%=correo_usuario%>" required>
                                </div>
                                <div class="col-5">
                                    <input class="form-control-sm" type="text" name="pass_usuario" id="pass_usuario" placeholder="Nueva Contraseña" required>
                                </div>
                                <div class="col-2">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-4">
                                    <input class="form-control-sm" type="text" name="nom_usuario" id="nom_usuario" placeholder="Nombre(s)" value="<%=nom_usuario%>" required>
                                </div>
                                <div class="col-4">
                                    <input class="form-control-sm" type="text" name="pat_usuario" id="pat_usuario" placeholder="Apellido paterno" value="<%=pat_usuario%>" required>
                                </div>
                                <div class="col-4">
                                    <input class="form-control-sm" type="text" name="mat_usuario" id="mat_usuario" placeholder="Apellido materno" value="<%=mat_usuario%>" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <div class="form-floating mt-4">
                                        <select name="est_usuario" id="est_usuario" class="form-select-sm" placeholder="Selecciona">
                                            <option value="si">Activo</option>
                                            <option value="no">Inactivo</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-floating mt-4 ">
                                        <select name="nom_inst" id="nom_inst" class="form-select-sm" placeholder="Selecciona">
                                            <c:forEach items="${inst}" var="institucion">
                                                <option value="${institucion.nom_inst}">${institucion.nom_inst}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-4">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                </div>
                                <div class="col-4">
                                    <input type="submit" value="Editar administrador" class="w-100 mt-4 mb-2 btn btn-lg rounded-3 custom-bsign">
                                    <a href="listaadmin">Regresar</a>
                                </div>
                                <div class="col-4 mt-5">
                                </div>
                            </div>
                        </form>

                        <br>

                        <%
                            }
                            if ("nuevo2".equals(accion)) {
                        %>

                        <div class="row">
                            <div class="col mt-5">
                                <h1>Nuevo administrador</h1>
                            </div>
                        </div>

                        <form action="altaadmin" method="post">
                            <div class="row mt-3">
                                <div class="col-5">
                                    <input class="form-control-sm" type="text" name="correo_usuario" id="correo_usuario" placeholder="Correo administrador" required>
                                </div>
                                <div class="col-5">
                                    <input class="form-control-sm" type="text" name="pass_usuario" id="pass_usuario" placeholder="Contraseña administrador" required>
                                </div>
                                <div class="col-2">
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col-4">
                                    <input class="form-control-sm" type="text" name="nom_usuario" id="nom_usuario" placeholder="Nombre(s)" required> 
                                </div>
                                <div class="col-4">
                                    <input class="form-control-sm" type="text" name="pat_usuario" id="pat_usuario" placeholder="Apellido paterno" required>
                                </div>
                                <div class="col-4">
                                    <input class="form-control-sm" type="text" name="mat_usuario" id="mat_usuario" placeholder="Apellido materno" required> 
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <div class="form-floating mt-4">
                                        <select name="est_usuario" id="est_usuario" class="form-select-sm" placeholder="Selecciona">
                                            <option value="si">Activo</option>
                                            <option value="no">Inactivo</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-floating mt-4">
                                        <select name="nom_inst" id="nom_inst" class="form-select-sm" placeholder="Selecciona">
                                            <c:forEach items="${inst}" var="institucion">
                                                <option value="${institucion.nom_inst}">${institucion.nom_inst}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-4">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                </div>
                                <div class="col-4">
                                    <input type="submit" value="Alta administrador" class="w-100 mt-4 mb-2 btn btn-lg rounded-3 custom-bsign">
                                    <a href="../listaadmin">Regresar</a>
                                </div>
                                <div class="col-4 mt-5">
                                </div>
                            </div>

                        </form>

                        <br>

                        <%
                                }
                            } else {
                                response.sendRedirect("admin.jsp?a=lista");
                            }

                        %>
                    </div>
                    <br><br><br><br><br><br>
                </div>
                <div class="col-2"></div>
            </div>
        </div>
        <jsp:include page="../recursos/paginas/footer.jsp"/>
    </body>

</html>
