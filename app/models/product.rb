class Product < ApplicationRecord

  validates :name,                 presence: true
  validates :price,                presence: true
  validates :publish_status,       presence: true
  validates :text,                 presence: true
  validates :size,                 presence: true
  validates :shipping_charges,     presence: true
  validates :shipping_origin_area, presence: true
  validates :days_to_ship,         presence: true
  validates :saler_id,             presence: true
  validates :buyer_id,             presence: true

  has_many :categories,            through: :products_categories
  has_many :products_categories
  has_many :likes
  has_many :images

  belongs_to :brand
  belongs_to :saler,               class_name: "User"
  belongs_to :buyer,               class_name: "User"

end
