<script lang="ts">
  import { onMount } from 'svelte';

  let container: HTMLDivElement;
  const BIRD_COUNT = 8;
</script>

<div bind:this={container} class="fixed inset-0 overflow-hidden pointer-events-none">
  {#each Array(BIRD_COUNT) as _, i}
    <div class="bird-container" class:bird-container--one={i === 0} class:bird-container--two={i === 1} class:bird-container--three={i === 2} class:bird-container--four={i === 3} class:bird-container--five={i === 4} class:bird-container--six={i === 5} class:bird-container--seven={i === 6} class:bird-container--eight={i === 7}>
      <div class="bird" class:bird--one={i === 0} class:bird--two={i === 1} class:bird--three={i === 2} class:bird--four={i === 3} class:bird--five={i === 4} class:bird--six={i === 5} class:bird--seven={i === 6} class:bird--eight={i === 7}></div>
    </div>
  {/each}
</div>

<style>
  .bird {
    background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/174479/bird-cells-new.svg);
    background-size: auto 100%;
    width: 88px;
    height: 125px;
    will-change: background-position;
    animation-name: fly-cycle;
    animation-timing-function: steps(10);
    animation-iteration-count: infinite;
  }

  .bird--one {
    animation-duration: 1s;
    animation-delay: -0.5s;		
  }
  
  .bird--two {
    animation-duration: 0.9s;
    animation-delay: -0.75s;
  }
  
  .bird--three {
    animation-duration: 1.25s;
    animation-delay: -0.25s;
  }
  
  .bird--four {
    animation-duration: 1.1s;
    animation-delay: -0.5s;
  }

  .bird--five {
    animation-duration: 1.15s;
    animation-delay: -0.35s;
  }

  .bird--six {
    animation-duration: 1.05s;
    animation-delay: -0.6s;
  }

  .bird--seven {
    animation-duration: 1.2s;
    animation-delay: -0.45s;
  }

  .bird--eight {
    animation-duration: 0.95s;
    animation-delay: -0.7s;
  }

  .bird-container {
    position: absolute;
    top: 15%;
    left: -10%;
    transform: scale(0) translateX(-10vw);
    will-change: transform;
    animation-name: fly-right-one;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
  }

  .bird-container--one {
    animation-duration: 15s;
    animation-delay: 0s;
  }
  
  .bird-container--two {
    animation-duration: 16s;
    animation-delay: 1s;
  }
  
  .bird-container--three {
    animation-duration: 14.6s;
    animation-delay: 9.5s;
  }
  
  .bird-container--four {
    animation-duration: 16s;
    animation-delay: 10.25s;
  }

  .bird-container--five {
    animation-duration: 15.5s;
    animation-delay: 5s;
  }

  .bird-container--six {
    animation-duration: 14.8s;
    animation-delay: 6.5s;
  }

  .bird-container--seven {
    animation-duration: 15.2s;
    animation-delay: 3.5s;
  }

  .bird-container--eight {
    animation-duration: 15.8s;
    animation-delay: 8s;
  }

  @keyframes fly-cycle {
    100% {
      background-position: -900px 0;
    }
  }

  @keyframes fly-right-one {
    0% {
      transform: scale(0.3) translateX(-10vw);
    }
    
    10% {
      transform: translateY(2vh) translateX(10vw) scale(0.4);
    }
    
    20% {
      transform: translateY(0vh) translateX(30vw) scale(0.5);
    }
    
    30% {
      transform: translateY(4vh) translateX(50vw) scale(0.6);
    }
    
    40% {
      transform: translateY(2vh) translateX(70vw) scale(0.6);
    }
    
    50% {
      transform: translateY(0vh) translateX(90vw) scale(0.6);
    }
    
    60% {
      transform: translateY(0vh) translateX(110vw) scale(0.6);
    }
    
    100% {
      transform: translateY(0vh) translateX(110vw) scale(0.6);
    }
  }
</style> 