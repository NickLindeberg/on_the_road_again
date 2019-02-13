class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :google_token
      t.string :email
      t.text :google_refresh_token

      t.timestamps
    end
  end
end
