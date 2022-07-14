var map;
var currentMarker = [];
var currentWindow;
var poly_storage = [];
var position_options = { //位置情報取得時のオプション
  "enableHighAccuracy": false, //より精度の高い位置情報を取得するか
  "timeout": 60000, //タイムアウト
  "maximumAge": 10000, //取得の間隔(ミリ秒)
};


function initMap() {
  // マップのセットアップ
  var mapOptions = {
    zoom: 13,
    center: {lat: 35.232355, lng: 139.106937}
  };
  map = new google.maps.Map(document.getElementById('map'), mapOptions);
  
    // 位置情報を監視する
  function watchPosition() {
    if (navigator.geolocation) {
      watchId = navigator.geolocation.watchPosition(function (position) {
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;
        //ポリライン(経路)の描写
        addPolyLine(lat, lng)
      }, errorGetPosition, position_options)
    }
  }

  // 位置情報取得のエラー
  function errorGetPosition(error) {
    alert(error.code + ": " + error.message);
  }

  //位置情報の取得を止める
  function clearWatch(watchId) {
    navigator.geolocation.clearWatch(watchId);
  }

  //ポリライン(経路)の描写
  function addPolyLine(lat, lng) {
    var polyLatLng = [lat + ',' + lng];
    poly_storage.push(polyLatLng);
    snapPolyLine(poly_storage);
  }

  function snapPolyLine(poly_storage) {
    $.get('https://roads.googleapis.com/v1/snapToRoads', { //HTTP(get通信)を用いたAjax処理
      interpolate: true,
      key: process.env.GOOGLE_MAP_API,
      path: poly_storage.join('|')
    }, function (data) {
      processResponse(data)
    });
  }

  function processResponse(data) {
    var snappedCoordinates = [];
    for (var i = 0; i < data.snappedPoints.length; i++) {
      // スナップされた地点の取得
      var position = new google.maps.LatLng(
        data.snappedPoints[i].location.latitude,
        data.snappedPoints[i].location.longitude);
      snappedCoordinates.push(position);

      // スナップされた地点へのマーカー表示
      viewNewGooglemap(position);
    }

    // スナップされた地点をもとにPolylineを作成
    var polyline = new google.maps.Polyline({
      path: snappedCoordinates,
      strokeColor: "red",
      strokeWeight: 3
    });

    //Polylineをマップに表示
    polyline.setMap(map);
  }

  function getCurrentDateTime() {
    var current_date = new Date();
    var Y = current_date.getFullYear();
    var M = current_date.getMonth() + 1;
    var D = current_date.getDate();
    var h = current_date.getHours();
    var m = current_date.getMinutes();
    var s = current_date.getSeconds();
    var current_date = Y + "/" + M + "/" + D + "/" + h + ":" + m + ":" + s;

    return current_date;
  }

  //スナップされた地点へのマーカー表示
  function viewNewGooglemap(current_position) {
    //スナップされた地点に地図の中心と縮尺をセット
    map.setCenter(current_position);
    map.setZoom(20);

    //マーカーの設定
    var marker = new google.maps.Marker({
      position: current_position,
      map: map,
      animation: google.maps.Animation.BOUNCE
    });

    //新しいマーカーが立ったらマーカーのアニメーションを止める
    if (currentMarker.length > 0) {
      marker.setAnimation('null');
    }
    //マーカーの情報を保存しておく
    currentMarker.push(marker);

    //InfoWindowの設定
    var infoWindow = new google.maps.InfoWindow({
      content: '更新時間:' + getCurrentDateTime()
    });

    //マーカーをクリックしたらInfoWindowを開く
    marker.addListener('click', function () {
      //他のマーカーのInfoWindowが表示されていたら閉じる
      if (currentWindow) {
        currentWindow.close();
      }
      infoWindow.open(map, marker);
      //現在開いているInfoWindowとして保存しておく
      currentWindow = infoWindow;
      //クリックしたマーカーの位置に地図の中心をあわせる
      map.setCenter(current_position);
    });
  }

  $('#start').click(function () {
    watchPosition();
  });

  $('#stop').click(function () {
    clearWatch(watchId);
  });
}

window.onload = function() {
  initMap();
}