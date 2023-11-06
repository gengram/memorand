<script>
    let meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    let diasSemana = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];
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
        document.getElementById("mesAño").innerText = meses[month] + " " + year;
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
                        dia.classList.add("text-white"); // Cambiar el color de los números de otros días
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

    function drawAñosSelector() {
        let añoSelectorBody = document.getElementById("años");
        añoSelectorBody.innerHTML = "";
        for (let i = year - 10; i <= year + 10; i++) {
            let año = document.createElement("tr");
            let añoNumber = document.createElement("td");
            añoNumber.innerText = i;
            año.appendChild(añoNumber);
            año.addEventListener("click", function () {
                year = i;
                drawCalendario();
                document.getElementById("añoSelector").style.display = "none";
            });
            añoSelectorBody.appendChild(año);
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
        document.getElementById("añoSelector").style.display = "none";
    });

    document.getElementById("btnElegirAño").addEventListener("click", function () {
        drawAñosSelector();
        document.getElementById("añoSelector").style.display = "block";
        document.getElementById("mesSelector").style.display = "none";
    });

    drawCalendario();
</script>
