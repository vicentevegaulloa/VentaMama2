class Sale < ApplicationRecord
  belongs_to :client
  has_many :sale_states, dependent: :destroy
  has_many :states, through: :sale_states
  accepts_nested_attributes_for :sale_states, :allow_destroy => true
  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products
  accepts_nested_attributes_for :sale_products, :allow_destroy => true

  def total
    total = 0
    self.sale_products.each do |sp|
      total += sp.cantidad * sp.product.unit_price
    end
    return total
  end

  def self.search(search)
    if search
      self.where(id: search.to_i)
    else
      Sale.all
    end
  end


end
