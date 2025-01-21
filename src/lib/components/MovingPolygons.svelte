<script lang="ts">
  import { onMount } from 'svelte';

  let container: HTMLDivElement;
  let polygons: HTMLDivElement[] = [];
  const POLYGON_COUNT = 15;

  function generatePositions(count: number, minDistance: number) {
    const positions: Array<{x: number, y: number, scale: number}> = [];
    const attempts = 30;

    while (positions.length < count) {
      let bestPosition = null;
      let maxMinDistance = 0;

      for (let i = 0; i < attempts; i++) {
        const x = Math.random() * 100; // Utilise tout l'espace horizontal
        const y = Math.random() * 100; // Utilise tout l'espace vertical
        const scale = 0.5 + Math.random(); // Variation de taille entre 50% et 150%
        let currentMinDistance = Infinity;

        for (const pos of positions) {
          const dx = x - pos.x;
          const dy = y - pos.y;
          const distance = Math.sqrt(dx * dx + dy * dy);
          currentMinDistance = Math.min(currentMinDistance, distance);
        }

        if (currentMinDistance > maxMinDistance) {
          maxMinDistance = currentMinDistance;
          bestPosition = { x, y, scale };
        }
      }

      if (bestPosition && (maxMinDistance >= minDistance || positions.length === 0)) {
        positions.push(bestPosition);
      } else {
        minDistance *= 0.9;
      }
    }

    return positions;
  }

  const positions = generatePositions(POLYGON_COUNT, 20);

  function handleMouseMove(event: MouseEvent) {
    const rect = container.getBoundingClientRect();
    const mouseX = event.clientX - rect.left;
    const mouseY = event.clientY - rect.top;

    polygons.forEach((polygon, index) => {
      const polygonRect = polygon.getBoundingClientRect();
      const polygonX = polygonRect.left - rect.left + polygonRect.width / 2;
      const polygonY = polygonRect.top - rect.top + polygonRect.height / 2;

      const deltaX = mouseX - polygonX;
      const deltaY = mouseY - polygonY;
      const distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
      const maxDistance = 300;

      if (distance < maxDistance) {
        const force = (1 - distance / maxDistance) * 50;
        const angle = Math.atan2(deltaY, deltaX);
        const moveX = -Math.cos(angle) * force;
        const moveY = -Math.sin(angle) * force;
        const scale = positions[index].scale;

        polygon.style.transform = `translate(${moveX}px, ${moveY}px) rotate(${moveX}deg) scale(${scale})`;
      } else {
        polygon.style.transform = `scale(${positions[index].scale})`;
      }
    });
  }

  onMount(() => {
    polygons.forEach((polygon, index) => {
      const randomRotation = Math.random() * 360;
      polygon.style.transform = `rotate(${randomRotation}deg) scale(${positions[index].scale})`;
    });
  });
</script>

<div 
  bind:this={container}
  on:mousemove={handleMouseMove}
  class="absolute inset-0 overflow-hidden pointer-events-auto z-10 left-0 top-0 w-full h-full"
>
  {#each Array(POLYGON_COUNT) as _, i}
    <div
      bind:this={polygons[i]}
      class="absolute w-72 h-72"
      style="
        left: {positions[i].x}%;
        top: {positions[i].y}%;
        transform-origin: center;
        transition: transform 0.3s ease-out;
      "
    >
      <svg
        class="w-full h-full text-blue-400/30"
        viewBox="0 0 24 24"
        fill="currentColor"
      >
        {#if i % 3 === 0}
          <!-- Triangle -->
          <path d="M12 2L2 22h20L12 2z" />
        {:else if i % 3 === 1}
          <!-- Hexagone -->
          <path d="M12 2l8.66 5v10L12 22l-8.66-5V7L12 2z" />
        {:else}
          <!-- Carré -->
          <path d="M3 3h18v18H3V3z" />
        {/if}
      </svg>
    </div>
  {/each}
</div>

<style>
  div {
    will-change: transform;
  }
</style> 