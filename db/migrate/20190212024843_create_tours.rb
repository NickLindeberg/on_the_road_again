class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.text :name
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
