// Funciones para aplicar estilos al texto
function bold() {
    document.execCommand('bold', false, null);
}

function italic() {
    document.execCommand('italic', false, null);
}

function underline() {
    document.execCommand('underline', false, null);
}

// Función para cambiar el color del texto
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('exampleColorInput').addEventListener('input', function(event) {
        var selectedColor = event.target.value;
        applyColor(selectedColor);
    });
});

function applyColor(color) {
    document.getElementById('contE').focus();
    document.execCommand('styleWithCSS', false, true);
    document.execCommand('foreColor', false, color);
}

// Función para insertar una lista
function insertList() {
    document.execCommand('insertUnorderedList', false, null);
}




