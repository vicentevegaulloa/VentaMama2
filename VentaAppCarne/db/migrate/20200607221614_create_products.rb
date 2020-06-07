class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :unit_price
      t.string :unit_metric
      t.integer :supp_price

      t.timestamps
    end
  end
end
