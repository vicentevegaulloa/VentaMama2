class AddPaidToSale < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :paid, :integer
  end
end
