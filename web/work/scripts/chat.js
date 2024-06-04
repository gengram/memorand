(function (window, document, JSON) {
    'use strict';

    var host = window.location.host;

    if (host === 'gengram.gerdoc.com')
    {
        host = 'gengram.gerdoc.com:8080';
    }

    console.log(host);

    var URL = 'ws://' + host + '/memorand/chat';

    console.log(URL);

    var ws = new WebSocket(URL);

    var chatter = document.getElementById('chatter');
    var btn = document.getElementById('submit');

    var urlParams = new URLSearchParams(window.location.search);
    var msg_canva = urlParams.get('id');
    var msg_sender = document.getElementById('msg_sender').textContent;
    var msg_txt = document.getElementById('msg_txt');

    ws.onopen = onOpen;
    ws.onclose = onClose;
    ws.onmessage = onMessage;
    ws.onerror = onError;

    btn.addEventListener('click', onSend);

    function onOpen()
    {
        console.log('Cliente conectado');
    }

    function onClose()
    {
        console.log('Cliente desconectado');
    }

    function onError(error)
    {
        console.error('WebSocket error:', error);
    }

    function onSend()
    {
        if (ws.readyState !== WebSocket.OPEN)
        {
            console.error('WebSocket no está abierto. Estado actual:', ws.readyState);
            return;
        }

        var now = new Date();
        var msg_time = now.getTime();

        var msg =
                {
                    msg_canva: msg_canva,
                    msg_sender: msg_sender,
                    msg_time: msg_time,
                    msg_txt: msg_txt.value
                };

        console.log(msg);

        try
        {
            ws.send(JSON.stringify(msg));
        } catch (error)
        {
            console.error("Error enviando mensaje:", error);
        }

        msg_txt.value = '';
    }

    function onMessage(evt) {
        var obj = JSON.parse(evt.data);
        var msgTime = new Date(obj.msg_time).toLocaleString();
        var isCurrentUser = (obj.msg_sender === msg_sender);
        var messageAlignment = isCurrentUser ? 'text-end justify-content-end' : 'align-items-baseline';
        var avatarImage = isCurrentUser ? 'https://nextbootstrap.netlify.app/assets/images/profiles/2.jpg' : 'https://nextbootstrap.netlify.app/assets/images/profiles/1.jpg';
        var messageHtml = `
        <div class="d-flex ${messageAlignment} mb-4">
            ${isCurrentUser ? '' : `
            <div class="position-relative avatar">
                <img src="../XM-Uploads/users/profile/default-user.png" class="img-fluid rounded-circle" alt="">
                <span class="position-absolute bottom-0 start-100 translate-middle p-1 border border-light rounded-pill">
                    <span class="visually-hidden">New alerts</span>
                </span>
            </div>
            `}
            <div class="pe-2">
                <div>
                    <div class="card card-text d-inline-block p-2 px-3 m-1">${obj.msg_txt}</div>
                </div>
                <div>
                    <div class="small" style="color: #AFB2B3;">${obj.msg_sender} - ${msgTime}</div>
                </div>
            </div>
            ${isCurrentUser ? `
            <div class="position-relative avatar">
                <img src="${avatarImage}" class="img-fluid rounded-circle" alt="">
                <span class="position-absolute bottom-0 start-100 translate-middle p-1 border border-light rounded-pill">
                    <span class="visually-hidden">New alerts</span>
                </span>
            </div>
            ` : ''}
        </div>
    `;

        var newMessage = document.createElement('div');
        newMessage.innerHTML = messageHtml;
        chatter.appendChild(newMessage);
    }


})(window, document, JSON);
