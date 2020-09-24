# アプリケーション名

## know_share

# アプリケーションの概要

### 自分のノウハウを共有し合って、互いの生活に活かそう！

# 🌐 App URL

### **https://idea-28803.herokuapp.com/** 

# テスト用アカウント

## ユーザーアカウント
- email    : poi098@gmail.com
- password : 7ygv6tfc

## Basic認証
- ID : tomoya
- pass : 0000

# 利用方法

### ①ユーザー登録をします。
### ②ユーザー登録することによって記事を投稿することができます。
### ③投稿者じゃない他のユーザーは投稿されている記事を読むことができ、コメントといいねをすることができます。(記事を読むだけならログインしてなくても読むことができます)

# 目的とした課題解決

### このアプリケーションを通じて、普段の生活などにおいて工夫していることなどを共有し合うことによってより快適な生活を送れる知識と出会えるきっかけを作ることが目的です。

# 洗い出した要件と説明

## ノウハウ一覧機能
### 投稿された記事を一覧できるようにしています。

## ノウハウ投稿機能
### ノウハウを記述し、投稿することができます。

## ノウハウ詳細機能
### 投稿された記事の本文を読むことができます。

## ノウハウ編集機能
### 記事の投稿者だけが記事の編集を行うことができます。

## ノウハウ削除機能
### 記事の投稿者だけが記事の削除を行うことができます。

## ユーザー管理機能
### ユーザー新規登録、ログイン、ログアウトをすることができます。

## 検索機能
### 検索することによってキーワードに合う投稿だけをピックアップすることができます。

## いいね機能
### 詳細画面にてその記事に対していいねボタンを押すことができます。

## コメント機能
### 詳細画面にてその記事に対してコメントを残すことができます。

# 実装予定の機能
## ユーザーフォロー機能
## PV機能

# データベース設計
## ER図
<img width="743" alt="スクリーンショット 2020-09-24 13 32 03" src="https://user-images.githubusercontent.com/69112102/94101765-84ba9e80-fe6b-11ea-85bb-59b32161661c.png">

# ローカルでの動作方法
- $ git clone https://github.com/tomoya4130/idea-28803
- $ cd idea-28803
- $ bundle install
- $ rails db:create
- $ rails db:migrate
- $ rails s
- 👉 http://localhost:3000
### 環境 👉 rails6 mysql2

# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| birthday        | date    | null: false |



### Association

- has_many :ideas
- has_many :likes
- has_many :comments

## ideas テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| genre_id               | integer    | null: false                    |
| title                  | string     | null: false                    |
| content                | text       | null: false                    |
| likes_count            | integer    |                                |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :likes
- has_many   :comments

## likes テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| idea               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :idea
 
## comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| comment          | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| idea             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :idea
