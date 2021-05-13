## users

| Column               | Type    | Options                   |
|--------------------- | ------- | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| name_last_name       | string  | null: false               |
| name_first_name      | string  | null: false               |
| name_kana_last_name  | string  | null: false               |
| name_kana_first_name | string  | null: false               |
| birth_year           | integer | null: false               |
| birth_month          | integer | null: false               |
| birth_day            | integer | null: false               |


### Association
- has_many :items
- has_many :purchases

## items

| Column              | Type       |Options                         |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| category            | integer    | null: false                    |
| product_status      | integer    | null: false                    |
| shipping_charges    | integer    | null: false                    |
| shipping_area       | integer    | null: false                    |
| days_to_ship        | integer    | null: false                    |
| price               | integer    | null: false                    |
| user_id             | references | null :false, foreign_key :true |


### Association
- belongs_to :user
- has_one :purchase

## purchases

| Column   | Type       | Options                         |
| -------- | ---------- | ------------------------------- |
| user     | references | null: false, foreign_key :true  |
| item     | references | null: false, foreign_key :true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures     | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| purchases_id    | references | null: false, foreign_key :true |

### Association
- belongs_to :purchase