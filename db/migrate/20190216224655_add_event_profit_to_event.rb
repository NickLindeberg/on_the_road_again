class AddEventProfitToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_profit, :decimal, :default => 0
    add_column :events, :travel_cost, :decimal, :default => 0
  end
end
