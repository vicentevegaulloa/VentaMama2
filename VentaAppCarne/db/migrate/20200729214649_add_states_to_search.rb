class AddStatesToSearch < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :states, :string, array: true, default: [], null: false
  end
end
