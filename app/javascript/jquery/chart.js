import Chart from 'chart.js/auto';
require('chartjs-adapter-moment')

var ctx = document.getElementById('myChart');
var set_chart_params = {
  type: 'line',
  data: {
    labels: gon.date,

    datasets: [{
      label: 'vdot',
      data: gon.vdot,
      borderColor: 'rgba(255, 99, 132, 1)',
      backgroundColor: 'rgba(255, 99, 132, 0.1)'
    }]
  },
  options: {
    scales: {
      x: {
        scaleLabel: {
          display: true,
          labelString: "時間"
        },
        type: 'time',
        time: {
          parser: 'YYYY-MM-DD',
          unit: 'day',
          displayFormats: {
            'day': 'MM/DD'
          }
        }
      },
      y: {
        scaleLabel: {
          display: true,
          labelString: 'vdot'
        },
        type: 'linear',
      }
    }
  }
}
var myChart = new Chart(ctx, set_chart_params);
