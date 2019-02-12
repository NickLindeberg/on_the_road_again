class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :website
      t.text :phone
      t.integer :capacity
      t.integer :zip
      t.integer :lat
      t.integer :lng
      t.integer :songkick_id


      t.timestamps
    end
  end
end
