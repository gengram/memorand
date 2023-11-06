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
                    
                    <div class="form-floating mb-3">
                        <input type="text" name="id_usuario" id="id_usuario" required placeholder="Id Usuario"><br>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="password" name="pass_usuario" id="pass_usuario" required placeholder="Contraseña">
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="text" name="correo_usuario" id="correo_usuario" required placeholder="Correo">
                    </div>
                    
                    <div class="form-floating mb-3">
                        <select name="tipo_usuario" id="tipo_usuario" placeholder="Selecciona">
                            <option value="admin">Administrador</option>
                            <option value="profesor">Profesor</option>
                            <option value="staff">Staff</option>
                            <option value="alumno">Alumno</option>
                        </select>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="text" name="nombre_usuario" id="nombre_usuario" required placeholder="Nombre"><br>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="text" name="paterno_usuario" id="paterno_usuario" required placeholder="Apellido paterno"><br>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="text" name="materno_usuario" id="materno_usuario" required placeholder="Apellido materno"><br>
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
