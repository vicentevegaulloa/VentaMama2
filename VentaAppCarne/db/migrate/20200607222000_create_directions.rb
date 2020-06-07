class CreateDirections < ActiveRecord::Migration[5.2]
  def change
    create_table :directions do |t|
      t.string :sector
      t.string :street
      t.string :muni_n
      t.string :comuna
      t.string :unidad
      t.string :n_unidad

      t.timestamps
    end
  end
end
