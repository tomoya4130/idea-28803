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
