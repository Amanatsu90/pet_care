# アプリ名
わんこの介護BOX

# 概要
犬の介護情報に特化した情報投稿アプリです。  
ユーザー登録をすると記事の投稿、編集、削除、記事へのコメントができます。  
投稿する際は、画像（任意）、本文、犬のサイズと介護のテーマ（食事の介助、寝たきりのケアなど）を選択し、  
自由にタグをつける事も可能です。

# 本番環境
https://pet-care01.herokuapp.com/

ログイン情報（テスト用）
* Email: test@exsample
* Password: ab1234

# 制作背景（意図）
以前飼っていた犬（ラブラドールレトリーバー）の介護を行う際、
* 小型犬の情報は沢山あるが、大型犬の情報が少ない
* 一般家庭では、どのように介護環境を整えているのか情報がほぼ無い
* 食事内容を変えただけで体調が劇的に改善した（他の人にも伝えたい）

などの事があり、もっと最新の介護情報や、一般での取り組みを共有できるようにしたいと考え作りました。

# DEMO

# 工夫したポイント
* 目的の情報を早く見つけられるよう、犬のサイズ、または介護のテーマで記事一覧表示を切り替えるようにしました。
* タイトル、本文から目的の記事を見つけられるよう、検索機能を実装しました。　
* 犬種名や〜対策など、より具体的なカテゴリーを付けたい場合を想定し、タグ付け機能を実装しました。
* 各記事に他ユーザーから質問や感想を述べられるよう、コメント投稿機能を実装しました。
* 特定の記事をすぐに閲覧できるよう、お気に入り機能を実装しました。
* 利用者が見やすいよう、レイアウトを統一するようにしました。

# 使用技術（開発環境）
### バックエンド
Ruby、Ruby on Rails
### フロントエンド
HTML、CSS
### データベース
MySQL、Sequel Pro
### インフラ
AWS
### サーバ（本番環境）
Heroku
### ソース管理
GitHub、GitHubDesktop
### テスト
Rspec
### エディタ
VSCode

# 課題や今後実装したい機能
* １枚しか画像を投稿できないため、複数画像の投稿機能を実装したいです。  
　それに伴い、どの画像を投稿したか分かるよう、プレビュー機能も付けたいです。
* スマートフォン表示もできるようCSSに修正を加えたいです。
* 表示スピードを上げるため、CSSの機能を一部JavaScriptに移管したいです。
* 人気の記事をトップに表示する機能を実装したいです。


# DB設計

## users テーブル

| Column             | Type   | Options     | 
| ------------------ | ------ | ----------- | 
| name               | string | null: false | 
| nickname           | string | null: false | 
| email              | string | null: false | 
| encrypted_password | string | null: false | 

### Association

- has_many :posts
- has_many :comments


## posts テーブル

| Column       | Type       | Options                        | 
| ------------ | ---------- | ------------------------------ | 
| title        | string     | null: false                    | 
| text         | text       | null: false                    | 
| dog_size_id  | integer    | null: false                    | 
| theme_id     | integer    | null: false                    | 
| user         | references | null: false, foreign_key: true | 

### Association

- has_many :users
- has_many :comments
- has_one_attached :image

### ActiveHash Associations

- belongs_to :theme_tag


## comments テーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ | 
| text   | text       | null: false                    | 
| user   | references | null: false, foreign_key: true | 
| post   | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :post


## favorite テーブル

| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ | 
| user   | references | null: false, foreign_key: true | 
| post   | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :post
