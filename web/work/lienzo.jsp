<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../XM-Resources/pages/imports.jspf"/>
    <link rel="stylesheet" href="../XM-Resources/styles/bootstrap.css">
    <link rel="stylesheet" href="../XM-Resources/styles/styless.css">
    <link rel="shortcut icon" href="../XM-Resources/vector/memorand-bee.svg">
    <title>Memorand</title>
</head>
<body>
    <jsp:include page="../XM-Resources/pages/elements/navbar_work.jspf"/>
    <div class="controls">
        <button id="select" type="button" onclick="changeAction(this)">select</button>
        <button id="erase" type="button" onclick="changeAction(this)">erase</button>
        <button id="undo" type="button" onclick="changeAction(this)">undo erasing</button>
        <button id="draw" type="button" onclick="changeAction(this)">draw</button>
        <button id="spray" type="button" onclick="changeAction(this)">spray</button>
    </div>
    <div>
        <div>
            <label for="a">
                Background Image <code>erasable</code>
            </label>
            <input id="a" type="checkbox" onchange="setBgImageErasableProp(this)">
        </div>
        <div>
            <label for="b">
                Remove Erased Objects on <code>erasing:end</code>
            </label>
            <input id="b" type="checkbox" onchange="setErasingRemovesErasedObjects(this)">
        </div>
    </div>
    <div>
        <button type="button" onclick="toJSON()">to JSON</button>
        <button type="button" onclick="downloadImage()">to Image</button>
        <button type="button" onclick="downloadSVG()">to SVG</button>
    </div>
    <div style="display:flex;flex-direction:row;">
        <div>
            <canvas id="c" width="500" height="620"></canvas>
        </div>
        <div style="margin:0 1rem;">
            <code>erasing:end</code><br>
            <code id="output">N/A</code>
        </div>
    </div>
</body>
<style>
    button.active {
        background: limegreen;
        font-weight: bold;
    }
</style>
<script>
    let erasingRemovesErasedObjects = false;

    function changeAction(target) {
        ['select','erase','undo','draw','spray'].forEach(action => {
            const t = document.getElementById(action);
            t.classList.remove('active');
        });
        if(typeof target==='string') target = document.getElementById(target);
        target.classList.add('active');
        const canvas = document.getElementById('c');
        const ctx = canvas.getContext('2d');
        switch (target.id) {
            case "select":
                canvas.isDrawingMode = false;
                break;
            case "erase":
                canvas.freeDrawingBrush = new fabric.EraserBrush(canvas);
                canvas.freeDrawingBrush.width = 10;
                canvas.isDrawingMode = true;
                break;
            case "undo":
                canvas.freeDrawingBrush = new fabric.EraserBrush(canvas);
                canvas.freeDrawingBrush.width = 10;
                canvas.freeDrawingBrush.inverted = true;
                canvas.isDrawingMode = true;
                break;
            case "draw":
                canvas.freeDrawingBrush = new fabric.PencilBrush(canvas);
                canvas.freeDrawingBrush.width = 35;
                canvas.isDrawingMode = true;
                break;
            case "spray":
                canvas.freeDrawingBrush = new fabric.SprayBrush(canvas);
                canvas.freeDrawingBrush.width = 35;
                canvas.isDrawingMode = true;
                break;
            default:
                break;
        }
    }

    function init() {
        const canvas = document.getElementById('c');
        const ctx = canvas.getContext('2d');
        // Aquí deberías inicializar tu lienzo y agregar elementos, pero como es un código fragmentado, no tengo acceso al contexto completo.
    }

    const setDrawableErasableProp = (drawable, value) => {
        const canvas = document.getElementById('c');
        canvas.get(drawable)?.set({ erasable: value });
        changeAction('erase');
    };

    const setBgImageErasableProp = (input) =>
        setDrawableErasableProp("backgroundImage", input.checked);

    const setErasingRemovesErasedObjects = (input) =>
        (erasingRemovesErasedObjects = input.checked);

    const downloadImage = () => {
        const canvas = document.getElementById('c');
        const ext = "png";
        const base64 = canvas.toDataURL({
            format: ext,
            enableRetinaScaling: true
        });
        const link = document.createElement("a");
        link.href = base64;
        link.download = `eraser_example.${ext}`;
        link.click();
    };

    const downloadSVG = () => {
        const canvas = document.getElementById('c');
        const svg = canvas.toSVG();
        const a = document.createElement("a");
        const blob = new Blob([svg], { type: "image/svg+xml" });
        const blobURL = URL.createObjectURL(blob);
        a.href = blobURL;
        a.download = "eraser_example.svg";
        a.click();
        URL.revokeObjectURL(blobURL);
    };

    const toJSON = async () => {
        const canvas = document.getElementById('c');
        const json = canvas.toDatalessJSON(["clipPath", "eraser"]);
        const out = JSON.stringify(json, null, "\t");
        const blob = new Blob([out], { type: "text/plain" });
        const clipboardItemData = { [blob.type]: blob };
        try {
            navigator.clipboard &&
            (await navigator.clipboard.write([
                new ClipboardItem(clipboardItemData)
            ]));
        } catch (error) {
            console.log(error);
        }
        const blobURL = URL.createObjectURL(blob);
        const a = document.createElement("a");
        a.href = blobURL;
        a.download = "eraser_example.json";
        a.click();
        URL.revokeObjectURL(blobURL);
    };

    document.addEventListener("DOMContentLoaded", function() {
        init();
        changeAction('erase');
    });
</script>
</html>
