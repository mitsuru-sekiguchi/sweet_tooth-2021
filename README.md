# SweetTooth

## 概要
スイーツ専門の投稿サイトでユーザー登録をすることにより投稿が可能になる。
その他、投稿へのコメントやYummy!（いいね）で評価することが可能。

## 機能
#### ・ユーザー管理機能
#### ・投稿機能
#### ・投稿編集機能
#### ・投稿削除機能
#### ・コメント機能
#### ・yummy！（いいね）機能

## URL https://sweet-tooth-2021.herokuapp.com/


## テスト用アカウント
#### Basic認証
#### ID：sweettooth
#### Pass:20210310

#### テストユーザー1
#### email:test@test.co.jp
#### Pass:test123

#### テストユーザー2
#### email:aaaa@co.jp
#### Pass:aaa123

## 目指した課題解決
#### ・スイーツに特化したSNSが欲しい
#### ・画像はあるが再度、購入・利用したいと思った時に商品名、金額、店舗名など情報が思い出せない
#### ・最新スイーツの情報収集や投稿で気になったスイーツがある店舗名、その金額が知りたい

## 要件定義
|機能                 |
|--------------------|
|ユーザー管理機能       |
|--------------------|
|投稿機能             |
|--------------------|
|投稿詳細機能          |
|--------------------|
|投稿編集機能          |
|--------------------|
|投稿削除機能          |
|--------------------|
|投稿一覧機能          |
|--------------------|
|投稿コメント機能        |
|--------------------|
|投稿検索機能          |
|--------------------|
|投稿Yummy!(いいね機能) |



 

## users テーブル

| Column        | Type      | Options     |
| --------------| ----------| ------------|
| nickname      | string    | null: false |
| email         | string    | null: false |

### Association

- has_many :sweets
- has_many :comments

## sweets テーブル

| Column          | Type       | Options          |
| ----------------| -----------| -----------------|
| name            | string     | null: false      |
| price           | integer    | null: false      |
| shop_info       | string     | null: false      |
| text            | text       |                  |
| user            | references | foreign_key:true |


### Association

- belongs_to :user
- has_many   :comments

## comments テーブル

| Column          | Type       | Options          |
| ----------------| -----------| -----------------|
| text            | text       | null: false      |
| user            | references | foreign_key:true |
| sweet            | references | foreign_key:true |

### Association

- belongs_to :user
- belongs_to :sweet
