class AddOrderToSearch < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :order, :string
  end
end
