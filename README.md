# README

Usersテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|e-mail|string|null: false unique: true|
|pass|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false
|family_name_kana|string|null: false|
|first_name_kana|string|null:false|
|nickname|string|null: false|
|profile_text|text||


### Association
- has_many :products
- has_many :evaluations



Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|address|string||
|user_id|references|null: false, foreign_key: true|



Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|postal_code|integer||
|prefecture|string||
|city|string||
|address|string||
|building|string||
|user_id|references|null: false, foreign_key: true|



Evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|like|integer||
|normal|integer||
|bad|integer||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user 



Productsテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|name|string|null: false, index: true|
|text|text|null: false|
|status_id|references||
|strategy_id|references|null: false, foreign_key: true|

### Association
- has_many :categories,  through: :products_categories
- has_many :products_categories
- belongs_to :user



Brandsテーブル

|Column|Type|Options|
|------|----|-------|
|​ID|||
|name|string||
|ancestry|string|index: true|

### Association
- has_many :products



Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|ID|||
|image|string|null: false|
|product_id|references|null: false|foreign_key: true|

### Association
- belongs_to :product


Statusテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|size|string|null: false|
|item_staus|string|null: false|
|shipping_charges|string|null: false|
|shipping_origun_area|string|null: false|
|days_to_ship|string|null: false|
|price|integer|null: false|




Products_categories(商品の中間テーブル)

|Column|Type|Options|
|------|----|-------|
|ID|||
|product_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :products
- belongs_to :categories



Categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|name|string|null: false|
|ancestry|string|null: false, index: true|

### Association
- has_many :products,  through: :products_categories
- has_many :products_categories



Insalesテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|product_id|references|null: false|foreign_key: true|

### Association
has_many :likes



Likesテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|like|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|insale_id|references|null: false, foreign_key: true|

### Association
- belongs_to :insale



Soldsテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|product_id|references|null: false|foreign_key: true|
|user_id|references|null: false, foreign_key: true|