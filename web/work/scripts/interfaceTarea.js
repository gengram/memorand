document.addEventListener('DOMContentLoaded', function () {
    // Seleccionar todos los botones
    const buttons = document.querySelectorAll('.btnnav');

// Función para activar un botón y recordar su estado
    function activateButton(button) {
        // Remover clase 'active' de todos los botones
        buttons.forEach(btn => {
            btn.classList.remove('active');
            btn.classList.remove('active-border');
        });

        // Agregar clase 'active' al botón actual
        button.classList.add('active');
        // Agregar clase 'active-border' al botón actual
        button.classList.add('active-border');

        // Guardar el ID del botón activo en el almacenamiento local
        localStorage.setItem('activeButton', button.id);
    }

// Agregar event listeners a cada botón
    buttons.forEach(button => {
        button.addEventListener('click', function () {
            activateButton(this);
        });
    });

// Verificar si hay un botón activo almacenado localmente al cargar la página
    const activeButtonId = localStorage.getItem('activeButton');
    if (activeButtonId) {
        const activeButton = document.getElementById(activeButtonId);
        if (activeButton) {
            activateButton(activeButton);
        }
    }

// Agregar evento de clic al enlace "Regresar" para limpiar el almacenamiento local
    const backButton = document.getElementById('backLink');
    backButton.addEventListener('click', function () {
        localStorage.removeItem('activeButton');
    });
}
);