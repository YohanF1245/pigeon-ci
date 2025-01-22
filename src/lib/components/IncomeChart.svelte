<script lang="ts">
  import { onMount, onDestroy } from 'svelte';
  import { Chart, registerables } from 'chart.js';
  import { subMonths, format } from 'date-fns';
  import { fr } from 'date-fns/locale';

  Chart.register(...registerables);

  export let months = 6;

  let chartCanvas: HTMLCanvasElement;
  let chartInstance: Chart | null = null;

  function generateData(numMonths: number) {
    const labels = Array.from({ length: numMonths }, (_, i) => {
      const date = subMonths(new Date(), numMonths - 1 - i);
      return format(date, 'MMM yyyy', { locale: fr });
    });

    const generateRandomData = () => 
      Array.from({ length: numMonths }, () => Math.floor(Math.random() * 15000) + 5000);

    return {
      labels,
      datasets: [
        {
          label: 'Devis émis',
          data: generateRandomData(),
          backgroundColor: 'rgba(99, 102, 241, 0.5)',
          borderColor: 'rgb(99, 102, 241)',
          borderWidth: 1,
          stack: 'income'
        },
        {
          label: 'Factures en attente',
          data: generateRandomData(),
          backgroundColor: 'rgba(59, 130, 246, 0.5)',
          borderColor: 'rgb(59, 130, 246)',
          borderWidth: 1,
          stack: 'income'
        },
        {
          label: 'Paiements validés',
          data: generateRandomData(),
          backgroundColor: 'rgba(34, 197, 94, 0.5)',
          borderColor: 'rgb(34, 197, 94)',
          borderWidth: 1,
          stack: 'income'
        },
        {
          label: 'Dépenses',
          data: generateRandomData(),
          backgroundColor: 'rgba(239, 68, 68, 0.5)',
          borderColor: 'rgb(239, 68, 68)',
          borderWidth: 1,
          stack: 'expenses'
        }
      ]
    };
  }

  function createChart() {
    if (!chartCanvas) return;

    chartInstance = new Chart(chartCanvas, {
      type: 'bar',
      data: generateData(months),
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'top' as const,
            align: 'start' as const,
          },
          tooltip: {
            mode: 'index',
            intersect: false,
            callbacks: {
              label: function(context) {
                let label = context.dataset.label || '';
                if (label) {
                  label += ': ';
                }
                if (context.parsed.y !== null) {
                  label += new Intl.NumberFormat('fr-FR', {
                    style: 'currency',
                    currency: 'EUR'
                  }).format(context.parsed.y);
                }
                return label;
              }
            }
          }
        },
        scales: {
          x: {
            stacked: true,
            grid: {
              display: false
            }
          },
          y: {
            stacked: true,
            ticks: {
              callback: function(value) {
                return new Intl.NumberFormat('fr-FR', {
                  style: 'currency',
                  currency: 'EUR',
                  maximumSignificantDigits: 3
                }).format(value as number);
              }
            }
          }
        }
      }
    });
  }

  $: if (months && chartInstance) {
    chartInstance.data = generateData(months);
    chartInstance.update();
  }

  onMount(() => {
    createChart();
  });

  onDestroy(() => {
    if (chartInstance) {
      chartInstance.destroy();
    }
  });
</script>

<div class="bg-white p-6 rounded-xl shadow-sm border border-gray-100">
  <canvas 
    bind:this={chartCanvas}
    class="w-full"
    style="height: 400px;"
  ></canvas>
</div> 