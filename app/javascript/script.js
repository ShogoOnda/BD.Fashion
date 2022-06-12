// （API_KEY には、"取得したAPIキー" を記述）
const API_KEY = "489e9336b252f2465ca6828d733c93ac";

$(document).on('turbolinks:load', function() {
$(function(){
  $('#btn').on('click', function() {

  let idx = $("#idx").val()

    // 入力された都市名でWebAPIに天気情報をリクエスト
    $.ajax({
      url: "https://api.openweathermap.org/data/2.5/forecast?q=" + $('#cityname').val() + "&units=metric&lang=ja&appid=" + API_KEY,
      dataType : 'jsonp',
    }).done(function (data){
      //通信成功
      // 位置
      // 天気
      $('#weather').text(data["list"][parseInt(idx)]["weather"][0]["main"]);
      // 天気アイコン
      $('#wicon').attr("src","http://openweathermap.org/img/w/" + data["list"][parseInt(idx)]["weather"][0]["icon"] + ".png");
      $('#wicon').attr("alt", data["list"][parseInt(idx)]["weather"][0]["main"]);
      // 気温
      $('#temp').text(data["list"][parseInt(idx)]["main"]["temp"]);
      // 最高気温
      $('#temp_max').text(data["list"][parseInt(idx)]["main"]["temp_max"]);
      // 最低気温
      $('#temp_min').text(data["list"][parseInt(idx)]["main"]["temp_min"]);
      //湿度
      $('#humidity').text(data["list"][parseInt(idx)]["main"]["humidity"]);
      //風速
      $('#speed').text(data["list"][parseInt(idx)]["wind"]["speed"]);
      // DI（不快指数）計算
      // T:気温、H:湿度
      // DI = 0.81T + 0.01H * (0.99T - 14.3) + 46.3
      $('#DI').text( 0.81 * Number(data["list"][parseInt(idx)]["main"]["temp"]) + 0.01 * Number(data["list"][parseInt(idx)]["main"]["humidity"]) * (0.99 * Number(data["list"][parseInt(idx)]["main"]["temp"]) - 14.3) + 46.3 );

      if((0.81 * Number(data["list"][parseInt(idx)]["main"]["temp"]) + 0.01 * Number(data["list"][parseInt(idx)]["main"]["humidity"]) * (0.99 * Number(data["list"][parseInt(idx)]["main"]["temp"]) - 14.3) + 46.3) >= 80){
      $('#message').text("蒸し暑く不快に感じる天気です。薄手の服を着ましょう。");
      }

    }).fail(function (data) {
    //通信失敗
    alert('通信に失敗しました。');      });
  });
});


});

$(document).on('turbolinks:load', function() {
//document.addEventListener('DOMContentLoaded', function(){
	// タブに対してクリックイベントを適用
	const tabs = document.getElementsByClassName('tab');
	for(let i = 0; i < tabs.length; i++) {
		tabs[i].addEventListener('click', tabSwitch);
	}

	// タブをクリックすると実行する関数
	function tabSwitch(){
		// 引数で指定したセレクターと一致する直近の祖先要素を取得
		const ancestorEle = this.closest('.tab-panel');
		// タブのclassの値を変更
		ancestorEle.getElementsByClassName('is-active')[0].classList.remove('is-active');
		this.classList.add('is-active');
		// コンテンツのclassの値を変更
		ancestorEle.getElementsByClassName('is-show')[0].classList.remove('is-show');
		const groupTabs = ancestorEle.getElementsByClassName('tab');
		const arrayTabs = Array.prototype.slice.call(groupTabs);
		const index = arrayTabs.indexOf(this);
		ancestorEle.getElementsByClassName('panel')[index].classList.add('is-show');
	};
});


