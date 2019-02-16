class AddEventProfitToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_profit, :decimal, :scale => 2
    add_column :events, :travel_cost, :decimal, :scale => 2
  end
end
