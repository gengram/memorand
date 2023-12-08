var wsURI = "ws://" + document.location.host + document.location.pathname + "chat";

var websocket = new WebSocket(wsURI);

websocket.onmessage = function(event) {
    
    onMessage(event);
    
}

websocket.onopen = function() {
    
    onOpen();
    
}

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
    var contentMessage = "<p>User: " + data.username + " Dice: " + data.content + "</p>";
    document.getElementById("output").innerHTML += contentMessage + "</br>";
    
    
}

function send() {
    
    var message = document.getElementById("message_in").value;
    var username = document.getElementById("username_in").value;
    
    var json = {
        "content": message,
        "username": username
    };
    
    console.log("Enviando " + message);
    websocket.send(JSON.stringify(json));
    
}

