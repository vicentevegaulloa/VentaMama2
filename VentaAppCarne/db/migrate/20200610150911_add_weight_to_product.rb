class AddWeightToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :estimated_weight, :float
    add_column :sale_products, :real_weight, :float
  end
end
