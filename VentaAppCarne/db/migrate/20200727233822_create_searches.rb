class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :client_id
      t.datetime :updated_open
      t.datetime :updated_close
      t.string :products

      t.timestamps
    end
  end
end
