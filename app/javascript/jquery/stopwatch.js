var timer = document.getElementById('timer');
var start = document.getElementById('start');
var stop = document.getElementById('stop');
var reset = document.getElementById('reset');

var startTime;
var elapsedTime = 0;
var timerId;
var timeToadd = 0;


function timerText(){
  var hour = Math.floor(elapsedTime / 3600000);
  var min = Math.floor(elapsedTime / 60000);
  var sec = Math.floor(elapsedTime % 60000 / 1000);
  var ms = elapsedTime % 1000;

  hour = ('0' + hour).slice(-1); 
  min = ('0' + min).slice(-2); 
  sec = ('0' + sec).slice(-2);
  ms = ('0' + ms).slice(-2);

  timer.textContent = hour + ':' + min + ':' + sec + ':' + ms;
}


function countUp(){
  timerId = setTimeout(function(){
    elapsedTime = Date.now() - startTime + timeToadd;
    timerText()
    //繰り返し呼び出し
    countUp();
  },10);
}

start.addEventListener('click',function(){
  startTime = Date.now();
  countUp();
  start.disabled = true;
  stop.disabled = false;
  reset.disabled = true;
});

stop.addEventListener('click',function(){
  clearTimeout(timerId);
  timeToadd += Date.now() - startTime;
  start.disabled = false;
  stop.disabled = true;
  reset.disabled = false;
});

reset.addEventListener('click',function(){
  elapsedTime = 0;
  timeToadd = 0;
  timerText();
  start.disabled = false;
  stop.disabled = true;
  reset.disabled = true;
});
