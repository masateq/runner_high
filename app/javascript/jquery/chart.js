import Chart from 'chart.js/auto';
require('chartjs-adapter-moment')

var ctx = document.getElementById('myChart');
var set_chart_params = {
  type: 'line',
  data: {
    labels: ['2021-08-02',
      '2021-08-04',
      '2021-08-10',
      '2021-08-11',
      '2021-08-20',
      '2021-08-21'],

    datasets: [{
      label: '気温',
      data: [24.6, 26.8, 22.1, 28.5, 32.8, 29.0],
      borderColor: 'rgba(255, 99, 132, 1)',
      backgroundColor: 'rgba(255, 99, 132, 0.1)'
    }]
  },
  options: {
    legend: {
      display: false
    },
    scales: {
      x: {
        scaleLabel: {
          display: true,
          labelString: '時間'
        },
        type: 'time',
        time: {
          parser: 'YYYY-MM-DD',
          unit: 'day',
          stepSize: 1,
          displayFormats: {
            'day': 'MM月DD日'
          }
        }
      }
    }
  }
}
var myChart = new Chart(ctx, set_chart_params);
