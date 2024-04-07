document.addEventListener("DOMContentLoaded", function () {
    const urlParams = new URLSearchParams(window.location.search);
    let collab = urlParams.get('id');
    if (!collab) {
        collab = ""; // Asegúrate de que collab sea una cadena vacía si no se proporciona en la URL
    }

    // Asigna el evento click a los botones y actualiza la URL del navegador
    document.getElementById("get_tasks").addEventListener("click", function () {
        loadInfo("tasks", collab);
        history.pushState(null, "", "?id=" + collab + "&view=tasks");
    });
    document.getElementById("get_posts").addEventListener("click", function () {
        loadInfo("posts", collab);
        history.pushState(null, "", "?id=" + collab + "&view=posts");
    });
    document.getElementById("get_people").addEventListener("click", function () {
        loadInfo("people", collab);
        history.pushState(null, "", "?id=" + collab + "&view=people");
    });

    // Maneja el evento popstate para cargar el contenido cuando se navega hacia atrás o hacia adelante en el historial
    window.addEventListener("popstate", function (event) {
        const urlParams = new URLSearchParams(window.location.search);
        const view = urlParams.get('view');
        collab = urlParams.get('id');
        if (!collab) {
            collab = ""; // Asegúrate de que collab sea una cadena vacía si no se proporciona en la URL
        }

        if (view) {
            loadInfo(view, collab);
        }
    });
});

function loadInfo(request, collab) {
    const xhr = new XMLHttpRequest();
    let url = "";

    switch (request) {
        case "tasks":
            url = `/memorand/taskget?reqby=collab&collab=${collab}`;
            break;
        case "posts":
            url = `/memorand/postget?reqby=collab&collab=${collab}`;
            break;
        case "people":
            url = `/memorand/userget?reqby=collab&collab=${collab}`;
            break;
        default:
            console.error("Tipo de solicitud no válido");
            return;
    }

    xhr.open("GET", url, true);

    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                document.getElementById("content").innerHTML = xhr.responseText;
            } else {
                console.error("Error al cargar el contenido:", xhr.status);
            }
        }
    };

    xhr.send();
}
