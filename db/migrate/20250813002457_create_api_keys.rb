class CreateApiKeys < ActiveRecord::Migration[8.0]
  def change
    create_table :api_keys do |t|
      t.string :name
      t.string :client_id
      t.string :client_secret

      t.timestamps
    end
  end
end
