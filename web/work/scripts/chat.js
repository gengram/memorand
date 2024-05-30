(function(window, document, JSON) {
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
        }
        catch (error)
        {
            console.error("Error enviando mensaje:", error);
        }

        msg_txt.value = '';
    }

    function onMessage(evt)
    {
        var obj = JSON.parse(evt.data);
        var msg = obj.msg_sender + ' (' + new Date(obj.msg_time).toLocaleString() + '): ' + obj.msg_txt;
        
        var newMessage = document.createElement('div');
        newMessage.textContent = msg;
        chatter.appendChild(newMessage);
    }
    
})(window, document, JSON);
