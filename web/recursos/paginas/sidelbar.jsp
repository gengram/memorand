<%-- 
    Memorand by Gengram © 2023
--%>
<div class="offcanvas offcanvas-start" style="width: 100px;" tabindex="-1" id="sidebarOffcanvas" aria-labelledby="sidebarOffcanvasLabel">

    <div class="offcanvas-body">
        <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
            <li class="nav-item">
                <a href="index.jsp" class="nav-link py-3 border-bottom rounded-0"aria-current="page" title="Home" data-bs-toggle="tooltip" data-bs-placement="right">
                    <img src="../recursos/imagenes/logotypes/me-logoP.png" width="33" height="33" role="img" >
                </a>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Horario">
                    <a href="horario.jsp" class="nav-link py-3  border-bottom rounded-0"  data-bs-toggle="tooltip" data-bs-placement="right">
                        <svg width="35" height="35" viewBox="0 0 24 24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"><path d="M12 0C5.4 0 0 5.4 0 12s5.4 12 12 12 12-5.4 12-12S18.6 0 12 0zm0 22C6.5 22 2 17.5 2 12S6.5 2 12 2s10 4.5 10 10-4.5 10-10 10z"  class="fill-000000"></path><path d="M13.9 12.5c0-.2.1-.3.1-.5 0-.7-.4-1.4-1-1.7V4c0-.6-.4-1-1-1s-1 .4-1 1v6.3c-.6.3-1 1-1 1.7 0 1.1.9 2 2 2 .2 0 .3 0 .5-.1l1.8 1.8c.4.4 1 .4 1.4 0s.4-1 0-1.4l-1.8-1.8zM12 13c-.6 0-1-.4-1-1s.4-1 1-1 1 .4 1 1-.4 1-1 1z"  class="fill-000000"></path><circle cx="20" cy="12" r="1" class="fill-000000"></circle><circle cx="4" cy="12" r="1" class="fill-000000"></circle><circle cx="17.7" cy="17.7" r="1" class="fill-000000"></circle><circle cx="6.3" cy="6.3" r="1" class="fill-000000"></circle><circle cx="12" cy="20" r="1" class="fill-000000"></circle><circle cx="6.3" cy="17.7" r="1" class="fill-000000"></circle><circle cx="17.7" cy="6.3" r="1" class="fill-000000"></circle></svg>
                    </a>
                </span>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Calendario">
                    <a href="calendario.jsp" class="nav-link py-3  border-bottom rounded-0 c2" data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="bi bi-calendar-week-fill custom-icon2"></i>
                    </a>
                </span>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Cuaderno">
                    <a href="cuaderno.jsp" class="nav-link py-3  border-bottom rounded-0"  data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="bi bi-book-fill custom-icon2"></i>
                    </a>
                </span>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Pendientes">
                    <a href="pendientes.jsp" class="nav-link py-3  border-bottom rounded-0"  data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="bi bi-check-circle-fill custom-icon2"></i>
                    </a>
                </span>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Foro">
                    <a href="#.jsp" class="nav-link py-3  border-bottom rounded-0"  data-bs-toggle="tooltip" data-bs-placement="right" >
                        <svg width="35" height="35" viewBox="0 0 48 48" width="48" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h48v48h-48z" fill="none"/><path d="M42 12h-4v18h-26v4c0 1.1.9 2 2 2h22l8 8v-30c0-1.1-.9-2-2-2zm-8 12v-18c0-1.1-.9-2-2-2h-26c-1.1 0-2 .9-2 2v28l8-8h20c1.1 0 2-.9 2-2z"/></svg>
                    </a>
                </span>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Chat">
                    <a href="chat/index.jsp" class="nav-link py-3  border-bottom rounded-0"  data-bs-toggle="tooltip" data-bs-placement="right">
                        <i class="bi bi-telegram custom-icon2"></i>
                    </a>
                </span>
            </li>
            <li>
                <span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Clases">
                    <a href="clases.jsp" class="nav-link py-3  border-bottom rounded-0"  data-bs-toggle="tooltip" data-bs-placement="right">
                        <svg width="35" height="35"  viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><g id="Graduation"><polygon points="445.055 384.794 445.055 221.864 418.805 234.989 418.805 384.777 401.301 429.785 462.551 429.785 445.055 384.794"/><path d="M229.0648,306.3708l-107.7643-53.88v53.7754c0,36.2433,58.7634,65.625,131.25,65.625,72.4887,0,131.25-29.3817,131.25-65.625V252.49L276.0277,306.3741C257.5813,313.681,247.5133,313.6789,229.0648,306.3708Z"/><path d="M264.2912,282.8969l186.5207-93.26c6.4579-3.2289,6.4579-8.5107,0-11.74l-186.5207-93.26c-6.4556-3.2289-17.0214-3.2289-23.4793,0l-186.5207,93.26c-6.4556,3.2289-6.4556,8.5107,0,11.74l186.5207,93.26C247.27,286.1258,257.8356,286.1258,264.2912,282.8969Z"/></g></svg>
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