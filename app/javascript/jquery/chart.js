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
    }
  }
}
var myChart = new Chart(ctx, set_chart_params);


var one_month = document.getElementById('one_month');
one_month.addEventListener('click', function() {
  var dt = new Date();
  myChart.options.scales.x.time.unit = 'day';
  myChart.options.scales.x.min = dt.setMonth(dt.getMonth()-1);
  myChart.update();
});

var three_months = document.getElementById('three_months');
three_months.addEventListener('click', function() {
  var dt = new Date();
  myChart.options.scales.x.time.unit = 'week';
  myChart.options.scales.x.min = dt.setMonth(dt.getMonth()-3);
  myChart.update();
});

var six_months = document.getElementById('six_months');
six_months.addEventListener('click', function() {
  var dt = new Date();
  myChart.options.scales.x.time.unit = 'week';
  myChart.options.scales.x.min = dt.setMonth(dt.getMonth()-6);
  myChart.update();
});

var one_year = document.getElementById('one_year');
one_year.addEventListener('click', function() {
  var dt = new Date();
  myChart.options.scales.x.time.unit = 'month';
  myChart.options.scales.x.min = dt.setFullYear(dt.getFullYear()-1);
  myChart.update();
});