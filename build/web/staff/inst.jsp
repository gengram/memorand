<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <jsp:include page="../recursos/import.jsp"/>
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css" type="text/css">
        <title>Instituciones</title>
    </head>

    <%
        String accion = request.getParameter("a");

        //PROTECCION
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
                                <h1>Nueva institucion</h1>
                            </div>
                        </div>

                        <form action="../altainst" method="post">
                            <div class="row">
                                <div class="col-2">
                                </div>
                                <div class="col-6">
                                    <input class="form-control-sm mt-3" type="text" name="nom_inst" id="nom_inst" placeholder="Nombre institucion" required>
                                </div>
                                <div class="col-4">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <div class="form-floating mt-3">
                                        <select name="tipo_inst" id="tipo_inst" placeholder="Selecciona" class="form-select-sm" required>
                                            <option value="pescolar">Escolar Lite</option>
                                            <option value="mescolar">Escolar Medio</option>
                                            <option value="gescolar">Escolar Grande</option>
                                            <option value="pempresa">Empresa Lite</option>
                                            <option value="mempresa">Empresa Medio</option>
                                            <option value="gempresa">Empresa Grande</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-6">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6 mt-3">
                                    <input class="form-control-sm" type="text" name="lim_lider" id="lim_lider" placeholder="Limite de lideres" required>
                                    <input class="form-control-sm mt-3" type="text" name="lim_part" id="lim_part" placeholder="Limite de participantes" required>
                                </div>
                                <div class="col-6 mt-3">
                                    <input class="form-control-sm" type="text" name="lim_grupo" id="lim_grupo" placeholder="Limite de grupos" required>
                                    <input class="form-control-sm mt-3" type="text" name="lim_sector" id="lim_sector" placeholder="Limite de sectores" required>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-4">
                                </div>
                                <div class="col-4">
                                    <input type="submit" value="Alta institucion" class="w-100 mt-4 mb-2 btn btn-lg rounded-3 custom-bsign">
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

                                String id_inst = request.getParameter("i");
                                String nom_inst = request.getParameter("n");
                                String tipo_inst = request.getParameter("t");
                                String lim_lider = request.getParameter("l");
                                String lim_part = request.getParameter("p");
                                String lim_grupo = request.getParameter("g");
                                String lim_sector = request.getParameter("s");

                        %>

                        <div class="row">
                            <div class="col mt-5">

                                <h1>Editar institucion</h1>
                            </div>
                        </div>

                        <div class="row">
                            <form action="../editainst" method="post">
                                <div class="col-2">
                                </div>
                                <div class="col-6">
                                    <input class="form-control-sm mt-3" type="text" name="id_inst" id="id_inst" value="<%=id_inst%>" hidden="true">
                                    <input class="form-control-sm mt-3" type="text" name="nom_inst" id="nom_inst" placeholder="Nuevo nombre" value="<%=nom_inst%>" required>
                                </div>
                                <div class="col-4">
                                </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-floating mt-3">
                                    <select name="tipo_inst" id="tipo_inst" placeholder="Selecciona" class="form-select-sm" required>
                                        <option value="pescolar">Escolar Lite</option>
                                        <option value="mescolar">Escolar Medio</option>
                                        <option value="gescolar">Escolar Grande</option>
                                        <option value="pempresa">Empresa Lite</option>
                                        <option value="mempresa">Empresa Medio</option>
                                        <option value="gempresa">Empresa Grande</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-6">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 mt-3">
                                <input class="form-control-sm" type="text" name="lim_lider" id="lim_lider" placeholder="Nuevo lim. de lideres" value="<%=lim_lider%>" required>
                                <input class="form-control-sm mt-3" type="text" name="lim_part" id="lim_part" placeholder="Nuevo lim. de participantes" value="<%=lim_part%>" required>
                            </div>
                            <div class="col-6 mt-3">
                                <input class="form-control-sm" type="text" name="lim_grupo" id="lim_grupo" placeholder="Nuevo lim. de grupos" value="<%=lim_grupo%>" required>
                                <input class="form-control-sm mt-3" type="text" name="lim_sector" id="lim_sector" placeholder="Nuevo lim. de sectores" value="<%=lim_sector%>" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                            </div>
                            <div class="col-4">
                                <input type="submit" value="Editar institucion" class="w-100 mt-4 mb-2 btn btn-lg rounded-3 custom-bsign">
                                <a href="../listainst">Regresar</a>
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
                                <h1>Nueva institucion</h1>
                            </div>
                        </div>

                        <div class="row">
                            <form action="../altainst" method="post">
                                <div class="col-2">
                                </div>
                                <div class="col-6">
                                    <input class="form-control-sm mt-3" type="text" name="nom_inst" id="nom_inst" placeholder="Nombre institucion" required>
                                </div>
                                <div class="col-4">
                                </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <div class="form-floating mt-3">
                                    <select name="tipo_inst" id="tipo_inst" placeholder="Selecciona" class="form-select-sm" required>
                                        <option value="pescolar">Escolar Lite</option>
                                        <option value="mescolar">Escolar Medio</option>
                                        <option value="gescolar">Escolar Grande</option>
                                        <option value="pempresa">Empresa Lite</option>
                                        <option value="mempresa">Empresa Medio</option>
                                        <option value="gempresa">Empresa Grande</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-6">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6 mt-3">
                                <input class="form-control-sm" type="text" name="lim_lider" id="lim_lider" placeholder="Limite de lideres" required>
                                <input class="form-control-sm mt-3" type="text" name="lim_part" id="lim_part" placeholder="Limite de participantes" required>
                            </div>
                            <div class="col-6 mt-3">
                                <input class="form-control-sm" type="text" name="lim_grupo" id="lim_grupo" placeholder="Limite de grupos" required>
                                <input class="form-control-sm mt-3" type="text" name="lim_sector" id="lim_sector" placeholder="Limite de sectores" required>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-4">
                            </div>
                            <div class="col-4">
                                <input type="submit" value="Alta institucion" class="w-100 mt-4 mb-2 btn btn-lg rounded-3 custom-bsign">
                                <a href="../listainst">Regresar</a>
                            </div>
                            <div class="col-4 mt-5">
                            </div>
                        </div>

                        </form>

                        <br>

                        <%
                                }
                            } else {
                                response.sendRedirect("insti.jsp?a=nuevo");
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
