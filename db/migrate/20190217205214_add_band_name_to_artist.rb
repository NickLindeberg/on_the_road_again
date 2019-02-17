class AddBandNameToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :band_name, :string
  end
end
