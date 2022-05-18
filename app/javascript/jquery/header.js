function FixedAnime() {
	var headerH = $('#header').outerHeight(true);
	var scroll = $(window).scrollTop();
	if (scroll >= headerH){//headerの高さ以上になったら
			$('#header').addClass('fixed');//fixedというクラス名を付与
		}else{
			$('#header').removeClass('fixed');//fixedというクラス名を除去
		}
}

$('#g-navi a').click(function () {
	var elmHash = $(this).attr('href'); //hrefの内容を取得
	var pos = Math.round($(elmHash).offset().top-120);	//headerの高さを引く
	$('body,html').animate({scrollTop: pos}, 500);//取得した位置にスクロール※数値が大きいほどゆっくりスクロール
	return false;//リンクの無効化
});

$(window).scroll(function () {
	FixedAnime();
});

$(window).on('load', function () {
	FixedAnime();
});