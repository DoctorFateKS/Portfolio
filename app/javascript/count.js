document.addEventListener("DOMContentLoaded", () => {
  function animateCount(el) {
    const target = +el.getAttribute('data-target');
    let count = 0;
    const increment = target / 500; // 100 étapes d'animation

    const updateCount = () => {
      count += increment;
      if (count < target) {
        el.textContent = Math.ceil(count);
        requestAnimationFrame(updateCount);
      } else {
        el.textContent = target; // s’assurer d’atteindre la cible exacte
      }
    };

    updateCount();
  }

  const prCountEl = document.getElementById('pr-count');
  const totalContribEl = document.getElementById('total-contributions');
  const projectCountEl = document.getElementById('project_count');

  if (prCountEl) animateCount(prCountEl);
  if (totalContribEl) animateCount(totalContribEl);
  if (projectCountEl) animateCount(projectCountEl);
});
