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
/* Contenido de tareas*/
// Función para mostrar el contenido correspondiente
function showContent(contentId) {
    // Ocultar todos los contenidos excepto el deseado
    var contents = document.querySelectorAll('.content');
    contents.forEach(function (content) {
        if (content.id === contentId) {
            content.classList.remove('hidden');
        } else {
            content.classList.add('hidden');
        }
    });
    // Guardar el ID del contenido activo en el almacenamiento local
    localStorage.setItem('activeContentId', contentId);
}

// Mostrar el contenido guardado en el almacenamiento local al cargar la página
window.addEventListener('load', function () {
    var activeContentId = localStorage.getItem('activeContentId');
    if (activeContentId) {
        showContent(activeContentId);
    }
});
// Manejar clic en los botones
document.getElementById('get_ideas').addEventListener('click', function () {
    showContent('ideas_content');
});
document.getElementById('get_notes').addEventListener('click', function () {
    showContent('notes_content');
});
document.getElementById('get_canvas').addEventListener('click', function () {
    showContent('canvas_content');
});
// Manejar clic en el enlace de regreso
document.getElementById('backLink').addEventListener('click', function () {
    // Eliminar el almacenamiento local
    localStorage.removeItem('activeContentId');
});
/* Colores */
function selectColor(color) {
    document.getElementById("selected_color").value = color;
}

