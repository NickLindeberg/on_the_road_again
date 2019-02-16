class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :name
      t.string :show_time
      t.belongs_to :tour, foreign_key: true

      t.timestamps
    end
  end
end
