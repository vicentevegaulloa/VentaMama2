class AddTotalMinToSearch < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :total_min, :integer
    add_column :searches, :total_max, :integer
  end
end
