// 1ヶ月ボタン
var one_month = document.getElementById('one_month');
one_month.addEventListener('click', function() {
  var dt = new Date();
  window.globalFunction.myChart.options.scales.x.time.unit = 'day';
  window.globalFunction.myChart.options.scales.x.min = dt.setMonth(dt.getMonth()-1);
  window.globalFunction.myChart.update();
});

// 3ヶ月ボタン
var three_months = document.getElementById('three_months');
three_months.addEventListener('click', function() {
  var dt = new Date();
  window.globalFunction.myChart.options.scales.x.time.unit = 'week';
  window.globalFunction.myChart.options.scales.x.min = dt.setMonth(dt.getMonth()-3);
  window.globalFunction.myChart.update();
});

// 6ヶ月ボタン
var six_months = document.getElementById('six_months');
six_months.addEventListener('click', function() {
  var dt = new Date();
  window.globalFunction.myChart.options.scales.x.time.unit = 'week';
  window.globalFunction.myChart.options.scales.x.min = dt.setMonth(dt.getMonth()-6);
  window.globalFunction.myChart.update();
});

// 1年ボタン
var one_year = document.getElementById('one_year');
one_year.addEventListener('click', function() {
  var dt = new Date();
  window.globalFunction.myChart.options.scales.x.time.unit = 'month';
  window.globalFunction.myChart.options.scales.x.min = dt.setFullYear(dt.getFullYear()-1);
  window.globalFunction.myChart.update();
});