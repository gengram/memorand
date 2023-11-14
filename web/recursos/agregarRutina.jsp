<div class="modal fade" tabindex="-1" role="dialog" id="modalAgregarRutina">
    
    <div class="modal-dialog modal-dialog-centered text-center" role="document">
        
        <div class="modal-content rounded-4 shadow">
            
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2 text-primary ">Iniciar Sesi&oacute;n</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-2">

                <form method="post">
                    
                    <div class="form-floating mb-4">
                        <input type="time" name="hora_inicio" id="hora_inicio" required placeholder="Incio"><br>
                    </div>
                    
                    <div class="form-floating mb-4">
                        <input type="time" name="hora_final" id="hora_final" required placeholder="Final"><br>
                    </div>
                    
                    <input type="submit" value="Agregar" id="agregarBtn" class="w-100 mb-2 btn btn-lg rounded-3 custom-bsign">
                </form>
             
                
                <hr class="my-4">
                <p class="mb-3 text-primary" style="font-size: 70%;">Condiciones de uso | Política de privacidad</p>
                
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("agregarBtn").addEventListener("click", function() {
        // Verifica si ya hay 6 botones
        var botonesActualesLunes = document.querySelectorAll("#botonesLunes ul.list-group li").length;
        if (botonesActualesLunes < 7) {
            // Crea un nuevo botón
            var nuevoBoton = document.createElement("li");
            nuevoBoton.className = "btn zoom-button list-group-item shadow border-primary border-1 rounded-4";
            nuevoBoton.innerText = "Nuevo Botón";

            // Agrega el nuevo botón al área de botones (dentro del div "nuevosBotonesContainer")
            document.getElementById("botonesLunes").querySelector("ul.list-group").appendChild(nuevoBoton);
            alert("Se ha agregado.");
        } else {
            // Muestra un mensaje o realiza alguna acción si ya se alcanzó el límite de 6 botones
            alert("Se ha alcanzado el límite de 6 botones.");
        }
    });
</script>
