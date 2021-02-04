# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| family_name        | string  | null: false               |
| first_name_kana    | string  | null: false               |
| family_name_kana   | string  | null: false               |
| birth_date         | date    | null: false               |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| explain            | text       | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| price              | integer    | null: false       |
| shopping_charge_id | integer    | null: false       |
| shopping_area_id   | integer    | null: false       |
| days_to_ship_id    | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shopping_charges
- belongs_to_active_hash :shopping_area
- belongs_to_active_hash :days_to_ship

## purchasesテーブル

| Column  | Type      | Options           |
| ------- | --------- | ----------------- |
| user    | reference | foreign_key: true |
| item    | reference | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column        | Type      | Options           |
| ------------- | --------- | ----------------- |
| postal_code   | string    | null: false       |
| shopping_area_id | integer   | null: false       |
| city          | string    | null: false       |
| address       | string    | null: false       |
| building      | string    |                   |
| phone_number  | string    | null: false       |
| purchase      | reference | foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to_active_hash :shopping_area