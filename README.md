# SweetTooth

## 概要
スイーツ専門の投稿サイトでユーザー登録をすることにより投稿が可能になる。
その他、投稿へのコメントやYummy!（いいね）で評価することが可能。

## 機能
・ユーザー管理機能
・投稿機能
・投稿編集機能
・投稿削除機能
・コメント機能
・yummy！（いいね）機能

## URL https://sweet-tooth-2021.herokuapp.com/


## テスト用アカウント
Basic認証
ID：sweettooth
Pass:20210310

テストユーザー1
email:test@test.co.jp
Pass:test123

テストユーザー2
email:aaaa@co.jp
Pass:aaa123




 

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
