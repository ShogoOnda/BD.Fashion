// （API_KEY には、"取得したAPIキー" を記述）
const API_KEY = "489e9336b252f2465ca6828d733c93ac";

$(function(){
  $('#btn').on('click', function() {

  let idx = $("#idx").val()

  if(idx == "1"){
    // 入力された都市名でWebAPIに天気情報をリクエスト
    $.ajax({
      url: "https://api.openweathermap.org/data/2.5/forecast?q=" + $('#cityname').val() + "&units=metric&lang=ja&appid=" + API_KEY,
      dataType : 'jsonp',
    }).done(function (data){
      //通信成功
      // 位置
      $('#place').text(data["list"][1]["main"]);
      // 最高気温
      $('#temp_max').text(data["list"][1]["main"]["temp_max"]);
      // 最低気温
      $('#temp_min').text(data["list"][1]["main"]["temp_min"]);
      //湿度
      $('#humidity').text(data["list"][1]["main"]["humidity"]);
      //風速
      $('#speed').text(data["list"][1]["wind"]["speed"]);
      // 天気
      $('#weather').text(data["weather"][1]["main"]);
      // 天気アイコン
      //$('#img').attr("src","http://openweathermap.org/img/w/" + data["weather"][1]["icon"] + ".png");
      //$('#img').attr("alt",data["weather"][1]["main"]);
    }).fail(function (data) {
      //通信失敗
      alert('通信に失敗しました。');      });
  } else if(idx == "2"){
  $.ajax({
    url: "https://api.openweathermap.org/data/2.5/forecast?q=" + $('#cityname').val() + "&units=metric&lang=ja&appid=" + API_KEY,
    dataType : 'jsonp',
  }).done(function (data){
    //通信成功
    // 位置
    $('#place').text(data["list"][2]["main"]);
    // 最高気温
    $('#temp_max').text(data["list"][2]["main"]["temp_max"]);
    // 最低気温
    $('#temp_min').text(data["list"][2]["main"]["temp_min"]);
    //湿度
    $('#humidity').text(data["list"][2]["main"]["humidity"]);
    //風速
    $('#speed').text(data["list"][2]["wind"]["speed"]);
    // 天気
    //$('#weather').text(data["weather"][2]["main"]);
  }).fail(function (data) {
    //通信失敗
    alert('通信に失敗しました。');      });
  } else if(idx == "0"){
    $.ajax({
      url: "https://api.openweathermap.org/data/2.5/forecast?q=" + $('#cityname').val() + "&units=metric&lang=ja&appid=" + API_KEY,
      dataType : 'jsonp',
    }).done(function (data){
      //通信成功
      // 位置
      $('#place').text(data["list"][idx]["main"]);
      // 最高気温
      $('#temp_max').text(data["list"][0]["main"]["temp_max"]);
      // 最低気温
      $('#temp_min').text(data["list"][0]["main"]["temp_min"]);
      //湿度
      $('#humidity').text(data["list"][0]["main"]["humidity"]);
      //風速
      $('#speed').text(data["list"][0]["wind"]["speed"]);
      // 天気
      //$('#weather').text(data[weather][0][main]);
      // 天気アイコン
      //$('#img').attr("src","http://openweathermap.org/img/w/" + data["weather"][0]["icon"] + ".png");
      //$('#img').attr("alt",data["weather"][0]["main"]);
    }).fail(function (data) {
    //通信失敗
    alert('通信に失敗しました。');      });
  } else {
      alert('6時間以上は取得できません。');
  }
  });
});


document.addEventListener('DOMContentLoaded', function(){
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