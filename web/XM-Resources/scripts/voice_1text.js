document.addEventListener('DOMContentLoaded', function () {
    const btnStart = document.getElementById('btnStartcon');
    const btnStop = document.getElementById('btnStopcont');
    const textarea = document.getElementById('contE');

    const recognition = new webkitSpeechRecognition();
    let recognitionActive = false;

    recognition.continuous = true;
    recognition.lang = 'es-Es';
    recognition.interimResult = false;

    btnStart.addEventListener('click', () => {
        recognition.start();
    });

    btnStop.addEventListener('click', () => {
        recognition.abort();
    });

    recognition.onresult = (event) => {
        const texto = event.results[event.results.length - 1][0].transcript;

        // Inserta el texto que desees
        var textoAInsertar = texto;
        textarea.innerHTML += " " + textoAInsertar;
    };
});