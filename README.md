# :anchor:my port
my portは社内の情報共有サイトです。  
![CB6B6019-B092-41AD-B992-662D3DCED53E_1_105_c](https://user-images.githubusercontent.com/83590000/130168931-10a3e7ca-4af3-4507-87b9-f4548f91eb7f.jpeg)  
URL:http://my-port-202106.com/

### 🚡動作デモ

お忙しい方にもご覧いただきやすいよう、動作デモ（5分間）を編集しました。ぜひご覧ください。  (YouTubeが開きます)  
＊いただいた[レビュー](https://docs.google.com/spreadsheets/d/1pAyMYA0krrO3pSC5tShYLg_69_Q6Tw-3HffIdUT48HM/edit#gid=0)を元に随時修正しておりますので、現状、実物とは異なっていますが、  
大体の機能は理解いただけるかと思います。  

＊音楽が鳴りますのでご注意ください!!!  
 
[![my_port](https://img.youtube.com/vi/tqwmsAYB7vQ/0.jpg)](https://www.youtube.com/watch?v=tqwmsAYB7vQ)

### :mag:サイト概要

自分が業務中にぶつかった問題、調べたこと、解決策を共有することで、  
自身の業務の備忘録、同じ問題にぶつかった社員の助けになります。  
また、社内の誰が、何に詳しいのかどういう分野が得意なのか分かり、効率よく情報共有ができます。

### :book:テーマを選んだ理由

・社内で誰が、どんな業務を行っていて、何に詳しいか情報共有することで、  
業務の効率化、業務品質の向上につながると考えたからです。  

・前職は輸出入の事務の仕事を行っており、EPA(経済連携協定）を使用して貨物を輸入することもあり、    
その際には税関に問い合わせたり、かなり色々と調べて EPAが適用できるよう手配を行いましたが、  
調べたことを共有する場が無かったのが勿体無いと感じていました。    

・また、現在コロナの影響もあり、新入社員同士の交流はほとんどなく、  
横の繋がりが薄く孤独を感じやすい状況がありますが、  
投稿記事を見ることでそれぞれがどういう業務を行っているか知ることができ、  
モチベーションアップにつながるのではないかと考えています。  

### 😄ターゲットユーザー

・同じ会社で働く人たち

### :bulb:主な利用シーン

・業務で分からないことにぶつかり、過去に同様のことが無かったか、解決策を調べたい時、誰か詳しい人を見つけたい時。  
・自身が業務中に色々調べた結果を残し、社内でシェアしたい場合. 
・社内で勉強会を開催したいとき

### 💁重要視したこと
私は「パッと見て必要な情報を得られる」ことを意識し、このサイトを作成しました。
機能が多い分、レイアウトはシンプルに仕上げました。
記事に複数タグを実装することで、記事の特徴をわかりやすくし、マイページではポイント機能、活動状況のグラフを作成し、自分の頑張りが一目でわかりやすいよう工夫しました。
また、検索機能は通常の検索機能に加えて、インクリメンタルサーチ（逐次検索）もできるように、
必要な情報にアクセスしやすいようにしました。


## 📍　機能

|   | 機能　　　　　 | 使用技術(gem等) |
|:-----------|:------------|:------------:|
|１ | ログイン・ログアウト機能 | devise         |
|２ |プロフィール編集| devise      |
|３ |ゲストログイン機能|ー         |
|4 |退会機能（論理削除）|ー         |
|5 | 画像投稿機能 |refile, mini_magick|
|6 | 投稿機能(CRUD) |ー           |
|7 | 下書き機能|ー           |
|8 | 投稿への複数タグ付け |ー           |
|9 | 並び替え機能 |ー           |
|10| ランキング機能 |ー           |
|11| 投稿の閲覧数表示 |impressionist|
|12| いいね機能（非同期）  |ー           |
|13| コメント機能（非同期） |ー           |
|14| 勉強会登録機能 |ー           |
|15| 部署登録機能 |ー           |
|16| メール機能 |ー           |
|17| メール配信（バッチ処理） |whenever|
|18| 通知機能 |ー           |
|19| 通知の定時削除（バッチ処理） |whenever|
|20| 検索機能 |ー           |
|21| インクリメンタルサーチ |jquery-rails|
|22| マイページの活動グラフ |chartkick|
|23| 画像スライドショー |jquery-rails|
|24| TOPに戻るボタン/タブ切り替え |jquery-rails|
|25| 投稿のテキストエディタ |summernote-rails|
|26| 管理者機能 |cancancan/rails_admin|
|27| エラー・フラッシュメッセージ |ー           |
|28| メッセージの日本語化 |rails-i18n/devise-i18n/devise-i18n-views|
|29| デザイン |bootstrap|
|30| ページ導入 |kaminari|

-チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/1HaNpYHFXyml-Vv_o5HNoRlMdPvuDcbhqFkOJKHKbZv0/edit#gid=566224576

## 📍　非機能要件
| | 機能　　　　　 | 使用技術 |
|:-----------|:------------|:------------:|
|１| リーダブルコード |rubocop-airbnb|
|２|環境変数化|dotenv-rails|
|３|デバッグ|pry-byebug|
|４| テスト（単体/機能） |capybara/rspec-rails/factory_bot_rails/faker|
|６| N＋１問題 |ー           |

ーテストコードは全て網羅できておらず、日々少しずつテスト件数を増やしています。

## 📍ER図
<img width="1003" alt="スクリーンショット 2021-08-23 18 33 06" src="https://user-images.githubusercontent.com/83590000/130424971-293401b0-282d-4430-8d61-c3c323745c70.png">

## 📍AWS（インフラ）構成図
-AWSについては学習中のため、追ってアップデートします。  
![スクリーンショット 2021-08-23 18 58 12](https://user-images.githubusercontent.com/83590000/130428586-9d32846c-f917-4840-8712-b431b7ffd720.png)


## 📍開発環境

- OS(Operating system)：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE（ソースコードを記述するエディタ）：Cloud9

## :art:使用素材

[ICON BOX](https://iconbox.fun/)  
[ちょうどいいイラスト](https://tyoudoii-illust.com/)  
[FLAT ICON DESIGN](http://flat-icon-design.com/)  
[hatchful](https://hatchful.shopify.com/ja/)  
[O-DAN](https://o-dan.net/ja/)

## 🧑‍🎓制作の記録
学んだことを[Qiita](https://qiita.com/ki_87)にてアウトプットしております。  
  
[スクールでの発表スライド](https://docs.google.com/presentation/d/1gO3HAA0jwPUX9VD9vCupAU3nwCX-Gdqz0sldCtnpYBs/edit#slide=id.gc6f59039d_0_24)
