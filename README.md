## users

| Column   | Type  | Options      |
|--------- | ----- | ------------ |
| name     |string | null: false  |
| email    |string | unique: true |
| password |string | null: false  |


### Association
- has_many :items
- has_many :purchases

## items

| Column              | Type       |Options                         |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| category            | string     | null: false                    |
| product_status      | string     | null: false                    |
| shipping_charges    | integer    | null: false                    |
| shipping_area       | string     | null: false                    |
| days_to_ship        | string     | null: false                    |
| price               | integer    | null: false                    |
| seller              | string     | null: false                    |
| user_id             | references | null :false, foreign_key :true |


### Association
- belongs_to :user
- has_one :purchase

## purchases

| Column   | Type       | Options                         |
| -------- | ---------- | ------------------------------- |
| user_id  | references | null: false, foreign_key :true  |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| postal_code     | integer | null: false |
| prefectures     | string  | null: false |
| municipality    | string  | null: false |
| address         | string  | null: false |
| building_name   | string  |             |
| phone_number    | integer | null: false |

### Association
- belongs_to :purchase