# :anchor:my port
my portは社内の情報共有サイトです。  
![CB6B6019-B092-41AD-B992-662D3DCED53E_1_105_c](https://user-images.githubusercontent.com/83590000/130168931-10a3e7ca-4af3-4507-87b9-f4548f91eb7f.jpeg)  
URL:

### :mag:サイト概要

自分が業務中にぶつかった問題、調べたこと、解決策を共有することで、  
自身の業務の備忘録、同じ問題にぶつかった社員の助けになります。  
また、社内の誰が、何に詳しいのかどういう分野が得意なのか分かり、効率よく情報共有ができます。

### :book:テーマを選んだ理由

社内で誰が、どんな業務を行っていて、何に詳しいか情報共有することで、  
業務の効率化、業務品質の向上につながると考えたからです。  

前職は輸出入の事務の仕事を行っており、EPA(経済連携協定）を使用して貨物を輸入することもあり、    
その際には税関に問い合わせたり、かなり色々と調べて EPAが適用できるよう手配を行いましたが、  
その際に、調べたことを共有する場が無かったのが勿体無いと感じていました。    
また、現在コロナの影響もあり、新入社員同士の交流はほとんどなく、横の繋がりが薄く孤独を感じやすい状況がありますが、  
投稿記事を見ることでそれぞれがどういう業務を行っているか知ることができ、  
モチベーションアップにつながるのではないかと考えています。  

### 😄ターゲットユーザー

同じ会社で働く人たち

### :bulb:主な利用シーン

・業務で分からないことにぶつかり、過去に同様のことが無かったか、解決策を調べたい時、誰か詳しい人を見つけたい時。  
・自身が業務中に色々調べた結果を残し、社内でシェアしたい場合. 
・社内で勉強会を開催したいとき. 

## :paperclip:設計書

-ER図：https://drive.google.com/file/d/1v3620sm4i5ZRKwLGR8fDyXHk6-h61y6a/view?usp=sharing  
-テーブル定義書：https://docs.google.com/spreadsheets/d/1XOzqwQbU1ZkUstGjmeaEbChlmGakMK73aPGOYHKz-Rg/edit?usp=sharing  
-詳細設計：https://docs.google.com/spreadsheets/d/1WPLhhodtTDnt7MbZS4ar8xBifeaXXOGKKMzIOISe2uo/edit?usp=sharing  
-WBS:https://docs.google.com/spreadsheets/d/1bnECdGxYu506fDCI-aZTNsy_W873OcBbnySi80CQOyw/edit#gid=1773513600  
-インフラ構成図　https://app.diagrams.net/?libs=general;aws4#G1bgnUj_cFFnusmfQsOMVVfdwn7SDcrD8h

## :paperclip:チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/1HaNpYHFXyml-Vv_o5HNoRlMdPvuDcbhqFkOJKHKbZv0/edit#gid=566224576

## :pushpin:　機能

|   | 機能　　　　　 | 使用技術 |
|:-----------|:------------|:------------:|
|１ | ログイン・ログアウト機能 | devise         |
|２ |プロフィール編集| devise      |
|３ |ゲストログイン機能|ー         |
|４ | 画像投稿機能 |refile, mini_magick|
|５ | 投稿機能(CRUD) |ー           |
|６ | 投稿への複数タグ付け |ー           |
|７ | 並び替え |ー           |
|８ | ランキング |ー           |
|９ | 投稿の閲覧数表示 |impressionist|
|10| いいね機能（非同期）  |ー           |
|11| コメント機能（非同期） |ー           |
|12| 勉強会登録機能 |ー           |
|13| 部署登録機能 |ー           |
|14| メール機能 |ー           |
|15| メール配信（バッチ処理） |whenever|
|16| 通知機能 |ー           |
|17| 通知の定時削除（バッチ処理） |whenever|
|18| 検索機能 |ー           |
|19| インクリメンタルサーチ |jquery-rails|
|20| マイページの活動グラフ |chartkick|
|21| 画像スライドショー |ー           |
|22| TOPに戻るボタン |ー           |
|23| 投稿のテキストエディタ |summernote-rails|
|24| 管理者機能 |cancancan/rails_admin|
|25| エラー・フラッシュメッセージ |ー           |
|26| 日本語化 |rails-i18n/devise-i18n/devise-i18n-views|
|27| レスポンシブデザイン |bootstrap|
|28| ページ導入 |kaminari|

## :pushpin:　非機能要件
| | 機能　　　　　 | 使用技術 |
|:-----------|:------------|:------------:|
|１| リーダブルコード |rubocop-airbnb|
|２|環境変数化|dotenv-rails|
|３|デバッグ|pry-byebug|
|４| テスト（単体/機能） |capybara/rspec-rails/factory_bot_rails/faker|
|６| N＋１問題 |ー           |

ーテストは全て網羅できておらず、日々少しずつテスト件数を増やしています。

## :pushpin:開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9

## :art:使用素材

https://iconbox.fun/  
https://tyoudoii-illust.com/  
http://flat-icon-design.com/?s=post  
https://hatchful.shopify.com/ja/
