# テーブル設計

## usersテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | NOT NULL    |
| family_name      | string  | NOT NULL    |
| first_name_kana  | string  | NOT NULL    |
| family_name_kana | string  | NOT NULL    |
| birth_date       | integer | NOT NULL    |

### Association

- has_many :items
- belongs_to :purchase

## itemsテーブル

| Column           | Type      | Options            |
| ---------------- | --------- | ------------------ |
| goods            | string    | NOT NULL           |
| explain          | text      | NOT NULL           |
| category         | string    | NOT NULL           |
| condition        | string    | NOY NULL           |
| price            | integer   | NOT NULL           |
| shopping_charges | integer   | NOT NULL           |
| shopping_area    | string    | NOT NULL           |
| days_to_ship     | integer   | NOT NULL           |
| user             | reference | foreign_keys: true |

### Association

- belongs_to :user
- belongs_to :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shopping_charges
- belongs_to_active_hash :shopping_area
- belongs_to_active_hash :days_to_ship

## purchasesテーブル

| Column  | Type      | Options            |
| ------- | --------- | ------------------ |
| user    | reference | foreign_keys: true |
| item    | reference | foreign_keys: true |

### Association

- has_one :user
- has_one :item
- belongs_to :address

## addressesテーブル

| Column       | Type      | Options            |
| ------------ | --------- | ------------------ |
| postal_code  | integer   | NOT NULL           |
| prefectures  | string    | NOT NULL           |
| city         | string    | NOT NULL           |
| address      | string    | NOT NULL           |
| detail       | string    | NOT NULL           |
| phone_number | string    | NOT NULL           |
| purchase     | reference | foreign_keys: true |

### Association

- has_one :purchase
- belongs_to_active_hash :prefectures