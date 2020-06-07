class CreateSaleStates < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_states do |t|
      t.references :sale, foreign_key: true
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
