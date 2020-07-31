class RemoveExtraColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :directions, :muni_n, :string
    remove_column :directions, :comuna, :string
    remove_column :directions, :unidad, :string
    remove_column :directions, :n_unidad, :string
  end
end
