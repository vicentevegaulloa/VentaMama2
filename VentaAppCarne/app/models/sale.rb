class Sale < ApplicationRecord
  belongs_to :client
  has_many :sale_states
  has_many :states, through: :sale_states
  has_many :sale_products
  has_many :products, through: :sale_products
end
