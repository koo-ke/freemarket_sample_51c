class Image < ApplicationRecord

    validates :image,       presence: true
    validates :product_id,  presence: true

    belongs_to :product, optional: true

end