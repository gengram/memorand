(function(window, document, JSON) {
    'use strict';

    var host = window.location.host;
    
    if (host === 'gengram.gerdoc.com')
    {
        host = 'gengram.gerdoc.com:8080';
    }
    
    var URL = 'ws://' + host + '/memorand/updater';
    
    var ws = new WebSocket(URL);

    var content = document.getElementById('contE');

    var upd_type = document.getElementById('type').textContent;
    var urlParams = new URLSearchParams(window.location.search);
    var upd_id = urlParams.get('id');
    
    var inputTimeout;
    
    ws.onopen = onOpen;
    ws.onclose = onClose;
    ws.onmessage = onMessage;
    ws.onerror = onError;

    content.addEventListener('input', onSend);

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
        if (ws.readyState !== WebSocket.OPEN) {
            console.error('WebSocket no está abierto. Estado actual:', ws.readyState);
            return;
        }

        clearTimeout(inputTimeout);

        inputTimeout = setTimeout(function () {
            var upd_msg = 'update';

            var msg = {
                upd_type: upd_type,
                upd_id: upd_id,
                upd_msg: upd_msg
            };

            console.log(msg);

            try {
                ws.send(JSON.stringify(msg));
            } catch (error) {
                console.error("Error enviando mensaje:", error);
            }
        }, 5000);
    }

    function onMessage(evt)
    {
        const xhr = new XMLHttpRequest();
        let getURL = `/memorand/noteget?id=${upd_id}`;

        xhr.open("GET", getURL, true);

        xhr.onreadystatechange = function ()
        {
            if (xhr.readyState === XMLHttpRequest.DONE)
            {
                if (xhr.status === 200)
                {
                    let selection = window.getSelection();
                    let range = selection.getRangeAt(0);
                    let position = range.startOffset;

                    document.getElementById('contE').innerHTML = xhr.responseText;

                    let newNode = document.getElementById('contE').childNodes[0];
                    range = document.createRange();
                    range.setStart(newNode, position);
                    range.collapse(true);
                    selection.removeAllRanges();
                    selection.addRange(range);
                }
                else
                {
                    console.error("Error al cargar el contenido: ", xhr.status);
                }
            }
        };

        xhr.send();
    }
    
})(window, document, JSON);
