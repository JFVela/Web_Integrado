
	
		var navBar = document.querySelector('.js-nav-bar');
		if (typeof navBar === 'object')
			document.documentElement.style.setProperty('--nav-height',
					navBar.offsetHeight + 'px');

  const animateCounter = function () {
  const startAnimation = () => {
    function animateValue({ step, start, end, duration }) {
      const timeStep = 50,
        valueStep = ((end - start) / duration) * timeStep;

      const intervalId = setInterval(function () {
        start += valueStep;

        if (start > end) {
          start = end;
          clearInterval(intervalId);
        }

        step(start);
      }, timeStep);
    }

    document.querySelectorAll(".counter").forEach((n) => {
      const progressValue = n.getAttribute("data-progress-value");

      animateValue({
        start: 0,
        end: progressValue,
        duration: 8000,
        step: (val) => (n.textContent = `${val || 0}`)
      });
    });
  };
  setTimeout(startAnimation, 2000);
};

document.addEventListener("DOMContentLoaded", animateCounter);





// Importa ScrollTrigger
const { ScrollTrigger } = window;
const { CSSRulePlugin } = window;


// Crea una función para definir la animación
function animateOnScroll() {
  var rule = CSSRulePlugin.getRule("span:after");

  var tl = gsap.timeline({
    defaults: { duration: 1 },
    scrollTrigger: {
      trigger: ".anim1", // Elemento que activará la animación
      start: "top 80%", // Inicia la animación cuando el 80% del elemento es visible
    },
  });

  tl.from(".anim1", { y: -50, stagger: 0.6, opacity: 0 })
    .to(rule, { duration: 1.8, cssRule: { scaleY: 0 } }, "-=2.2")
    .from("aside", { backgroundPosition: "200px 0px", opacity: 0 }, "-=1.5")
    .from("#img1", { y: 100, opacity: 0 }, "-=0.5");
    
    var tl = gsap.timeline({
    defaults: { duration: 3 },
    scrollTrigger: {
      trigger: "body", // Elemento que activará la animación
      start: "top 80%", // Inicia la animación cuando el 80% del elemento es visible
    },
  });

  tl.from("#logoimg", { y: 30, opacity: 0 }, "-=.5");


}

// Crea una función para iniciar el contador cuando se haga scroll
function initCounter() {
  // Obtenemos el elemento del contador
  const contadorSection = document.getElementById('contador-section');

  // Creamos una función para iniciar el contador
  function startCounter() {
    const counters = document.querySelectorAll('.counter');
    counters.forEach(counter => {
      const targetValue = parseInt(counter.getAttribute('data-progress-value'));
      let currentValue = 0;
      const increment = targetValue / 900; // Velocidad de incremento

      const updateCounter = () => {
        if (currentValue < targetValue) {
          currentValue += increment;
          counter.textContent = Math.ceil(currentValue); // Muestra un valor entero
          requestAnimationFrame(updateCounter);
        } else {
          counter.textContent = targetValue; // Asegura que el valor final sea exacto
        }
      };

      updateCounter();
    });
  }

  // Configuramos ScrollTrigger para iniciar el contador cuando se hace scroll hasta la sección
  ScrollTrigger.create({
    trigger: contadorSection,
    start: 'top 80%', // Inicia la animación cuando el 80% de la sección es visible
    onEnter: startCounter, // Llama a la función para iniciar el contador
    once: true, // Solo se ejecutará una vez
  });
}

// Llama a la función cuando se carga la página
window.addEventListener("load", () => {
  animateOnScroll();
  initCounter();

});

