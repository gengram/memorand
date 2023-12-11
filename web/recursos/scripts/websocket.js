var wsURI = "ws://" + document.location.host + document.location.pathname + "chat";

var websocket = new WebSocket(wsURI);

websocket.onmessage = function (event) {

    onMessage(event);

};

websocket.onopen = function () {

    onOpen();

};

function onOpen() {

    console.log("Conexion abierta: " + wsURI);


}

function onClose() {

    console.log("Conexion cerrada: " + wsURI);

}

function onMessage(event) {

    console.log(event);
    display(event.data);

}

function display(dataString) {
    var data = JSON.parse(dataString);


    if (data.username === document.getElementById("username_to").value) {
        var fechaHoraActual = new Date();
// Extrae la hora, minutos y segundos
        var horas = fechaHoraActual.getHours();
        var minutos = fechaHoraActual.getMinutes();
// Formatea la salida para asegurarte de que siempre tenga dos dígitos
        horas = (horas < 10) ? '0' + horas : horas;
        minutos = (minutos < 10) ? '0' + minutos : minutos;
// Crea una cadena con la hora formateada
        var horaFormateada = horas + ':' + minutos;
        var contentMessage = "<div class=\"row\">" +
                "<div class=\"col-1\">" +
                    "<i class=\"bi bi-person-circle rounded-full w-12 me-4\"></i>" +
                "</div>" +
                "<div class=\"col-11\">" +
                    "<div class=\"d-flex  mb-1\">" +
                        "<div class=\"d-flex flex-column\">" +
                            "<div class=\"bg-white p-1 rounded-3xl rounded-bl-none w-96 shadow-sm mb-1\">" +
                                "<p class=\"font-medium mb-1\">" + data.usernom + "</p>" +
                                "<small class=\"inline-block text-gray-500 mb-1\">" + data.content + "</small>" +
                            "</div>" +
                            "<small class=\"text - gray - 500\">" + horaFormateada + "</small>" +
                        "</div>" +
                    "</div>" +
                "</div>" +
                "</div>";
        
        document.getElementById("output").innerHTML += contentMessage;

    }
    if (data.username === document.getElementById("username_in").value) {
        var fechaHoraActual = new Date();
// Extrae la hora, minutos y segundos
        var horas = fechaHoraActual.getHours();
        var minutos = fechaHoraActual.getMinutes();
// Formatea la salida para asegurarte de que siempre tenga dos dígitos
        horas = (horas < 10) ? '0' + horas : horas;
        minutos = (minutos < 10) ? '0' + minutos : minutos;
// Crea una cadena con la hora formateada
        var horaFormateada = horas + ':' + minutos;
        var contentMessage =  "<div class=\"row\">" +
                "<div class=\"col-11\">" +
                    "<div class=\"d-flex flex-row-reverse mb-1\">" +
                        "<div class=\"d-flex flex-column\">" +
                    "<div class=\"bg-blue-500 text-white p-1 rounded-3xl rounded-br-none w-96 mb-1\">" +
                "<p class=\"font-medium mb-1 ms-4\">" + data.usernom + "</p>" +
                "<small class=\"inline-block text-white mb-1 ms-4\">" + data.content + "</small>" +
                "</div>" +
                "<small class=\"flex-row-reverse text - gray - 500\">" + horaFormateada + "</small>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "<div class=\"col-1\">" +
                "<i class=\"bi bi-person-circle rounded-full w-12 me-4\"></i>" +
                "</div>" +
                "</div>"
        ;
        document.getElementById("output").innerHTML += contentMessage;

    }

}

function send() {

    var userto = document.getElementById("username_to").value;
    var nomto = document.getElementById("nom_to").value;
    var message = document.getElementById("message_in").value;
    var userin = document.getElementById("username_in").value;
    var nomin = document.getElementById("nom_in").value;

    var json = {
        "touser": userto,
        "tonom": nomto,
        "content": message,
        "username": userin,
        "usernom": nomin
    };

    console.log(nomin + " enviando: " + message + " a: " + nomto);
    websocket.send(JSON.stringify(json));

}