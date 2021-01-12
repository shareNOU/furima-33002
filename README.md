# テーブル設計

## usersテーブル

| Column    | Type       | Options  |
| --------- | ---------- | -------- |
| email     | string     | NOT NULL |
| password  | string     | NOT NULL |
| name      | string     | NOT NULL |

### Association

- has_many :items
- belongs_to :purchase

## itemsテーブル

| Column    | Type       | Options  |
| --------- | ---------- | -------- |
| goods     | string     | NOT NULL |
| prise     | string     | NOT NULL |
| explain   | text       | NOT NULL |

### Association

- belongs_to :user
- belongs_to :purchase

## purchasesテーブル

| Column    | Type       | Options  |
| --------- | ---------- | -------- |
| credit    | string     | NOT NULL |

### Association

- has_many :users
- has_many :items

## addressesテーブル

| Column    | Type       | Options  |
| --------- | ---------- | -------- |
| postal    | strings    | NOT NULL |
| city      | strings    | NOT NULL |
| number    | strings    | NOT NULL |

### Association

- has_one :purchase