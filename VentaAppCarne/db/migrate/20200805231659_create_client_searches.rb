class CreateClientSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :client_searches do |t|

      t.timestamps
    end
  end
end
