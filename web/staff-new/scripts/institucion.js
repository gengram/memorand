document.addEventListener("DOMContentLoaded", function ()
{
    const urlParams = new URLSearchParams(window.location.search);
    const inst = urlParams.get('id');
    
    console.log(inst);
    
    document.getElementById("active_admin").addEventListener("click", function () {
        loadInstitutions(inst, "si");
    });

    document.getElementById("inactive_admin").addEventListener("click", function () {
        loadInstitutions(inst, "no");
    });
});

function loadInstitutions(inst, status)
{
    var xhr = new XMLHttpRequest();
    
    xhr.open("GET", "/memorand/userget?reqby=admin&inst="+ inst +"&status=" + status, true);
    
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
