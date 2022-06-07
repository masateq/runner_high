import Chart from 'chart.js/auto';
require('chartjs-adapter-moment')
import annotationPlugin from 'chartjs-plugin-annotation';
Chart.register(annotationPlugin);

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
        max: new Date(),
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
    },
    plugins: {
      autocolors: false,
      annotation: {
        annotations: {
          line1: {
            type: 'line',
            yMin: gon.user_vdot, // ユーザーの目標タイムから導出される目標vdot
            yMax: gon.user_vdot,
            borderColor: 'rgb(0, 99, 255)',
            borderWidth: 2,
            borderDash: [5, 5]
          }
        }
      }
    }
  }
}
var myChart = new Chart(ctx, set_chart_params);

window.globalFunction = {};
window.globalFunction.myChart = myChart;