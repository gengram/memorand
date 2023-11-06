<script>
    let meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    let diasSemana = ["Dom", "Lun", "Mar", "Mi�", "Jue", "Vie", "S�b"];
    let hoy = new Date();
    let year = hoy.getFullYear();
    let month = hoy.getMonth();
    let diaActual = hoy.getDate();

    function drawCalendario() {
        let calendarBody = document.getElementById("calendario");
        let firstDay = new Date(year, month, 1);
        let lastDay = new Date(year, month + 1, 0);
        let startingDay = firstDay.getDay();
        let totalDays = lastDay.getDate();
        let date = 1;
        document.getElementById("mesA�o").innerText = meses[month] + " " + year;
        calendarBody.innerHTML = "";
        for (let i = 0; date <= totalDays; i++) {
            let semana = document.createElement("tr");
            for (let j = 0; j < 7; j++) {
                if (date > totalDays) {
                    break; // Detener el bucle si date es mayor que totalDays
                }
                let dia = document.createElement("td");
                dia.classList.add("text-center");
                dia.classList.add("fw-bold");
                dia.classList.add("border-3");
                dia.classList.add("border-white");
                calendarBody.style.borderCollapse = "collapse";
                semana.style.borderBottom = "none";



                if ((j === 0 || j === 6) && i > 0) {
                    dia.classList.add("text-white");
                    dia.style.backgroundColor = "#7BC3BC";
                }

                if (i === 0 && j < startingDay) {
                    dia.innerText = "";
                } else if (date <= totalDays) {
                    dia.innerText = date;

                    if (year === hoy.getFullYear() && month === hoy.getMonth() && date === hoy.getDate()) {
                        dia.style.backgroundColor = "#7BC3BC";
                        dia.style.color = "#FAECB0";
                    } else {
                        dia.classList.add("text-white"); // Cambiar el color de los n�meros de otros d�as
                        dia.style.backgroundColor = "#7BC3BC";
                    }

                    date++;
                }
                

                semana.appendChild(dia);
            }
            calendarBody.appendChild(semana);
        }

    }

    function drawMesesSelector() {
        let mesSelectorBody = document.getElementById("meses");
        mesSelectorBody.innerHTML = "";
        for (let i = 0; i < meses.length; i++) {
            let mes = document.createElement("tr");
            let mesName = document.createElement("td");
            mesName.innerText = meses[i];
            mes.appendChild(mesName);
            mes.addEventListener("click", function () {
                month = i;
                drawCalendario();
                document.getElementById("mesSelector").style.display = "none";
            });
            mesSelectorBody.appendChild(mes);
        }
    }
    
    function drawMesesSelector() {
        let mesSelectorBody = document.getElementById("meses");
        mesSelectorBody.innerHTML = "";
        for (let i = 0; i < meses.length; i++) {
            let mes = document.createElement("tr");
            let mesName = document.createElement("td");
            mesName.innerText = meses[i];
            mes.appendChild(mesName);
            mes.addEventListener("click", function () {
                month = i;
                drawCalendario();
                document.getElementById("mesSelector").style.display = "none";
            });
            mesSelectorBody.appendChild(mes);
        }
    }

    function drawA�osSelector() {
        let a�oSelectorBody = document.getElementById("a�os");
        a�oSelectorBody.innerHTML = "";
        for (let i = year - 10; i <= year + 10; i++) {
            let a�o = document.createElement("tr");
            let a�oNumber = document.createElement("td");
            a�oNumber.innerText = i;
            a�o.appendChild(a�oNumber);
            a�o.addEventListener("click", function () {
                year = i;
                drawCalendario();
                document.getElementById("a�oSelector").style.display = "none";
            });
            a�oSelectorBody.appendChild(a�o);
        }
    }

    document.getElementById("btnAnterior").addEventListener("click", function () {
        month--;
        if (month < 0) {
            month = 11;
            year--;
        }
        drawCalendario();
    });

    document.getElementById("btnSiguiente").addEventListener("click", function () {
        month++;
        if (month > 11) {
            month = 0;
            year++;
        }
        drawCalendario();
    });

    document.getElementById("btnElegirMes").addEventListener("click", function () {
        drawMesesSelector();
        document.getElementById("mesSelector").style.display = "block";
        document.getElementById("a�oSelector").style.display = "none";
    });

    document.getElementById("btnElegirA�o").addEventListener("click", function () {
        drawA�osSelector();
        document.getElementById("a�oSelector").style.display = "block";
        document.getElementById("mesSelector").style.display = "none";
    });

    drawCalendario();
</script>
