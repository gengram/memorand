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



// Función para insertar una lista
function insertList() {
    document.execCommand('insertUnorderedList', false, null);
}

// Función para insertar una lista ordenada
function insertOrderedList() {
    document.execCommand('insertOrderedList', false, null);
}

function applyColor(color) {
    var selection = window.getSelection();
    if (selection.rangeCount > 0) {
        var range = selection.getRangeAt(0);
        var newNode = document.createElement('span');
        newNode.style.color = color;
        range.surroundContents(newNode);
    }
}

// Función para obtener todos los nodos de texto dentro de un rango
function getTextNodesInRange(range) {
    var textNodes = [];
    var treeWalker = document.createTreeWalker(
        range.commonAncestorContainer,
        NodeFilter.SHOW_TEXT,
        function(node) {
            if (range.intersectsNode(node)) {
                return NodeFilter.FILTER_ACCEPT;
            }
            return NodeFilter.FILTER_REJECT;
        }
    );

    while (treeWalker.nextNode()) {
        textNodes.push(treeWalker.currentNode);
    }

    return textNodes;
}

