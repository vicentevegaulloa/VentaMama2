class Sale < ApplicationRecord
  belongs_to :client
  has_many :sale_states, dependent: :destroy
  has_many :states, through: :sale_states
  accepts_nested_attributes_for :sale_states, :allow_destroy => true
  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products
  accepts_nested_attributes_for :sale_products, :allow_destroy => true
end
