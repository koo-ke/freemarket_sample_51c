class Address < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture

  validates :postal_code,  presence: true
  validates :prefecture,   presence: true
  validates :city,         presence: true
  validates :address,      presence: true
  validates :user_id,      presence: true

  belongs_to :user

end
