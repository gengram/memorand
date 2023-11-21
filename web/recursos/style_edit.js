function bold() {
    document.execCommand('bold', false, null);
}

function italic() {
    document.execCommand('italic', false, null);
}

function underline() {
    document.execCommand('underline', false, null);
}

document.getElementById('exampleColorInput').addEventListener('input', function (event) {
    var selectedColor = event.target.value;
    applyColor(selectedColor);
});

function applyColor(color) {
    // Aplica el color al texto seleccionado en el 'textarea'
    document.execCommand('styleWithCSS', false, true);
    document.execCommand('foreColor', false, color);
}

function insertList() {
    document.execCommand('insertUnorderedList', false, null);
}