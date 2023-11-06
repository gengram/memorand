<%-- 
    Memorand by Gengram © 2023
--%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="recursos/import.jsp"/>
        <style>
            .chat {
                max-width: 800px;
                margin: auto;
            }

            .card {

            }

            .message-area {
                height: 300px;
                overflow-y: auto;
            }

            .user-message {
                background-color: #84e0e0;
                padding: 8px;
                border-radius: 20px;
                max-width: 50%;
                display: inline-block;
                margin-bottom: 10px;
            }

            .other-message {
                background-color: #d4f4f4;
                padding: 8px;
                border-radius: 20px;
                max-width: 50%;
                display: inline-block;
                margin-bottom: 10px;
            }

            .user-message p, .other-message p {
                margin: 0;
            }

            .chat-input {
                margin-top: 10px;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }
            .message-container {
                display: flex;
                flex-direction: column;
            }

            .user-message, .other-message {
                background-color: #d4f4f4;
                padding: 8px;
                border-radius: 20px;
                max-width: 50%;
                margin: 5px; /* Espacio entre mensajes */
            }

            .user-message {
                align-self: flex-end; /* Alinea los mensajes del usuario a la derecha */
                background-color: #84e0e0;
            }
        </style>
    </style>
    <title>Chat</title>
</head>
<body>
    <jsp:include page="recursos/navbar.jsp"/>
    <div class="container text-center" >
        <div class="row" >
            <div class="col-1">
                <br><br><br>
            </div>
            <div class="col-10">
                <div class="row row-cols-2">
                    <div class="col">

                    </div>
                    <div class="col"><button class="btn custom-bsign mt-4"><i class="bi bi-plus-circle"></i> Nuevo Pendiente </button></div>
                </div>
                <div class="row">
                    <div class="col-1">

                    </div>
                    <div class="col-10">
                        <div class="chat">
                            <div class="card" style="max-width: 650px; max-height: 700px;">
                                <div class="card-body" >
                                    <div class="row row-cols-1message-area" id="message-area">

                                    </div>
                                </div>
                            </div>
                            <div class="chat-input">
                                <form id="chat-form" style="max-width: 650px;">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Escribe tu mensaje..." id="user-message">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Enviar</button>
                                </form>
                            </div>
                        </div> 
                    </div>
                    <div class="col-1">

                    </div>

                </div>
            </div>
            <div class="col-1">
                <button type="button" class="btn border-0 rounded-circle ms-5" style="color: #27988A;" data-bs-toggle="dropdown" aria-expanded="false">
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <i class="bi bi-question-circle-fill" style="font-size: 30px;"></i>
                    <br>
                </button>
            </div>
        </div>
    </div>
    <script>
        // Simulación de mensajes de chat
        const messageArea = document.getElementById("message-area");
        const chatForm = document.getElementById("chat-form");
        const userMessageInput = document.getElementById("user-message");

        chatForm.addEventListener("submit", function (e) {
            e.preventDefault();
            const userMessage = userMessageInput.value;
            if (userMessage.trim() !== "") {
                addMessage(userMessage, "user");
                userMessageInput.value = "";
                setTimeout(function () {
                    addMessage("Respuesta del otro usuario.", "other");
                }, 1000);
            }
        });

        function addMessage(message, sender) {
            const messageDiv = document.createElement("div");
            messageDiv.className = sender === "user" ? "user-message" : "other-message";
            const messageText = document.createElement("p");
            messageText.textContent = message;
            messageDiv.appendChild(messageText);
            messageArea.appendChild(messageDiv);

            // Hacer que el área de mensajes se desplace automáticamente hacia abajo
            messageArea.scrollTop = messageArea.scrollHeight;
        }
        function addMessage(message, sender) {
            const messageDiv = document.createElement("div");
            const messageText = document.createElement("p");

            if (sender === "user") {
                messageDiv.className = "user-message";
                messageText.textContent = message;
                messageDiv.appendChild(messageText);
            } else {
                messageDiv.className = "other-message";
                messageText.textContent = "Otro usuario: " + message;
                messageDiv.appendChild(messageText);
            }

            messageArea.appendChild(messageDiv);

            // Hacer que el área de mensajes se desplace automáticamente hacia abajo
            messageArea.scrollTop = messageArea.scrollHeight;
        }

    </script>
    <jsp:include page="recursos/footer.jsp"/>
</body>
</html>
