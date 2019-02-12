class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :token
      t.string :email
      t.string :google_client_id
      t.text :refresh_token

      t.timestamps
    end
  end
end
