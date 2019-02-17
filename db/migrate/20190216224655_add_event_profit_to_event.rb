class AddEventProfitToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_profit, :decimal
    add_column :events, :travel_cost, :decimal
  end
end
