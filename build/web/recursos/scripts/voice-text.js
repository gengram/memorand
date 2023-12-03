document.addEventListener('DOMContentLoaded', function () {
    const btnStart = document.getElementById('btnStart');
    const btnStop = document.getElementById('btnStop');

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
        var editor = document.getElementById('editor');

        // Inserta el texto que desees
        var textoAInsertar = texto;
        editor.innerHTML += " "+ textoAInsertar;
    };
});