<%-- 
    Memorand by Gengram © 2023
--%>


<div class="modal fade" tabindex="-1" role="dialog" id="modalSignin">
    <div class="modal-dialog modal-dialog-centered text-center" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2 text-primary">Registrarse</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-0">

                <form action="signup" method="post">

                    <div class="form-floating mb-0">
                        <input type="text" name="id_usuario" id="id_usuario" class="form-control-sm" required placeholder="Id Usuario">
                    </div>

                    <div class="form-floating mt-3">
                        <input type="password" name="pass_usuario" id="pass_usuario" class="form-control-sm" required placeholder="Contraseña">
                    </div>

                    <div class="form-floating mt-3">
                        <input type="text" name="correo_usuario" id="correo_usuario" class="form-control-sm" required placeholder="Correo">
                    </div>

                    <div class="form-floating mt-3 mx-2">
                        <select name="tipo_usuario" id="tipo_usuario" placeholder="Selecciona" class="form-select-sm">
                            <option value="admin">Administrador</option>
                            <option value="profesor">Profesor</option>
                            <option value="staff">Staff</option>
                            <option value="alumno">Alumno</option>
                        </select>
                    </div>

                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-sm" name="nombre_usuario" id="nombre_usuario" required placeholder="Nombre">
                    </div>

                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-sm" name="paterno_usuario" id="paterno_usuario" required placeholder="Apellido paterno">
                    </div>

                    <div class="form-floating mt-3">
                        <input type="text" class="form-control-sm" name="materno_usuario" id="materno_usuario" required placeholder="Apellido materno">
                    </div>

                    <input type="submit" value="Registrarse" class="w-100 mb-2 btn btn-lg rounded-3 custom-bsign">
                    <br>

                    <small class="text-body-secondary"><a type="button" data-bs-target="#modalLogin" data-bs-toggle="modal">¿Ya tienes una cuenta?  Inicia</a></small>
                    <hr class="my-4">
                    <p class="mb-3 text-primary" style="font-size: 70%;">Condiciones de uso | Política de privacidad</p>

                </form>

            </div>
        </div>
    </div>
</div>

<style>
    input {
        padding: 10px; /* Establece un relleno de 10 píxeles en todos los lados */
        margin: 5px; /* Establece un margen de 5 píxeles alrededor del campo */
    }
</style>
