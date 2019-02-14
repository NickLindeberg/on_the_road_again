class AddVenueIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :venue_id, :integer 
  end
end
