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
  # validates :buyer_id,             presence: true

  has_many :product_categories
  has_many :categories,            through: :product_categories
  has_many :likes
  has_many_attached :images


  belongs_to :brand,       optional: true
  belongs_to :saler,       optional: true        
  belongs_to :buyer,       optional: true       


  scope :recent, -> { order(created_at: :desc).limit(4) }
end
