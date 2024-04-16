function confirmAction(endpoint, status)
{
    console.log(endpoint + " " + status);
    
    var confirmacion = confirm("¿Estás seguro de que deseas cambiar el servicio de "+ endpoint +"?");

    if (confirmacion)
    {
        var urlDelServlet = "";
        
        if (endpoint === "sales")
        {
            urlDelServlet = "/memorand/servicestat?id=c10c1331-6801-4402-b62d-b860d443885b&status="+ status;
        }
        else if (endpoint === "system")
        {
            urlDelServlet = "/memorand/servicestat?id=9cd15faf-0fa5-482c-a7dd-d07790797528&status="+ status;
        }
        else if (endpoint === "tester")
        {
            urlDelServlet = "/memorand/servicestat?id=99949271-4466-46bc-b306-aa171e7e81b3&status="+ status;
        }
        else
        {
            console.error("Endpoint desconocido:", endpoint);
            return;
        }
        
        window.location.href = urlDelServlet;

    }
}