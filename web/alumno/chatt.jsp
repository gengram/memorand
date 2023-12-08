<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../recursos/paginas/import.jsp"/>
        <link rel="stylesheet" href="../recursos/estilos/bootstrap.css"  type="text/css">
        <link rel="stylesheet" href="../recursos/estilos/styless.css" type="text/css">
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../recursos/paginas/navbar.jsp"/>
        <jsp:include page="../recursos/paginas/sidelbar.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-12 mt-5 ms-5 card shadow-lg" style="max-width: 1400px; max-height: 650px;">
                    <div class="card-body">
                        <section class="d-flex h-90 overflow-hidden">
                            <div class="bg-white col-xl-3 col-lg-4 col-12 p-6 shadow-lg">
                                <h3 class="text-2xl mb-8">Chat en línea</h3>

                                <div class="overflow-auto h-85">
                                    <!-- Ejemplo de mensaje -->
                                    <div class="bg-gray-100 mb-4 p-4 rounded shadow-sm">
                                        <img src="../recursos/imagenes/extras/user-01.jpg" class="rounded-full w-12 me-4">
                                        <div class="w-full overflow-hidden">
                                            <div class="d-flex mb-1">
                                                <p class="font-medium flex-grow">Diego Velázquez</p>
                                                <small class="text-gray-500">09:55 am</small>
                                            </div>
                                            <small class="overflow-ellipsis overflow-hidden block whitespace-nowrap text-gray-500">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dapibus a erat ac facilisis. Quisque in fringilla lorem.</small>
                                        </div>
                                    </div>
                                    <div class="bg-gray-100 mb-4 p-4 rounded shadow-sm">
                                        <img src="../recursos/imagenes/extras/user-01.jpg" class="rounded-full w-12 me-4">
                                        <div class="w-full overflow-hidden">
                                            <div class="d-flex mb-1">
                                                <p class="font-medium flex-grow">Diego Velázquez</p>
                                                <small class="text-gray-500">09:55 am</small>
                                            </div>
                                            <small class="overflow-ellipsis overflow-hidden block whitespace-nowrap text-gray-500">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dapibus a erat ac facilisis. Quisque in fringilla lorem.</small>
                                        </div>
                                    </div>
                                    <div class="bg-gray-100 mb-5 p-4 rounded shadow-sm">
                                        <img src="../recursos/imagenes/extras/user-01.jpg" class="rounded-full w-12 me-4">
                                        <div class="w-full overflow-hidden">
                                            <div class="d-flex mb-1">
                                                <p class="font-medium flex-grow">Diego Velázquez</p>
                                                <small class="text-gray-500">09:55 am</small>
                                            </div>
                                            <small class="overflow-ellipsis overflow-hidden block whitespace-nowrap text-gray-500">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dapibus a erat ac facilisis. Quisque in fringilla lorem.</small>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="bg-gray-100 col-xl-9 col-lg-8 d-none d-lg-block shadow">
                                <div class="py-4 px-5 border-bottom">
                                    <div class="d-flex">
                                        <div class="d-flex flex-grow">
                                            <div class="position-relative me-4">
                                                <img src="../recursos/imagenes/extras/user-01.jpg" class="rounded-full w-12">
                                            </div>
                                            <div>
                                                <p class="font-medium">Fer López</p>
                                            </div>
                                        </div>
                                        <div class="d-flex">

                                            <svg class="w-6 text-gray-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <!-- Icono -->
                                            </svg>
                                        </div>
                                    </div>
                                </div>

                                <div class="py-1 px-3 h-65 overflow-auto ">
                                    <!-- Ejemplo de mensaje 1 -->
                                    <div class="row">
                                        <div class="col-1">
                                            <img src="../recursos/imagenes/extras/user-02.jpg" class="rounded-full w-12 me-4">
                                        </div>
                                        <div class="col-11">
                                            <div class="d-flex mb-12">
                                                <div class="d-flex flex-column">
                                                    <div class="bg-white p-6 rounded-3xl rounded-bl-none w-96 shadow-sm mb-2">
                                                        <p class="font-medium mb-1">Fer López</p>
                                                        <small class="inline-block text-gray-500 mb-1">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dapibus a erat ac facilisis. Quisque in fringilla lorem.</small>
                                                    </div>
                                                    <small class="text-gray-500">09:55 am</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Ejemplo de mensaje 2 -->
                                    <div class="row">
                                        <div class="col-11">
                                            <div class="d-flex flex-row-reverse mb-12">
                                                <div class="d-flex flex-column">
                                                    <div class="bg-blue-500 text-white p-6 rounded-3xl rounded-br-none w-96 mb-2">
                                                        <p class="font-medium mb-1">Diego Velázquez</p>
                                                        <small class="inline-block mb-1">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dapibus a erat ac facilisis. Quisque in fringilla lorem.</small>
                                                    </div>
                                                    <small class="text-gray-500 self-end">09:55 am</small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <img src="../recursos/imagenes/extras/user-01.jpg" class="rounded-full w-12 ml-4">
                                        </div>
                                    </div>

                                    <!-- Otros mensajes de la conversación... -->
                                </div>

                                <div class="row ">
                                    <div class="col-8">
                                        <input type="text" class="rounded-sm px-20 py-2 focus:outline-none bg-gray-100 w-full" placeholder="Escribe tu mensaje..."> 
                                    </div>
                                    <div class="col-4 justify-end">
                                        <button type="button" class="btn btn-outline-dark rounded">Enviar</button>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../recursos/paginas/footer.jsp"/>
    </body>
</html>
