# テーブル設計

## usersテーブル

| Column           | Type    | Options  |
| ---------------- | ------- | -------- |
| name             | string  | NOT NULL |
| email            | string  | NOT NULL |
| password         | string  | NOT NULL |
| password_dummy   | string  | NOT NULL |
| first_name       | string  | NOT NULL |
| family_name      | string  | NOT NULL |
| first_name_kana  | string  | NOT NULL |
| family_name_kana | string  | NOT NULL |
| birth_date_year  | integer | NOT NULL |
| birth_date_month | integer | NOT NULL |
| birth_date_day   | integer | NOT NULL |

### Association

- has_many :items
- has_one :purchase

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
- has_one :purchase

## purchasesテーブル

| Column  | Type      | Options            |
| ------- | --------- | ------------------ |
| user    | reference | foreign_keys: true |
| item    | reference | foreign_keys: true |
| address | reference | foreign_keys: true |

### Association

- has_one :user
- has_one :item

## addressesテーブル

| Column       | Type    | Options  |
| ------------ | ------- | -------- |
| postal_code  | integer | NOT NULL |
| prefectures  | string  | NOT NULL |
| city         | string  | NOT NULL |
| address      | string  | NOT NULL |
| detail       | string  | NOT NULL |
| phone_number | integer | NOT NULL |

### Association

- has_one :purchase