<%-- 
    Memorand by Gengram © 2023
--%>
<div class="offcanvas offcanvas-start" style="width: 100px;" tabindex="-1" id="sidebarOffcanvas" aria-labelledby="sidebarOffcanvasLabel">

    <div class="offcanvas-body">
        <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
            <li class="nav-item">
                <a href="staff/index.jsp" class="nav-link py-3 border-bottom rounded-0"aria-current="page" title="Home" data-bs-toggle="tooltip" data-bs-placement="right">
                    <img src="recursos/imagenes/logotypes/me-logoP.png" width="33" height="33" role="img" >
                </a>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Ver admins">
                    <a href="horario.jsp" class="nav-link py-3  border-bottom rounded-0"  data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="bi bi-person-fill-gear custom-icon2"></i>
                    </a>
                </span>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Nuevo admin">
                    <a href="calendario.jsp" class="nav-link py-3  border-bottom rounded-0 c2" data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="bi bi-person-fill-add custom-icon2"></i>
                    </a>
                </span>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Ver Inst.">
                    <a href="cuaderno.jsp" class="nav-link py-3  border-bottom rounded-0"  data-bs-toggle="tooltip" data-bs-placement="right">
                        <svg width="35" height="35" enable-background="new 0 0 24 24" id="Layer_1" version="1.1" viewBox="0 0 24 24"  xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="M23.3,7.5C22.5,7,12.8,0.2,12.8,0.2c-0.4-0.3-1.2-0.3-1.6,0c0,0-9.8,6.8-10.5,7.3S0,8.5,0,8.5V9v0c0,0.5,0.4,1,0.9,1H2v12H1  c-0.6,0-1,0.5-1,1v1h24v-1c0-0.6-0.5-1-1-1h-1V10h1c0.5,0,1-0.4,1-1v0V8.5C24,8.5,24.1,8.1,23.3,7.5z M12,2l8.9,6H3.1L12,2z M3,22  V10h2v12H3z M6,22V10h4v12H6z M11,22V10h2v12H11z M14,22V10h4v12H14z M21,22h-2V10h2V22z"/></svg>
                    </a>
                </span>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Nueva Inst.">
                    <a href="pendientes.jsp" class="nav-link py-3  border-bottom rounded-0"  data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="bi bi-plus-square custom-icon2"></i>
                    </a>
                </span>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Cerrar Sesi&oacute;n">
                    <a href="../logout" class="nav-link py-3  border-bottom rounded-0"  data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="bi bi-box-arrow-left custom-icon2"></i>
                    </a>
                </span>
            </li>
        </ul>
    </div>
</div>

<script>
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl)
    });
</script>