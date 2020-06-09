class Product < ApplicationRecord
  has_many :sale_products, dependent: :destroy
  has_many :sales, through: :sale_products
end
