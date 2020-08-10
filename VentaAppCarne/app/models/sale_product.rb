class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product
  validates :product_id, presence: true
end
