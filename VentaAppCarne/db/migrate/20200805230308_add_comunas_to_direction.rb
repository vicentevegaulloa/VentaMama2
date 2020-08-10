class AddComunasToDirection < ActiveRecord::Migration[5.2]
  def change
    add_column :directions, :comuna, :string
  end
end
