# README

## users テーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| nickname                | string | null: false |
| email                   | string | null: false |
| password                | string | null: false |
| password_confirmation   | string | null: false |
| last_name               | string | null: false |
| first_name              | string | null: false |
| last_name_reading       | string | null: false |
| first_name_reading      | string | null: false |
| birth_date(1i)          | string | null: false |
| birth_date(2i)          | string | null: false |
| birth_date(3i)          | string | null: false |
| phone_number            | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| item_name       | string      | null: false                    |
| explanation     | text        | null: false                    |
| category        | string      | null: false                    |
| status          | string      | null: false                    |
| burden          | string      | null: false                    |
| shipping_area   | string      | null: false                    |
| delivery_days   | string      | null: false                    |
| price           | integer     | null: false                    |
| user_id         | string      | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture      | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id       | references | null: false, foreign_key: true |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address