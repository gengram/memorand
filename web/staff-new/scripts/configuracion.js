function confirmAction(endpoint)
{
    var confirmacion = confirm("¿Estás seguro de que deseas enviar esta solicitud?");

    if (confirmacion)
    {
        var urlDelServlet = "";
        
        if (endpoint === "sales")
        {
            urlDelServlet = "/memorand/staff-new/home.jsp";
        }
        else if (endpoint === "system")
        {
            urlDelServlet = "/memorand/staff-new/home.jsp";
        }
        else if (endpoint === "reset")
        {
            urlDelServlet = "/memorand/resetdata";
        }
        else
        {
            console.error("Endpoint desconocido:", endpoint);
            return;
        }
        
        window.location.href = urlDelServlet;

    }
}