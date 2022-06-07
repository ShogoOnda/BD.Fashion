// （API_KEY には、"取得したAPIキー" を記述）
const API_KEY = "489e9336b252f2465ca6828d733c93ac";

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
      $('#place').text(data["list"][parseInt(idx)]["main"]);
      // 最高気温
      $('#temp_max').text(data["list"][parseInt(idx)]["main"]["temp_max"]);
      // 最低気温
      $('#temp_min').text(data["list"][parseInt(idx)]["main"]["temp_min"]);
      //湿度
      $('#humidity').text(data["list"][parseInt(idx)]["main"]["humidity"]);
      //風速
      $('#speed').text(data["list"][parseInt(idx)]["wind"]["speed"]);
      // 天気
      //$('#weather').text(data["list"]["weather"][parseInt(idx)]["main"]);
      // 天気アイコン
      //$('#img').attr("src","http://openweathermap.org/img/w/" + data["weather"][1]["icon"] + ".png");
      //$('#img').attr("alt",data["weather"][1]["main"]);

    }).fail(function (data) {
    //通信失敗
    alert('通信に失敗しました。');
    });
  });
});

document.addEventListener("turbolinks:load", function() {
$(document).ready(function () {
  $("#theTarget").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'slide',
    // 変化に係る時間(ミリ秒)
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形("block" or "bubble")
    navType : 'block',
    // 子要素の種類('div' or 'img')
    childrenElementType : 'div',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : true,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 3000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
  });
});