<script lang="ts">
  import { page } from '$app/stores';
  import { 
    LayoutDashboard, 
    FileText, 
    Receipt, 
    Users, 
    Settings,
    LogOut
  } from 'lucide-svelte';

  const menuItems = [
    { label: 'Dashboard', icon: LayoutDashboard, href: '/dashboard' },
    { label: 'Devis', icon: FileText, href: '/devis' },
    { label: 'Factures', icon: Receipt, href: '/factures' },
    { label: 'Clients', icon: Users, href: '/clients' },
    { label: 'Paramètres', icon: Settings, href: '/parametres' }
  ];
</script>

<aside class="fixed left-0 top-0 h-screen w-64 bg-white border-r border-gray-200 flex flex-col">
  <!-- Logo -->
  <div class="h-16 flex items-center px-6 border-b border-gray-200">
    <span class="text-xl font-bold text-gray-900">Pigeon Devis</span>
  </div>

  <!-- Navigation -->
  <nav class="flex-1 px-4 py-6 space-y-1">
    {#each menuItems as item}
      <a
        href={item.href}
        class={`flex items-center px-4 py-2.5 text-sm font-medium rounded-lg ${
          $page.url.pathname === item.href
            ? 'text-indigo-600 bg-indigo-50'
            : 'text-gray-700 hover:text-indigo-600 hover:bg-gray-50'
        }`}
      >
        <svelte:component
          this={item.icon}
          class={`w-5 h-5 mr-3 ${$page.url.pathname === item.href ? 'text-indigo-600' : 'text-gray-400'}`}
        />
        {item.label}
      </a>
    {/each}
  </nav>

  <!-- Déconnexion -->
  <div class="p-4 border-t border-gray-200">
    <button
      class="flex items-center w-full px-4 py-2.5 text-sm font-medium text-gray-700 rounded-lg hover:bg-gray-50 hover:text-red-600"
    >
      <LogOut class="w-5 h-5 mr-3 text-gray-400" />
      Déconnexion
    </button>
  </div>
</aside>

<style>
  .active {
    @apply bg-blue-50 text-blue-600;
  }
  
  .active :global(svg) {
    @apply text-blue-600;
  }
</style> 