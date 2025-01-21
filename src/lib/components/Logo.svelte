<script lang="ts">
  export let size = 48;
  export let color = "currentColor";
  export let textColor = color;
</script>

<div class="inline-flex items-center gap-4">
  <svg 
    width={size} 
    height={size} 
    viewBox="0 0 48 48" 
    fill="none" 
    xmlns="http://www.w3.org/2000/svg"
    class="transition-transform duration-700 hover:rotate-[360deg]"
  >
    <path 
      d="M24 4L30 10L24 16L18 10L24 4Z" 
      fill={color}
      class="opacity-80"
    />
    <path 
      d="M36 16L42 22L36 28L30 22L36 16Z" 
      fill={color}
      class="opacity-60"
    />
    <path 
      d="M12 16L18 22L12 28L6 22L12 16Z" 
      fill={color}
      class="opacity-60"
    />
    <path 
      d="M24 28L30 34L24 40L18 34L24 28Z" 
      fill={color}
      class="opacity-40"
    />
    <path 
      d="M24 16L30 22L24 28L18 22L24 16Z" 
      fill={color}
    />
  </svg>
  <div class="font-bold leading-none">
    <div class="text-4xl tracking-tight" style="color: {textColor}">Pigeon</div>
    <div class="text-lg opacity-80 tracking-widest uppercase mt-2" style="color: {textColor}">Devis</div>
  </div>
</div> 