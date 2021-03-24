# SweetTooth
# <img width="1426" alt="スクリーンショット 2021-03-24 16 44 45" src="https://user-images.githubusercontent.com/74820572/112273314-8fda7400-8cc0-11eb-907d-a4ce6cebe7c3.png">
## 概要
スイーツ専門の投稿サイト
## 機能
### ユーザー管理機能
ユーザー登録、ユーザーログインができる
### 投稿機能
ユーザー登録していれば投稿することができる
### 投稿編集機能
ユーザー登録しているかつ投稿者は投稿を編集することができる
### 投稿削除機能
ユーザー登録しているかつ投稿者は投稿を削除することができる
### コメント機能
ユーザー登録をしているユーザーは投稿者の有無に関わらず投稿にコメントすることができる
### yummy！（いいね）機能
ユーザー登録をしているユーザーは投稿者の有無に関わらず投稿にyummy！（いいね）をすることができる
 

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
