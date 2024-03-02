const hiddenButton = document.getElementById('hiddenButton');
let lastScrollTop = 0;

window.addEventListener('scroll', () => {
    let scrollTop = window.scrollY;
    if (scrollTop > lastScrollTop) {
        // Scrolling hacia abajo
        hiddenButton.style.opacity = "0"; // Hacerlo gradualmente invisible
        setTimeout(() => { // Añadir un pequeño retraso antes de ocultarlo completamente
            hiddenButton.classList.remove('shown');
            hiddenButton.classList.add('hidden');
        }, 300); // 200ms de retraso
    } else {
        // Scrolling hacia arriba
        hiddenButton.classList.remove('hidden');
        hiddenButton.classList.add('shown');
        hiddenButton.style.opacity = "1"; // Hacerlo gradualmente visible
    }
    lastScrollTop = scrollTop;
});