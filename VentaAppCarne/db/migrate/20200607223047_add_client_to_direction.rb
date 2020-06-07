class AddClientToDirection < ActiveRecord::Migration[5.2]
  def change
    add_reference :directions, :client, foreign_key: true
  end
end
