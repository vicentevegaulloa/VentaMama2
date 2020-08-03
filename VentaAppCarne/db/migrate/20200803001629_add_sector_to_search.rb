class AddSectorToSearch < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :sector, :string
  end
end
