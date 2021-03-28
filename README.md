# アプリケーション名：  SweetTooth
![sweettooth top](https://user-images.githubusercontent.com/74820572/112306681-68e16980-8ce3-11eb-9594-48a4071a64f1.gif)
![index](https://user-images.githubusercontent.com/74820572/112423163-79dabb00-8d75-11eb-8e52-0eec982e9467.gif)


<br>

## アプリケーション概要
----
スイーツ専用の投稿サイト。
ユーザー登録をすることにより投稿が可能になる。投稿画面では商品名、金額、店舗名が入力必須となっており、理由として情報収集や飲食店探し、自身の記録としてまた行きたいと思った時に確認出来るようにするためにその情報を必須としている。
その他、投稿へのコメントや検索、いいね機能することが可能。

<br>

## URL
----
 https://sweet-tooth-2021.herokuapp.com/

<br>

## 実装した機能
----
<br>

#### 新規登録※deviseを使用
----
<img width="" alt="signup" src="https://user-images.githubusercontent.com/74820572/112309310-8c59e380-8ce6-11eb-95e6-b1f910da288d.png" ><br>

#### ログイン※deviseを使用
---
<img width="" alt="login" src="https://user-images.githubusercontent.com/74820572/112309305-8b28b680-8ce6-11eb-8c83-dfe2feea7c75.png"><br>

#### 投稿機能
----
![post](https://user-images.githubusercontent.com/74820572/112450283-9687ea80-8d97-11eb-9394-a0bb532e6068.jpg)<br>

#### 投稿編集機能
----
![edit](https://user-images.githubusercontent.com/74820572/112450816-2168e500-8d98-11eb-873b-6b8f85239116.jpg)<br>

#### 投稿削除機能
----
![delete](https://user-images.githubusercontent.com/74820572/112450810-1f9f2180-8d98-11eb-9d4a-4c2922e62691.jpg)<br>

#### コメント機能
----
<img width="1426" alt="comment" src="https://user-images.githubusercontent.com/74820572/112450808-1e6df480-8d98-11eb-9aa7-912c340487b3.png"><br>

#### 投稿検索機能
----
![serach](https://user-images.githubusercontent.com/74820572/112313042-c927d980-8cea-11eb-91c3-df9a69fd6e4f.jpg)<br>

#### いいね機能
----
<img width="1410" alt="いいね機能" src="https://user-images.githubusercontent.com/74820572/112740333-1c35b100-8fb7-11eb-9d9d-1834a61a95c5.png">
<br>


<br>


## Basic認証・テスト用アカウント
----
<br>

||Basic認証|テストユーザー1|テストユーザー2|
|---|---|---|---|
|ID|sweettooth|-----|-----|
|email|-----|test@test.co.jp|aaaa@co.jp|
|Pass|20210310|test123|aaa123|

<br>

<br>

## 利用方法
----
<br>

#### ユーザー新規登録
----
![signup test](https://user-images.githubusercontent.com/74820572/112415467-324d3280-8d67-11eb-9fd4-0149c938ffec.gif)
##### 必要事項を入力し登録ボタンを押すと新規登録される。登録後にトップページに遷移し投稿ボタンが表示され投稿や投稿に対していいね（絵文字）を押すことが可能になる。
----
<br>

#### ユーザーログイン
----
![login test](https://user-images.githubusercontent.com/74820572/112415432-25c8da00-8d67-11eb-95b1-972f124f8e95.gif)
##### 必要事項を入力するとトップページへ。新規登録同様に投稿ボタンが表示され投稿や投稿に対しいいね（絵文字）を押すことが可能になる。
----
<br>

#### 新規投稿
----
![post test](https://user-images.githubusercontent.com/74820572/112422229-e2c13380-8d73-11eb-8cf6-355ad6b5978d.gif)
##### 必要事項を入力すると投稿ができる。投稿ボタンを押すとトップページへ。トップページに投稿が表示される。
----
<br>

#### 投稿詳細
----
![show test](https://user-images.githubusercontent.com/74820572/112415459-2fead880-8d67-11eb-81b7-6778484a56c8.gif)
##### 新規登録の有無に関わらず投稿画像をクリックすると詳細画面を確認することができる。ログイン中のユーザーであれば投稿に対しコメントをすることが可能。
----
<br>

#### ユーザー投稿一覧
----
![user index](https://user-images.githubusercontent.com/74820572/112415488-38dbaa00-8d67-11eb-96b5-031fd739c939.gif)
##### 新規登録の有無に関わらず投稿詳細画面下部のユーザー名投稿一覧をみるをクリックするとそのユーザーの投稿一覧を確認することができる。
----
<br>

#### 投稿編集
----
![edit test](https://user-images.githubusercontent.com/74820572/112415401-1c3f7200-8d67-11eb-9f29-2db114a94a7d.gif)
##### 登録したユーザーは自身の投稿を編集することができる。トップページより投稿画像をクリックすると詳細画面に遷移し、その投稿者であれば編集、削除ボタンが表示される。編集後、編集するボタンを押すと詳細ページに遷移し編集した内容が反映される。
----
<br>

#### 投稿削除
----
![delete test](https://user-images.githubusercontent.com/74820572/112415399-1ba6db80-8d67-11eb-8a93-caad8f27eaef.gif)
##### 登録したユーザーは自身の投稿を削除することができる。トップページより投稿画像をクリックすると詳細画面に遷移し、その投稿者であれば編集、削除ボタンが表示される。削除ボタンを押すとトップページに遷移し削除した内容はトップページには表示されない。
----
<br>


#### コメント投稿
----
![comment test](https://user-images.githubusercontent.com/74820572/112415378-134ea080-8d67-11eb-8f68-6bcce47c8dcd.gif)
##### 登録したユーザーは投稿詳細ページに遷移するとコメント入力フォームが表示され投稿に対してコメントすることが可能になる。コメントを入力後、コメントするボタンを押すと詳細ページにそのコメントが表示される。
----
<br>

#### 投稿検索
----
![search test](https://user-images.githubusercontent.com/74820572/112415450-2c575180-8d67-11eb-9f22-ae2c266c8ad8.gif)
##### 新規登録の有無に関わらず、トップページの検索フォームにキーワードを入力して検索ボタンを押すと検索結果画面に遷移しキーワードに該当した投稿が表示される。
----
<br>

#### いいね機能
----
![いいね機能](https://user-images.githubusercontent.com/74820572/112740317-f7d9d480-8fb6-11eb-9253-eae7745781f7.gif)
##### 登録しているユーザーはトップページの投稿一覧より絵文字をクリックすることにより評価することができる。また2度クリックすることで取り消すことも可能である。
----
<br>
<br>

## 目指した課題解決
----
#### ・スイーツ好きのための特化したSNSを必要とする人のため
#### ・画像はあるが再度、購入・利用したいと思った時に商品名、金額、店舗名など情報が思い出せないときに確認できること
#### ・最新スイーツの情報や投稿で気になったスイーツがある店舗名、その金額が知りたいときに確認できること

<br>


<br>

## 実装予定機能
----
- マイページ機能
- ユーザーフォロー機能
- 店舗検索機能

<br>

<br>

## 要件定義
----
|優先順位<br>（高：3、中：2、低：1）|機能|目的|詳細|ユーザーストーリー|見積もり時間（所要時間）|
|-----|-----|-----|-----|-----|-----|
|3                        |ユーザー管理機能       |ユーザー登録をするため                  |ユーザー情報を入力し登録する。<br>登録したユーザーが登録したメールアドレス、パスワードのみでログインができる。|・ユーザー情報を登録していないと投稿、編集、削除、コメントができな<br>・ユーザー情報を登録していると投稿、編集、削除、コメントができる|8|
||                    |                                   |
|3|投稿機能             |投稿をするため                        |投稿したい画像を選択し、商品名、金額、購入又は利用店舗、投稿に対してのコメント（任意）を入力し投稿ボタンを押すと投稿することができる。|・ユーザー登録をしていないと投稿ボタンが表示されない<br>・ユーザー登録をすると投稿ボタンが表示され、クリックすると投稿画面に遷移できる<br>・ユーザー登録をしていると投稿することができる|8|
||                    |                                   |
|3|投稿詳細機能          |投稿の詳細を確認できるようにするため        |投稿画面をクリックすると商品の画像、商品名、金額、購入又は利用店舗、投稿に対してのコメント、他ユーザーからのコメントの詳細を確認することができる。|・ユーザー登録の有無に関わらず、投稿画像をクリックすると投稿詳細ページに遷移する<br>・ユーザー登録していると投稿詳細画面でコメント入力欄が表示される<br>・ユーザー登録しているユーザーかつその投稿者であれば編集、削除ボタンが表示される<br>・ユーザー登録していないユーザーは投稿詳細画面に編集、削除ボタン、コメント欄が表示されない|5|
||                    |                                   |
|3|投稿編集機能          |投稿の編集をできるようにするため           |投稿詳細画面の編集をクリックすると商品の画像、商品名、金額、購入又は利用店舗、投稿に対してのコメントが編集することができる。|・ユーザー登録をしているユーザーかつ投稿者であれば投稿の編集ができる<br>・ユーザー登録をしているがその投稿者でなければ投稿の編集はできない<br>・ユーザー登録をしていないと投稿の編集はできない|5|
||                    |                                   |
|3|投稿削除機能          |投稿の削除をできるようにするため           |投稿詳細画面の編集をクリックすると投稿を削除することができる。|・ユーザー登録をしているユーザーかつ投稿者であれば投稿の削除ができる<br>・ユーザー登録をしているがその投稿者でなければ投稿の削除はできない<br>・ユーザー登録をしていないと投稿の削除はできない|1|
||                    |                                   |
|3|投稿一覧機能          |ユーザーの投稿一覧を確認できるようにするため |投稿一覧をクリックするとそのユーザーの投稿一覧を確認することができる。|・ユーザー登録の有無に関わらず投稿一覧を確認することができる|2|
||                    |                                   |
|2|投稿コメント機能        |投稿にコメントできるようにするため           |投稿詳細画面のコメント欄に入力をしてコメントボタンを押すとコメントができる。|・ユーザー登録をしていないとコメントができない<br>・ユーザー登録をするとコメントができる<br>・ユーザー登録をしていると投稿者でなくても投稿することができる|2|
||                    |                                   |
|2|投稿検索機能          |投稿を検索できるようにするため            |投稿検索欄にキーワードを入力すると検索することができる|・ユーザー登録の有無に関わらず投稿の検索することができる|2|
||                    |                                   |
|1|投稿いいね機能 |投稿に評価できるようにするため            |投稿詳細のいいねボタン(絵文字)を押すと数が表示され投稿の評価ができる|・ユーザー登録をしていなといいねが押せない<br>・ユーザー登録をしているといいねが押せる<br>・ユーザー登録をしているといいねの解除ができる|5|

<br>




<br>

## ローカル環境での動作

```ruby
% git clone https://github.com/mitsuru-sekiguchi/sweet_tooth-2021.git
% cd sweet_tooth-2021
% bundle install
% yarn install
% rails db:create
% rails db:migrate
% rails s
→  http://localhost:3000
```


<br>

## 使用技術（開発環境）
----
#### バックエンド
----
- Rails '6.0.3.5'
- Ruby '2.6.5'
<br>
<br>

#### フロントエンド
----
- HTML
- CSS
<br>
<br>

#### データベース
----
- MySQL
- SequelPro
<br>
<br>

#### ソース管理
----
- GitHub
- GitHubDesktop
<br>
<br>

#### テスト
----
- RSpec
<br>
<br>

#### エディタ
----
- VScode

<br>
<br>

## テーブル設計
#### users テーブル
| Column        | Type      | Options     |
| --------------| ----------| ------------|
| nickname      | string    | null: false |
| email         | string    | null: false |

#### Association

- has_many :sweets
- has_many :comments
- has_many :likes

#### sweets テーブル

| Column          | Type       | Options          |
| ----------------| -----------| -----------------|
| name            | string     | null: false      |
| price           | integer    | null: false      |
| shop_info       | string     | null: false      |
| text            | text       |                  |
| user            | references | foreign_key:true |


#### Association

- belongs_to :user
- has_many   :comments
- has_many   :likes

#### comments テーブル

| Column          | Type       | Options          |
| ----------------| -----------| -----------------|
| text            | text       | null: false      |
| user            | references | foreign_key:true |
| sweet            | references | foreign_key:true |

#### Association

- belongs_to :user
- belongs_to :sweet

#### likes テーブル

| Column          | Type       | Options          |
| ----------------| -----------| -----------------|
| user            | references | foreign_key:true |
| sweet           | references | foreign_key:true |

#### Association

- belongs_to :user
- belongs_to :sweet
