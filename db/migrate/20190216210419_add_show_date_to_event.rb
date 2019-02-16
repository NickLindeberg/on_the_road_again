class AddShowDateToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :show_date, :date
  end
end
