class ProductCategory < ApplicationRecord
    # validates :product_id, presence: true
    # validates :category_id, presence: true
    belongs_to :category
    belongs_to :product
end
