window.onload = function () {
    var canvas = document.getElementById('canvas');
    var ctx = canvas.getContext('2d');
    var isDrawing = false;
    var color = '#25ce7b'; // Color por defecto

    canvas.addEventListener('mousedown', startDrawing);
    canvas.addEventListener('mousemove', draw);
    canvas.addEventListener('mouseup', stopDrawing);
    canvas.addEventListener('mouseout', stopDrawing);

    document.getElementById('colorPicker').addEventListener('input', function () {
        color = this.value;
    });

    document.getElementById('clearBtn').addEventListener('click', clearCanvas);

    document.getElementById('downloadPngBtn').addEventListener('click', function () {
        downloadCanvas('png');
    });

    document.getElementById('downloadSvgBtn').addEventListener('click', function () {
        downloadCanvas('svg');
    });

    function startDrawing(e) {
        isDrawing = true;
        draw(e);
    }

    function draw(e) {
        if (!isDrawing)
            return;

        ctx.strokeStyle = color;
        ctx.lineWidth = 2;
        ctx.lineCap = 'round';

        ctx.lineTo(e.offsetX, e.offsetY);
        ctx.stroke();
        ctx.beginPath();
        ctx.moveTo(e.offsetX, e.offsetY);
    }

    function stopDrawing() {
        isDrawing = false;
        ctx.beginPath();
    }

    function clearCanvas() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
    }

    function downloadCanvas(format) {
        var downloadLink = document.createElement('a');
        if (format === 'png') {
            downloadLink.href = canvas.toDataURL('image/png');
            downloadLink.download = 'pizarra.png';
        } else if (format === 'svg') {
            var svgData = canvas.toDataURL('image/svg+xml');
            var svgBlob = new Blob([svgData], {type: 'image/svg+xml'});
            var svgUrl = URL.createObjectURL(svgBlob);
            downloadLink.href = svgUrl;
            downloadLink.download = 'pizarra.svg';
        }
        downloadLink.click();
    }
};