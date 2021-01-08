# テーブル設計

## usersテーブル

| Column    | Type       | Options  |
| --------- | ---------- | -------- |
| email     | string     | NOT NULL |
| password  | string     | NOT NULL |
| name      | string     | NOT NULL |

### Association

- has_many :items

## itemsテーブル

| Column    | Type       | Options  |
| --------- | ---------- | -------- |

### Association

- belongs_to :user
