document.addEventListener('DOMContentLoaded', function () {
    // Seleccionar todos los botones
    const buttons = document.querySelectorAll('.navC');

    // Función para activar un botón y recordar su estado
    function activateButton(button) {
        // Remover clase 'active' de todos los botones
        buttons.forEach(navC => {
            navC.classList.remove('active');
        });

        // Agregar clase 'active' al botón actual
        button.classList.add('active');

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
});

document.addEventListener('DOMContentLoaded', function () {
    // Seleccionar todos los conjuntos de cards
    const cardSets = document.querySelectorAll('.card-set');

    // Función para activar un botón y recordar su estado dentro de un conjunto de cards
    function activateButton(button, buttons) {
        // Remover clase 'activeP' de todos los botones dentro del conjunto de cards
        buttons.forEach(navPub => {
            navPub.classList.remove('activeP');
        });

        // Agregar clase 'activeP' al botón actual
        button.classList.add('activeP');

        // Guardar el ID del botón activo en el almacenamiento local específico para este conjunto de cards
        localStorage.setItem('activeButton-' + button.closest('.card-set').id, button.id);
    }

    // Agregar event listeners a cada botón dentro de cada conjunto de cards
    cardSets.forEach(cardSet => {
        const buttons = cardSet.querySelectorAll('.navPub');
        buttons.forEach(button => {
            button.addEventListener('click', function () {
                activateButton(this, buttons);
            });
        });

        // Verificar si hay un botón activo almacenado localmente al cargar la página para este conjunto de cards
        const activeButtonId = localStorage.getItem('activeButton-' + cardSet.id);
        if (activeButtonId) {
            const activeButton = cardSet.querySelector('#' + activeButtonId);
            if (activeButton) {
                activateButton(activeButton, buttons);
            }
        }
    });
});

document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('task_panel').addEventListener('click', function () {
        document.getElementById('vbtn-radioPanel').checked = true;
    });

    document.getElementById('task_table').addEventListener('click', function () {
        document.getElementById('vbtn-radioTabla').checked = true;
    });
});
