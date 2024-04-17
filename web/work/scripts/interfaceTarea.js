document.addEventListener('DOMContentLoaded', function () {
    const buttons = document.querySelectorAll('.btnnav');

    function activateButton(button) {
        buttons.forEach(btn => {
            btn.classList.remove('active');
            btn.classList.remove('active-border');
        });
        button.classList.add('active');
        button.classList.add('active-border');
        // Comprobar si el botón es el botón de información antes de guardar en el almacenamiento local
        if (button.id !== 'view_info') {
            localStorage.setItem('activeButton', button.id);
        }
    }

    buttons.forEach(button => {
        button.addEventListener('click', function () {
            activateButton(this);
        });
    });

    const activeButtonId = localStorage.getItem('activeButton');
    if (activeButtonId) {
        const activeButton = document.getElementById(activeButtonId);
        if (activeButton) {
            activateButton(activeButton);
        }
    }

    const backButton = document.getElementById('backLink');
    backButton.addEventListener('click', function () {
        localStorage.removeItem('activeButton');
    });

    function restoreActiveButtonStyle() {
        const activeButtonId = localStorage.getItem('activeButton');
        if (activeButtonId) {
            const activeButton = document.getElementById(activeButtonId);
            if (activeButton) {
                activateButton(activeButton);
            }
        }
    }

    document.getElementById('modalInfo').addEventListener('hidden.bs.modal', function () {
        restoreActiveButtonStyle();
    });

    function showContent(contentId) {
        var contents = document.querySelectorAll('.content');
        contents.forEach(function (content) {
            if (content.id === contentId) {
                content.classList.remove('hidden');
            } else {
                content.classList.add('hidden');
            }
        });
        localStorage.setItem('activeContentId', contentId);
    }

    window.addEventListener('load', function () {
        var activeContentId = localStorage.getItem('activeContentId');
        if (activeContentId) {
            showContent(activeContentId);
        }
    });

    document.getElementById('get_ideas').addEventListener('click', function () {
        showContent('ideas_content');
    });
    document.getElementById('get_notes').addEventListener('click', function () {
        showContent('notes_content');
    });
    document.getElementById('get_canvas').addEventListener('click', function () {
        showContent('canvas_content');
    });

    document.getElementById('backLink').addEventListener('click', function () {
        localStorage.removeItem('activeContentId');
    });

    // Agregar evento de clic al botón de cierre dentro del modal
    const modalCloseButton = document.querySelector('.btn-close');
    if (modalCloseButton) {
        modalCloseButton.addEventListener('click', function () {
            restoreActiveButtonStyle();
        });
    }
});



// Agregar evento de clic al botón de cierre dentro del modal
const modalCloseButton = document.querySelector('.btn_info');
if (modalCloseButton) {
    modalCloseButton.addEventListener('click', function () {
        // Restaurar el estilo del botón activo
        restoreActiveButtonStyle();
        // Recargar la página
        location.reload();
    });
}
