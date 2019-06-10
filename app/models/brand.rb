class Brand < ApplicationRecord

    validates :products_id , presence: true

    has_many :products
end
