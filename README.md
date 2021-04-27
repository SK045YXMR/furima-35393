# テーブル設計

## users テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| email           | string   | null: false |
| password        | string   | null: false |
| nickname        | string   | null: false |
| first_name      | string   | null: false |
| last_name       | string   | null: false |
| first_name_kana | string   | null: false |
| last_name_kana  | string   | null: false |
| birth_date      | date     | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_example     | text       | null: false                    |
| item_category    | string     | null: false                    |
| item_status      | string     | null: false                    |
| shopping_charges | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| days_to_ship     | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order

## order テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase