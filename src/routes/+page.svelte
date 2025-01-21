<script lang="ts">
  import { fade } from "svelte/transition";
  import Logo from "../lib/components/Logo.svelte";
  import FlyingPigeons from "../lib/components/FlyingPigeons.svelte";

  let email = '';
  let password = '';

  function handleSubmit() {
    console.log('Login:', { email, password });
  }
</script>

<div class="grid grid-cols-2 min-h-screen">
  <!-- Left side -->
  <div class="bg-gradient-to-br from-blue-800 via-blue-900 to-blue-950 flex items-center justify-center relative">
    <!-- Cercles décoratifs -->
    <div class="absolute top-0 right-0 w-96 h-96 bg-blue-600/10 rounded-full blur-3xl transform translate-x-1/2 -translate-y-1/2"></div>
    <div class="absolute bottom-0 left-0 w-96 h-96 bg-blue-400/10 rounded-full blur-3xl transform -translate-x-1/2 translate-y-1/2"></div>

    <FlyingPigeons />

    <div class="relative max-w-md px-8 z-20" in:fade={{ duration: 700 }}>
      <div class="animate__animated animate__bounceIn">
        <Logo size={100} color="rgba(255,255,255,0.8)" textColor="white" />
      </div>
      <h2 class="mt-12 text-3xl font-medium text-white leading-snug animate__animated animate__fadeInUp animate__delay-1s">
        La solution moderne<br/> pour vos devis et factures
      </h2>
      <ul class="mt-8 space-y-4 text-blue-100">
        <li class="flex items-center gap-3 animate__animated animate__fadeInLeft animate__delay-2s">
          <svg class="w-5 h-5 text-blue-300" fill="currentColor" viewBox="0 0 20 20">
            <path d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"/>
          </svg>
          <span>Création de devis en moins de 2 minutes</span>
        </li>
        <li class="flex items-center gap-3 animate__animated animate__fadeInLeft animate__delay-3s">
          <svg class="w-5 h-5 text-blue-300" fill="currentColor" viewBox="0 0 20 20">
            <path d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"/>
          </svg>
          <span>Suivi des paiements en temps réel</span>
        </li>
        <li class="flex items-center gap-3 animate__animated animate__fadeInLeft animate__delay-4s">
          <svg class="w-5 h-5 text-blue-300" fill="currentColor" viewBox="0 0 20 20">
            <path d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"/>
          </svg>
          <span>Tableaux de bord et statistiques détaillés</span>
        </li>
      </ul>
    </div>
  </div>

  <!-- Right side -->
  <div class="bg-[#f8f9fa] flex items-center justify-center relative overflow-hidden">
    <div class="absolute inset-0 bg-[radial-gradient(circle_at_1px_1px,#e9ecef_1px,transparent_0)] bg-[length:24px_24px]"></div>

    <div class="w-[400px] relative animate__animated animate__fadeIn animate__delay-1s">
      <div class="mb-12">
        <h2 class="text-3xl font-medium text-gray-900">Connexion</h2>
        <p class="mt-3 text-gray-600">Accédez à votre espace personnel</p>
      </div>
      
      <form on:submit|preventDefault={handleSubmit} class="space-y-6">
        <div class="animate__animated animate__fadeInUp animate__delay-2s">
          <label for="email" class="block text-sm font-medium text-gray-700 mb-2">
            Adresse email
          </label>
          <input
            type="email"
            id="email"
            bind:value={email}
            class="w-full h-12 px-4 bg-white border border-gray-200 rounded-lg text-gray-900
                   focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500/30
                   transition-all duration-200"
            placeholder="vous@exemple.com"
            required
          />
        </div>

        <div class="animate__animated animate__fadeInUp animate__delay-3s">
          <label for="password" class="block text-sm font-medium text-gray-700 mb-2">
            Mot de passe
          </label>
          <input
            type="password"
            id="password"
            bind:value={password}
            class="w-full h-12 px-4 bg-white border border-gray-200 rounded-lg text-gray-900
                   focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500/30
                   transition-all duration-200"
            required
          />
        </div>

        <div class="flex items-center justify-between animate__animated animate__fadeIn animate__delay-4s">
          <label class="flex items-center select-none group">
            <div class="relative">
              <input type="checkbox" class="sr-only peer">
              <div class="w-10 h-5 bg-gray-200 rounded-full peer 
                          peer-checked:bg-blue-500 peer-focus:ring-2 peer-focus:ring-blue-500/30
                          after:content-[''] after:absolute after:top-0.5 after:left-[2px] 
                          after:bg-white after:rounded-full after:h-4 after:w-4 after:transition-all
                          peer-checked:after:translate-x-5"></div>
            </div>
            <span class="ml-3 text-sm text-gray-600 group-hover:text-gray-900 transition-colors">
              Se souvenir de moi
            </span>
          </label>
          <a href="/reset-password" 
             class="text-sm text-blue-600 hover:text-blue-700 transition-colors">
            Mot de passe oublié ?
          </a>
        </div>

        <button
          type="submit"
          class="mt-8 w-full bg-gradient-to-r from-blue-600 to-blue-700 text-white h-12 rounded-lg font-medium 
                 hover:from-blue-700 hover:to-blue-800 active:from-blue-800 active:to-blue-900
                 focus:ring-2 focus:ring-blue-500/30 focus:outline-none
                 transition-all duration-200 shadow-lg shadow-blue-500/25
                 animate__animated animate__fadeInUp animate__delay-4s"
        >
          Se connecter
        </button>

        <div class="mt-8 text-center animate__animated animate__fadeIn animate__delay-5s">
          <p class="text-gray-600">
            Pas encore de compte ?
            <a href="/register" class="text-blue-600 hover:text-blue-700 font-medium ml-1">
              Créer un compte gratuitement
            </a>
          </p>
        </div>
      </form>
    </div>
  </div>
</div>

<style>
  /* Style personnalisé pour le switch */
  input[type="checkbox"]:checked + div {
    @apply bg-blue-500;
  }

  input[type="checkbox"]:checked + div:after {
    @apply translate-x-full;
  }

  :global(.animate__animated) {
    --animate-duration: 1s;
  }
</style>
