class Event < ApplicationRecord
  validates_presence_of :name, :show_time
  belongs_to :tour

  def total_profit
    total = (self.event_profit - self.travel_cost)
    total
  end
end
