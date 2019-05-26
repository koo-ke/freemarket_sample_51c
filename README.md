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
- has_one :address
- has_many :buyed_products, foreign_key: "buyer_id", class_name: "Products"
- has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Products"
- has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Products"



Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user



Productsテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|name|string|null: false, index: true|
|price|integer|null: false|
|nego_status|integer|null: false, default: 0|
|text|text|null: false|
|size|string|null: false, default: 0|
|item_staus|string|null: false|
|shipping_charges|string|null: false|
|shipping_origun_area|string|null: false|
|days_to_ship|string|null: false|
|saler_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|

### Association
- has_many :categories,  through: :products_categories
- has_many :products_categories
- has_many :likes
- has_many :images
- belongs_to :brand
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"


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
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product



Products_categories(商品の中間テーブル)

|Column|Type|Options|
|------|----|-------|
|ID|||
|product_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category



Categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|name|string|null: false|
|ancestry|string|null: false, index: true|

### Association
- has_many :products,  through: :products_categories
- has_many :products_categories



Likesテーブル

|Column|Type|Options|
|------|----|-------|
|ID|||
|like|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product