<script lang="ts">
  import Sidebar from '$lib/components/Sidebar.svelte';
  import IncomeChart from '$lib/components/IncomeChart.svelte';
  import { Calendar, TrendingUp, ArrowUpRight, ArrowDownRight } from 'lucide-svelte';

  let selectedPeriod = 6;
  const periods = [
    { value: 3, label: '3 mois' },
    { value: 6, label: '6 mois' },
    { value: 12, label: '1 an' }
  ];

  // Données simulées pour les KPIs
  const kpis = [
    {
      title: 'Chiffre d\'affaires',
      value: '38 450 €',
      change: '+12.5%',
      isPositive: true
    },
    {
      title: 'Devis en cours',
      value: '15 750 €',
      change: '+5.2%',
      isPositive: true
    },
    {
      title: 'Dépenses',
      value: '12 380 €',
      change: '-3.1%',
      isPositive: false
    }
  ];
</script>

<div class="flex h-screen bg-gray-50">
  <Sidebar />
  
  <main class="flex-1 ml-64 p-8">
    <!-- En-tête -->
    <div class="flex justify-between items-center mb-8">
      <h1 class="text-2xl font-bold text-gray-900">Dashboard</h1>
      
      <div class="flex items-center gap-2 bg-white rounded-lg shadow-sm border border-gray-200 p-1">
        <Calendar class="w-4 h-4 text-gray-500 ml-2" />
        <select
          bind:value={selectedPeriod}
          class="py-2 pr-8 pl-2 text-sm border-none focus:ring-0 rounded-lg"
        >
          {#each periods as period}
            <option value={period.value}>{period.label}</option>
          {/each}
        </select>
      </div>
    </div>

    <!-- KPIs -->
    <div class="grid grid-cols-3 gap-6 mb-8">
      {#each kpis as kpi}
        <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
          <h3 class="text-sm font-medium text-gray-500">{kpi.title}</h3>
          <div class="mt-2 flex items-baseline gap-4">
            <span class="text-3xl font-bold text-gray-900">{kpi.value}</span>
            <span class="flex items-center text-sm font-medium {kpi.isPositive ? 'text-green-600' : 'text-red-600'}">
              {#if kpi.isPositive}
                <ArrowUpRight class="w-4 h-4 mr-1" />
              {:else}
                <ArrowDownRight class="w-4 h-4 mr-1" />
              {/if}
              {kpi.change}
            </span>
          </div>
        </div>
      {/each}
    </div>

    <!-- Graphique principal -->
    <div class="mb-8">
      <IncomeChart months={selectedPeriod} />
    </div>

    <!-- Statistiques supplémentaires -->
    <div class="grid grid-cols-2 gap-6">
      <!-- Top clients -->
      <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
        <h3 class="text-lg font-semibold text-gray-900 mb-4">Top Clients</h3>
        <div class="space-y-4">
          {#each Array(5) as _, i}
            <div class="flex items-center justify-between">
              <div>
                <p class="font-medium text-gray-900">Client {i + 1}</p>
                <p class="text-sm text-gray-500">{Math.floor(Math.random() * 5 + 1)} devis en cours</p>
              </div>
              <span class="text-lg font-semibold text-gray-900">
                {new Intl.NumberFormat('fr-FR', { style: 'currency', currency: 'EUR' }).format(Math.random() * 10000 + 5000)}
              </span>
            </div>
          {/each}
        </div>
      </div>

      <!-- Taux de conversion -->
      <div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
        <h3 class="text-lg font-semibold text-gray-900 mb-4">Taux de Conversion</h3>
        <div class="space-y-4">
          <div class="flex items-center justify-between">
            <p class="text-gray-600">Devis émis</p>
            <p class="font-medium">45</p>
          </div>
          <div class="flex items-center justify-between">
            <p class="text-gray-600">Devis acceptés</p>
            <p class="font-medium">32</p>
          </div>
          <div class="flex items-center justify-between">
            <p class="text-gray-600">Taux de conversion</p>
            <p class="font-medium text-green-600">71%</p>
          </div>
          <div class="w-full bg-gray-200 rounded-full h-2.5 mt-2">
            <div class="bg-green-600 h-2.5 rounded-full" style="width: 71%"></div>
          </div>
        </div>
      </div>
    </div>
  </main>
</div> 