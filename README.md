# テーブル設計


## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | unique: true,null: false       |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| birth_date         | date       | null: false                    |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| title                  | string     | null: false                    |
| price                  | integer    | null: false                    |
| text                   | text       | null: false                    |
| tag_category_id        | integer    | null: false                    |
| tag_state_id           | integer    | null: false                    |
| tag_address_id         | integer    | null: false                    |
| tag_delivery_charge_id | integer    | null: false                    |
| tag_delivery_day_id    | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## consumers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| tag_address_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| tel_number     | string     | null: false                    |
| order_id       | integer    | foreign_key: true              |

### Association

- belongs_to :order




## ordersテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | integer    | null: false, foreign_key: true |
| item_id       | integer    | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :consumer



# プルダウン




## tag_categories テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| tag_category | string     | null: false                    |

### Association

- belongs_to :item


## tag_states テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| tag_state    | string     | null: false                    |

### Association

- belongs_to :item


## tag_delivery_charges テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| tag_delivery_charge   | string     | null: false                    |




## tag_delivery_days テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| tag_delivery_day      | string     | null: false                    |







