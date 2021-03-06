# BD.Fashion

## サイト概要

### サイトテーマ

天気の情報とタンスや押し入れから洋服を引っ張り出すことなく洋服の情報を表示し、どの服を着るべきか判断しやすくするユーザー個々の服に対するレビューサイト

### テーマを選んだ理由

天気と所持している服を関連付けし、お出掛け前により快適に過ごせるよう服の選定ができるサイトってそういえばないな・・・っていう関心から、APIを用いて天気の情報と所持している洋服を登録しておくだけで、お出かけする日に着るべき服を事前に選定できるサイトがあると便利だと思い、天候情報と所持している服を関連付けできるサイトを作成してみることにしました。</br>
お出掛け前にどんな洋服を着るか事前に決めておきたいのに、どんな服を着ていようか悩む経験がある方や外出先で洋服を購入する際に、以前買ったことあるような服をもう一度買ってしまった経験がある方は、多いのではないでしょうか？</br>
このサイトを用いれば、2日後までの天気と持っている服の情報を関連付けを行い、どんな服を着ていくか事前に選択しやすくすることやタンスの中を整理し、どんな服を持っているか確認できることで似たような服を買ってしまう失敗を無くしたりすることができます。

### ターゲットユーザ

外出時に服装の選択の失敗を減らしたい方</br>

タンスの中の服を管理しきれていない方</br>

洋服の購入で、サイズを間違えて購入してしまったり、同じような服を購入してしまったことがある方</br>

### 主な利用シーン

所持している服をサイト上に登録して管理したいとき</br>
（画像の登録やシーズンごとでジャンル分けが可能）

「この組み合わせでいこう！」と着替えて外に出てみたものの室内と外気の違いに驚き、「失敗した、でも、時間がないから諦めてこれで行こう・・・」と不快な一日を過ごす可能性を減らしたいとき</br>

外出前の所持している服の組み合わせを考える時間がないとき</br>

## 実装機能リスト

https://docs.google.com/spreadsheets/d/13cl9gZd6Ztc3pngOSVnWlZl47tmEv1cXINse_IqSNLo/edit?usp=sharing

## 開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9

## 使用素材

服のシルエットのフリー画像出典元サイト</br>
https://www.silhouette-ac.com/

## 使用API

OpenWeatherMap</br>
https://openweathermap.org/

## 苦労した点

シーズンタグと各アイテム（アウター、インナー、ボトム、シューズ）を多対多のテーブルで中間テーブルを配置しており、シーズンタグで絞り込み検索を行うには、テーブルの結合を使って情報を引っ張ってこないといけないという点がカリキュラム外であったため、調べたり教えてもらったりで苦労しました。(各モデル参照)</br>
</br>
マイページやみんなのアイテムにあるシーズンタグを切り替えても、見ているアイテムで絞り込みができるようにするのに苦労しました。（クリックしたグループにクラスの付与や他グループで付与されているクラスの削除、またパラメータをURLに埋め込むことで画面遷移なく絞り込みができるようにした）</br>
（例えば、インナーグループを見ている最中に、絞り込み検索を行なっても、インナーが表示されたまま絞り込み検索が適用される。）</br>
参照：app/javascript/script.js</br></br>
APIの導入には、配列取得の規則がわからず試行錯誤でどの情報が取得できるのか、調べながら確認しました。</br>
参照：app/javascript/script.js</br></br>





