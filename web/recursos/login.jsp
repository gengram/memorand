<%-- Memorand by Gengram © 2023 --%>

<div class="modal fade" tabindex="-1" role="dialog" id="modalLogin">

    <div class="modal-dialog modal-dialog-centered text-center" role="document">
        <div class="modal-content rounded-4 shadow">
            
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2 text-primary ">Iniciar Sesi&oacute;n</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-2">
                <form action="login" method="post">
                    <div class="form-floating">
                        <input type="email" class="form-control-sm rounded-3" name="correo_usuario" id="correo_usuario" required placeholder="Correo electr&oacute;nico"><br>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control-sm rounded-3" name="pass_usuario" id="pass_usuario" required placeholder="Contrase&ntilde;a"><br>
                    </div>
                    <input type="submit" value="Iniciar sesión" class="w-100 mb-2 btn btn-lg rounded-3 custom-bsign">
                </form>

                <small class="text-body-secondary"> <a type="button" data-bs-target="#modalSignin" data-bs-toggle="modal">¿No tienes cuenta? Reg&iacute;strate</a></small>
                <hr class="my-4">
                <p class="mb-3 text-primary" style="font-size: 70%;">Condiciones de uso | Política de privacidad</p>
            </div>
            
        </div>
    </div>
    
</div>

<!-- Modal de Instituciones -->
<div class="modal fade" tabindex="-1" role="dialog" id="modalInst">
    <div class="modal-dialog modal-dialog-centered text-center" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2 text-primary ">
                    <i class="bi bi-stars" style="color: yellow;"></i>
                    Instituciones educativas
                    <i class="bi bi-stars" style="color: yellow;"></i></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-0">
                <ul class="list-unstyled mt-3 mb-4 text-justify text-start mx-5">
                    <li ><i class="bi text-primary bi-check-lg"></i> Licencias</li>
                    <li ><i class="bi text-primary bi-check-lg"></i> Espacio ilimitados</li>
                    <li><i class="bi text-primary bi-check-lg"></i> Estad&iacute;sticas</li>
                    <li><i class="bi text-primary bi-check-lg"></i> Ideas y apuntes</li>
                    <li><i class="bi text-primary bi-check-lg"></i> Apuntes por voz</li>
                    <li><i class="bi text-primary bi-check-lg"></i> Imagen a texto</li>
                    <li><i class="bi text-primary bi-check-lg"></i> Rutinas</li>
                    <li><i class="bi text-primary bi-check-lg"></i> Tareas</li>
                    <li><i class="bi text-primary bi-check-lg"></i> Calendario</li>
                    <li><i class="bi text-primary bi-check-lg"></i> Compartir QR y NFC</li>
                    <li><i class="bi text-primary bi-check-lg"></i> Personalizaci&oacute;n</li>
                    <li><i class="bi text-primary bi-check-lg"></i> Aplicaci&oacute;n m&oacute;vil</li>
                </ul>
                <button type="button" class="w-100 btn btn-lg custom-bsign"> <i class="bi bi-envelope-fill"></i>     Contactanos</button>
            </div>
        </div>
    </div>
</div>


