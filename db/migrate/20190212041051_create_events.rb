class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :name
      t.datetime :show_time
      t.references :tour, foreign_key: true
      # t.references :venue, foreign_key: true


      t.timestamps
    end
  end
end
