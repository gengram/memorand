document.addEventListener('DOMContentLoaded', function () {
    const buttons = document.querySelectorAll('.navC');

    function activateButton(button) {
        buttons.forEach(navC => {
            navC.classList.remove('active');
            navC.classList.remove('active-border');
        });

        button.classList.add('active');
        button.classList.add('active-border');

        localStorage.setItem('activeButton', button.id);
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

    // Agregar event listener al enlace para regresar al inicio
    const backButton = document.getElementById('backL');
    backButton.addEventListener('click', function () {
        // Elimina la clase 'active' de todos los botones
        console.log('Click en enlace de regreso');
        buttons.forEach(navC => {
            navC.classList.remove('active');
            navC.classList.remove('active-border');
        });

        // Obtén el botón predeterminado por su ID
        const defaultButton = document.getElementById('get_tasks');
        
        // Agrega la clase 'active' y 'active-border' al botón predeterminado
        defaultButton.classList.add('active');
        defaultButton.classList.add('active-border');

        // Guarda el ID del botón activo en el almacenamiento local
        localStorage.setItem('activeButton', defaultButton.id);
    });
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
