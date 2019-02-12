class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.text :name
      t.belongs_to :artist, foreign_key: true

      t.timestamps
    end
  end
end
