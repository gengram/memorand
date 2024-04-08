document.addEventListener("DOMContentLoaded", function ()
{
    const urlParams = new URLSearchParams(window.location.search);
    const collab = urlParams.get('id');
    
    document.getElementById("task_panel").addEventListener("click", function () {
        loadTasks(collab, "panel");
    });

    document.getElementById("task_table").addEventListener("click", function () {
        loadTasks(collab, "table");
    });
});

function loadTasks(collab, view)
{
    var xhr = new XMLHttpRequest();
    
    xhr.open("GET", "/memorand/taskget?reqby=collab&collab=" + collab +"&view=" + view, true);
    
    xhr.onreadystatechange = function ()
    {
        if (xhr.readyState === XMLHttpRequest.DONE)
        {
            if (xhr.status === 200)
            {
                document.getElementById("tasks").innerHTML = xhr.responseText;
            }
            else
            {
                console.error("Error al cargar las tareas:", xhr.status);
            }
        }
    };
    
    xhr.send();
}