document.addEventListener("DOMContentLoaded", function ()
{
    document.getElementById("active_inst").addEventListener("click", function () {
        loadInstitutions("si");
    });

    document.getElementById("inactive_inst").addEventListener("click", function () {
        loadInstitutions("no");
    });
});

function loadInstitutions(status)
{
    var xhr = new XMLHttpRequest();
    
    xhr.open("GET", "/memorand/instget?reqby=status&status=" + status, true);
    
    xhr.onreadystatechange = function ()
    {
        if (xhr.readyState === XMLHttpRequest.DONE)
        {
            if (xhr.status === 200)
            {
                document.getElementById("content").innerHTML = xhr.responseText;
            }
            else
            {
                console.error("Error al cargar las instituciones:", xhr.status);
            }
        }
    };
    
    xhr.send();
}
